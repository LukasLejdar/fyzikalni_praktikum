set ylabel ""
set xlabel ""

set term epslatex size 3.7,2.5
set output "data.tex"

plot "data.txt" u 1:($3/$2 * 60) lc 6 lt 7 t ""
