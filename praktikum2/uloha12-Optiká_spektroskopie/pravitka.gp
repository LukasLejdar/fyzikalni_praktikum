load '~/.local/share/gnuplot-palettes/viridis.pal'

array prav1[351]
array prav2[351]
array prav3[351]
array prav4[351]

array alphas[351]
array alphas_err[351]
array lambdas[351]

array ds = [3.55, 7.05, 10.55, 14.15] 
array Ts = [0, 0, 0, 0]

stats "spektroskopie/PRAV1.CSV" u (lambdas[int($0+1)] = $1) nooutput
stats "spektroskopie/PRAV1.CSV" u (prav1[int($0+1)] = $2) nooutput
stats "spektroskopie/PRAV2.CSV" u (prav2[int($0+1)] = $2) nooutput
stats "spektroskopie/PRAV3.CSV" u (prav3[int($0+1)] = $2) nooutput
stats "spektroskopie/PRAV4.CSV" u (prav4[int($0+1)] = $2) nooutput

T(x, a) = exp(-a*x) * 100

do for [i=1:351] {
    Ts[1] = prav1[i]
    Ts[2] = prav2[i]
    Ts[3] = prav3[i]
    Ts[4] = prav4[i]

    b = 1
    fit T(x, b) ds u (ds[$0+1]):(Ts[$0+1]) via b 
    alphas[i] = b 
    alphas_err[i] = b_err
}


set yrange [0:85]
set xrange [300:1050]
set bmargin at screen 0.03
set term epslatex size 6,2.7
set output "pravitka.tex"

set key left top Left reverse
set ylabel "propustnost \\%"
set xlabel "$\\lambda$ (nm)"
set termoption dashlength 5


plot \
"spektroskopie/PRAV1.CSV" u 1:2 w l ls 5 lw 4 t "$d = 3.55$ mm", \
"spektroskopie/PRAV2.CSV" u 1:2 w l ls 6 lw 4 t "$d = 7.05$ mm", \
"spektroskopie/PRAV3.CSV" u 1:2 w l ls 7 lw 4 t "$d = 10.55$ mm", \
"spektroskopie/PRAV4.CSV" u 1:2 w l ls 8 lw 4 t "$d = 14.15$ mm"

set key right top
unset yrange
set output "pravitka_alphas.tex"
plot lambdas u (lambdas[$0+1]):(alphas[$0+1]) w l lw 4 lc rgb "navy" t "fit", \
lambdas u (lambdas[$0+1]):(alphas[$0+1] + alphas_err[$0+1]*3) w l lc rgb "light-red" dt (20, 5) t "3$ \\sigma $", \
lambdas u (lambdas[$0+1]):(alphas[$0+1] - alphas_err[$0+1]*3) w l lc rgb "red" dt (20, 5) t ""

