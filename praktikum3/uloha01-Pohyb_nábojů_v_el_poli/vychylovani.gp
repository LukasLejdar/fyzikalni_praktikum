set ylabel ""
set xlabel ""

set term epslatex size 3.7,2.5
set output "vychylovani_Iv87.tex"
plot "vychylovani_Iv87.txt" u (1/$1**0.5):4 lc 6 lt 7 t ""

set term epslatex size 3.7,2.5
set output "vychylovani2.tex"
plot "vychylovani2.txt" u (1/$1**0.5):4 lc 6 lt 7 t ""

set term epslatex size 3.7,2.5
set output "vychylovani3.tex"
plot "vychylovani3.txt" u 3:4 lc 6 lt 7 t ""

set term epslatex size 3.7,2.5
set output "vychylovani4.tex"
plot "vychylovani4.txt" u 3:4 lc 6 lt 7 t ""
