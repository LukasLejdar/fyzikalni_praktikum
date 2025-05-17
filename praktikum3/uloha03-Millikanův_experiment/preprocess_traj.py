import pandas as pd

df = pd.read_csv('trajectories/300V_0.csv')
with open('traj_by_particle.txt', 'w') as f:
    for pid, group in df.groupby('particle'):
        group = group.sort_values('frame')
        f.write(f"\" particle {pid} \" \n")  # Separate blocks
        for _, row in group.iterrows():
            f.write(f"{row['frame']} {row['y']}\n")
        f.write(f"\n\n")  # Separate blocks

print()
