
load '~/.local/share/gnuplot-palettes/viridis.pal'

set samples 400
set lmargin at screen 0.09
set rmargin at screen 0.91

set xlabel "$\\lambda$ (nm)"
set ylabel "propustnost \\%"

set ytics nomirror

d = 400
As = 1.56
Bs = 0.014
Av = 2.231
Bv = 0.06

ns(x) = As + Bs*1e6/x**2
nv(x) = Av + Bv*1e6/x**2
beta(x) = 2*pi*nv(x)*d/x
Tvs(x) = 2*ns(x) / (1 + ns(x)**2 + 0.5*(nv(x)**2 - 1)*(1 - (ns(x)/nv(x))**2)*sin(beta(x))**2 ) * 100
fit [400:1000] Tvs(x) "spektroskopie/TIO2.CSV" u 1:2 via As, Bs, Av, Bv, d

set term epslatex size 5,3 color colortext
set output "tio2.tex"
set yrange [30:105]

plot \
[350:1000] "spektroskopie/TIO2.CSV" u 1:2 w l lc -1 lw 2 t "$T_{vs}(\\lambda)$", \
[400:1000] Tvs(x) w l lt rgb "light-red" lw 5 dt 2 t "fit"

unset yrange
set ylabel "n"
set term epslatex size 3,3 color colortext
set output "tio2_n.tex"
plot \
[400:1000] nv(x) w l ls 6 lw 4 t "fit $ n_v $", \
[400:1000] ns(x) w l ls 2 lw 4 t "fit $ n_s $"



