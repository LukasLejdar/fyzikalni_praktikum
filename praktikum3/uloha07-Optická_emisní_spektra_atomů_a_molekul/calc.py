import numpy as np
import uncertainties as unc

a = unc.ufloat(-1.94015, 0.1613 )
k = 8.6173303 * 1e-5

print(-1/(a*k))


a = unc.ufloat(-0.0892623, 0.003119)
Bv = 1696
h = 6.62607015 * 1e-34
c = 299792458
k = 1.380649 * 1e-23

print(-Bv*h*c/(k * a) )

