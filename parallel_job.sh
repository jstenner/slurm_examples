#!/bin/sh
#SBATCH --job-name=parallel_job_test # Job name
#SBATCH --mail-type=ALL              # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=<email_address>  # Where to send mail	
#SBATCH --nodes=1                    # Use one node
#SBATCH --ntasks=1                   # Run a single task	
#SBATCH --cpus-per-task=4            # Number of CPU cores per task
#SBATCH --mem=4gb                    # Total memory limit
#SBATCH --time=00:05:00              # Time limit hrs:min:sec
#SBATCH --output=parallel_%j.out     # Standard output and error log

pwd; hostname; date

echo "Running prime number generator program on $SLURM_CPUS_ON_NODE CPU cores"

module load gcc/5.2.0 

/data/training/SLURM/prime/prime

date
