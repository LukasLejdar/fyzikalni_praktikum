
set ylabel "mA"
set xlabel "$\\varphi$ $ (^{\\circ})  $"

w = 2*pi / 350
f(x) = Imin + (Imax - Imin)*(cos(x*w + phi))**2
fit f(x) "malus.txt" u 1:2 via Imin, Imax, phi, w
set term epslatex size 4,2.5

set output "malus_full.tex"
plot "malus.txt" u 1:2 lt 1 lc -1 lw 4 ps 1.5 t "", f(x) lc 2 t "$I(\\varphi)$"

Imin = 1.025
Imax = 1.271
set ylabel "$\\mu$A"
fit f(x) "malus.txt" u 1:3 via Imin, Imax, phi, w

Imin = 0.91
Imax = 5.07
set output "malus_mono.tex"
plot "malus.txt" u 1:3 lt 1 lc -1 lw 4 ps 1.5 t "", f(x) lc 22 t "$I(\\varphi)$"
