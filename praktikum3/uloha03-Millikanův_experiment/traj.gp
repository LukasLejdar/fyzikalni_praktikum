set ylabel "$ y $ (px)"
set xlabel "$ t $ (frame)"

set palette defined ( \
    0 "#440154",  \
    1 "#482878",  \
    2 "#3E4A89",  \
    3 "#31688E",  \
    4 "#26828E",  \
    5 "#1F9E89",  \
    6 "#35B779",  \
    7 "#6CCE59",  \
    8 "#B4DE2C",  \
    9 "#FDE725" )

stats 'traj_by_particle.txt' u 0

set term epslatex size 4.2,2.5
set output "traj.tex"

set xrange [0:350]

x1 = 42
x2 = 77
x3 = 128
x4 = 256

set arrow from x1,0 to x1,600 nohead lc 0 lt 0
set arrow from x2,0 to x2,600 nohead lc 0 lt 0
set arrow from x3,0 to x3,600 nohead lc 0 lt 0
set arrow from x4,0 to x4,600 nohead lc 0 lt 0

plot for [in=0:452] "traj_by_particle.txt" i in u 1:2 w l lw 1 t "", x=100 
