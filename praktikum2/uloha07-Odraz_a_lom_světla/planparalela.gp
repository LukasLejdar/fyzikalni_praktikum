

set angles degrees
set ylabel ""
set xlabel ""
set samples 1000

set tmargin at screen 0.95 
set bmargin at screen 0.20
set lmargin at screen 0.05
set rmargin at screen 0.95

set term epslatex size 3,2.6
set output "planparalela.tex"
plot "planparalela.txt" u 1:2 ps 1 lc 6 lt 7 t ""
