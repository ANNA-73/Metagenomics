#!/bin/sh
#SBATCH -A p32045
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 1:00:00
#SBATCH --mem=0
#SBATCH --job-name="blast"
#SBATCH --mail-user=anahid.moghadam@northwestern.edu
#SBATCH --output=/projects/p32917/Blast/blast.out
#SBATCH --error=/projects/p32917/Blast/blast.err

cd /projects/p32917/

module purge all
module load  blast/2.16.0

for file in *.fasta  
do
  label=$(basename "$file" .fasta)
  blastn -query "$file" -subject ./Anna_ref_genes/PAO-pilin.fasta \
    -outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore" \
    -word_size 50 |
    awk -v lbl="$label" '{print lbl "\t" $0}' >> ./Blast/combined_PAO-pilin.tsv
done
