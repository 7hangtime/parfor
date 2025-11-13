#!/bin/bash
#SBATCH --job-name=nbody                
#SBATCH --output=nbody_%j.out          
#SBATCH --ntasks=1                      
#SBATCH --cpus-per-task=1               
#SBATCH --time=04:00:00                 
#SBATCH --partition=Centaurus           

make

echo "======================================"
echo " SLURM job information"
echo " Job ID: $SLURM_JOB_ID"
echo " Job Name: $SLURM_JOB_NAME"
echo " Node: $SLURM_NODELIST"
echo " CPUs: $SLURM_CPUS_PER_TASK"
echo "======================================"
echo ""

# Solar system 
{ time ./nbody planet 200 5000000 10000 1 > solar_seq.tsv; } 2>&1

# Random 100 particles
{ time ./nbody 100 1 10000 100 1 > random100_seq.tsv; } 2>&1

# Random 1000 particles
{ time ./nbody 1000 1 10000 100 1 > random1000_seq.tsv; } 2>&1

rm nbody

