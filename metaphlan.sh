#!/bin/sh
#SBATCH -A b1042
#SBATCH -p genomics
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 3:00:00
#SBATCH --mem=0
#SBATCH --job-name="metaphlan"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/b1180/Anna/bettina/metaphlan.out
#SBATCH --error=/projects/b1180/Anna/bettina/metaphlan.err

module purge all
module load singularity
module load bowtie2/2.4.5
cd /projects/b1180/Anna/bettina/assembled/spades-CK3D14_S22
touch ../../metaphlan/profiled_CK3D14_S22_R1.txt

singularity exec -B /projects/b1180/Anna/bettina/assembled -B /projects/b1057/  /projects/b1057/biobakery_diamondv0822.sif \
  metaphlan2.py  CK3D14_S22_R1_001_kneaddata_paired_1.fastq --input_type fastq --nproc 24  --bowtie2out  CK3D14_S22.bowtie2.bz2 > ../../metaphlan/profiled_CK3D14_S22_R1.txt
