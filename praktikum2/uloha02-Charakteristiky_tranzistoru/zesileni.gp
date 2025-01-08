set ylabel "$ U_{M2} $ (V)"
set xlabel "$ U_{M1} $ (mV)"

set bmargin at screen 0.03
set term epslatex size 4,2.0
set output "zesileni.tex"

f(x) = a*x*1e-3
fit f(x) "zesileni.txt" u 1:2 via a

plot "zesileni.txt" u 1:2 lc 6 lt 7 t "", f(x)
