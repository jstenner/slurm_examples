#!/bin/bash
#SBATCH --job-name=SDWebUI
#SBATCH --mail-type=ALL               # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=<GATORUSERNAME>@ufl.edu   # Where to send mail
#SBATCH --nodes=1                     # Use one node
#SBATCH --ntasks=1                    # Run a single task
#SBATCH --cpus-per-task=1             # Use 1 core
#SBATCH --mem=16gb                    # Memory limit
#SBATCH --partition=gpu               # Required for GPUs
#SBATCH --gpus=a100:1                 # Specify GPU type
#SBATCH --time=04:00:00               # Time limit hrs:min:sec, or 7-0 for days + hrs
#SBATCH --account=art4612             # HiPerGator account
#SBATCH --qos=art4612                 # QOS Group
#SBATCH --output=webui_%j.out # Standard output and error log


date;hostname;pwd

# You should have previously created a module savelist called "webui"
# consisting of 1) ufrc   2) cuda/11.4.3   3) gcc/9.3.0   4) git/2.30.1   5) python/3.10
module r webui
# Since AUTOMATIC1111/stable-diffusion-webui offers to make videos, 
# let's load ffmpeg (could be incorporated with webui savelist if preferred).
# If you've already included ffmpeg in your webui savelist, then comment this line out:
module load ffmpeg/4.3.1
# activate the python virtual environment created during initial install.
source venv/bin/activate

unset XDG_RUNTIME_DIR

port=$(shuf -i 20000-30000 -n 1)

echo -e "\nStarting Stable Diffusion WebUI on port ${port} on the $(hostname) server."
echo -e "\nSSH tunnel command:"
echo -e "\tssh -NL ${port}:$(hostname):${port} ${USER}@hpg.rc.ufl.edu"
echo -e "\nLocal browser URI:"
echo -e "\thttp://127.0.0.1:${port}"
host=$(hostname)

# Change USERNAME and PASSWD below to something you'll remember.
# This is also where you'll add any commandline arguments you need to run things.
python launch.py --listen --port ${port} --gradio-auth USERNAME:PASSWD --disable-safe-unpickle
