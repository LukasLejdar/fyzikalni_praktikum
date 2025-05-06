set ylabel "$ U_0 $ (V) "
set xlabel "$ U_1 $ (V)"

f(x) = a*x

g(x) = -2*x

fit f(x) "invertujici.txt" u 1:2 via a

set term epslatex size 3.8,2.5
set output "invertujici.tex"

set yrange [-8:-2.5]
set xrange [1.25:4]

plot g(x) lc 6 t " teoretická závislost $-2x$", f(x) lc 7 t "fit ", "invertujici.txt" u 1:2 lt 7 lc -1 t ""
