#! /bin/bash
###### This script makes a montage of the vb and lGLM images for each subject and map for all sessions in a single image
# Author: Genevieve Hayes
# Date: 22/09/2022
# Version: 1.0
######

prj_dir=path_to_project_directory/pngs/multi_slice/cropped/combined

# Create a folder for the grids
out_dir=$prj_dir/grids

mkdir -p ${out_dir}

SBJ_LIST=('sub-001' 'sub-002' 'sub-003' 'sub-004' 'sub-007' 'sub-008')
MAP_LIST=('cvr1' 'delay')

# move into project directory
cd ${prj_dir} || exit

# combine images into grid for each subject and map
for sub in "${SBJ_LIST[@]}"
do 
    for map in "${MAP_LIST[@]}"
    do
        echo "combining vb and lGLM images for ${sub} ${map}"
        montage ${map}_${sub}_ses-01.png ${map}_${sub}_ses-02.png ${map}_${sub}_ses-03.png ${map}_${sub}_ses-04.png ${map}_${sub}_ses-05.png ${map}_${sub}_ses-06.png ${map}_${sub}_ses-07.png ${map}_${sub}_ses-08.png ${map}_${sub}_ses-09.png ${map}_${sub}_ses-10.png -tile 1x10 -geometry +2+0 ${out_dir}/${map}_${sub}_grid.png
    done
done


echo "Done rendering multi-slice images for all subjects"