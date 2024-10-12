import uncertainties as unc

m = unc.ufloat(17.728, 0.003)
m1 = unc.ufloat(38.580, 0.003)
mv = unc.ufloat(43.740, 0.003)
rho_vz = 1.204
rho = 998.2

print((rho - rho_vz) * (m1 - m) / (mv - m) + rho_vz )
