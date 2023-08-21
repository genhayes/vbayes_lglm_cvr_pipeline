#! /bin/bash
###### This is the main script for generating the multislice pngs for the lGLM and vb CVR maps from outputs to grids
# Author: Genevieve Hayes
# Date: 22/09/2022
# Version: 1.0
######
module load fsl/6.0.3

bash render_multislice_fsl_maps.sh
bash crop_pngs.sh
bash combine_multislice_pngs.sh
bash make_multislice_grids.sh

echo "Done multi-slice pipeline!"
echo "---------------------------------"