#!/bin/bash
#SBATCH --mem=5gb 
#SBATCH --ntasks-per-node=1
#SBATCH --nodes=1
#SBATCH --qos=blanca-ibgc1
#SBATCH --time=172:00:00
#SBATCH --output=slurm.EUR.GFG.%J.out
#SBATCH --error=slurm.EUR.%J.err
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=hayo0753@colorado.edu
#SBATCH --array 1-22

/work/KellerLab/opt/bin/rvtest --inVcf /rc_scratch/hayo0753/thesis/rvtest-script/freeze2_genotypes/chr${SLURM_ARRAY_TASK_ID}.dose.vcf.gz.pruned.vcf.gz --pheno /rc_scratch/hayo0753/thesis/rvtest-script/freeze2_genotypes/f2phen.ped --covar /rc_scratch/hayo0753/thesis/rvtest-script/freeze2_genotypes/f2_covariates.ped --out f2_${SLURM_ARRAY_TASK_ID}.output --kinship /rc_scratch/hayo0753/thesis/rvtest-script/freeze2_genotypes/kinship.output.kinship --single famScore
