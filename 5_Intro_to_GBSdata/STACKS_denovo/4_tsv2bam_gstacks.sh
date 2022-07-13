#!/bin/bash
#########################################################################################
# So far we have run ustacks > cstacks > sstacks. Now running tsv2bam and gstacks on
# de novo data
#########################################################################################
N_pop=/data/Tbulleri/popmaps/Northern_popmap
S_pop=/data/Tbulleri/popmaps/Southern_popmap
C_pop=/data/Tbulleri/popmaps/Colonies_popmap
N_input=/data/Tbulleri/cstacks/Northern/
S_input=/data/Tbulleri/cstacks/Southern/
C_input=/data/Tbulleri/cstacks/Colonies/

for M in {1..8}
    do
    for j in {3..7}
        do
        if ((${M} == 1))
            then
            c=${M}
            c_hi=$((${M} + 1))
            echo "Running tsv2bam for Northern ustacksM${M}m${j}..."
            tsv2bam -P ${N_input}ustacksM${M}m${j}_c${c} -M ${N_pop} -t 30 &
            tsv2bam -P ${N_input}ustacksM${M}m${j}_c${c_hi} -M ${N_pop} -t 30
            wait
            echo "Running tsv2bam for Southern ustacksM${M}m${j}..."
            tsv2bam -P ${S_input}ustacksM${M}m${j}_c${c} -M ${S_pop} -t 30 &
            tsv2bam -P ${S_input}ustacksM${M}m${j}_c${c_hi} -M ${S_pop} -t 30
            wait
            echo "Running tsv2bam for Colonies ustacksM${M}m${j}..."
            tsv2bam -P ${C_input}ustacksM${M}m${j}_c${c} -M ${C_pop} -t 30 &
            tsv2bam -P ${C_input}ustacksM${M}m${j}_c${c_hi} -M ${C_pop} -t 30
            wait
            echo "Running gstacks for Northern ustacksM${M}m${j}..."
            gstacks -P ${N_input}ustacksM${M}m${j}_c${c} -M ${N_pop} -t 20 &
            gstacks -P ${N_input}ustacksM${M}m${j}_c${c_hi} -M ${N_pop} -t 20
            wait
            echo "Running gstacks for Southern ustacksM${M}m${j}..."
            gstacks -P ${S_input}ustacksM${M}m${j}_c${c} -M ${S_pop} -t 20 &
            gstacks -P ${S_input}ustacksM${M}m${j}_c${c_hi} -M ${S_pop} -t 20
            wait
            echo "Running gstacks for Colonies ustacksM${M}m${j}..."
            gstacks -P ${C_input}ustacksM${M}m${j}_c${c} -M ${C_pop} -t 20 &
            gstacks -P ${C_input}ustacksM${M}m${j}_c${c_hi} -M ${C_pop} -t 20
            wait
        elif ((${M} > 1))
            then
            c_low=$((${M} - 1))
            c=${M}
            c_hi=$((${M} + 1))
            echo "Running tsv2bam for Northern ustacksM${M}m${j}..."
            tsv2bam -P ${N_input}ustacksM${M}m${j}_c${c_low} -M ${N_pop} -t 30 &
            tsv2bam -P ${N_input}ustacksM${M}m${j}_c${c} -M ${N_pop} -t 30 &
            tsv2bam -P ${N_input}ustacksM${M}m${j}_c${c_hi} -M ${N_pop} -t 30
            wait
            echo "Running tsv2bam for Southern ustacksM${M}m${j}..."
            tsv2bam -P ${S_input}ustacksM${M}m${j}_c${c_low} -M ${S_pop} -t 30 &
            tsv2bam -P ${S_input}ustacksM${M}m${j}_c${c} -M ${S_pop} -t 30 &
            tsv2bam -P ${S_input}ustacksM${M}m${j}_c${c_hi} -M ${S_pop} -t 30
            wait
            echo "Running tsv2bam for Colonies ustacksM${M}m${j}..."
            tsv2bam -P ${C_input}ustacksM${M}m${j}_c${c_low} -M ${C_pop} -t 30 &
            tsv2bam -P ${C_input}ustacksM${M}m${j}_c${c} -M ${C_pop} -t 30 &
            tsv2bam -P ${C_input}ustacksM${M}m${j}_c${c_hi} -M ${C_pop} -t 30
            wait
            echo "Running gstacks for Northern ustacksM${M}m${j}..."
            gstacks -P ${N_input}ustacksM${M}m${j}_c${c_low} -M ${N_pop} -t 20 &
            gstacks -P ${N_input}ustacksM${M}m${j}_c${c} -M ${N_pop} -t 20 &
            gstacks -P ${N_input}ustacksM${M}m${j}_c${c_hi} -M ${N_pop} -t 20
            wait
            echo "Running gstacks for Southern ustacksM${M}m${j}..."
            gstacks -P ${S_input}ustacksM${M}m${j}_c${c_low} -M ${S_pop} -t 20 &
            gstacks -P ${S_input}ustacksM${M}m${j}_c${c} -M ${S_pop} -t 20 &
            gstacks -P ${S_input}ustacksM${M}m${j}_c${c_hi} -M ${S_pop} -t 20
            wait
            echo "Running gstacks for Colonies ustacksM${M}m${j}..."
            gstacks -P ${C_input}ustacksM${M}m${j}_c${c_low} -M ${C_pop} -t 20 &
            gstacks -P ${C_input}ustacksM${M}m${j}_c${c} -M ${C_pop} -t 20 &
            gstacks -P ${C_input}ustacksM${M}m${j}_c${c_hi} -M ${C_pop} -t 20
            wait
        fi
    done
done
