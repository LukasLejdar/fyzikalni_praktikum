set ylabel "$ \\langle L_t^2  \\rangle \\ \\mu \\text{m}^2 $"
set xlabel "t (s)"
set yrange [0:50]

a = 1e-12
f(x) = a*x
fit f(x) "brown_Ls.txt" u 1:2 via a

set bmargin at screen 0.03
set term epslatex size 4,2.0
set output "brown_Ls.tex"

plot "brown_Ls.txt" u 1:($2*1e12) lc 6 lt 7 t "", f(x)*1e12 lc 7 t "fit"


