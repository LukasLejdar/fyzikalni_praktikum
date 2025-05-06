import numpy as np
import random
import math
from collections import Counter
import matplotlib.pyplot as plt

poisson = np.loadtxt('poisson.txt')

poisson[2] += poisson[1] + poisson[0]
poisson[0] *= 0
poisson[1] *= 0

poisson[-4] += poisson[-3] + poisson[-2] + poisson[-1]
poisson[-3] *= 0
poisson[-2] *= 0
poisson[-1] *= 0

poisson = poisson[2:-3]

data = np.loadtxt('poisson6.txt')[:14]

chi_sq = np.sum(( poisson[:, 1] - poisson[:, 3] )**2 / (poisson[:, 3]))
print(chi_sq)

K = 7 * 1e-8
v = 0.02
d = 0.227

def r1(x):
    return np.sqrt(x**2 + v**2)

def r2(x):
    return np.sqrt((d - x)**2 + v**2)

def alpha(x):
    return np.arccos(x / r1(x))

def beta(x):
    return np.arccos((d - x) / r2(x))

def c(x):
    a = alpha(x)
    b = beta(x)
    numerator = np.cos(a) * np.cos(b)
    denominator = r1(x)**2 * r2(x)**2 * np.sin( (a + b) / 2 )**4
    return numerator / denominator


rate = 26/60  # events/sec

# Total time to simulate (e.g., 10 seconds)
T = 1200  # seconds

# List to hold the event times
event_times = []

current_time = 0

t = 0
while t <= T:
   t += random.expovariate(rate)
   event_times.append(t)

data = np.loadtxt('data.txt')

print( (30/60) / c(d/2) )

print(c(data[:, 0]))


#print(data[:, 2] / data[:, 1])

lam = 26

# Generate 1 random sample
sample = np.random.poisson(lam)

# Generate 1000 samples
samples = np.random.poisson(lam, 1000)

poisson6 = np.loadtxt('poisson6.txt')[:, 0]
poisson7 = np.loadtxt('poisson7.txt')[:, 0]
poisson8 = np.loadtxt('poisson8.txt')[:, 0]

poisson = poisson6 - poisson6[0]
poisson = np.hstack([ poisson, poisson7 + poisson[-1] ])
poisson = np.hstack([ poisson, poisson8 + poisson[-1] ])

#poisson = np.array(event_times)

factorial_vec = np.vectorize(math.factorial)


def dist(n, l):
    return l**n / factorial_vec(n) * np.exp(-l)

T = 10
N = np.floor(np.max(poisson) / T)
l = len(poisson) / poisson[-1] * T
bounds = np.array([ np.arange(N-1), np.arange(N-1)+1]).T * T
bins = [  len(poisson[(bound[0] < poisson) & (poisson <= bound[1]) ]) for bound in bounds ]
counts = Counter(bins)

print(len(poisson) / poisson[-1])
print(len(poisson) / poisson[-1] * N)
print(counts)
print(N)

print(dist(np.arange(12), l))
print(dist(np.arange(12), l)*N)

x = sorted(counts.keys())
y = [counts[i] for i in x]


plt.scatter(x, np.array(y))
plt.scatter(x, dist(x, l)*N)
plt.show()









