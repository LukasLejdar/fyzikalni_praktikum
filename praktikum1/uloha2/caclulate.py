import math

RA = 150/12
RV = 10 * 10**6

def method1(U, uU, I, uI, unit, unittxt):
    mean = U/I
    u = mean*math.sqrt((uU/U)**2 + (uI/I)**2)
    return "({:.3f} $\pm$ {:.3g}) {}".format(mean/unit, 3 * u/unit, unittxt)

def methodA(U, uU, I, uI, unit, unittxt):
    mean = U/(I - U/RV)
    u = mean*math.sqrt((uU/U)**2 +  ( uI**2 + (U/RV)**2 *((uU/U)**2 + (uI/I)**2)) / (I - U/RV)**2 )
    return "({:.3f} $\pm$ {:.3g}) {}".format(mean/unit, 3 * u/unit, unittxt)

def methodB(U, uU, I, uI, unit, unittxt):
    mean = U/I - RA
    u = U/I*math.sqrt((uU/U)**2 + (uI/I)**2)
    return "({:.3f} $\pm$ {:.3g}) {}".format(mean/unit, 3 * u/unit, unittxt)

Ar1 = (3, 0.005, 30.36 * 10**-3, 0.02 * 10**-3, 1, "[$\Omega$]")
Br1 = (6, 0.008, 54.74 * 10**-3, 0.03 * 10**-3, 1, "[$\Omega$]")
#Ar2 = (16, 0.02, 0.017 * 10**-3, 0.002 * 10**-3, 10**6, "[M$\Omega$]")
#Br2 = (16.16, 0.02, 0.016 * 10**-3, 0.002 * 10**-3, 10**6, "[M$\Omega$]")

Ar2 = (16, 0.018, 0.0174 * 10**-3, 0.0015087 * 10**-3, 10**6, "[M$\Omega$]")
Br2 = (16.16, 0.01816, 0.016 * 10**-3, 0.001508 * 10**-3, 10**6, "[M$\Omega$]")

print("Vztah (1) & {} & {} & {} & {} \\\\".format(method1(*Ar1), method1(*Ar2), method1(*Br1), method1(*Br2)))
print("Vztah (2) a (3) & {} & {} & {} & {}".format(methodA(*Ar1), methodA(*Ar2), methodB(*Br1), methodB(*Br2)))

