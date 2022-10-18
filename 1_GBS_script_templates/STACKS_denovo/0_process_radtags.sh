#!/bin/bash
#############################################################################
# Running radtags and fastqc for processed reads. QC metrics output by fastQC 
# can be visualised using multiqc. 
#############################################################################
data=/data/Tbulleri/
out=/data/Tbulleri/radtags/
trim=/data/Tbulleri/trimmed_fastqc/

mkdir -p ${data}{radtags,trimmed_fastqc}

for file in ${data}reads/*.fastq.gz
    do
    base=$(basename ${file} .fastq.gz)
    echo "Running radtags for ${base}..."
    process_radtags -f ${file} -o ${out} -b /data/Tbulleri/barcodes -e pstI -r -c -q &
done
wait
for file in $f{out}/*.fq.gz
    do
    base=$(basename $file .fq.gz)
    echo "Running fastQC for $base"
	fastqc -o ${trim} ${file}
done
multiqc ${trim}