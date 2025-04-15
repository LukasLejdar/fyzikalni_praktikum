set ylabel "$ K(n) $"
set xlabel "n"

set key at graph 1, 0.91
set key spacing 1
set key samplen 1.5


set term epslatex size 3.7,2.5
set output "poisson.tex"

set yrange [0:30]

plot "poisson.txt" u 1:2 lc -1 lt 7 t "", \
"poisson.txt" u 1:4 pt 7 ps 1.0 lc rgb "#E69F00" t "$ P(n) \\cdot N  $ ", \
