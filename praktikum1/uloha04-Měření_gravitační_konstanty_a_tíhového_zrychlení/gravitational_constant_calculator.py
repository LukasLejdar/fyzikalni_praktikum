import uncertainties as unc
import uncertainties.umath as umath
import math

rho = 8.19e-3
m = unc.ufloat(38.3e-3, 0.2e-3)
d = 50.0e-3
M = 1.5
r = 46.5e-3
T = unc.ufloat(500, 5)

L = 5.280 # Vzdálenost protější stěny od oscilátoru v metrech
meritko = 918 # délka 0.5m dlohého měřitka v pixelech

x1 = unc.ufloat(937, 7.5)
x2 = unc.ufloat(803, 7.5)

phi = 0.5 * umath.atan((x1/meritko - x2/meritko) / (2*L))

J = 2*m*(2/5*(rho**2) + d**2)
D = (2*math.pi/T)**2 * J
Z = 2*M*m*d*( 1/(r**2) - r/( (4*(d**2) + r**2) ** (3/2)) )

G =  D * phi / Z

print('x0', x1 / meritko, 'x1', x2 / meritko)
print('\\varphi_0 - \\varphi_0\' &=', phi * 2, '\\\\')
print('J &=', J, '\\\\')
print('D &=', D, '\\\\')
print('G &=', G, '\\\\')
