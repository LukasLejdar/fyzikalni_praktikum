set ylabel "residuál"
set xlabel "$ e \\cdot 10^{-19}$ (C)"

q = 1.6273925477851515

set arrow from q,2 to q,11 nohead lc 0 lt 0

set term epslatex size 3.3,2.3
set output "res.tex"
plot "res.txt" u ($1*1e19):2 w l lc -1 lt 7 t "", \
