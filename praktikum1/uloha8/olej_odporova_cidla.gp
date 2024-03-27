set xlabel "teplota °C"
set ylabel "Odpor [$\\Omega$]"

set xrange [20:130]

f1(x) = a1*x + b1
f2(x) = a2*x + b2

fit f1(x) "olej.txt" u 2:4 via a1,b1
fit f2(x) "olej.txt" u 2:5 via a2,b2

set term epslatex size 5.5,3.5
set output "olej_odporova_cidla.tex"
plot \
  "olej.txt" u 2:4 w p lt 7 lc -1 t "", f1(x) lc 6 lw 4 t "", \
  "olej.txt" u 2:5 w p lt 7 lc -1 t "", f2(x) lc 7 lw 4 t "" \
