set ylabel ""
set xlabel ""

set term epslatex size 3.7,2.5
set output "dolnofrekvencni_propust.tex"

plot "dolnofrekvencni_propust.txt" u 1:2 lc 6 lt 7 t ""
