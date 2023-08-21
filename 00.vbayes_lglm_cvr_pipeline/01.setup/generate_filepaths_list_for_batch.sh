#!/bin/bash
##### This script simply generates a list of filepaths for the quantiphyse analysis
# Author: Genevieve Hayes
# Date: 22/09/2022
# Version: 1.0
######
path_base='path_to_project_directory/'
list_output_path='path_to_list_output/list.txt'

SBJ_LIST=('sub-001' 'sub-002' 'sub-003' 'sub-004' 'sub-005' 'sub-006' 'sub-007' 'sub-008' 'sub-009' 'sub-010')
SES_LIST=('ses-01' 'ses-02' 'ses-03' 'ses-04' 'ses-05' 'ses-06' 'ses-07' 'ses-08' 'ses-09' 'ses-10')
num=1

for SBJ in "${SBJ_LIST[@]}"
do
    for SES in "${SES_LIST[@]}"
    do
    cat >> ${list_output_path} <<-EOF
        Case${num}:
            Folder: ${path_base}/${SBJ}/${SES}/func_preproc
EOF
    num=$((num+1))

    done
done

echo "List of filepaths saved to ${list_output_path}"
echo "Done generating list of filepaths for quantiphyse analysis!"
