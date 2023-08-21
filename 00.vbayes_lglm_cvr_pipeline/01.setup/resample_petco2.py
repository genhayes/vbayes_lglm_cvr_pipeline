##### This python script resamples petco2 peakline data to match the number of volumes in the functional data and then plots the resampled data if necessary
# Author: Genevieve Hayes
# Date: 22/09/2022
# Version: 1.0
######

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#  Define subject and session
# NOTE  THIS  ALSO NEEDS TO BE CHANGED IN FILE PATHS BELOW
subject = 'sub-01'
session = 'ses-01'
# Set the absolute path to the directory containing the data
ses_dir = 'path_to_data_directory/sub-001/ses-01/func_preproc/'

V_to_mmHg = 71.2 # Conversion factor from voltage to mmHg

# Load petco2 data
petco2_filename='task-breathhold_physio_co_peakline'
petco2 = np.loadtxt(ses_dir + petco2_filename)

nvols = 330 # Number of volumes in the functional data

# Down-sample the petco2 data to match the number of volumes in the functional data
petco2_resampled = petco2[0::len(petco2)//nvols]

# Plot the resampled data
plt.plot(petco2_resampled*V_to_mmHg)
plt.title(subject + '/' + session)
plt.xlabel('Volume')
plt.ylabel('PETCO2 (mmHg relative to mean)')
plt.show()

