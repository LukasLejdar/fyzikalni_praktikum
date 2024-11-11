set ylabel "$n$"
set xlabel "$\\lambda$ (nm)"

set ytics 0.005
set yrange [1.602:1.629]
set xrange [380:650]

B = 1e-12
f(x) = A + B / (x * 1e-9)**2
fit f(x) "cauchy.txt" u 1:2 via A,B

set bmargin at screen 0.03
set term epslatex size 4,2.0
set output "cauchy.tex"

plot "cauchy.txt" u 1:2 lc 1 lt 7 t "", f(x) lc 11 t "fit"

