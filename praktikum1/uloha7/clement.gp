set ylabel "h1 [mm]"

set xlabel "h2 - h1 [mm]"
set xrange [50:140]

set style data points

f(x) = a*x + b
fit f(x) "clement" u ($1-$3):1 via a,b

set term png
set output "clement.png"
plot "clement" u ($1-$3):1 title "", f(x) title sprintf("%.4fx", a)


