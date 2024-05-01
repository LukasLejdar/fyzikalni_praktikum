set bmargin at screen 0.03
set term epslatex size 3.1,2.2
set output "pocatecni_rozlozeni_teploty.tex"

set tics nomirror
unset ytics
set xtics -0.5, 0.5, 0.5

f1(x) = x + 0.5 
f2(x) = -x + 0.5
f3(x) = -1

set ylabel "teplota"
set xlabel "x"

set yrange [-0.05:0.58]

plot [-0.6:0.6] f3(x) t "", \
[-0.5:0] f1(x) lc -1 lw 5 t "", \
[0:0.5] f2(x) lc -1 lw 5 t ""

