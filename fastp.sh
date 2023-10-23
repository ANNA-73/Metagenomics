#!/bin/sh
#SBATCH -A p32045
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 4:00:00
#SBATCH --mem=0
#SBATCH --job-name="fastp"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/b1042/HartmannLab/Howler/fastp.out
#SBATCH --error=/projects/b1042/HartmannLab/Howler/fastp.err
cd  /projects/b1042/HartmannLab/Howler/kneaddata/KM-113

module purge all
module load fastp/0.23.4
fastp --in1 KM-113_R1_kneaddata_paired_1.fastq -o clean-KM-113_paired_1.fastq \
 --in2 KM-113_R1_kneaddata_paired_2.fastq  -O clean-KM-113_paired_2.fastq.fastq \
 --detect_adapter_for_pe  --thread 10

