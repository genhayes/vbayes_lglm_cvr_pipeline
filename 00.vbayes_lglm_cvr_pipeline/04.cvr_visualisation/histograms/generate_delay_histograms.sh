#!/bin/bash
###### This script generates histograms for the hemodynamic delay data
# Author: Genevieve Hayes
# Date: 22/09/2022
# Version: 1.0
######

# ADJUST FILE PATHS AS NEEDED. Choose subject and session or use case numbers
SBJ_LIST=('sub-001') #'sub-002' 'sub-003' 'sub-004' 'sub-007' 'sub-008')
SES_LIST=('ses-01') #'ses-02' 'ses-03' 'ses-04' 'ses-05' 'ses-06' 'ses-07' 'ses-08' 'ses-09' 'ses-10')
CASE='Case12'

for sub in "${SBJ_LIST[@]}"
do
    for ses in "${SES_LIST[@]}"
    do
        
        #EXAMPLE USAGE: python cvr_histograms.py [input_lglm] [input_bayes] [mask] [output_filepath] [start_range] [end_range]

        # generate histograms for gray matter
        python cvr_histograms.py ../Data/qp_outputs/"${CASE}"/delay_lGLM.nii ../Data/qp_vbneg_out/"${CASE}"/mean_delay_vbneg.nii ../Data/${sub}/${ses}/anat_preproc/${sub}_${ses}_T1w_brain_func_space_GM_mask.nii.gz ../Data/${sub}/${ses}/anat_preproc/GM_delay_histograms_nozeros_1000bins.png -8 8
        # generate histograms for white matter
        python cvr_histograms.py ../Data/qp_outputs/"${CASE}"/delay_lGLM.nii ../Data/qp_vbneg_out/"${CASE}"/mean_delay_vbneg.nii ../Data/${sub}/${ses}/anat_preproc/${sub}_${ses}_T1w_brain_func_space_WM_mask.nii.gz ../Data/${sub}/${ses}/anat_preproc/WM_delay_histograms_no_zeros_1000bins.png -8 8

    done
done