#!/bin/bash

N_in=/data/Tbulleri/ref_aligned/gstacks/Northern
S_in=/data/Tbulleri/ref_aligned/gstacks/Southern
C_in=/data/Tbulleri/ref_aligned/gstacks/Colonies
N_out=/data/Tbulleri/ref_aligned/populations/Northern
S_out=/data/Tbulleri/ref_aligned/populations/Southern
C_out=/data/Tbulleri/ref_aligned/populations/Colonies
N_pop=/data/Tbulleri/popmaps/Northern_popmap
S_pop=/data/Tbulleri/popmaps/Southern_popmap
C_pop=/data/Tbulleri/popmaps/Colonies_popmap

populations -P $N_in -O $N_out -M $N_pop -R 0.8 --min-maf 0.05 --write-single-snp --fstats --vcf --genepop --structure --smooth --hwe -t 30

populations -P $S_in -O $S_out -M $S_pop -R 0.8 --min-maf 0.05 --write-single-snp --fstats --vcf --genepop --structure --smooth --hwe -t 30

populations -P $C_in -O $C_out -M $C_pop -p 3 -r 0.75 --min-maf 0.05 --write-single-snp --fstats --vcf --genepop --structure --smooth --hwe -t 30