#!/usr/bin/env bash
#### This script runs the LMEr analysis on the normalized cvr and delay maps
# Author: Genevieve Hayes
# Date: 22/09/2022
# Version: 1.0
######
# TO RUN THIS SCRIPT:
# Change the folder paths below to the directories containing that normalized VB and lGLM outputs.
module load afni/latest

MNI_dir=path_to_project_directory/vbneg_MNI_maps_scaled
mask_path=path_to_MNI/brain_mask.nii.gz 
out_dir=path_to_project_directory/LMEr

echo "Mask path: ${mask_path}"

SBJ_LIST=('sub-001' 'sub-002' 'sub-003' 'sub-004' 'sub-007' 'sub-008')
SES_LIST=('ses-01' 'ses-02' 'ses-03' 'ses-04' 'ses-05' 'ses-06' 'ses-07' 'ses-08' 'ses-09' 'ses-10')

echo "Starting LME analysis"

for inmap in cvr delay
do
	# Compute LMErs
	rm ../LMEr_${inmap}.nii.gz

	run3dLMEr="3dLMEr -prefix ${out_dir}/LMEr_${inmap}.nii.gz -jobs 10"
	run3dLMEr="${run3dLMEr} -mask ${mask_path}"
	run3dLMEr="${run3dLMEr} -model  'model+(1|session)+(1|subject)'"

	run3dLMEr="${run3dLMEr} -gltCode lGLM_vs_vb  'model : 1*lGLM -1*vb'"

	run3dLMEr="${run3dLMEr} -dataTable                                                     "
	run3dLMEr="${run3dLMEr}       subject session  model       InputFile                        "
	for sub in "${SBJ_LIST[@]}"
	do
		for ses in "${SES_LIST[@]}"
		do
			for model in lGLM vb
			do
				if inmap=.'cvr'
				then
					run3dLMEr="${run3dLMEr}       ${sub}  ${ses}       ${model}      ${MNI_dir}/std_${model}_${sub}_${ses}.nii.gz"
				else
					run3dLMEr="${run3dLMEr}       ${sub}  ${ses}       ${model}      ${MNI_dir}/std_${inmap}_${model}_${sub}_${ses}.nii.gz"
				fi
			
			done
		done
	done
	echo ""
	echo "${run3dLMEr}"
	echo ""
	eval ${run3dLMEr}
done

echo "End of LME analysis script!"
