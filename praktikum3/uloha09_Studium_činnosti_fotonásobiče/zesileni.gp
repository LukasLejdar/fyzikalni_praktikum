set ylabel "log($ M $)"
set xlabel "$U_n$ (V)"

phi1 = 0.90 * 1e-4
phi3 = 0.52 * 1e-4
phi5 = 0.34 * 1e-4

set key top left
set key spacing 1
set key samplen 1.5

q = 1.60217663e-19

A1 = 0.077
A3 = 0.077
A5 = 0.077

mu1 = 0.00023
mu3 = 0.00023
mu5 = 0.00023

M1(x) = 14 * log( A1 * x/14 ) - mu1 * x
M3(x) = 14 * log( A3 * x/14 ) - mu3 * x
M5(x) = 14 * log( A5 * x/14 ) - mu5 * x

fit M1(x) "1.txt" u 1:( log($5**14) ) via A1, mu1
fit M3(x) "3.txt" u 1:( log($5**14) ) via A3, mu3
fit M5(x) "5.txt" u 1:( log($5**14) ) via A5, mu5

set term epslatex size 3.5,2.3
set output "M.tex"

plot \
"1.txt" u 1:( log($5**14) ) lc 1 lt 7 t "poloha 1", \
"3.txt" u 1:( log($5**14) ) lc 3 lt 7 t "poloha 3", \
"5.txt" u 1:( log($5**14) ) lc 5 lt 7 t "poloha 5", \
M1(x) lc 1 t "", M3(x) lc 3 t "", M5(x) lc 5 t ""

set ylabel " log($ S $) (A Lm$^{-1} $) "
set xlabel "$U_n$ (V)"

k1 = 1e-22
k3 = 1e-22
k5 = 1e-22

mu1 = 0.007
mu3 = 0.007
mu5 = 0.007

S1(x) = log(k1 * (x/14)**14) - mu1*x
S3(x) = log(k3 * (x/14)**14) - mu3*x
S5(x) = log(k5 * (x/14)**14) - mu5*x

fit S1(x) "1.txt" u 1:( log($4/phi1) ) via k1, mu1
fit S3(x) "3.txt" u 1:( log($4/phi3) ) via k3, mu3
fit S5(x) "5.txt" u 1:( log($4/phi5) ) via k5, mu5

set output "S.tex"

plot \
"1.txt" u 1:( log($4/phi1) ) lc 1 lt 7 t "poloha 1", \
"3.txt" u 1:( log($4/phi3) ) lc 3 lt 7 t "poloha 3", \
"5.txt" u 1:( log($4/phi5) ) lc 5 lt 7 t "poloha 5", \
S1(x) lc 1 t "", \
S3(x) lc 3 t "", \
S5(x) lc 5 t ""



