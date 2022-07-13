#!/bin/bash
######################################################################################################################
# Modified script from STACKS manual. This runs the populations programme for each trial data set. 
######################################################################################################################
N_pop=/data/Tbulleri/popmaps/Northern_popmap
S_pop=/data/Tbulleri/popmaps/Southern_popmap
C_pop=/data/Tbulleri/popmaps/Colonies_popmap
N_in=/data/Tbulleri/cstacks/Northern
S_in=/data/Tbulleri/cstacks/Southern
C_in=/data/Tbulleri/cstacks/Colonies
N_out=/data/Tbulleri/denovo_populations/Northern
S_out=/data/Tbulleri/denovo_populations/Southern
C_out=/data/Tbulleri/denovo_populations/Colonies

for M in {1..8}
    do
    for j in {3..7}
    do
        if ((${M} == 1))
            then
            c=${M}
            c_hi=$((${M} + 1))
            echo "Calling populations for ustacks M${M}m${j} and cstacks ${c}..."
            populations -P $N_in/ustacksM${M}m${j}_c${c} -O $N_out/ustacksM${M}m${j}_c${c} -M $N_pop -R 0.8 \
                --min-maf 0.05 --write-single-snp --fstats --vcf --phylip --genepop --structure --hwe -t 30 &
            populations -P $S_in/ustacksM${M}m${j}_c${c} -O $S_out/ustacksM${M}m${j}_c${c} -M $S_pop -p 2 -R 0.8 \
                --min-maf 0.05 --write-single-snp --fstats --vcf --phylip --genepop --structure --hwe -t 30 &
            populations -P $C_in/ustacksM${M}m${j}_c${c} -O $C_out/ustacksM${M}m${j}_c${c} -M $C_pop -p 3 -R 0.8 \
                --min-maf 0.05 --write-single-snp --fstats --vcf --phylip --genepop --structure --hwe -t 30 &
            echo "Calling populations for ustacks M${M}m${j} and cstacks ${c_hi}..."
            populations -P $N_in/ustacksM${M}m${j}_c${c_hi} -O $N_out/ustacksM${M}m${j}_c${c_hi} -M $N_pop -R 0.8 \
                --min-maf 0.05 --write-single-snp --fstats --vcf --phylip --genepop --structure --hwe -t 30 &
            populations -P $S_in/ustacksM${M}m${j}_c${c_hi} -O $S_out/ustacksM${M}m${j}_c${c_hi} -M $S_pop -p 2 -R 0.8 \
                --min-maf 0.05 --write-single-snp --fstats --vcf --phylip --genepop --structure --hwe -t 30 &
            populations -P $C_in/ustacksM${M}m${j}_c${c_hi} -O $C_out/ustacksM${M}m${j}_c${c_hi} -M $C_pop -p 3 -R 0.8 \
                --min-maf 0.05 --write-single-snp --fstats --vcf --phylip --genepop --structure --hwe -t 30 
            wait
        elif ((${M} > 1))
            then
            c_low=$((${M} - 1))
            c=${M}
            c_hi=$((${M} + 1))
            echo "Calling populations for ustacks M${M}m${j} and cstacks ${c_low}..."
            populations -P $N_in/ustacksM${M}m${j}_c${c} -O $N_out/ustacksM${M}m${j}_c${c} -M $N_pop -R 0.8 \
                --min-maf 0.05 --write-single-snp --fstats --vcf --phylip --genepop --structure --hwe -t 30 &
            populations -P $S_in/ustacksM${M}m${j}_c${c} -O $S_out/ustacksM${M}m${j}_c${c} -M $S_pop -p 2 -R 0.8 \
                --min-maf 0.05 --write-single-snp --fstats --vcf --phylip --genepop --structure --hwe -t 30 &
            populations -P $C_in/ustacksM${M}m${j}_c${c} -O $C_out/ustacksM${M}m${j}_c${c} -M $C_pop -p 3 -R 0.8 \
                --min-maf 0.05 --write-single-snp --fstats --vcf --phylip --genepop --structure --hwe -t 30 &
            echo "Calling populations for ustacks M${M}m${j} and cstacks ${c}..."
            populations -P $N_in/ustacksM${M}m${j}_c${c} -O $N_out/ustacksM${M}m${j}_c${c} -M $N_pop -R 0.8 \
                --min-maf 0.05 --write-single-snp --fstats --vcf --phylip --genepop --structure --hwe -t 30 &
            populations -P $S_in/ustacksM${M}m${j}_c${c} -O $S_out/ustacksM${M}m${j}_c${c} -M $S_pop -p 2 -R 0.8 \
                --min-maf 0.05 --write-single-snp --fstats --vcf --phylip --genepop --structure --hwe -t 30 &
            populations -P $C_in/ustacksM${M}m${j}_c${c} -O $C_out/ustacksM${M}m${j}_c${c} -M $C_pop -p 3 -R 0.8 \
                --min-maf 0.05 --write-single-snp --fstats --vcf --phylip --genepop --structure --hwe -t 30 &
            echo "Calling populations for ustacks M${M}m${j} and cstacks ${c_hi}..."
            populations -P $N_in/ustacksM${M}m${j}_c${c_hi} -O $N_out/ustacksM${M}m${j}_c${c_hi} -M $N_pop -R 0.8 \
                --min-maf 0.05 --write-single-snp --fstats --vcf --phylip --genepop --structure --hwe -t 30 &
            populations -P $S_in/ustacksM${M}m${j}_c${c_hi} -O $S_out/ustacksM${M}m${j}_c${c_hi} -M $S_pop -p 2 -R 0.8 \
                --min-maf 0.05 --write-single-snp --fstats --vcf --phylip --genepop --structure --hwe -t 30 &
            populations -P $C_in/ustacksM${M}m${j}_c${c_hi} -O $C_out/ustacksM${M}m${j}_c${c_hi} -M $C_pop -p 3 -R 0.8 \
                --min-maf 0.05 --write-single-snp --fstats --vcf --phylip --genepop --structure --hwe -t 30 
            wait
        fi
    done
done
