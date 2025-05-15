import cv2
import numpy as np
import argparse
from background_remover import BackgroundRemover
from drops_manager import DropsManager

from drop_detector import find_drops, request_threshold
from drops_tracker import DropsTracker

from scipy.spatial import distance
from scipy.optimize import linear_sum_assignment

import matplotlib.pyplot as plt

import os
import mplcursors

import pandas as pd
from sklearn.linear_model import LinearRegression
from sklearn.metrics import r2_score
import matplotlib.pyplot as plt

import trackpy as tp

from scipy.stats import linregress


voltages = {
 '300V_0.csv' : 300,
 '500V_1.csv' : 500,
 '500V_0.csv' : 500,
 '550V_1.csv' : 550,
 '550V_0.csv' : 550,
 '450V_1.csv' : 450,
 '450V_0.csv' : 450,
 '600V_1.csv' : 600,
 '600V_0.csv' : 600,
 '600V_3.csv' : 600,
 '400V_1.csv' : 400,
 '400V_0.csv' : 400,
 '100V_1.csv' : 100,
 '350V_0.csv' : 350,
 '350V_1.csv' : 350,
 '300V_1.csv' : 300,
 '350V_1.csv' : 350,
 '100V_0.csv' : 100,
}

viskosity = 1.813e-5
oil_density = 1030
air_density = 1.204
g = 9.806
d = 2.5e-3
q = 1.602e-19

s_frame = 1 / 25
m_px = 0.0297e-3 / (483 / 30)

csv_dir = 'trajectories/'

particle_vels = {}

for csv in os.listdir(csv_dir):

    t = pd.read_csv('trajectories/' + csv)

    selected_particles = set()
    lines = []

    fig, ax = plt.subplots(figsize=(10, 6))

    for particle, traj in t.groupby('particle'):
        line, = ax.plot(traj['frame'], traj['y'], label=f'{particle}', picker=5)
        line.set_gid(particle)  # store particle ID
        lines.append(line)

    ax.set_xlabel('Frame (time)')
    ax.set_ylabel('y-position (pixels)')
    ax.set_title( csv + ' Click on trajectories to select')
    ax.grid(True)

    def on_pick(event):
        line = event.artist
        pid = line.get_gid()

        if pid in selected_particles:
            selected_particles.remove(pid)
            line.set_linewidth(1.0)
            line.set_color('blue')
        else:
            selected_particles.add(pid)
            line.set_linewidth(3.0)
            line.set_color('red')

        fig.canvas.draw()
    fig.canvas.mpl_connect('pick_event', on_pick)
    plt.show()

    particle_vels[csv] = []

    for particle, traj in t.groupby('particle'):
        if particle not in selected_particles:
            continue

        t_values = traj['frame'].values
        x_values = traj['x'].values
        y_values = traj['y'].values

        if len(t_values) <= 5:
            continue

        bounds = []
        lines = []
        vels = []
        line_fit = []

        fig, ax = plt.subplots()
        ax.plot(t_values, y_values)

        def fit():
            global line_fit
            global bounds
            global vels
            global t_values
            global y_values

            [line.remove() for line in line_fit]

            line_fit = []
            vels = []

            for i in range(0, len(bounds)-1, 2):
                mask = (bounds[i] < t_values) & (t_values < bounds[i+1])
                t = t_values[mask]
                y = y_values[mask]
                x = x_values[mask]

                slope_y, intercept_y, r_value, p_value, std_err = linregress(t, y)
                slope_x, intercept_x, r_value, p_value, std_err = linregress(t, x)
                line = ax.plot(t, slope_y * t + intercept_y, color='green', linestyle='-', alpha=0.5)[0]

                line_fit.append(line)
                vels.append([ float(slope_x), float(slope_y) ])

                charges = []

                for i in range(len(vels)-1):
                    v1 = abs(vels[i][1]) * m_px / s_frame
                    v2 = abs(vels[i+1][1]) * m_px / s_frame

                    r = (9/4 * viskosity / g * abs(v1 - v2) / (oil_density - air_density))**0.5
                    charge = 3 * np.pi * viskosity * r * (v1 + v2) / (voltages[csv]/d)
                    charges.append(charge)

                print(np.array(charges)/q, slope_x)

                plt.draw()

        def onclick(event):
            print(event)
            if event.inaxes:  # Make sure click is within the plot area
                x = event.xdata
                bounds.append(x)
                line = ax.axvline(x=x, color='red', linestyle='--')
                lines.append(line)
                plt.draw()
                fit()

        def on_key(event):
            print(event)
            if event.key == 'backspace' and lines:
                line = lines.pop()
                line.remove()
                removed_x = bounds.pop()
                plt.draw()
                fit()

        fig.canvas.mpl_connect('button_press_event', onclick)
        fig.canvas.mpl_connect('key_press_event', on_key)
        plt.show()

        particle_vels[csv].append(vels)


    with open('particles.txt', 'w') as file:
        file.write(str(particle_vels))

    print(particle_vels)

print(particle_vels)
