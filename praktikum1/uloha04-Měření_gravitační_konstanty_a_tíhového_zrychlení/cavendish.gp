
system("python3 amplitudes_finder.py cavendish8.txt")

set bmargin at screen 0.03
set term epslatex size 5.8,2.5
set output "cavendish.tex"

f = 918.0

set xrange [0:60] 
set yrange [0.78:1.11]
set ytics 0.8, 0.1, 1.2

set xlabel "T (min)"
set ylabel "x (m)"

phi0 = 938.0 / 918.0
phi1 = 803.0 / 918.0

set label "$x_1 = 1.021\\ m$" at 48,phi0
set label "$x_0' = 0.875\\ m$" at 48,phi1

plot \
"cavendish8.txt" u (0 < $1 && $1 < 6000 ? $1*10/60 : 1/0):($2 / f) lw 13 lt 0 lc 9 t "", \
"amplitudes.txt" u (0 < $1 && $1 < 6000 ? $1*10/60 : 1/0):($2 / f) ps 1.5 lt 7 lc 2 t "", \
[0:47] phi0 lw 5 lt 0 t "", \
[0:47] phi1 lw 5 lt 0 t ""
