#!/bin/bash
##########################################################################################################
# There are 3 key components for the cstacks pipeline.
#       1) The population map file
#       2) The output from the ustacks step
#       3) The output for cstacks
# The population map file is key for defining sample groupings, while the ustacks output was generated
# using the 'ustacks' programme. Finally, providing a location for cstacks to write out catalog results.
##########################################################################################################
N_pop=/data/Tbulleri/popmaps/Northern_popmap
S_pop=/data/Tbulleri/popmaps/Southern_popmap
C_pop=/data/Tbulleri/popmaps/Colonies_popmap
N_in=/data/Tbulleri/ustacks/Northern
S_in=/data/Tbulleri/ustacks/Southern
C_in=/data/Tbulleri/ustacks/Colonies
N_out=/data/Tbulleri/cstacks/Northern
S_out=/data/Tbulleri/cstacks/Southern
C_out=/data/Tbulleri/cstacks/Colonies

for M in {1..8}
    do
    for j in {3..7}
    do
        if ((${M} == 1))
            then
            c=${M}
            c_hi=$((${M} + 1))
            echo "Running cstacks -n ${c} for ustacksM${M}m${j}..."
            cstacks -P ${N_in}/ustacksM${M}m${j}_c${c} -M ${N_pop} -n 1 -p 30 &
            cstacks -P ${S_in}/ustacksM${M}m${j}_c${c} -M ${S_pop} -n 1 -p 30 &
            cstacks -P ${C_in}/ustacksM${M}m${j}_c${c} -M ${C_pop} -n 1 -p 30 &
            cstacks -P ${N_in}/ustacksM${M}m${j}_c${c_hi} -M ${N_pop} -n 1 -p 30 &
            cstacks -P ${S_in}/ustacksM${M}m${j}_c${c_hi} -M ${S_pop} -n 1 -p 30 &
            cstacks -P ${C_in}/ustacksM${M}m${j}_c${c_hi} -M ${C_pop} -n 1 -p 30
            wait
            mv ${N_in}/ustacksM${M}m${j}_c${c}/catalog* ${N_out}/ustacksM${M}m${j}_c${c}
            mv ${S_in}/ustacksM${M}m${j}_c${c}/catalog* ${S_out}/ustacksM${M}m${j}_c${c}
            mv ${C_in}/ustacksM${M}m${j}_c${c}/catalog* ${C_out}/ustacksM${M}m${j}_c${c}
            mv ${N_in}/ustacksM${M}m${j}_c${c_hi}/catalog* ${N_out}/ustacksM${M}m${j}_c${c_hi}
            mv ${S_in}/ustacksM${M}m${j}_c${c_hi}/catalog* ${S_out}/ustacksM${M}m${j}_c${c_hi}
            mv ${C_in}/ustacksM${M}m${j}_c${c_hi}/catalog* ${C_out}/ustacksM${M}m${j}_c${c_hi}
        elif ((${M} > 1))
            then
            c_low=$((${M} - 1))
            c=${M}
            c_hi=$((${M} + 1))
            echo "Running cstacks -n ${c} for ustacksM${M}m${j}..."
            cstacks -P ${N_in}/ustacksM${M}m${j}_c${c_low} -M ${N_pop} -n 1 -p 30 &
            cstacks -P ${S_in}/ustacksM${M}m${j}_c${c_low} -M ${S_pop} -n 1 -p 30 &
            cstacks -P ${C_in}/ustacksM${M}m${j}_c${c_low} -M ${C_pop} -n 1 -p 30 &
            cstacks -P ${N_in}/ustacksM${M}m${j}_c${c} -M ${N_pop} -n 1 -p 30 &
            cstacks -P ${S_in}/ustacksM${M}m${j}_c${c} -M ${S_pop} -n 1 -p 30 &
            cstacks -P ${C_in}/ustacksM${M}m${j}_c${c} -M ${C_pop} -n 1 -p 30 &
            cstacks -P ${N_in}/ustacksM${M}m${j}_c${c_hi} -M ${N_pop} -n 1 -p 30 &
            cstacks -P ${S_in}/ustacksM${M}m${j}_c${c_hi} -M ${S_pop} -n 1 -p 30 &
            cstacks -P ${C_in}/ustacksM${M}m${j}_c${c_hi} -M ${C_pop} -n 1 -p 30
            wait
            mv ${N_in}/ustacksM${M}m${j}_c${c_low}/catalog* ${N_out}/ustacksM${M}m${j}_c${c_low}
            mv ${S_in}/ustacksM${M}m${j}_c${c_low}/catalog* ${S_out}/ustacksM${M}m${j}_c${c_low}
            mv ${C_in}/ustacksM${M}m${j}_c${c_low}/catalog* ${C_out}/ustacksM${M}m${j}_c${c_low}
            mv ${N_in}/ustacksM${M}m${j}_c${c}/catalog* ${N_out}/ustacksM${M}m${j}_c${c}
            mv ${S_in}/ustacksM${M}m${j}_c${c}/catalog* ${S_out}/ustacksM${M}m${j}_c${c}
            mv ${C_in}/ustacksM${M}m${j}_c${c}/catalog* ${C_out}/ustacksM${M}m${j}_c${c}
            mv ${N_in}/ustacksM${M}m${j}_c${c_hi}/catalog* ${N_out}/ustacksM${M}m${j}_c${c_hi}
            mv ${S_in}/ustacksM${M}m${j}_c${c_hi}/catalog* ${S_out}/ustacksM${M}m${j}_c${c_hi}
            mv ${C_in}/ustacksM${M}m${j}_c${c_hi}/catalog* ${C_out}/ustacksM${M}m${j}_c${c_hi}
        fi
    done
done