#!/bin/sh

#SBATCH --job-name=autocbed
#SBATCH --partition=stem
#SBATCH --error=autocbed.err              # error file
#SBATCH --output=autocbed.out             # output file

#SBATCH --time=7-00:00:00               # run time in days-hh:mm:ss

#SBATCH --nodes=1                      # number of nodes requested (n)
#SBATCH --ntasks=20                    # required number of CPUs (n)

##SBATCH --export=ALL

echo "Date:"
date
echo "Using ACI / HCP / Slurm cluster."
echo "JobID = $SLURM_JOB_ID"
echo "Using $SLURM_NNODES nodes"
echo "Using $SLURM_NODELIST nodes."
echo "Number of cores per node: $SLURM_TASKS_PER_NODE"
echo "Submit directory: $SLURM_SUBMIT_DIR"
echo ""

# Executable
/home/czhang376/bin/Multislice/AutoCBEDcpp/autocbed < Autocbed.input

echo "Finished on:"
date