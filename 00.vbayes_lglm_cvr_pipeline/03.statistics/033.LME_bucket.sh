#! /bin/bash
#### This script runs seperates the LMEr analysis outputs using AFNI's 3dbucket
# Author: Genevieve Hayes
# Date: 22/09/2022
# Version: 1.0
######

wdr=path_to_project_directory/LMEr

for map in cvr delay
do
    # Define n
    n=$(fslval ${wdr}/LMEr_${map}.nii.gz dim5)

    for ind in $(seq 0 "$n")
    do
        name=$(3dinfo -label ${wdr}/LMEr_${map}.nii.gz["$ind"])
        name="${name// /_}"
        3dbucket -prefix ${wdr}/LMEr_${map}_"${name}".nii.gz -overwrite ${wdr}/LMEr_${map}.nii.gz["$ind"]
    done

    echo "Done $map LMEr map bucketting!"

done 

echo "Done!"


