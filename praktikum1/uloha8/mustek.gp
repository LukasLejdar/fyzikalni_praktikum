set term epslatex size 6,4
set output "mustek.tex"
plot "mustek2.txt" u 1:2 t ""
