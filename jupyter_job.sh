#!/bin/bash
#SBATCH --job-name=jupyter
#SBATCH --output=jupyter_notebook_%j.log
#SBATCH --ntasks=1
#SBATCH --mem=2gb
#SBATCH --time=04:00:00

date;hostname;pwd
 
module add jupyter
 
launch_jupyter_notebook

# For additional details see: https://help.rc.ufl.edu/doc/Remote_Jupyter_Notebook
# To set a password, on a login node, use these commands:
#     module load jupyter
#     jupyter-notebook password
# You will be asked to enter a password and confirm that password.
# This password can then be used to connect to the notebooks without
# needing the token.
#
