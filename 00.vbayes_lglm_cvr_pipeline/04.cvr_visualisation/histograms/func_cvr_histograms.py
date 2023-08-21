#### This is a functino that plots the histograms of the CVR values for the lGLM and VB methods. It is called in generate_cvr_histograms.sh and generate_delay_histograms.sh
# Author: Genevieve Hayes
# Date: 22/09/2022
# Version: 1.0
######
# EXAMPLE USAGE: python cvr_histograms.py [input_lglm] [input_bayes] [mask] [output_filepath] [start_range] [end_range]
######

import numpy as np
from nilearn.masking import apply_mask
import matplotlib.pyplot as plt

# Read the cli arguments for the input file, mask and output file
import sys
input_files = [sys.argv[1], sys.argv[2]]
mask_file = sys.argv[3]
output_file = sys.argv[4]

# Read the range from the command line as floats
start_range = float(sys.argv[5])
end_range = float(sys.argv[6])
#print range
print(f"Range: {start_range} to {end_range}")

# Read the files
lglm_all = np.squeeze(apply_mask(input_files[0], mask_file))
bayes_all = np.squeeze(apply_mask(input_files[1], mask_file))

# set all values below -1 and about 1 to nan
lglm=lglm_all.copy()
bayes=bayes_all.copy()

# Only keep values between -1 and 1. Remove the rest
lglm[lglm < start_range] = np.nan
lglm[lglm > end_range] = np.nan
bayes[bayes < start_range] = np.nan
bayes[bayes > end_range] = np.nan

# Remove all values equal to zero
lglm[lglm==0] = np.nan
bayes[bayes==0] = np.nan

# Remove the nans
lglm = lglm[~np.isnan(lglm)]
bayes = bayes[~np.isnan(bayes)]

# Plot the histograms in the same figure
print("Plotting the histograms")
plt.figure(figsize=(15, 7))
plt.hist(lglm, bins=1000, alpha=0.5, label='LGML', histtype='step', linewidth=3)
plt.hist(bayes, bins=1000, alpha=0.5, label='Bayes', histtype='step', linewidth=3)


plt.xlim(start_range, end_range)

# print the number of voxels in the mask equal to 1
print(f"Number of voxels in the mask: {len(lglm_all)}")

# alculate the histogram and get the total number of counts
hist, bin_edges = np.histogram(lglm, bins=100)
total_counts = np.sum(hist)
print(f"Total counts for LGLM: {total_counts}")

hist, bin_edges = np.histogram(bayes, bins=100)
total_counts_2 = np.sum(hist)
print(f"Total counts for Bayesian: {total_counts_2}")

# count how many values are 0
print(f"Number of lGLM voxels with 0 remaining in histogram: {np.sum(lglm == 0)}")
print(f"Number of Bayesian voxels with 0 in histogram: {np.sum(bayes == 0)}")


# Add a legend
plt.legend(loc='upper right')
#
#  delete figure if it already exists
plt.close(output_file)

# Save the figure
plt.savefig(output_file)

print("Saved figure to {}".format(output_file))
