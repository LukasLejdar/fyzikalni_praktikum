

set bmargin at screen 0.03
set term epslatex size 6,2.7
set output "mustek.tex"

set ylabel "$\\Delta$t [$^{\\circ} C$]"
set xlabel "čas [s]"

plot "mustek2.txt" u 1:(4 * $2 / (4.3 * 2.2  ) ) w l lw 5 t ""
