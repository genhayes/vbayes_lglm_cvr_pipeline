#! /bin/bash
#### Runs the quantiphyse batch script quantiphyse_cvr_batch_script.yaml
# Author: Genevieve Hayes
# Date: 22/09/2022
# Version: 1.0
######

source activate quantiphyse
cd path/to/quantiphyse_batch_script_folder || exit
quantiphyse --batch=quantiphyse_cvr_batch_script.yaml
