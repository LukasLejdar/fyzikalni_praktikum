set ylabel "$h_1$ [mm]"

set xlabel "$h_1$ - $h_3$ [mm]"
set xrange [55:90]

set style data points

f(x) = a*x
fit f(x) "clement" u ($1-$3):1 via a

set term epslatex size 5,3
set output "clement.tex"
plot "clement" u ($1-$3):1 lt 7 lc 1 lw 3 title "", f(x) lw 3 title ""


