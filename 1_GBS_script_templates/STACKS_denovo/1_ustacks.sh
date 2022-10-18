#!/bin/bash
#########################################################################################################
# Running the ustacks pipeline for STACKSv2.41. This is an example where values of M were tested from 
# 1 - 8 were tested while values of m ranging from 3-7 were tested for each value of M.
#########################################################################################################
work=/data/Tbulleri/trimmed_cropped_radtags2/ # Set working directory
out=/data/Tbulleri/ustacks/ # Set output directory
count=1 # Initialise the counter. Ustacks requires unique integers as inputs for -i
for M in {1..8} # Range of M
do
    for j in {3..7} # Range of m
    do
        mkdir ${out}ustacksM${M}m${j}
        for fq in ${work}*fq.gz
        do
            base=$(basename ${fq} .fq.gz)
            printf "\nRunning Ustacks for ${base}...\n"
            ustacks -f ${fq} -i ${count} -o ${out}ustacksM${M}m${j}/ -M ${M} -m $j -p 30 -d
            interval=$((count + 1))
        done &
        count=1
    done
done