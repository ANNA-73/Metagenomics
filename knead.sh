#!/bin/sh
#SBATCH -A b1042
#SBATCH -p genomics
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 4:00:00
#SBATCH --mem=0
#SBATCH --job-name="knead"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/b1042/HartmannLab/Anna/Amato/knead.out
#SBATCH --error=/projects/b1042/HartmannLab/Anna/Amato/knead.err

module purge all
module load singularity
singularity exec -B /projects/b1042/HartmannLab/Anna/Amato/howler-genome -B /projects/b1057/ -B /projects/b1042/HartmannLab/Anna/Amato/howler-genome/  /projects/b1057/biobakery_diamondv0822.sif  kneaddata --input /projects/b1042/HartmannLab/Anna/Amato/howler-genome/KM-6-R1-nthuman.fastq --input /projects/b1042/HartmannLab/Anna/Amato/howler-genome/KM-6-R2-nthuman.fastq --reference-db /projects/b1042/HartmannLab/Anna/Amato/howler-genome/howlergenome  --output /projects/b1042/HartmannLab/Anna/Amato/kneaddata/ --threads 24

