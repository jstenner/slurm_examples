#!/bin/bash
#SBATCH --job-name=SDWebUI
#SBATCH --mail-type=ALL               # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=stenner@ufl.edu   # Where to send mail
#SBATCH --nodes=1                     # Use one node
#SBATCH --ntasks=1                    # Run a single task
#SBATCH --cpus-per-task=1             # Use 1 core
#SBATCH --mem=32gb                    # Memory limit
#SBATCH --partition=gpu               # Required for GPUs
#SBATCH --gpus=a100:1                 # Specify GPU type
#SBATCH --time=04:00:00               # Time limit hrs:min:sec, or 7-0 for days + hrs
#SBATCH --account=art4612             # HiPerGator account
#SBATCH --qos=art4612                 # QOS Group
#SBATCH --output=webui_%j.out # Standard output and error log


date;hostname;pwd

module r webui
source venv/bin/activate

unset XDG_RUNTIME_DIR

port=$(shuf -i 20000-30000 -n 1)

echo -e "\nStarting Stable Diffusion WebUI on port ${port} on the $(hostname) server."
echo -e "\nSSH tunnel command:"
echo -e "\tssh -NL ${port}:$(hostname):${port} ${USER}@hpg.rc.ufl.edu"
echo -e "\nLocal browser URI:"
echo -e "\thttp://0.0.0.0:${port}"
host=$(hostname)

# Change USERNAME and PASSWD below to something you'll remember.
# This is also where you'll add any commandline arguments you need to run things.
python launch.py --listen --port ${port} --gradio-auth USERNAME:PASSWD --disable-safe-unpickle

# For additional details see: https://help.rc.ufl.edu/doc/Remote_Jupyter_Notebook
# To set a password, on a login node, use these commands:
#     module load jupyter
#     jupyter-notebook password
# You will be asked to enter a password and confirm that password.
# This password can then be used to connect to the notebooks without
# needing the token.