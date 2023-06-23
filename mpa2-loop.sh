#!/bin/sh
#SBATCH -A b1042
#SBATCH -p genomics
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 48:00:00
#SBATCH --mem=0
#SBATCH --job-name="metaphlan2"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/b1042/HartmannLab/Anna/bettina/metaphlan2.out
#SBATCH --error=/projects/b1042/HartmannLab/Anna/bettina/metaphlan2.err

module purge all
module load singularity

export path='/projects/b1042/HartmannLab/Anna/bettina/knead-out'
for i in $path/*; do
    if [ -d "$i" ]; then
        base=$(basename "$i")
        cd "$i"
        singularity exec -B /projects/b1042/HartmannLab/monkey_gut_test/singularity -B /projects/b1042/HartmannLab/Anna/bettina/knead-out  /projects/b1042/HartmannLab/monkey_gut_test/singularity/biobakery_diamondv0822.sif \
        metaphlan2.py   ${base}_R1_001_kneaddata_paired_1.fastq,${base}_R1_001_kneaddata_paired_2.fastq --input_type fastq --nproc 24  --bowtie2out   ${base}.bowtie2.bz2 > ../../mpa2/profiled_${base}.txt
        cd ..
    fi
done
