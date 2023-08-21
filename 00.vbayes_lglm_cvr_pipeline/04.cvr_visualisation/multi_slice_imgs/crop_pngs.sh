#! /bin/bash
#### This script renders png images for the lGLM and vb CVR maps using fsleyes
# Author: Genevieve Hayes
# Date: 22/09/2022
# Version: 1.0
######

slice_type='multi_slice' 
prj_dir_vb=path_to_project_directory/pngs/$slice_type
prj_dir_lGLM=path_to_project_directory/pngs/$slice_type
out_dir=path_to_project_directory/pngs/$slice_type/cropped

# Create a folder for the cropped image
mkdir -p ${out_dir}

SBJ_LIST=('sub-001' 'sub-002' 'sub-003' 'sub-004' 'sub-007' 'sub-008')
SES_LIST=('ses-01' 'ses-02' 'ses-03' 'ses-04' 'ses-05' 'ses-06' 'ses-07' 'ses-08' 'ses-09' 'ses-10')

# Crop images
for sub in "${SBJ_LIST[@]}"
do
    for ses in "${SES_LIST[@]}"
    do
        echo "cropping images for ${sub} ${ses}"

        convert ${prj_dir_lGLM}/${sub}_${ses}_cvr1_lGLM_render.png -crop 920x212+10+220 +repage ${out_dir}/${sub}_${ses}_cvr1_lGLM_render.png
        convert ${prj_dir_vb}/${sub}_${ses}_cvr1_vb_render.png -crop 920x212+10+220 +repage ${out_dir}/${sub}_${ses}_cvr1_vb_render.png

        convert ${prj_dir_lGLM}/${sub}_${ses}_delay_lGLM_render.png -crop 920x212+10+220 +repage ${out_dir}/${sub}_${ses}_delay_lGLM_render.png
        convert ${prj_dir_vb}/${sub}_${ses}_delay_vb_render.png -crop 920x212+10+220 +repage ${out_dir}/${sub}_${ses}_delay_vb_render.png
        
    done
done

echo "Done cropping images!"
