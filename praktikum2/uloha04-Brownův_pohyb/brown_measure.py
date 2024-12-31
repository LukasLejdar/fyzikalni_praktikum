import cv2
import json
import numpy as np

trace_count = 15
trace = []

def click_event(event, x, y, flags, param):
    global trace_count
    if event == cv2.EVENT_LBUTTONDOWN:
        print(f"{trace_count} Clicked at: ({x}, {y})")
        trace.append((x, y))
        trace_count -= 1

video_path = "brown.mp4"
cap = cv2.VideoCapture(video_path)

img = cv2.imread('./brown_pct.jpg')
img = cv2.resize(img, (1200, 800))
cv2.imshow("Frame", img)
cv2.setMouseCallback("Frame", click_event)
cv2.waitKey(0)


while trace_count > 0:
    ret, frame = cap.read()
    cv2.imshow("Frame", frame)
    cv2.setMouseCallback("Frame", click_event)
    cv2.waitKey(0)

cap.release()
cv2.destroyAllWindows()

data_old = np.loadtxt('brown2.txt')
data_new = np.array(trace).reshape(-1, 2)
#data = np.column_stack([data_old, data_new])
np.savetxt('brown2.txt', data_new, fmt='%d')



