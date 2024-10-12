import uncertainties as unc

m1 = unc.ufloat(34.71, 0.03) * 0.001
mv = unc.ufloat(43.08, 0.03) * 0.001
rho = 998.2

print(rho * m1/mv)

