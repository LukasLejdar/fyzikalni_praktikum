import uncertainties as unc

B = unc.ufloat( 0.488077013447971 ,  9.85264879721348e-05 )
KB = unc.ufloat(1585.75736168033, 5)

mB = unc.ufloat(349.5, 0.04) * 0.001
m1 = unc.ufloat(249, 0.02) * 0.001
m2 = unc.ufloat(190.7, 0.02) * 0.001
t1 = unc.ufloat(24.1, 0.01)
t2 = unc.ufloat(41.3, 0.1)
t = unc.ufloat(30.2, 0.1)

w = m2*(t2 - t) / (mB*(t - t1)) - m1/mB
K = KB * w / (1 + w)

print('K = ', K)
print('c = ', (KB - K)/mB)
