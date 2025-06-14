set ylabel " $ \\ln ( \\sigma / E) $ "
set xlabel "$ E $ ($ eV $)"



f1(x) = -a1 * x + b1
f3(x) = -a3 * x + b3
f5(x) = -a5 * x + b5

fit f1(x) "1.txt" u ($1 / 14):( log( $5 / $1 * 14 ) ) via a1, b1
fit f3(x) "3.txt" u ($1 / 14):( log( $5 / $1 * 14 ) ) via a3, b3
fit f5(x) "5.txt" u ($1 / 14):( log( $5 / $1 * 14 ) ) via a5, b5

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


