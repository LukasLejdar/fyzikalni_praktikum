w0 = 6368
a2 = 2280
G0 = 25*1e-3

f(x) = G0 / sqrt( ((w0**2-x**2)/(x*a2))**2 + 1 )
phif(x) = -atan((w0**2-x**2)/(x*a2))*180/pi

print(f(6.368*1e3))
fit f(x) "resonance.txt" u ($1*2*pi):5 via w0, a2, G0

set xlabel "$\\omega$ (rad/s)"
set ylabel "$G$ (k$\\Omega^{-1}$) "

set tmargin at screen 0.89
set bmargin at screen 0.11
set lmargin at screen 0.06
set rmargin at screen 0.94

set samples 1000
set term epslatex size 3.1,2.1
set output "resonance_G.tex"
plot [5:8] "resonance.txt" u ($1*2*pi/1e3):5 ps 1.0 lc 9 lt 7 t "", \
f(x*1e3) w l lc -1 title "fit"

set xlabel "$\\omega$ (rad/s)"
set ylabel "$\\varphi $ (deg)"

set ytics 30
set samples 1000
set term epslatex size 3.1,2.1
set output "resonance_phi.tex"
plot [5:8] "resonance.txt" using ($1*2*pi/1e3):6 ps 1.0 lc 9 lt 7 t "",\
phif(x*1e3) w l lc -1 title "fit"

