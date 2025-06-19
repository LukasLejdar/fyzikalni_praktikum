set ylabel " $ \\ln ( \\sigma / E) $ "
set xlabel "$ E $ ($ eV $)"

A1 = 0.077
A3 = 0.077
A5 = 0.077

mu1 = 0.0023
mu3 = 0.0023
mu5 = 0.0023

#s1(x) = A1*x*exp(-mu1*x)

f1(x) = -mu1 * x + log(A1)
f3(x) = -mu3 * x + log(A3)
f5(x) = -mu5 * x + log(A5)

fit f1(x) "1.txt" u ($1 / 14):( log( $5 / $1 * 14 ) ) via mu1, A1
fit f3(x) "3.txt" u ($1 / 14):( log( $5 / $1 * 14 ) ) via mu3, A3
fit f5(x) "5.txt" u ($1 / 14):( log( $5 / $1 * 14 ) ) via mu5, A5

#print(s1(42))

set key at graph 1, 0.95
set key spacing 1
set key samplen 1.5

set bmargin at screen 0.04
set term epslatex size 3.7,2.0
set output "sigma_na_U.tex"

plot "1.txt" u ($1 / 14):( log( $5 / $1 * 14 ) ) lc 1 lt 7 t "poloha 1", \
"3.txt" u ($1 / 14):( log( $5 / $1 * 14 ) ) lc 4 lt 7 t "poloha 3", \
"5.txt" u ($1 / 14):( log( $5 / $1 * 14 ) ) lc 3 lt 7 t "poloha 5", \
f1(x) lc 1 t "", \
f3(x) lc 4 t "", \
f5(x) lc 3 t "" 





