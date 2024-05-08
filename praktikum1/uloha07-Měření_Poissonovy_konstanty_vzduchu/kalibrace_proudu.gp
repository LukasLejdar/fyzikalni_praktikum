set xlabel "výška vodního sloupce [mm]"

set ylabel "Proud [mA]"

set style data points

f(x) = a*x + b
fit f(x) "kalibrace_proudu" u 1:2 via a,b

set label "$I_0 = (4.09 \\pm 0.05)\\ mA$ \n $c = (0.031 \\pm 0.001)\\ Am^{-1}$" at graph 0.05, 0.95

set term epslatex size 5,3
set output "kalibrace_proudu.tex"
plot "kalibrace_proudu" u 1:2 lt 7 lc 1 lw 3 title "", \
  f(x) lw 3 title "$I_0 + c\\Delta h$" \


