import numpy as np
import matplotlib.pyplot as plt

phi1 = 0.90 * 1e-4
phi3 = 0.52 * 1e-4
phi5 = 0.34 * 1e-4

poloha1 = np.loadtxt('1.txt')

osv1_S = np.zeros([len(poloha1), 2])
osv1_S[:, 0] = poloha1[:, 0]
osv1_S[:, 1] = poloha1[:, 3] / phi1

def transform_S(osv, phi):
    osvn = ( osv - np.array([946, 704]) ) / np.array([4931 - 946, 3379 - 704])
    osvn = osvn * np.array([850 - 550, 3])  + np.array([550, 0])
    osvn[:, 1] *= phi
    return osvn

osv1_S_eps = np.array([
    1557, 803, 
    1730, 823, 
    1929, 843, 
    2009, 853, 
    2168, 882, 
    2274, 902, 
    2407, 942, 
    2553, 962, 
    2699, 1001, 
    2779, 1031, 
    2952, 1100, 
    3071, 1140, 
    3231, 1229, 
    3470, 1358, 
    3563, 1437, 
    3789, 1596, 
]).reshape(-1, 2)

osv2_S_eps = np.array([
    1956, 875, 
    2115, 893, 
    2221, 910, 
    2500, 1013, 
    2646, 1030, 
    2846, 1081, 
    3045, 1167, 
    3204, 1236, 
    3417, 1356, 
    3629, 1493, 
    3709, 1561, 
    3842, 1647, 
    4014, 1836, 
    4174, 2059, 
    4320, 2264, 
]).reshape(-1, 2)

osv5_S_eps = np.array([
    2327, 966,
    2474, 1019,
    2673, 1071,
    2846, 1124,
    3018, 1176,
    3217, 1281,
    3337, 1333,
    3510, 1438,
    3629, 1543,
    3802, 1648,
    3921, 1753,
    4028, 1858,
    4134, 1963,
    4240, 2068,
    4320, 2199,
    4386, 2278,
    4453, 2382,
    4586, 2592,
    4665, 2776,
    4745, 2907,
    4851, 3064,
]).reshape(-1, 2)

#print(transform_S(osv1_S_eps, phi1))
#print()
#print(transform_S(osv2_S_eps, phi3))
#print()
#print(transform_S(osv5_S_eps, phi5))
#print()

def transform_M(osv):
    osvn = ( osv - np.array([946, 704]) ) / np.array([4931 - 946, 3379 - 704])
    osvn = osvn * np.array([850 - 550, 300])  + np.array([550, 0])
    osvn[:, 1] = (osvn[:, 1] * 1e6)**(1/14)
    return osvn

osv1_M_eps = np.array([
    1557, 736,
    1730, 750,
    1929, 781,
    2009, 777,
    2168, 788,
    2274, 817,
    2407, 834,
    2553, 871,
    2699, 906,
    2779, 907,
    2952, 975,
    3071, 1011, 
    3231, 1107, 
    3470, 1264, 
    3563, 1302, 
    3789, 1471, 
]).reshape(-1, 2)

sigma = (poloha1[:, 2] / poloha1[:, 1])**0.5

osv1_M_new = transform_M(osv1_M_eps)


osv3_M_eps = np.array([
    1956, 788, 
    2115, 781, 
    2221, 786, 
    2500, 861, 
    2646, 867, 
    2846, 947, 
    3045, 1024, 
    3204, 1070, 
    3417, 1161, 
    3629, 1405, 
    3709, 1460, 
    3842, 1554, 
    4014, 1662, 
    4174, 1926, 
    4320, 2307, 
]).reshape(-1, 2)

osv5_M_eps = np.array([
    2327, 899,
    2474, 878,
    2673, 893,
    2846, 913,
    3018, 994,
    3217, 1061,
    3337, 1129,
    3510, 1329,
    3629, 1398,
    3802, 1628,
    3921, 1573,
    4028, 1730,
    4134, 1955,
    4240, 2154,
    4320, 2245,
    4386, 2245,
    4453, 2450,
    4586, 2550,
    4665, 2955,
    4745, 3078,
    4851, 3212,
]).reshape(-1, 2)

#print(transform_M(osv1_M_eps))
#print()
#print(transform_M(osv3_M_eps))
#print()
#print(transform_M(osv5_M_eps))

def transform_zes(zes):
    zesn = ( zes - np.array([726, 440]) ) / np.array([4205, 2939])
    zesn = zesn * np.array([0.00008, 3.8 - 3.2]) + np.array([0.00001, 3.2])
    zesn[:, 1] = zesn[:, 1]
    return zesn

zes650_eps = np.array([
    4931, 653,
    3722, 448,
    2934, 713,
    2408, 763,
    1987, 638,
    1620, 732,
    1304, 1256,
    1041, 863,
]).reshape(-1, 2)

zes750_eps = np.array([
    4931, 2854,
    3722, 2608,
    2934, 2629,
    2408, 2945,
    1987, 2686,
    1620, 2715,
    1304, 3052,
    1041, 2789,
]).reshape(-1, 2)


print(transform_zes(zes650_eps), '')
print()
print(transform_zes(zes750_eps), '')
print()


