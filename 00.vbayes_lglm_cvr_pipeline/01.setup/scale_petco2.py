##### This python script simply scales the petco2 data to mmHg if necessary
# Author: Genevieve Hayes
# Date: 22/09/2022
# Version: 1.0
######
# EXAMPLE USAGE: python scale_petco2.py [input_file]
######
import numpy as np

# Grab filename from command line
import sys
filename = sys.argv[1]

# Load data
data = np.loadtxt(filename)

v_to_mmHg = 71.2 # Conversion factor from voltage to mmHg

# Multiply all values in data by scalar
data = data * v_to_mmHg
