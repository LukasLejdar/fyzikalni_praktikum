set ylabel " $ I $ ($ \\mu A$)"
set xlabel "$ U $ ($ V $)"

set term epslatex size 3.7,2.5
set output "sigma_na_U.tex"

plot "1.txt" u ($1 / 14):( log( ($3/$2)**0.5 / $1 * 14 ) ) lc 1 lt 7 t "", \
"3.txt" u ($1 / 14):( log( ($3/$2)**0.5 / $1 * 14 ) ) lc 4 lt 7 t "", \
"5.txt" u ($1 / 14):( log( ($3/$2)**0.5 / $1 * 14 ) ) lc 3 lt 7 t ""
