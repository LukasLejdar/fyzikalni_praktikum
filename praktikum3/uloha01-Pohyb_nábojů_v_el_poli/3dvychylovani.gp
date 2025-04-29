
set term epslatex size 6,5
set output "3dvychylovani.tex"

set zlabel "$ y $ (cm)"
set xlabel "$ I_v $ (mA)"
set ylabel "$ U_a^{-1/2} \\cdot 10^{-2} $  $ (kV^{-1/2})  $ "  offset 9,0

f(x, y) = C * x * y

C = 1

fit f(x, y) "< (cat vychylovani1.txt && cat vychylovani2.txt && cat vychylovani3.txt && cat vychylovani4.txt ) " \
    u ($3):(1/sqrt($1)):($4/2) via C

set ytics offset 1,0

set grid

# Set 3D plot
set view 58, 217
set ticslevel 0

set tmargin at screen 0.9
set bmargin at screen 0.3

splot \
    f(x * 1e-3, y * 1e-2)*1e2  w l lc rgb "gray(0.1)" t "", \
    "vychylovani1.txt" using ($3*1e3):(1/sqrt($1)*100):($4*100/2) lc 1 pt 7 t "$ I_v = 82.0 $ mA", \
    "vychylovani2.txt" using ($3*1e3):(1/sqrt($1)*100):($4*100/2) lc 2 pt 7 t "$ I_v = 62.8 $ mA", \
    "vychylovani3.txt" using ($3*1e3):(1/sqrt($1)*100):($4*100/2) lc 3 pt 7 t "$ U_a = 1750 $ V", \
    "vychylovani4.txt" using ($3*1e3):(1/sqrt($1)*100):($4*100/2) lc 4 pt 7 t "$ U_a = 2000 $ V"
