# APT-orientation-cell
This code enables you to add a crystal reference cube to your APT reconstruction.

1. Use Winwulff to overlay and align a stereographic projection of the crystal with the field evaporation image of the dataset (note: sufficient crystallographic information in the the FEI is required so that poles can clearly be distinguished). Record the Rho and Beta angles of 3 poles on the stereographic projection which are not all on the same zone line.
2. Use orientation matrix_winwulff_template_X.xlsx to determine the orientation matrix (g) of a grain of interest in the APT reconstruction. The spreadsheet calculates g using the equations given in [1].  
3. On Matlab - upload the .pos file of interest using readpos.m
4. Run orientation_cell_reconstruction_X.m with the inputted g value to add the orientation reference cube to the pos file.

Additional specific instructions are provided in the spreadsheet and code. 

Please cite [2] if this code/spreadsheet was used for publication. 

[1] Randle V, Engler O. Introduction to texture analysis: macrotexture, microtexture and orientation mapping. CRC press; 2000 Aug 7.
[2] Breen AJ, Day AC, Lim B, Davids WJ, Ringer SP. Revealing latent pole and zone line information in atom probe detector maps using crystallographically correlated metrics. Ultramicroscopy. 2023 Jan 1;243:113640.



