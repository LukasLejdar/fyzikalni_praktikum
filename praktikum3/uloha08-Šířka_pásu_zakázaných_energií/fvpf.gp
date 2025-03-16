set ylabel ""
set xlabel ""

set bmargin at screen 0.03
set term epslatex size 4,2.0
set output "silicon_S.tex"

plot ".txt" u 1:2 lc 6 lt 7 t ""
