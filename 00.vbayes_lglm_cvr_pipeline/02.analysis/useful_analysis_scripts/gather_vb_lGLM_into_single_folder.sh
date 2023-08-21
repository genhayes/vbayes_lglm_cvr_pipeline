#! /bin/bash
#### This script moves vb .nii quantiphyse outputs and lGLM .nii quantiphyse outputs into the same folder
# Author: Genevieve Hayes
# Date: 22/09/2022
# Version: 1.0
######
# TO RUN THIS SCRIPT:
# Change the folder paths below to the directories containing that VB and lGLM outputs. new_dir is the directory where you want to move the files to.
######

new_dir=path_to_project_directory/links_to_all_maps/
vb_dir=path_to_project_directory/links_to_vb_maps/
lGLM_dir=path_to_project_directory/links_to_all_maps/

# Make new_dir if it doesn't exist
mkdir -p $new_dir

# Move all .nii files from vb_dir to new_dir
mv $vb_dir*.nii $new_dir
# Move all .nii files from lGLM_dir to new_dir
mv $lGLM_dir*.nii $new_dir

