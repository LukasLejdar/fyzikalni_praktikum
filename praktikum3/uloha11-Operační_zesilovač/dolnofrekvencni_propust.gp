set xlabel "$ f $ (Hz)"
set ylabel "$ A_u $"

CF = 10e-9
RF = 100e3
RA = 10e3

f(w) = - U1 * (RF/RA) /( 1 + (2*pi*w*CF*RF)**2 )**0.5

fit f(x) "dolnofrekvencni_propust.txt" u 1:2 via U1

set term epslatex size 3.4,2.5
set output "dolnofrekvencni_propust.tex"

set yrange [-2:-12]

g(x) = - 10.898 / 2**0.5


plot "dolnofrekvencni_propust.txt" u 1:2 lc -1 lt 7 t "", f(x) lc 6 t "teoretická závislost", g(x) lc 2 t "$ A_{u,max} / \\sqrt(2) $ "
