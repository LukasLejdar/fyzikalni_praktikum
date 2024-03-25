set ylabel "h1 [mm]"

set xlabel "h1 - h3 [mm]"
set xrange [55:90]

set style data points

f(x) = a*x
fit f(x) "clement" u ($1-$3):1 via a

set term png
set output "clement.png"
plot "clement" u ($1-$3):1 title "", f(x) title ""


