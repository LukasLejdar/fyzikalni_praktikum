set xlabel "H(t) $Am^{-1}$"
set ylabel "B(t) $(T)$"

set tmargin at screen 1.0
set bmargin at screen 0.03
set lmargin at screen 0
set rmargin at screen 1

R1 = 83
R2 = 120e3
C = 1e-6
N1 = 260
N2 = 900
h = 7.3e-3
r1 = 19.5e-3
r2 = 28.7e-3
r = (r1 + r2)/2

kH = N1 / (2 * pi * r * R1)
kB = R2*C / (N2 * h * (r2 - r1))

Hs = kH * 4.18381
Bs = kB * 0.08518
HC = kH * 1.407428
BR = kB * 0.063438
set label "$(H_s, B_s)$" at Hs, Bs point pt 7 ps 1.5 lc rgb "red" offset -5,-2
set label "$(H_C, 0)$" at HC, 0 point pt 7 ps 1.5 lc rgb "red" offset 1, -1
set label "$(0, B_R)$" at 0, BR point pt 7 ps 1.5 lc rgb "red" offset 1, -1
print(Hs)
print(Bs)
print(HC)
print(BR)

set term epslatex size 4,2.5
set output "hystereze.tex"
plot "hystereze.txt" u (kH*$2):(kB*$3) w l lw 3 lc 4 t ""



