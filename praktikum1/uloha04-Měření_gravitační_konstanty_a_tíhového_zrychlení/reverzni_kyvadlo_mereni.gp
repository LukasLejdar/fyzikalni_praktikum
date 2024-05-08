
f1(x) = a1 * x ** 2 + b1 * x + c1
f2(x) = a2 * x ** 2 + b2 * x + c2

fit f1(x) "reverzni_kyvadlo_mereni.txt" u 1:2 via a1,b1,c1
fit f2(x) "reverzni_kyvadlo_mereni.txt" u 3:4 via a2,b2,c2

set xrange [67:130]
set yrange [0.955:1.085]

set bmargin at screen 0.03
set term epslatex size 6,2.7
set output "reverzni_kyvadlo_mereni.tex"

set ylabel "T (s)"
set xlabel "x (mm)"

x0 = 92.7282
T0 = 0.999035

plot \
f1(x) t "" lc 3, \
f2(x) t "" lc 4, \
"reverzni_kyvadlo_mereni.txt" u 1:2 ps 1 lt 7 lc 1 t "", \
"reverzni_kyvadlo_mereni.txt" u 3:4 ps 1 lt 7 lc 2 t "", \
"< echo '92.7282 0.999035'" u 1:2:(sprintf("$x_0$=%.1f $T_0$=%.1f", $1, $2)) with labels left offset 0.8, -1.1 t "", \
"< echo '92.7282 0.999035'" lt 7 lc -1 t ""

pause -1 "Press any key to exit"



