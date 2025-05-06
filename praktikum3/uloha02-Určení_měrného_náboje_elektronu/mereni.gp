set ylabel " $ 2U $ (V) "
set xlabel " $ D^2 B^2 / 4 \\cdot 10^{-10} $ $ C V^{-1} kg^{-1}  $ "

set term epslatex size 3.7,2.5
set output "mereni.tex"

a = -1e11

f(x) = a*x

fit f(x) "mereni.txt" u (($3 * $4/2)**2):( 2 * $2 )  via a

plot "mereni.txt" u (($3 * $4/2)**2 * 1e10):( 2 * $2 )  lc 0 lt 7 t "", f(x*1e-10) t "fit"
