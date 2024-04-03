set xlabel "Čas [s]"
set ylabel "Odpor [$\\Omega$]"

t1 = 300
t2 = 400
t = 170
u1 = 1190
u2 = 1090
f(x) =  u2 - (u2 - u1)*exp(-x/t)
fit [t1:t2] f(x) "relaxacni_doba2.txt" using ($1 - t1):4 via u1,u2,t

set tmargin at screen 1.0
set bmargin at screen 0.04
set lmargin at screen 0
set rmargin at screen 1

set term epslatex size 5,3.2
set output "relaxacni_doba_zapozdrene.tex"
plot "relaxacni_doba2.txt" u 1:4 w l lw 3 lt 14 t "", [285:1200] f(x-t1) lc -1 lw 5 t "$\\tau_m$ = 147.4(8) s"
