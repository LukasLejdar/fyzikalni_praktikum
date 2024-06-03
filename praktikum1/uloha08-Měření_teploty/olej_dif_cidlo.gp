set xlabel "teplota °C"
set ylabel "Napětí [mV]"
set yrange [0.5:6]

f(x) = a*x
fit f(x) "olej.txt" u 2:($3) via a

set tmargin at screen 1.0
set bmargin at screen 0.03
set lmargin at screen 0
set rmargin at screen 1

set term epslatex size 4,2.5
set output "olej_dif_cidlo.tex"
plot "olej.txt" u 2:($3 * 1000) lt 7 lc -1 t "", f(x)*1000 lw 4 t "$\\beta = 4.259(8) * 10^{-5} $"
