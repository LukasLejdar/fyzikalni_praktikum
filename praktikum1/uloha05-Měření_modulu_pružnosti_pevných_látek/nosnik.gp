system("awk '!/^#/ {sum += $1; printf(\"%s\", sum); \
  for (i=2; i<=NF; i++) printf(\" %s\", $i); print \"\"}' nosnik.txt > nosnik_summed.txt")

set ylabel "y (mm)"
set xlabel "m (g)"
set yrange [0:7]
set key font ",20"

set tmargin at screen 0.99
set bmargin at screen 0.05
set lmargin at screen 0.01
set rmargin at screen 0.99

f1(x) = a1*x
f2(x) = a2*x
f3(x) = a3*x
f4(x) = a4*x

fit f1(x) "nosnik_summed.txt" u 1:2:3 via a1
fit f2(x) "nosnik_summed.txt" u 1:4:5 via a2
fit f3(x) "nosnik_summed.txt" u 1:6:7 via a3
fit f4(x) "nosnik_summed.txt" u 1:8:9 via a4

set term epslatex size 5.3,2.9
set output "nosnik.tex"

x_legendy = 421
set multiplot
set key at x_legendy,6.7
set xrange [0:1200]

plot \
-1 lc "white" t "přidávání závaží", \
"nosnik_summed.txt" u 1:3 ps 1.4 lc 0 lt 7 t "odebírání závaží", \
"nosnik_summed.txt" u 1:5 ps 1.4 lc 0 lt 7 t "", \
"nosnik_summed.txt" u 1:7 ps 1.4 lc 0 lt 7 t "", \
"nosnik_summed.txt" u 1:9 ps 1.4 lc 0 lt 7 t "", \
[0:1100] f1(x) lc 9 lt 0 lw 5 t  "hliník", \
[0:1100] f3(x) lc 3 lt 0 lw 5 t  "mosaz", \
[0:1100] f2(x) lc 4 lt 0 lw 5 t  "měď"   , \
[0:1100] f4(x) lc 5 lt 0 lw 5 t  "ocel"

unset border
unset tics
unset xlabel
unset ylabel

dl = 17
set key at x_legendy - 1.5*dl,6.7
plot "nosnik_summed.txt" u 1:2 ps 1.4 lc 9 lt 7 t " "

set key at x_legendy - 0.5 * dl,6.7
plot "nosnik_summed.txt" u 1:6 ps 1.4 lc 3 lt 7 t " "

set key at x_legendy + 0.5*dl,6.7
plot "nosnik_summed.txt" u 1:4 ps 1.4 lc 4 lt 7 t " "

set key at x_legendy + 1.5*dl,6.7
plot "nosnik_summed.txt" u 1:8 ps 1.4 lc 5 lt 7 t " "

print "k1 = $(", a1, " \\pm ", a1_err, ") \\cdot 10^{-6}$ mkg$^{-1}$"
print "k2 = $(", a2, " \\pm ", a2_err, ") \\cdot 10^{-6}$ mkg$^{-1}$"
print "k3 = $(", a3, " \\pm ", a3_err, ") \\cdot 10^{-6}$ mkg$^{-1}$"
print "k4 = $(", a4, " \\pm ", a4_err, ") \\cdot 10^{-6}$ mkg$^{-1}$"



