
set bmargin at screen 0.03
set term epslatex size 5,2.5
set output "casovy_vyvoj_teploty.tex"

set border 3
set tics nomirror
set xtics -0.5, 0.5, 0.5

t0 = 0.0
tmax = 100.0
l = 1.0
lambda = 1.0
rho = 3600.0
c = 1.0

f1(x) = 200 * x + tmax
f2(x) = 200 * (-x) + tmax 
f3(x) = -10

t(x, tau) = \
    t0 + sum [n=0:100] (8*(tmax - t0) / (pi**2 * (n*2+1)**2) * \
    cos(pi * (n*2+1) * (x / l) * exp(- tau *(lambda / (rho*c)) * (pi * (n*2+1) / l)**2))

set ylabel "teplota $^{\\circ}$ C"
set xlabel "x / m"

set yrange [-10:118]
set size ratio 0.85
set key at 0.8,110

plot [-0.55:0.55] f3(x) t "", \
[-0.5:0] f1(x) lc -1 lw 5 t "", \
[0:0.5] f2(x) lc -1 lw 5 t "0 min", \
[-0.5:0.5] t(x, 2*60) lc 2 lw 5 t "2 min", \
[-0.5:0.5] t(x, 5*60) lc 3 lw 5 t "5 min", \
[-0.5:0.5] t(x, 10*60) lc 4 lw 5 t "10 min", \
[-0.5:0.5] t(x, 20*60)  lc 5 lw 5 t "20 min"

                 
