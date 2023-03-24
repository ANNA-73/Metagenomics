#!/bin/sh
#SBATCH -A b1042
#SBATCH -p genomics
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 10:00:00
#SBATCH --mem=0
#SBATCH --job-name="metabat-1"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/b1042/HartmannLab/Anna/Amato/metabat.out
#SBATCH --error=/projects/b1042/HartmannLab/Anna/Amato/metabat.err

module purge all
module load metabat/0.32.4
cd /projects/b1042/HartmannLab/Anna/Amato/

metabat -i /projects/b1042/HartmannLab/Anna/Amato/kneaddata1/KM-6-assembled/KM-6-contigs.fa  -a /projects/b1042/HartmannLab/Anna/Amato/depth1.txt -o ./bin-KM-6
