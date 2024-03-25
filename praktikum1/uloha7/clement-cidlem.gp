set ylabel "I1 [mA] - I0"

set xlabel "I1 - I3 [mA]"
set xrange [1.6:2.9]

set style data points

f(x) = a*x
fit f(x) "clement" u ($2-$4):($2 - 4.09177)  via a

set term png
set output "clement-cidlem.png"
plot "clement" u ($2-$4):($2 - 4.09177) title "", f(x) title ""
