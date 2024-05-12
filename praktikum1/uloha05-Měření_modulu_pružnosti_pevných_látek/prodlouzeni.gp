system("awk '{sum += $1; print sum, $2, $3}' prodlouzeni.txt > prodlouzeni_summed.txt")

set ylabel "$\\Delta l$ (mm)"
set xlabel "m (g)"

set yrange [0:0.55]
set ytics 0,0.1,0.5
set key font ",20"
set key right bottom

set tmargin at screen 0.99
set bmargin at screen 0.05
set lmargin at screen 0.01
set rmargin at screen 0.99

f(x) = a*x + b
fit f(x) "prodlouzeni_summed.txt" u 1:2 via a,b

set term epslatex size 3.8,2.2
set output "prodlouzeni.tex"

set label at 50,0.5 "k = $(449 \\pm 4) \\cdot 10^{-6}$ mkg$^{-1}$"
plot \
f(x) lt 0 lw 5 t  "fit f(m) = k$\\cdot$m", \
"prodlouzeni_summed.txt" u 1:2 ps 1.5 lc -1 lt 7 t "přidávání závaží", \
"prodlouzeni_summed.txt" u 1:3 ps 1.5 lc 4 lt 7 t "odébírání závaží"

system("python3 -c \"\
import uncertainties as unc; \
import math;\
l = 1.567;\
g = 9.81;\
d = unc.ufloat(0.50, 0.003)*0.001;\
k = unc.ufloat(0.00044922, 3.518e-06);\
print('E = ', 4 * g * l / (math.pi * d ** 2 * k));\
\" ")


