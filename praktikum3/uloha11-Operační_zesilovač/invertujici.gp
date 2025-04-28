set ylabel "$ U_0 $ (V) "
set xlabel "$ U_1 $ (V)"

f(x) = a*x

fit f(x) "invertujici.txt" u 1:2 via a

set term epslatex size 3.8,2.5
set output "invertujici.tex"

set yrange [-8:-2.5]
set xrange [1.25:4]

plot "invertujici.txt" u 1:2 lt 7 lc -1 t "", f(x) lc 7 t "fit "
