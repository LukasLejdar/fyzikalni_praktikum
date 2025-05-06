set ylabel "$ U_0 $ (V)"
set xlabel "$ U_2 - U_1 $ (V)"

f(x) = a*x

g(x) = 2*x

fit f(x) "rozdilovy.txt" u ($2 - $1):3 via a

set term epslatex size 3.2,2.5
set output "rozdilovy.tex"

set yrange [-2:7]

plot g(x) lc 6 t " teoretická závislost $2x$", "rozdilovy.txt" u ($2 - $1):3 lc -1 lt 7 t "", f(x) lc 7 t "fit"
