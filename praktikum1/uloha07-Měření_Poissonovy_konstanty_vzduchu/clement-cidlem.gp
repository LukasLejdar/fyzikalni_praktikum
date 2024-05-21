set ylabel "$I_1$ - $I_0$ [mA]"

set xlabel "$I_1$ - $I_3$ [mA]"
set xrange [1.6:2.9]

set style data points

f(x) = a*x
fit f(x) "clement" u ($2-$4):($2 - 4.09177)  via a

set tmargin at screen 0.99
set bmargin at screen 0.04
set lmargin at screen 0.01
set rmargin at screen 0.99

set term epslatex size 4,2.6
set output "clement-cidlem.tex"
plot "clement" u ($2-$4):($2 - 4.09177) lt 7 lc 1 lw 3 title "", f(x) lw 3 title ""
