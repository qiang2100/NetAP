# NetAP

This code is based on Hofree et al.'s code, which can downlaod from this "http://chianti.ucsd.edu/~mhofree/NBS/".

1. run "demo_NBS_TCGA.m" ; %% through this step, we can get the gene network (named as "knnGlap" in Hofree) and the adjusted uterine or lung data (project orignial data into network).

2. call "compute_patient_sis.m" ; %% compute the similarity among patients

3. call Affinity Propagation algorithm using apcluster in R for clustering according the similarity matric
