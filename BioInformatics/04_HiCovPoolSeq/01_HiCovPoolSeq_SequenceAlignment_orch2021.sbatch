#!/bin/bash
#SBATCH --job-name=01.orch.2021.alignment_RD1
#SBATCH --time=40:00:00
#SBATCH --mem=75GB
#SBATCH --cpus-per-task=10
#SBATCH --partition=hns
#SBATCH --out=out.01.orch.2021.alignment_RD1

module load biology
module load bwa

Dir=${1}

cd ${Dir}

awk 'NR>0' orch2021.samps.csv > orch2021.samps.txt

while read samp
do
    bwa mem -t 20 ../../../Dmel_RefGenome/all_dmel.fasta "$samp"_R1_001.fastq.gz "$samp"_R2_001.fastq.gz > "$samp".sam
done < orch2021.samps.txt

