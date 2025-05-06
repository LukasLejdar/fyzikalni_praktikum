
set ylabel "$ U_0 $ (V) "
set xlabel "$ U_1 $ (V)"

f(x) = a*x

g(x) = 3*x


fit f(x) "neinvertujici.txt" u 1:2 via a

set term epslatex size 3.6,2.2
set output "neinvertujici.tex"

set xrange [1:3.75]

set key at graph 0.8, 0.95


plot g(x) lc 6 t " teoretická závislost $3x$", f(x) lc 7 t "fit ", "neinvertujici.txt" u 1:2 lt 7 lc -1 t ""
