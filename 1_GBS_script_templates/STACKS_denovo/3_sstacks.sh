#!/bin/bash
##################################################################################################
# Prepare by moving all required ustacks files to the appropriate cstacks directory. 
# This makes it so that the remaining processes can all occur in the same file (e.g., sstacks,  
# tsv2bam, and gstacks)
##################################################################################################
ustacks=/data/Tbulleri/ustacks/
N_cstacks=/data/Tbulleri/cstacks/Northern/
S_cstacks=/data/Tbulleri/cstacks/Southern/
C_cstacks=/data/Tbulleri/cstacks/Colonies/
N_pop=/data/Tbulleri/popmaps/Northern_popmap
S_pop=/data/Tbulleri/popmaps/Southern_popmap
C_pop=/data/Tbulleri/popmaps/Colonies_popmap

for M in {1..8}
    do
    for j in {3..7}
        do
        if ((${M} == 1))
            then
            c=$M
            c_hi=$((${M} + 1))
            echo "Moving files for ustacksM${M}m${j} and cstacks -n ${c}..."
            cp ${ustacks}ustacksM${M}m${j}/N* ${N_cstacks}ustacksM${M}m${j}_c${c}/ &
            cp ${ustacks}ustacksM${M}m${j}/S* ${S_cstacks}ustacksM${M}m${j}_c${c}/ &
            cp ${ustacks}ustacksM${M}m${j}/* ${C_cstacks}ustacksM${M}m${j}_c${c}
            wait
            echo "Moving files for ustacksM${M}m${j} and cstacks -n ${c_hi}..."
            cp ${ustacks}ustacksM${M}m${j}/N* ${N_cstacks}ustacksM${M}m${j}_c${c_hi}/ &
            cp ${ustacks}ustacksM${M}m${j}/S* ${S_cstacks}ustacksM${M}m${j}_c${c_hi}/ &
            cp ${ustacks}ustacksM${M}m${j}/* ${C_cstacks}ustacksM${M}m${j}_c${c_hi}/
            wait
            echo "Running sstacks for Northern ustacksM${M}m${j}..."
            sstacks -P ${N_cstacks}ustacksM${M}m${j}_c${c} -M ${N_pop} -p 30 &
            sstacks -P ${N_cstacks}ustacksM${M}m${j}_c${c_hi} -M ${N_pop} -p 30
            wait
            echo "Running sstacks for Southern ustacksM${M}m${j}..."
            sstacks -P ${S_cstacks}ustacksM${M}m${j}_c${c} -M ${S_pop} -p 30 &
            sstacks -P ${S_cstacks}ustacksM${M}m${j}_c${c_hi} -M ${S_pop} -p 30
            wait
            echo "Running sstacks for Colonies ustacksM${M}m${j}..."
            sstacks -P ${C_cstacks}ustacksM${M}m${j}_c${c} -M ${C_pop} -p 30 &
            sstacks -P ${C_cstacks}ustacksM${M}m${j}_c${c_hi} -M ${C_pop} -p 30
            wait
        elif ((${M} > 1))
            then
            c_low=$((${M} - 1))
            c=$M
            c_hi=$((${M} + 1))
            echo "Moving files for ustacksM${M}m${j} and cstacks -n ${c_low}..."
            cp ${ustacks}ustacksM${M}m${j}/N* ${N_cstacks}ustacksM${M}m${j}_c${c_low}/ &
            cp ${ustacks}ustacksM${M}m${j}/S* ${S_cstacks}ustacksM${M}m${j}_c${c_low}/ &
            cp ${ustacks}ustacksM${M}m${j}/* ${C_cstacks}ustacksM${M}m${j}_c${c_low}
            wait
            echo "Moving files for ustacksM${M}m${j} and cstacks -n ${c}..."
            cp ${ustacks}ustacksM${M}m${j}/N* ${N_cstacks}ustacksM${M}m${j}_c${c}/ &
            cp ${ustacks}ustacksM${M}m${j}/S* ${S_cstacks}ustacksM${M}m${j}_c${c}/ &
            cp ${ustacks}ustacksM${M}m${j}/* ${C_cstacks}ustacksM${M}m${j}_c${c}
            wait
            echo "Moving files for ustacksM${M}m${j} and cstacks -n ${c_hi}..."
            cp ${ustacks}ustacksM${M}m${j}/N* ${N_cstacks}ustacksM${M}m${j}_c${c_hi}/ &
            cp ${ustacks}ustacksM${M}m${j}/S* ${S_cstacks}ustacksM${M}m${j}_c${c_hi}/ &
            cp ${ustacks}ustacksM${M}m${j}/* ${C_cstacks}ustacksM${M}m${j}_c${c_hi}
            wait
            echo "Running sstacks for Northern ustacksM${M}m${j}..."
            sstacks -P ${N_cstacks}ustacksM${M}m${j}_c${c_low} -M ${N_pop} -p 30 &
            sstacks -P ${N_cstacks}ustacksM${M}m${j}_c${c} -M ${N_pop} -p 30 &
            sstacks -P ${N_cstacks}ustacksM${M}m${j}_c${c_hi} -M ${N_pop} -p 30
            wait
            echo "Running sstacks for Southern ustacksM${M}m${j}..."
            sstacks -P ${S_cstacks}ustacksM${M}m${j}_c${c_low} -M ${S_pop} -p 30 &
            sstacks -P ${S_cstacks}ustacksM${M}m${j}_c${c} -M ${S_pop} -p 30 &
            sstacks -P ${S_cstacks}ustacksM${M}m${j}_c${c_hi} -M ${S_pop} -p 30
            wait
            echo "Running sstacks for Colonies ustacksM${M}m${j}..."
            sstacks -P ${C_cstacks}ustacksM${M}m${j}_c${c_low} -M ${C_pop} -p 30 &
            sstacks -P ${C_cstacks}ustacksM${M}m${j}_c${c} -M ${C_pop} -p 30 &
            sstacks -P ${C_cstacks}ustacksM${M}m${j}_c${c_hi} -M ${C_pop} -p 30
            wait
        fi
    done
done
