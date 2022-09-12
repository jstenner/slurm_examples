#!/bin/bash
#SBATCH --job-name=stableai
#SBATCH --mail-type=ALL               # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=stenner@ufl.edu   # Where to send mail	
#SBATCH --nodes=1                     # Use one node
#SBATCH --ntasks=1                    # Run a single task
#SBATCH --cpus-per-task=1             # Use 1 core
#SBATCH --mem=12gb                    # Memory limit
#SBATCH --partition=gpu               # Required for GPUs
#SBATCH --gpus=a100:1                 # Specify GPU type
#SBATCH --time=01:00:00               # Time limit hrs:min:sec, or 7-0 for days + hrs
#SBATCH --output=stableai_%j.out    # Standard output and error log


date;hostname;pwd
 
module r condacudagcc
conda activate ldm
cd /blue/art4612/share/stenner/stable-diffusion/
 
python scripts/txt2img.py --prompt "a photograph of an astronaut riding a horse" --plms

date
