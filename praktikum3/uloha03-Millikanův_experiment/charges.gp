set ylabel "$ q \\cdot 10^{-19}$ (C)"
set xlabel " měření "

set xrange[0:54]
set yrange [0:7]

set output "charges.tex"
set term epslatex size 3.5,2.4
plot "charges.txt" using ($0 + 1):($1 * 1e19) w p pt 7 ps 1 lc 0 t ""


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


