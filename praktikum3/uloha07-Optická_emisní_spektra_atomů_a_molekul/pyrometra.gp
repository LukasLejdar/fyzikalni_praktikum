set ylabel "$  \\ln \\frac{I \\lambda^4 }{S} $"
set xlabel "$ N' (N' + 1)$ "

Bv = 1696
h = 6.62607015 * 1e-34
c = 299792458
k = 1.380649 * 1e-23

q = -Bv*h*c/(k * 273)
C = 10

f(x) = x*q + C
fit f(x) "OH7_spectral_lines.txt" u ($1*($1+1)):(log($8 * $4**4 / $2)) via q,C

set bmargin at screen 0.03
set term epslatex size 3,1.5
set output "intenzity.tex"

set xrange [0:45]

plot "OH7_spectral_lines.txt" u ($1*($1+1)):(log($8 * $4**4 / $2)) lc 6 lt 7 t "", f(x) t "$ ax + b $"

print(-Bv*h*c/(k * q) )
