import cv2
import numpy as np
import os
import matplotlib.pyplot as plt

points = np.empty((0,2))

for file in sorted(os.listdir('koule8/')):
    image = cv2.imread('koule8/' + file)

    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    gray = gray[8:120, 430:1050]
    #gray = cv2.GaussianBlur(gray, (1, 1), 0)
    minVal, maxVal, minLoc, maxLoc = cv2.minMaxLoc(gray)
    #print(gray.shape)
    #print(maxLoc[::-1], gray[maxLoc[::-1]], gray[minLoc[::-1]])
    points = np.append(points, np.array([maxLoc]), axis=0)

print(points[:, 0] + 530)
plt.plot(points[:, 0])
plt.show()
