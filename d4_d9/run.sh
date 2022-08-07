#!/bin/bash
#SBATCH -p long
#SBATCH --job-name=d4_d9_new
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=isabela.pereira@colorado.edu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=6gb
#SBATCH --time=30:00:00
#SBATCH --output=nextflow.out
#SBATCH --error=nextflow.err

pwd; hostname; date
echo "Go heart!"

module load singularity/3.1.1

nextflow run nf-core/rnaseq -r 3.8.1 \
-resume \
-profile singularity \
--input /scratch/Shares/rinn/isabela/CARDEL/d4_d9/design.csv \
--fasta /scratch/Shares/rinn/genomes/Homo_sapiens/Gencode/v38/GRCh38.p13.genome.fa.gz \
--gtf /scratch/Shares/rinn/genomes/Homo_sapiens/Gencode/v38/gencode.v38.annotation.gtf \
--aligner star_salmon \
--gencode \
--email isabela.pereira@colorado.edu \
--outdir /scratch/Shares/rinn/isabela/CARDEL/d4_d9/results \
-c nextflow.config

date
