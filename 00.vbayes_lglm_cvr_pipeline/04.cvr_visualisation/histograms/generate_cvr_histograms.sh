#!/bin/bash
###### This script generates histograms for the CVR data
# Author: Genevieve Hayes
# Date: 22/09/2022
# Version: 1.0
######

# Choose subject and session or run all
SBJ_LIST=('sub-001') #'sub-002' 'sub-003' 'sub-004' 'sub-007' 'sub-008')
SES_LIST=('ses-01') #'ses-02' 'ses-03' 'ses-04' 'ses-05' 'ses-06' 'ses-07' 'ses-08' 'ses-09' 'ses-10')

for sub in "${SBJ_LIST[@]}"
do
    for ses in "${SES_LIST[@]}"
    do
        
        #EXAMPLE USAGE: python cvr_histograms.py [input_lglm] [input_bayes] [mask] [output_filepath] [start_range] [end_range]

        # generate histograms for gray matter
        python func_cvr_histograms.py ../Data/${sub}/${ses}/anat_preproc/${sub}_${ses}_cvr1_lGLM_GM_masked.nii.gz ../Data/${sub}/${ses}/anat_preproc/${sub}_${ses}_cvr1_vb_GM_masked.nii.gz ../Data/${sub}/${ses}/anat_preproc/${sub}_${ses}_T1w_brain_func_space_GM_mask.nii.gz ../Data/${sub}/${ses}/anat_preproc/GM_histogram_nozeros_1000bins.png -0.3 0.6
        # generate histograms for white matter
        python func_cvr_histograms.py ../Data/${sub}/${ses}/anat_preproc/${sub}_${ses}_cvr1_lGLM_WM_masked.nii.gz ../Data/${sub}/${ses}/anat_preproc/${sub}_${ses}_cvr1_vb_WM_masked.nii.gz ../Data/${sub}/${ses}/anat_preproc/${sub}_${ses}_T1w_brain_func_space_WM_mask.nii.gz ../Data/${sub}/${ses}/anat_preproc/WM_histograms_nozeros_1000bins.png -0.3 0.6

    done
done