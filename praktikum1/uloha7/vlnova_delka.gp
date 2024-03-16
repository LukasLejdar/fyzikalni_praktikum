set ylabel "l [cm]"
set yrange [0:140]

set xlabel "měření n"

set style data points
set style line 1 lt rgb "dark-violet" lw 1
set linetype 2 lc rgb "#009e73" lw 1
set linetype 3 lc rgb "#56b4e9" lw 1
set linetype 4 lc rgb "#e69f00" lw 1
set linetype 5 lc rgb "#f0e442" lw 1
set linetype 6 lc rgb "#0072b2" lw 1
set linetype 7 lc rgb "#e51e10" lw 1
set linetype 8 lc rgb "black"   lw 1
set linetype 9 lc rgb "gray50"  lw 1

f5(x) = a5*x + b5
f4(x) = a4*x + b4
f3(x) = a3*x + b3
f2(x) = a2*x + b2

fit f5(x) "vlnova_delka5" u 1:(100-$2) via a5,b5
fit f4(x) "vlnova_delka4" u 1:(100-$2) via a4,b4
fit f3(x) "vlnova_delka3" u 1:(100-$2) via a3,b3
fit f2(x) "vlnova_delka2" u 1:(100-$2) via a2,b2

set term png
set output "vlnova_delka5.png"

plot \
  "vlnova_delka5" u 1:(500-$2) title "", \
  "vlnova_delka4" u 1:(100-$2) title "", \
  "vlnova_delka3" u 1:(100-$2) title "", \
  "vlnova_delka2" u 1:(100-$2) title "", \
  f5(x) lt 5 title sprintf("f = 5.89 kHz    %.4fx", a5), \
  f4(x) lc 4 title sprintf("f = 3.41 kHz    %.4fx", a4), \
  f3(x) lc 3 title sprintf("f = 5.04 kHz    %.4fx", a3), \
  f2(x) lc 2 title sprintf("f = 1.56 kHz    %.4fx", a2)

