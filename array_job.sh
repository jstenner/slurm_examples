#!/bin/sh
#SBATCH --job-name=array_job_test   # Job name
#SBATCH --mail-type=ALL             # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=<email_address> # Where to send mail	
#SBATCH --nodes=1                   # Use one node
#SBATCH --ntasks=1                  # Run a single task
#SBATCH --mem-per-cpu=1gb           # Memory per processor
#SBATCH --time=00:05:00             # Time limit hrs:min:sec
#SBATCH --output=array_%A-%a.out    # Standard output and error log
#SBATCH --array=1-5                 # Array range
pwd; hostname; date

echo This is task $SLURM_ARRAY_TASK_ID

date
