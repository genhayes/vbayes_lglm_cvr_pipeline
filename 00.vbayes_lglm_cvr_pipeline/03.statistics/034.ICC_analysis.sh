#!/usr/bin/env bash
#### This script runs the ICC(2,1) reproducibility analysis for the vb and/or lGLM maps NOTE: t-statistics are not currently included in this ICC(2,1) analysis
# Author: Genevieve Hayes
# Date: 22/09/2022
# Version: 1.0
######
# TO RUN THIS SCRIPT:
# Change the folder paths below to the directories containing that normalized VB and lGLM outputs.
######
module load afni/latest
# Define which model to run ICC stats on
model='lGLM' #vb

MNI_dir=path_to_project_directory/vbneg_MNI_maps_scaled
mask_path=path_to_MNI/brain_mask.nii.gz 
out_dir=path_to_project_directory/ICC2

SBJ_LIST=('sub-001' 'sub-002' 'sub-003' 'sub-004' 'sub-007' 'sub-008')
SES_LIST=('ses-01' 'ses-02' 'ses-03' 'ses-04' 'ses-05' 'ses-06' 'ses-07' 'ses-08' 'ses-09' 'ses-10')

echo "Starting ICC analysis for ${model}"

mkdir -p ${out_dir}

for inmap in cvr delay
do
	# Compute ICC
	rm ${out_dir}/ICC2_${inmap}_${model}.nii.gz

	run3dICC="3dICC -prefix ${out_dir}/ICC2_${inmap}_${model}.nii.gz -jobs 10"
	run3dICC="${run3dICC} -mask ${mask_path}"
	run3dICC="${run3dICC} -model  '1+(1|session)+(1|Subj)'"
		run3dICC="${run3dICC} -dataTable"
		run3dICC="${run3dICC}      Subj session    InputFile            "
		for sub in "${SBJ_LIST[@]}"
		do
			for ses in "${SES_LIST[@]}"
			do
			if [ ${inmap} == 'cvr' ]; 
			then
				run3dICC="${run3dICC}      ${sub}  ${ses}  ${MNI_dir}/std_${model}_${sub}_${ses}.nii.gz"
			else
				run3dICC="${run3dICC}      ${sub}  ${ses}  ${MNI_dir}/std_${inmap}_${model}_${sub}_${ses}.nii.gz"
			fi
			done
		done
		echo ""
		echo "${run3dICC}"
		echo ""
		eval "${run3dICC}"
done

echo "End of ICC analysis script!"