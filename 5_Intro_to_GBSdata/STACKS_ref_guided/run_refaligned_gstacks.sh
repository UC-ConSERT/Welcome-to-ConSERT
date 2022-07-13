#!/bin/bash
 
#########################################################################################
#Running gstacks on data aligned with bowtie2
#########################################################################################

#mkdir -p /data/Tbulleri/ref_aligned/{gstacks,populations}/{Northern,Southern,Colonies}
 
input=/data/Tbulleri/trimmed_cropped_radtags2/
N_pop=/data/Tbulleri/popmaps/Northern_popmap
S_pop=/data/Tbulleri/popmaps/Southern_popmap
C_pop=/data/Tbulleri/popmaps/Colonies_popmap
N=/data/Tbulleri/gstacks/Northern
S=/data/Tbulleri/gstacks/Southern
C=/data/Tbulleri/gstacks/Colonies
    
echo gstacks -I $input -O $N -M $N_pop -t 8
echo "Finished calculating $N"
echo gstacks -I $input -O $S -M $S_pop -t 8
echo "Finished calculating $S"
echo gstacks -I $input -O $C -M $C_pop -t 8
echo "Finished calculating $C"