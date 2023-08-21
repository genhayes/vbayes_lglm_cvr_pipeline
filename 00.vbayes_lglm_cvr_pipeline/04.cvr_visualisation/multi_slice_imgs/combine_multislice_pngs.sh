#! /bin/bash
#### This script combines the vb and lGLM images into a single image for each subject and session
# Author: Genevieve Hayes
# Date: 22/09/2022
# Version: 1.0
######
prj_dir=path_to_project_directory/pngs/multi_slice/cropped 
# Create a folder for the grids
out_dir=$prj_dir/combined

mkdir -p ${out_dir}

SBJ_LIST=('sub-001' 'sub-002' 'sub-003' 'sub-004' 'sub-007' 'sub-008')
SES_LIST=('ses-01' 'ses-02' 'ses-03' 'ses-04' 'ses-05' 'ses-06' 'ses-07' 'ses-08' 'ses-09' 'ses-10')
MAP_LIST=('cvr1' 'delay')

# move into project directory
cd ${prj_dir} || exit

# combine images into grid
for sub in "${SBJ_LIST[@]}"
do
    for ses in "${SES_LIST[@]}"
    do
        for map in "${MAP_LIST[@]}"
        do
            echo "combining vb and lGLM images for ${sub} ${ses} ${map}"
            montage ${sub}_${ses}_${map}_lGLM_render.png ${sub}_${ses}_${map}_vb_render.png -tile 2x1 -geometry +2+0 ${out_dir}/${map}_${sub}_${ses}.png
        done

    done
done

cd ${out_dir} || exit

echo "Done combine vb and lGLM for the multi-slice images"