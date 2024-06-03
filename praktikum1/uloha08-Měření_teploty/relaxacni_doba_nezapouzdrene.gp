set xlabel "Čas [s]"
set ylabel "Napětí [mV]"

t1 = 239
t2 = 600
t = 100
u1 = 3 
u2 = 1 
f(x) =  u2 - (u2 - u1)*exp(-(x - t1)/t)
fit [t1:t2] f(x) "relaxacni_doba2.txt" using 1:2 via u1,u2,t

set tmargin at screen 1.0
set bmargin at screen 0.15
set lmargin at screen 0
set rmargin at screen 1

set term epslatex size 5,3
set output "relaxacni_doba_nezapouzdrene.tex"
plot "relaxacni_doba2.txt" u 1:2 w l lw 3 lt 14 t "", \
[t1:1200] f(x)lt 0 lc -1 dt 3 lw 8 t "$\\tau_m$ = 56 $\\pm$ 75 s"
