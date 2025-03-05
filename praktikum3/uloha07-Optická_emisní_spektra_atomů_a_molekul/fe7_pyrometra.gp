set ylabel "$  \\ln \\frac{I_{mn} \\lambda_{mn} }{ A_{mn}g_m } $"
set xlabel "$E_m$ (eV)"

k = 8.6173303 * 1e-5

q = -1/(k*3000)
C = 40


f(x) = x*q + C

fit f(x) "fe7_spectral_lines.txt" u 2:(log($9 * $1 / $3 * 1e8)) via q,C

set bmargin at screen 0.03
set term epslatex size 4,2.0
set output "fe7_pyrometra.tex"

set xrange [2.7:6]

plot "fe7_spectral_lines.txt" u 2:(log($9 * $1 / $3 * 1e8)) lc 6 lt 7 t "", f(x) t "$ ax + b $"

print(-1/(q*k))


