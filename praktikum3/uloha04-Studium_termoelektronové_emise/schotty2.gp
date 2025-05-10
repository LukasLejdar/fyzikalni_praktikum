set term epslatex size 3.5,2.4

q = 1.60217663e-19
k = 1.380649e-23
m = 9.1093837e-31
epsilon = 8.854e-12
T  = 2750




set ylabel "$ \\log( I_a ) $  "
set xlabel "$ U_a $ (V) "

T1  = 2750
I01 = 4e-9

f1(x) = I01 * exp( q*x/(k*T1) )

set xrange [-5:5]
set yrange [-25:-9]

noise1 = 1.6329102511428571e-09
noise2 = 8.63999516e-10

a = -1
b = -0.4

set output "schotty-1,92A_log.tex"
fit [a:b] f1(x) "schotty-1,92A.txt" u 3:($4 - noise1) via T1, I01
plot "schotty-1,92A.txt" u 3:(log($4 - noise1)) lc -1 lt 7 t "", [*:0] log(f1(x)) lc 7 t "fit"

T2 = 2652.95    
I02 = 9e-7

f2(x) = I02 * exp( q*x/(k*T2) )

a = -1
b = -0.2

set output "schotty-1,98A_log.tex"
fit [a:b] f2(x) "schotty-1,98A.txt" u 3:($4 - noise2) via T2, I02
plot "schotty-1,98A.txt" u 3:(log($4 - noise2)) lc -1 lt 7 t "", [*:0] log(f2(x)) lc 7 t "fit"

set ylabel "$ I_a $ ($ \\mu $A)  "
set xlabel "$ U_a $ (V) "

set xrange [-5:500]
set yrange [-5:80]

L = 25e-3
R = 17e-3
D = 15e-3

r = 0.9e-3/2

E(x) = x * (L - D) / D  * 1 / (r * log(R/r))

W(x) = sqrt( q**3 * E(x) / (4 * pi * epsilon ) )

In1 = 40e-6

I1(x) = In1 * exp( W(x) / (k*T1) )

set output "schotty-1,92A.tex"
fit [20:500] I1(x) "schotty-1,92A.txt" u 3:4 via In1
plot "schotty-1,92A.txt" u 3:($4 * 1e6) lc -1 lt 7 t "", I1(x)*1e6 lc 7 t "fit"

I2(x) = In2 * exp( W(x) / (k*T2) )
fit [20:500] I2(x) "schotty-1,98A.txt" u 3:4 via In2

set output "schotty-1,98A.tex"
plot "schotty-1,98A.txt" u 3:($4 * 1e6) lc -1 lt 7 t "", I2(x)*1e6 lc 7 t "fit"

