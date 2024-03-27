set xlabel "Čas [s]"
set ylabel "Napětí [mA]"

set term epslatex size 6,4
set output "relaxacni_doba_nezapouzdrene.tex"
plot "relaxacni_doba2.txt" u 1:2 lt 14 t ""
