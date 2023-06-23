#!/bin/sh
#SBATCH -A b1042
#SBATCH -p genomics
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 16:00:00
#SBATCH --mem=0
#SBATCH --job-name="metaphlan4"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/b1042/HartmannLab/Anna/bettina/metaphlan4.out
#SBATCH --error=/projects/b1042/HartmannLab/Anna/bettina/metaphlan4.err

module purge all
module load metaphlan/4.0.1

export path='/projects/b1042/HartmannLab/Anna/bettina/knead-out'
for i in $path/*; do
    if [ -d "$i" ]; then
        base=$(basename "$i")
        touch ../../metaphlan4/profiled_$base.txt
        cd "$i"
        metaphlan ${base}_R1_001_kneaddata_paired_1.fastq,${base}_R1_001_kneaddata_paired_2.fastq --input_type fastq  --bowtie2db /projects/b1180/db/metaphlan_db/ --nproc 24 --bowtie2out ${base}.bowtie2.bz2 > ../../metaphlan4/profiled_$base.txt
        cd ..
    fi
done
