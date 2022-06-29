#!/bin/sh
#SBATCH -A p31332
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 4:00:00
#SBATCH --mem=0
#SBATCH --job-name="troubleshoot"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/p31332/js_aa_cdc/Anna_Duplicate/seq_knead/seq_knead/spades.out
#SBATCH --error=/projects/p31332/js_aa_cdc/Anna_Duplicate/seq_knead/seq_knead/spades.err

module purge all

cd /projects/p31332/js_aa_cdc/Anna_Duplicate/seq_knead/seq_knead/

module load spades/3.14.1

--meta -1 C-CDC-AG-Lu-1-10_S1_L001_R1_001_kneaddata_paired_1.fastq -2 C-CDC-AG-Lu-1-10_S1_L001_R1_001_kneaddata_paired_2.fastq -o ./test_spades

