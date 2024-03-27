set xlabel "Čas [s]"
set ylabel "Odpor [$\\Omega$]"

set term epslatex size 6,4
set output "relaxacni_doba_zapozdrene.tex"
plot "relaxacni_doba2.txt" u 1:4 lw 1 lt 14 t ""
