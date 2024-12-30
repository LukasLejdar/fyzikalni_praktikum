
import numpy as np
import cv2
import os

data = []

def get_coordinates(event, x, y, flags, param):
    if event == cv2.EVENT_LBUTTONDOWN:
        data.append(x)
        data.append(y)

directory = "michelson/"
jpg_files = [f for f in os.listdir(directory) if f.lower().endswith('.jpg')]

for file_name in jpg_files:
    image_path = os.path.join(directory, file_name)
    img = cv2.imread(image_path)
    img = cv2.resize(img, (800, 800))
    cv2.imshow(f"Image: {file_name}", img)
    cv2.setMouseCallback(f"Image: {file_name}", get_coordinates)

    while True:
        if cv2.waitKey(0) & 0xFF == ord('n'):
            break

    cv2.destroyAllWindows()

#data_old = np.loadtxt('vrstva.txt')
#data = np.vstack([data_old, np.array(data).reshape(-1, 3)])
np.savetxt('vrstva.txt', np.array(data).reshape(-1, 6))



