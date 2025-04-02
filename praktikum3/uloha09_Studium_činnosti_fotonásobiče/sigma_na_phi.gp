set ylabel ""
set xlabel ""

set term epslatex size 3.7,2.5
set output "sigma_na_phi.tex"

plot "600V.txt" u 2:( ($4/$3)**0.5 ) lc 1 lt 7 t "", \
"750V.txt" u 2:( ($4/$3)**0.5 ) lc 2 lt 7 t ""
