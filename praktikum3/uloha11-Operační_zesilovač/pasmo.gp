set ylabel "$ A_u $"
set xlabel "$ f $ (kHz) "

set term epslatex size 4,2.8
set output "pasmo.tex"

f(x) = 2 / sqrt(2)

plot "pasmo.txt" u 1:($2 / 2.133) lc -1 lt 7 t "", f(x) t "$ A_{u,max} / \\sqrt(2) $ "
