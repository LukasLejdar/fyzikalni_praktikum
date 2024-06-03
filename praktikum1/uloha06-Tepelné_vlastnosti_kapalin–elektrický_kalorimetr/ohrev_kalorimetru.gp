set ylabel "T ($^{\\circ}$C)"
set xlabel "t (s)"

set tmargin at screen 0.99
set bmargin at screen 0.01

t1 = 100
t2 = 4670

T0 = 25.0
P = 20.0
B = 1.0
KB = P / 0.01261227

f(x) = T0 + P / B * (1 - exp(-B*(x - t1)/KB))
fit [t1:t2] f(x) "ohrev_kalorimetru.txt" u 1:3 via T0, B

k(x) = T0 + (x - t1)* P/KB

set yrange [20:65]
set ytics 20,5,60
set key left top
set key reverse
set key Left

set term epslatex size 5.5,3
set output "ohrev_kalorimetru.tex"
plot \
"ohrev_kalorimetru.txt" u 1:3 w l lw 4 lc 4 t "$t(\\tau)$", \
"ohrev_kalorimetru.txt" u 1:5 w l lw 4 lc rgb "grey" t "$t_0(\\tau)$", \
[t1:t2] f(x) lw 8 lt 0 lc -1 t "fit", \
[t1:t2] k(x) lw 2 lt 0 lc -1 t "směrnice v t(0)"

print 'B = unc.ufloat(', B, ', ', B_err, ')'
print 'KB =', KB

pause -1
