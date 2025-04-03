# cibersortxGametocytes
using cibersortx with the dataset of S. K. Dogga et al., Science 384,eadj4088 (2024) "A single-cell atlas of sexual developmentin Plasmodium falciparum"

[GamscRNA2024_subset.tsv](https://github.com/Franck-Dumetz/cibersortxGametocytes/blob/main/GamscRNA2024_subset.tsv) is a subset of a 100 random UMI conrresponding to the 9 different life stages identified in the paper. 
Data coming from pf-ch10x-set4-ch10x-raw.csv downloaded from the Malaria Cell Atlas on 03/24/25. 

For convenience, mostly mine, the following matrix and source GEP file were updated to follow the PlasmoDB geneID naming convention.

[single-cell matrix](https://github.com/Franck-Dumetz/cibersortxGametocytes/blob/main/CIBERSORTx-matrix_scRNA2024Gam.txt) is the file ouputed by cibersortx to use for your deconvolution. It is associated with a GEP table to use for batch correction [GEP Table](https://github.com/Franck-Dumetz/cibersortxGametocytes/blob/main/CIBERSORTx-sourceGEP_scRNA2024Gam.txt)
