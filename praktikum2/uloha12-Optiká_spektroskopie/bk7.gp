
load '~/.local/share/gnuplot-palettes/viridis.pal'

set ylabel "propustnost \\%"
set xlabel "$\\lambda$ (nm)"

n(x) = A + B/x**2
ns(x) = (1 + sqrt(1 - (x/100)**2))/(x/100)
fit [400:800] n(x) "spektroskopie/BK7.CSV" u 1:(ns($2)) via A, B

set lmargin at screen 0.09
set rmargin at screen 0.91
set term epslatex size 4,3
set output "bk7.tex"

plot \
[350:1000] "spektroskopie/BK7.CSV" u 1:2 w l ls 6 t "", \

set ylabel "$n_s$"
set output "bk7_n.tex"

plot \
[350:1000] "spektroskopie/BK7.CSV" u 1:(ns($2)) w l ls 2 t "", \
[350:1000] n(x) ls 3 dt 2 lw 5 t "fit"
