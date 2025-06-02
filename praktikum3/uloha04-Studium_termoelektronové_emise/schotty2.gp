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

set key at graph 0.57,0.97

set xrange [-5:500]
set yrange [-5:90]

set output "schotty1.tex"
plot "schotty-1,98A.txt" u 3:($4 * 1e6) lc 6 lt 7 t "$ I_f = 1.98 $ A", \
"schotty-1,92A.txt" u 3:($4 * 1e6) lc 7 lt 7 t "$ I_f = 1.92 $ A"


L = 25e-3
R = 17e-3
D = 15e-3

r = 0.9e-3/2

E(x) = x * (L - D) / D  * 1 / (r * log(R/r))

W(x) = sqrt( q**3 * E(x) / (4 * pi * epsilon ) )

In1 = 40e-6
U01 = 20

I1(x) = In1 * exp( W(x) / (k*T1) )

set ylabel "$ \\ln(I_a) $ "
set xlabel "$ \\sqrt{U_a} $ (V$^{1/2}$) "

set xrange [0:25]
set yrange [-10.3:-10]

set output "schotty-1,92A.tex"
fit [80:500] I1(x) "schotty-1,92A.txt" u 3:4 via In1, T1
plot "schotty-1,92A.txt" u ($3**0.5):(log($4)) lc -1 lt 7 t "", log(I1(x**2)) lc 7 t "fit"

set xrange [0:25]
set yrange [-9.8:-9.5]

In2 = 60e-6
T2 = 1544
U02 = 40

I2(x) = In2 * exp( W(x) / (k*T2) )
fit [90:500] I2(x) "schotty-1,98A.txt" u 3:4 via In2, T2

set output "schotty-1,98A.tex"
plot "schotty-1,98A.txt" u ($3**0.5):(log($4)) lc -1 lt 7 t "", log(I2(x**2)) lc 7 t "fit"

