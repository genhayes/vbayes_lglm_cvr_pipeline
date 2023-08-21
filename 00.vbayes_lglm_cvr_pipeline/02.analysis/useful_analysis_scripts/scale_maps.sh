#! /bin/bash
#### This script scales the vb and lGLM maps by (x/scaling_factor) to convert from %BOLD/%CO2 to %BOLD/mmHg if necessary
# Author: Genevieve Hayes
# Date: 22/09/2022
# Version: 1.0
######

module load afni/latest

prj_dir=path_to_project_directory/links_to_all_maps
out_dir=path_to_project_directory/links_to_all_maps_scaled

#V_to_mmHg=71.2
scaling_factor=71.2

mkdir -p $out_dir

SBJ_LIST=('sub-001' 'sub-002' 'sub-003' 'sub-004' 'sub-007' 'sub-008')
SES_LIST=('ses-01' 'ses-02' 'ses-03' 'ses-04' 'ses-05' 'ses-06' 'ses-07' 'ses-08' 'ses-09' 'ses-10')


for sub in "${SBJ_LIST[@]}"
do
    for ses in "${SES_LIST[@]}"
    do
        echo "Scaling maps for ${sub} ${ses} by 1/${scaling_factor}"
        3dcalc -a ${prj_dir}/${sub}_${ses}_cvr1_lGLM.nii -expr "a/${scaling_factor}" -prefix ${out_dir}/${sub}_${ses}_cvr1_lGLM.nii -overwrite
        3dcalc -a ${prj_dir}/${sub}_${ses}_cvr1_vb.nii -expr "a/${scaling_factor}" -prefix ${out_dir}/${sub}_${ses}_cvr1_vb.nii -overwrite
    done
done

