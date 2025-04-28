set ylabel "$ A_u $"
set xlabel "$ \\omega $ (Hz) "

set term epslatex size 3.7,2.5
set output "pasmo.tex"

plot "pasmo.txt" u 1:($2 / 2.133) lc -1 lt 7 t ""
