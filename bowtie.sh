#!/bin/sh
#SBATCH -A b1042
#SBATCH -p genomics
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 5:00:00
#SBATCH --mem=0
#SBATCH --job-name="bowtie"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/b1042/HartmannLab/Anna/Amato/megahit.out
#SBATCH --error=/projects/b1042/HartmannLab/Anna/Amato/megahit.err

module purge all
module load bowtie2/2.2.6
module load samtools/1.2
module load perl/5.16

bowtie2-build /projects/b1042/HartmannLab/Anna/Amato/kneaddata1/KM-6-assembled/KM-6-contigs.fa  ./mapped/KM-6
#flag -q is to specify the files are fastq format anf flag -x is the  basename of the index for the reference genome
bowtie2 --threads 10 -q -x ./mapped/KM-6  -1 /projects/b1042/HartmannLab/Anna/Amato/kneaddata1/KM-6-R1-nthuman_kneaddata_paired_1.fastq -2 /projects/b1042/HartmannLab/Anna/Amato/kneaddata1/KM-6-R1-nthuman_kneaddata_paired_1.fastq -S KM-6.bowtie2.sam

samtools view -bS KM-6.bowtie2.sam > KM-6.bowtie2.bam
samtools sort KM-6.bowtie2.bam KM-6.bowtie2.sorted
samtools depth KM-6.bowtie2.sorted.bam > KM-6.depth.txt
