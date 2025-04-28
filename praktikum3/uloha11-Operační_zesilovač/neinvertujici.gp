
set ylabel "$ U_0 $ (V) "
set xlabel "$ U_1 $ (V)"

f(x) = a*x

fit f(x) "neinvertujici.txt" u 1:2 via a

set term epslatex size 3.6,2.2
set output "neinvertujici.tex"

set xrange [1:3.75]

plot "neinvertujici.txt" u 1:2 lt 7 lc -1 t "", f(x) lc 7 t "fit "
