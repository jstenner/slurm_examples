#!/bin/bash
#SBATCH --job-name=prog_hippy
#SBATCH --mail-type=ALL               # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=stenner@ufl.edu   # Where to send mail	
#SBATCH --nodes=1                     # Use one node
#SBATCH --ntasks=1                    # Run a single task
#SBATCH --cpus-per-task=1             # Use 1 core
#SBATCH --mem=12gb                    # Memory limit
#SBATCH --partition=gpu               # Required for GPUs
#SBATCH --gpus=a100:1                 # Specify GPU type
#SBATCH --time=01:00:00               # Time limit hrs:min:sec, or 7-0 for days + hrs
#SBATCH --output=prog_hippy_%j.out    # Standard output and error log


date;hostname;pwd
 
module r condacudagcc
conda activate progrockdiffusion
cd /blue/cota-dept/saah/stenner/projects/progrockdiffusion/
 
python prd.py -s settings/base.json -s settings/hippybus.json

date

