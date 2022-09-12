#!/bin/sh
#SBATCH --job-name=serial_job_test    # Job name
#SBATCH --mail-type=ALL               # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=<email_address>   # Where to send mail	
#SBATCH --nodes=1                     # Use one node
#SBATCH --ntasks=1                    # Run a single task
#SBATCH --cpus-per-task=1             # Use 1 core
#SBATCH --mem=600mb                   # Memory limit
#SBATCH --time=00:05:00               # Time limit hrs:min:sec
#SBATCH --output=serial_test_%j.out   # Standard output and error log

pwd; hostname; date

module load python

echo "Running plot script on a single CPU core"

python /data/training/SLURM/plot_find_edges.py

date
