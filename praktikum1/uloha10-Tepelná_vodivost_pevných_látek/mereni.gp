T = 21.1
t1 = 3463
t2 = 5000.0

set yrange [10:70]
  set xrange [1580:t2]
k = 1 / (4.259*(10**-2)) 

z = 0.000001
u1 = 58
u2 = 11
f(x) = u2 - (u2 - u1)*exp(-(x-t1) * z * (pi) ** 2)
fit [t1:t2] f(x) "mereni.txt" using 1:($6 * k + T) via u1,u2,z

set bmargin at screen 0.03
set term epslatex size 6,3.5
set output "mereni.tex"

set ylabel "t $^{\\circ} C$"
set xlabel "$\\tau$ [s]"

plot \
"mereni.txt" u 1:($5 * k + T) w l lw 4 lc 28 t "čidlo 1", \
"mereni.txt" u 1:($6 * k + T) w l lw 4 lc 29 t "čidlo 2", \
"mereni.txt" u 1:($3 * k + T) w l lw 4 lc 8  t "čidlo 3", \
"mereni.txt" u 1:($9 * k + T) w l lw 4 lc 14 t "čidlo 4", \
[t1:t2] f(x) lt 0 lc -1 lw 8 title "fit"

system("python -c \"\
import uncertainties as unc; \
l = unc.ufloat(2*0.0126, 2*0.0003); \
rho = unc.ufloat(750, 30); \
c = 1100; \
z = unc.ufloat(0.000272747, 6.067e-07); \
print(\'\\nlamda =\', z * l ** 2 * rho * c)\
\" ")
