
set xlabel "Čas [s]"
set ylabel "Odpor [$\\Omega$]"

t1 = 335
t2 = 900

t = 123
u1 = 238
u2 = 107
f(x) = u2 - (u2 - u1)*exp(-(x-t1) / t )
fit [t1:t2] f(x) "udaje_zapuzdrene.txt" using 1:2 via u1,u2,t

set xrange [326:900]
set yrange [100:260]

set tmargin at screen 0.99
set bmargin at screen 0.04
set lmargin at screen 0.01
set rmargin at screen 0.99

set term epslatex size 5,2.7
set output "udaje.tex"
plot "udaje_zapuzdrene.txt" u 1:2 w l lc 28 lw 6 lt 14 t "", \
[326:t2] f(x) lt 0 lc -1 dt 3 lw 8 t "fit"
