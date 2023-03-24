#!/bin/sh
#SBATCH -A b1042
#SBATCH -p genomics
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 2:00:00
#SBATCH --mem=0
#SBATCH --job-name="metabat-1"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/b1042/HartmannLab/Anna/Amato/metabat.out
#SBATCH --error=/projects/b1042/HartmannLab/Anna/Amato/metabat.err

module purge all
module load metabat/0.32.4
cd /projects/b1042/HartmannLab/Anna/Amato/

jgi_summarize_bam_contig_depths --outputDepth depth1.txt  KM-6.bowtie2.sorted.bam
 
