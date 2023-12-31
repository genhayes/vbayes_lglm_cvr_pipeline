# vbayes_lglm_cvr_pipeline
This repository includes all the scripts required to recreate the Variational Bayesian and lagged-General Linear Model CVR, hemodynamic delay, and statistics results using Quantiphyse and accompanying software. The pipeline has been made as accessible as possible for you to adapt it to run your own Variational Bayesian and/or lagged-General Linear Model CVR analysis on your own data or using S. Moia's publically available breath-hold data.

### To clone `vbayes_lglm_cvr_pipeline`:
```
git clone https://github.com/genhayes/vbayes_lglm_cvr_pipeline
```

# Pipeline organisation
### Scripts are organised into the folders:
- ```01.setup```
  - Contains useful scripts for preparing the data including resampling the CO2 traces and automatically generating a filepath list for the batch script in Quantphyse. Other scripts to help with optimally-combining multi-echo data, denoising, and other data preprocessing is available at [/smoia/EuskalIBUR_dataproc](https://github.com/smoia/EuskalIBUR_dataproc/tree/master), [/smoia/phys2cvr](https://github.com/smoia/phys2cvr), and [tedana's multi-echo analysis](https://me-ica.github.io/multi-echo-data-analysis/content/intro.html).
- ```02.analysis```
  - Includes an example of the main batch script for Quantiphyse to run the VB and lGLM analyses as well as scripts to help with scaling, logfile value-extraction, and output organisation should they be needed.
- ```03.statistics```
  - Contains the scripts for converting the output maps to MNI space and for running the LMEr [Chen et al., 2013](https://www.sciencedirect.com/science/article/pii/S1053811913000943) and ICC(2,1) [(Chen et al., 2018)](https://onlinelibrary.wiley.com/doi/full/10.1002/hbm.23909) statistical analyses.
- ```04.cvr_visualisation```
  - Scripts to render, crop, and combine singleslice and multislice images, scatter plots, and histograms of the analysis outputs. Feel free to treat these as inspiration for creating your own figures.
- ```05.stats_visualisation```
  - Scripts to render images for the statistical analyses.

# Data
This pipeline was created and used on the EuskalIBUR dataset. This dataset includes multi-echo BOLD MRI, CO2 traces, and respiratory belt data for 10 subjects x 10 sessions each acquired during a breath-hold protocol. All of the MRI images, physiological data, and manual classification used in this study is available in OpenNeuro at [(Moia et al., 2020)](https://openneuro.org/datasets/ds003192/versions/1.0.1). For more information regarding the protocol and acquisition methods see [(Moia et al., 2021)](https://www.sciencedirect.com/science/article/pii/S1053811921001919).

This pipeline was built for data organised in [BIDS format](https://bids.neuroimaging.io/), however it can be adapted to other folder structures if needed by changing the filepaths and folder loops.

# Quantiphyse and helpful software installation
To run the pipeline, you will need to install the following:
- [Quantiphyse](https://quantiphyse.readthedocs.io/en/latest/basics/install.html)
  - IMPORTANT: You will also need to install the CVR plugin for Quantiphyse using the command
    ```
    pip install quantiphyse-cvr
    ```
- [Python 3.7.13](https://www.python.org/downloads/release/python-3713/) (numpy, pandas),
- [FSL 6.0.3](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation) (optional; for visualisation only),
- [AFNI_23.0.07](https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/background_install/install_instructs/index.html) (optional) 
  - [Advanced Normalization Tool (ANTs)](https://andysbrainbook.readthedocs.io/en/latest/ANTs/ANTs_Overview.html) (optional; for mapping to MNI space for statistics only)
 
Note that these scripts may not run if using different versions of the software.

# Preprocessing
To preprocess the anatomical MRI, BOLD MRI, PETCO2 traces, please see [S. Moia's EuskalIBUR](https://github.com/smoia/EuskalIBUR_dataproc/tree/master) GitHub repository.
