#!/bin/sh
#SBATCH -A b1042
#SBATCH -p genomicslong
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 84:00:00
#SBATCH --mem=0
#SBATCH --job-name="knead-bettina"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/b1042/HartmannLab/Anna/bettina/knead-1st.out
#SBATCH --error=/projects/b1042/HartmannLab/Anna/bettina/knead-1st.err

module purge all
conda activate kneaddata
cd /projects/b1042/HartmannLab/Anna/bettina/1st


export path='/projects/b1042/HartmannLab/Anna/bettina/1st'

for r1_file in $path/*_R1_001.fastq.gz; do
    if [ -f "$r1_file" ]; then
        base=${r1_file%_R1_001.fastq.gz}
        r2_file="${base}_R2_001.fastq.gz"
        if [ -f "$r2_file" ]; then
            kneaddata --input "$r1_file" --input "$r2_file" --reference-db /projects/b1042/HartmannLab/Anna/bettina/decon/GRCm39/GRCm39 -o ../knead-out/$(basename "$base") --threads 10
        else
            echo "Error: Missing R2 file for $r1_file"
        fi
    fi
done
