set xlabel "teplota °C"
set ylabel "proud [mA]"
set yrange [0:6]

f(x) = a*x + b
fit f(x) "olej.txt" u 2:($3 * 1000) via a,b

set term epslatex size 5.5,3.5
set output "olej_dif_cidlo.tex"
plot "olej.txt" u 2:($3 * 1000) t "", f(x) t ""
