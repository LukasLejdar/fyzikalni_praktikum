 
set angles degrees
set ylabel "odrazivost"
set xlabel "úhel dopadu $\\varphi$ (°)"

set tmargin at screen 0.95 
set bmargin at screen 0.20
set lmargin at screen 0.05
set rmargin at screen 0.95

Up = 4487
Us = 2736
np = 1.3
ns = 1.3

cosphi1p(x) = sqrt(1 - (sin(x)/np)**2)
fp(x) = ( ( cosphi1p(x) - np * cos(x) ) / ( cosphi1p(x) + np * cos(x)) ) ** 2
fit fp(x) "odrazivost.txt" u 1:($2 / 4487) via np

cosphi1s(x) = sqrt(1 - (sin(x)/ns)**2)
fs(x) = ( (cos(x) - ns * cosphi1s(x)) / (cos(x) + ns * cosphi1s(x)) ) ** 2
fit fs(x) "odrazivost.txt" u 1:($3 / Us) via ns

set key left top
set term epslatex size 3.7,2.5
set output "odrazivost.tex"
plot \
"odrazivost.txt" u 1:($2 / Up) ps 1 lc -1 lt 7 t "", \
"odrazivost.txt" u 1:($3 / Us) ps 1 lc -1 lt 7 t "", \
fp(x) lc 3 t "fit $R_p(\\varphi)$", \
fs(x) lc 4 t "fit $R_s(\\varphi)$"
