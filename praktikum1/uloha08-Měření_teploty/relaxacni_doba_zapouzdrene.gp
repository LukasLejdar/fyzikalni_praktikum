set xlabel "Čas [s]"
set ylabel "Odpor [$\\Omega$]"

t1 = 300
t2 = 1200
t = 170
u1 = 1190
u2 = 1090
f(x) =  u2 - (u2 - u1)*exp(-(x - t1)/t)
fit [t1:t2] f(x) "relaxacni_doba2.txt" using ($1):4 via u1,u2,t

set tmargin at screen 0.99
set bmargin at screen 0.04
set lmargin at screen 0.01
set rmargin at screen 0.99

set term epslatex size 5,2.7
set output "relaxacni_doba_zapozdrene.tex"
plot "relaxacni_doba2.txt" u 1:4 w l lc 28 lw 6 lt 14 t "", \
[261:1200] f(x) lt 0 lc -1 dt 3 lw 8 t "$\\tau_m$ = 147.4(8) s"
