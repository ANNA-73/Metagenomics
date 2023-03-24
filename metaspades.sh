#!/bin/sh
#SBATCH -A b1042
#SBATCH -p genomics
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 10:00:00
#SBATCH --mem=0
#SBATCH --job-name="metaspades"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/b1042/HartmannLab/Anna/Amato/meta.out
#SBATCH --error=/projects/b1042/HartmannLab/Anna/Amato/meta.err

module purge all
module load spades/3.14.1

cd /projects/b1042/HartmannLab/Anna/Amato/kneaddata1
metaspades.py  -1 KM-6-R1-nthuman_kneaddata_paired_1.fastq -2 KM-6-R1-nthuman_kneaddata_paired_2.fastq -o spades-KM-6

