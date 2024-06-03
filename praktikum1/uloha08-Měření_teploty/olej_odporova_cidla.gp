set xlabel "teplota °C"
set ylabel "Odpor [$\\Omega$]"

set xrange [20:130]

#f1(x) = a1*x + r1
f1(x) = r1*(1+a1*(x-70))
f2(x) = r2*(1+a2*(x-70))

fit f1(x) "olej.txt" u 2:4 via a1,r1
fit f2(x) "olej.txt" u 2:5 via a2,r2

set tmargin at screen 1.0
set bmargin at screen 0.03
set lmargin at screen 0
set rmargin at screen 1


set term epslatex size 4,2.5
set output "olej_odporova_cidla.tex"

plot \
  "olej.txt" u 2:4 w p lt 7 lc -1 t "", \
  "olej.txt" u 2:5 w p lt 7 lc -1 t "", \
f1(x) lc 6 lw 4 t "$\\alpha_1 = 4.30(5) * 10^{-3}$", \
f2(x) lc 7 lw 4 t "$\\alpha_2 = 2.92(1) * 10^{-3}$"

replot


