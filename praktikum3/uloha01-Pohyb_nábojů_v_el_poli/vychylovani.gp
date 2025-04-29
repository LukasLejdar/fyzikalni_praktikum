set ylabel "$ y $ (cm)"
set xlabel " $ U_a^{-1/2} \\cdot 10^{-2} $  $ (kV^{-1/2})  $ "

f1(x) = a1*x
f2(x) = a2*x

fit f1(x) "vychylovani1.txt" u (1/$1**0.5*100):($4 * 1e2/2) via a1
fit f2(x) "vychylovani2.txt" u (1/$1**0.5*100):($4 * 1e2/2) via a2

set key at screen 0.65, 0.91

set yrange [6:11]

set term epslatex size 3.7,2.5
set output "vychylovani_Ivkonst.tex"
plot "vychylovani1.txt" u (1/$1**0.5*100):($4 * 1e2/2) lc 1 lt 7 t "", f1(x) lc 1 t "fit $ I_v = 82.0  $ mA", \
"vychylovani2.txt" u (1/$1**0.5*100):($4 * 1e2/2) lc 2 lt 7 t "", f2(x) lc 2 t "fit $I_v = 62.8$ mA"

set xlabel "$ I_v (mA) $"
set key top left
unset yrange

f3(x) = a3*x
f4(x) = a4*x

fit f3(x) "vychylovani3.txt" u ($3 * 1e3):($4 * 1e2/2) via a3
fit f4(x) "vychylovani4.txt" u ($3 * 1e3):($4 * 1e2/2) via a4

set key at screen 0.05, 0.87

set term epslatex size 3.7,2.5
set output "vychylovani_Ifkonst.tex"
plot "vychylovani3.txt" u ($3 * 1e3):($4 * 1e2/2) lc 3 lt 7 t "", f3(x) lc 3 t "fit $ U_a = 1750 $ V",  \
"vychylovani4.txt" u ($3 * 1e3):($4 * 1e2/2) lc 4 lt 7 t "", f4(x) lc 4 t "fit $ U_a = 2000 $ V"
