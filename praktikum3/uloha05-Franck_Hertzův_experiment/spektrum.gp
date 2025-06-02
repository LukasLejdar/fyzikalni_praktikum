set ylabel ""
set xlabel ""

set term epslatex size 6.9,2.5
set output "spektrum.tex"

set key at graph 0.36, 0.97

set yrange [0:10000]
set xrange [515:742]

set xtics 515,10,745

plot "KROKER0004.trt" u 1:($2 - 2000) w l lt 7 lc -1 t "", \
"Neon.txt" u 1:(0):(0):($2/2.5) with vectors filled nohead lw 4 lt 1 lc 2 t " spektrální čáry Neonu", \
"Helium.txt" u 1:(0):(0):($2*15) with vectors filled nohead lw 4 lt 1 lc 4 t " spektrální čáry Helia"
