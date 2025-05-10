set ylabel "$ \\log( I_a ) $  "
set xlabel "$ U_a $ (V) "

set term epslatex size 3.7,2.5
set output "schotty-1,92A.tex"

set xrange [-5:5]
set yrange [-22:-10]

I01 = 1.8e-7
q = 1.60217663e-19
k = 1.380649e-23
T1 = 2000

f1(x) = log(I01) + q * x / (k * T1)

fit [-1:0.3] f1(x) "schotty-1,92A.txt" u 3:(log($4)) via I01, T1

#plot "schotty-1,92A.txt" u 3:(log($4)) lc 6 lt 7 t "", f1(x) lc 7 t "fit"

T1 = 2063
A = 21e-4

f4(x) = A * (sqrt(pi)/2 * (T1*k/q)**(1.5) - sqrt(pi)/2 * (T1*k/q)**(1.5) * erf(sqrt((q* (-x) )/(k*T1))) + T1*k/q * sqrt( (-x) ) * exp(-q* (-x) / (k*T1)))

fit [-2:0.2] f4(x) "schotty-1,92A.txt" u 3:4 via T1, A

set xrange [-5:0]
set yrange [-1e-7:1e-6]

#set xrange [-5:5]
#set yrange [-1e-6:7e-5]

set xrange [-5:5]
set yrange [-22:-10]

#T1 = 1450 
#A = 6.0e-6
plot "schotty-1,92A.txt" u 3:(log($4)) lc 6 lt 7 t "", log(f4(x)) t "fit"

I02 = 1.8e-7
T2 = 4000
set output "schotty-1,98A.tex"
set xrange [-5:5]
set yrange [-22:-10]
f2(x) = log(I02) + q * x / (k * T2)
fit [-0.2:0.5] f2(x) "schotty-1,98A.txt" u 3:(log($4)) via I02, T2
#plot "schotty-1,98A.txt" u 3:(log($4)) lc 6 lt 7 t "", f2(x) lc 7 t "fit"

T2 = 2000

set samples 1000

f3(x) = A * ( sqrt(pi)/2 * (T2*k/q)**(1.5) * erf(sqrt((q*x)/(k*T2))) - T2*k/q * sqrt(x) * exp(-q*x / (k*T2))  )
set xrange [-5:10]
set yrange [-2e-6:7e-5]
plot "schotty-1,98A.txt" u 3:4 lc 6 lt 7 t "", f3(x) t "fit"

