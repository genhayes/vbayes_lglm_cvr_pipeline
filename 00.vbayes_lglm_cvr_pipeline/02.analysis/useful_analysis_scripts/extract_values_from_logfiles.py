#### This script extracts and prints specific values from the logfiles for the lGLM and vb CVR maps (abolsute latest start time and cross corelation estimated data start time)
# Author: Genevieve Hayes
# Date: 22/09/2022
# Version: 1.0
######
# TO RUN THIS SCRIPT:
# Load Python 3.7.13 and ensure the following packages are installed: pandas, numpy, matplotlib, os, glob
# Change the folder paths below to the directories containing that VB and lGLM outputs. new_dir is the directory where you want to move the files to.
######

import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import glob

# Define case folders to loop over until Case79
Cases = ["Case1","Case2","Case3","Case4","Case5","Case6","Case7","Case8","Case9","Case10","Case11","Case12","Case13","Case14","Case15","Case16","Case17","Case18","Case19","Case20","Case21","Case22","Case23","Case24","Case25","Case26","Case27","Case28","Case29","Case30","Case31","Case32","Case33","Case34","Case35","Case36","Case37","Case38","Case39","Case40","Case61","Case62","Case63","Case64","Case65","Case66","Case67","Case68","Case69","Case70","Case71","Case72","Case73","Case74","Case75","Case76","Case77","Case78","Case79"]

# Define project directory
project_dir = 'path/to/project_dir'

# Define the logfiles to extract values from
logfiles=["CvrPetCo2Vb.log"] # 'CvrPetCo2Vb.log')

# Define the values to extract
vals=["Final estimated data start time","Cross correlation estimated data start time"]

# Initialise a table to store the values
table = pd.DataFrame()

# Loop over cases
for case in Cases:
    print('Case: ' + case)
    # Loop over logfiles
    for logfile in logfiles:
        print('Logfile: ' + logfile)
        # Loop over values
        for val in vals:
            print('Value: ' + val)
            # Define the logfile path
            logfile_path = os.path.join(project_dir, case, logfile)
            # Open the logfile
            with open(logfile_path, 'r') as f:
                # Loop over lines in the logfile
                for line in f:
                    # If the line contains the value to extract
                    if val in line:
                        # Print the value
                        print(line)
                        # Add the value to the table
                        table.loc[case, val] = line.split(':')[-1].strip()
                
# Print the table
print(table)

                        


# Print done
print('Done')





