# APT-orientation-cell
This code enables you to add a crystal reference cube to your APT reconstruction.
orientation_cell_reconstruction_X.m adds an orientation cell (the edges of which are dummy atoms with a constant but arbitrary m/q) to a .pos file to facilitate crystallographic measurements.  

You first need to determine the orientation matrix (g) of the grain of interest in the APT reconstruction which is an input to the code. 
To do this I would recommend using Winwulff to overlay and align a stereographic projection of the crystal with the field evaporation image of the dataset. Output the Rho and Beta angles of 3 poles which are not all
on the same zone line. These can be used to determine the orientation of the corresponding crystallographic directions. The orientation matrix of the grains can be found using the equations found in [1]. A spreadsheet is provided in the supplementary material of [2] which does this. 

[1] Randle V, Engler O. Introduction to texture analysis: macrotexture, microtexture and orientation mapping. CRC press; 2000 Aug 7.
[2] To be added.


