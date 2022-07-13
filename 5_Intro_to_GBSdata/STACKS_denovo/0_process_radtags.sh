#!/bin/bash
#############################################################################
# Running radtags and fastqc for processed reads. We had extensive adaptor 
# contamination that required extra processing. 
#############################################################################
data=/data/Tbulleri/reads/
out=/data/Tbulleri/radtags/
trim=/data/Tbulleri/trimmed_fastqc/

for file in ${data}*fastq.gz
    do
    base=$(basename ${file} .fastq.gz)
    echo "Running radtags for ${base}..."
    process_radtags -f ${file} -o ${out} -b /data/Tbulleri/barcodes -e pstI -r -c -q &
done
wait
for file in $f{out}/*.fq.gz
    do
    base=$(basename $file .fq.gz)
    echo "Working on file $base"
	fastqc -o ${trim} ${file}
done
