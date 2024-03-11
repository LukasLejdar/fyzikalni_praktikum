set xrange [2:13]
set xlabel "Napětí / V"

set yrange [30:90]
set ylabel "Proud / mA"

set style data points

f(x) = a*x + b
fit f(x) "mereni-zarovka-UI" u 1:2 via a,b

set term png
set output "zarovka-graf.png"
plot "mereni-zarovka-UI" u 1:2 title "", f(x) title ""


