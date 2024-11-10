
f(x) = x*f
fit f(x) "prima_metoda.txt" u ($3 - $2 - $1 + $2):($1 - $2)*($3 - $2) via f

set tmargin at screen 1.0
set bmargin at screen 0.03
set lmargin at screen 0
set rmargin at screen 1

set term epslatex size 4,2.5
set output "prima_metoda.tex"
plot "prima_metoda.txt" u ($3 - $2 - $1 + $2):($1 - $2)*($3 - $2) t "", f(x) t "fit"
