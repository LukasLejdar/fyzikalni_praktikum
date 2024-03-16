set xlabel "výška vodního sloupce [mm]"

set ylabel "Proud [mA]"

set style data points

f(x) = a*x + b
fit f(x) "kalibrace_proudu" u 1:2 via a,b

set term png
set output "kalibrace_proudu.png"
plot "kalibrace_proudu" u 1:2 title "", f(x) title ""


