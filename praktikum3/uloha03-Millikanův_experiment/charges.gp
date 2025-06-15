set ylabel "$ q \\cdot 10^{-19}$ (C)"
set xlabel "měření"

set xrange [0:54]
set yrange [0:7]

set output "charges.tex"
set term epslatex size 3.8,2.3

# Use a discrete blue-scale palette (darker blue = higher value)
set palette defined (\
    1 "#9ecae1", \
    2 "#6baed6", \
    3 "#3182bd", \
    4 "#08519c")

set colorbox
set palette maxcolors 4
set cblabel "Shluk" offset character 1.,0
set cbtics scale 0
set cbrange [0.5:4.5]
set cbtics ("1" 1, "2" 2, "3" 3, "4" 4)

# Plot: use third column to select one of the 4 discrete colors
plot \
 1.58 lc rgb '#D3D3D3' t "", \
 3.23 lc rgb '#D3D3D3' t "", \
 4.84 lc rgb '#D3D3D3' t "", \
 6.36 lc rgb '#D3D3D3' t "", \
 "charges.txt" using ($0 + 1):($1 * 1e19):3 with points pt 7 ps 1 palette notitle

set colorbox
set cblabel "Napětí (V)" offset character 2,0
set palette maxcolors 7
set cbtics scale 0
set cbrange [275:625]
set palette defined (\
    0 "#440154", \
    1 "#3E4989", \
    2 "#31688E", \
    3 "#1F9E89", \
    4 "#35B779", \
    5 "#B4DE2C", \
    6 "#FDE725")

set cbtics ( "300" 300, "350" 350, "400" 400, "450" 450, "500" 500, "550" 550, "600" 600, "650" 650)

set xrange [0:62]
set yrange [0:7]

set output "all_charges.tex"
set term epslatex size 4.4,2.5
plot \
 1.58 lc rgb '#D3D3D3' t "", \
 3.23 lc rgb '#D3D3D3' t "", \
 4.84 lc rgb '#D3D3D3' t "", \
 6.36 lc rgb '#D3D3D3' t "", \
"all_charges.txt" using ($0 + 1):($1 * 1e19):2 w p pt 7 ps 1 palette notitle


set xlabel "n"

unset yrange
unset xrange

f(x) = e*x

fit f(x) "charges.txt" u 3:($1 * 1e19) via e

set xrange [0:4]
set xtics 0,1,4

set output "charge.tex"
set term epslatex size 2.9,2.3

plot "charges.txt" u 3:($1 * 1e19) lt 7 lc -1 t "", f(x) lc 2 t "fit"

