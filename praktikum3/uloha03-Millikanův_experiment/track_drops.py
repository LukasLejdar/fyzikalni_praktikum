import os
import cv2

import pandas as pd
import numpy as np
import trackpy as tp
import matplotlib.pyplot as plt

brightness = 1
contrast = 3
blur = 3

mereni_dir = 'mereni/'

particle_vels = {}

def get_video_frames(video):
    i = -1
    while True:
        ret, frame = video.read()
        if ret == False: break
        i += 1
        yield i, frame

#for video_file in os.listdir(mereni_dir):
for video_file in ['300V_0']:
    video = cv2.VideoCapture(mereni_dir + video_file)
    if not video.isOpened():
        print("Error: Cannot open video " + video_file)
        break

    print(video_file)

    background = np.median([frame for _, frame in get_video_frames(video)], axis=0).astype(np.uint8)

    video.set(cv2.CAP_PROP_POS_FRAMES, 0)

    all_features = []

    for i, frame in get_video_frames(video):
        frame = cv2.absdiff(frame, background)
        frame = cv2.medianBlur(frame, blur)
        frame = cv2.convertScaleAbs(frame, alpha=contrast, beta=brightness)

        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        gray[gray < 30] = 0

        features = tp.locate(gray, diameter=13, minmass=10)
        features['frame'] = i

        all_features.append(features)

    f = pd.concat(all_features).reset_index(drop=True)
    t = tp.link(f, search_range=10, memory=3)


    print('saving to trajectories/' + video_file + ".csv")
    t.to_csv('trajectories/' + video_file + ".csv" , index=False)

    selected_particles = set()
    lines = []

    fig, ax = plt.subplots(figsize=(10, 6))

    for particle, traj in t.groupby('particle'):
        line, = ax.plot(traj['frame'], traj['y'], label=f'{particle}', picker=5)
        line.set_gid(particle)  # store particle ID
        lines.append(line)

    ax.set_xlabel('Frame (time)')
    ax.set_ylabel('y-position (pixels)')
    ax.set_title(video_file)
    ax.grid(True)

    plt.show()
