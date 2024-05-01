set bmargin at screen 0.03
set term epslatex size 4,2.5
set output "casovy_vyvoj_teploty_uprostred.tex"

set border 3
set tics nomirror
set logscale y exp(1) 
set ytics 10, 10

t0 = 0.0
tmax = 100.0
l = 1.0
lambda = 1.0
rho = 3600.0
c = 1.0

t(x, tau) = \
    t0 + sum [n=0:100] (8*(tmax - t0) / (pi**2 * (n*2+1)**2) * \
    cos(pi * (n*2+1) * x / l) * exp(- tau *(lambda / (rho*c)) * (pi * (n*2+1) / l)**2))

tapprox(x, tau) = t0 + 8*(tmax - t0)/ (pi**2) * exp(- tau *(lambda / (rho*c)) * (pi / l)**2)
dummy(x) = -3

set ylabel "teplota $^{\\circ}$ C"
set xlabel "$\\tau$ min"

set yrange [2:120]

plot \
[-2:20] dummy(x) t "", \
[0:20] t(0, x*60) lw 1 lc -1 t "", \
[0:20] tapprox(0, x*60) lt 0 lw 12 lc 7 title "approx"
