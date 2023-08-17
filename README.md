# vbayes_lglm_cvr_pipeline

## Scripts are organised into different folders:
- ```01.setup```
- ```02.analysis```
- ```03.statistics```
- ```04.cvr_visualisation```
- ```05.stats_visualisation```

# Data
This pipeline was created and used on the EuskalIBUR dataset. This dataset includes multi-echo BOLD MRI, CO2 traces, and respiratory belt data for 10 subjects x 10 sessions each of a breath-hold protocol. All of the MRI images, physiological data, and manual classification used in this study is available in OpenNeuro at [(Moia et al., 2020)](https://openneuro.org/datasets/ds003192/versions/1.0.1).

# Preprocessing
To preprocess the anatomical MRI, BOLD MRI, PETCO2 traces, please see S.Moia's [EuskalIBUR](https://github.com/smoia/EuskalIBUR_dataproc/tree/master) GitHub repository.

# Quantiphyse and helpful software installation
- Quantiphyse
- Python (numpy, pandas),
- Fsl (optional),
- Ants (optional)
- Afni (optional)
