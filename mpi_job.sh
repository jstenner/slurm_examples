#!/bin/sh
#SBATCH --ntasks=24                  # Number of MPI ranks
#SBATCH --cpus-per-task=1            # Number of cores per MPI rank 
#SBATCH --nodes=2                    # Number of nodes
#SBATCH --ntasks-per-node=12         # How many tasks on each node
#SBATCH --ntasks-per-socket=6        # How many tasks on each CPU or socket
#SBATCH --distribution=cyclic:cyclic # Distribute tasks cyclically on nodes and sockets
#
#SBATCH --mem-per-cpu=1gb            # Memory per processor
#SBATCH --time=00:05:00              # Time limit hrs:min:sec
#
#SBATCH --output=mpi_test_%j.out     # Standard output and error log
#SBATCH --job-name=mpi_job_test      # Job name
#SBATCH --mail-type=ALL              # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=<email_address>  # Where to send mail

# Print some environment information  
echo "Date start        = $(date)"
echo "Hostname          = $(hostname -s)"
echo "Working Directory = $(pwd)"
echo ""
echo "Number of Nodes Allocated      = $SLURM_JOB_NUM_NODES"
echo "Number of Tasks Allocated      = $SLURM_NTASKS"
echo "Number of Cores/Task Allocated = $SLURM_CPUS_PER_TASK"
echo ""
echo "Running prime number generator program on $SLURM_JOB_NUM_NODES nodes with $SLURM_NTASKS tasks, each with $SLURM_CPUS_PER_TASK cores."
echo ""

module load intel/2020 openmpi/4

srun --mpi=pmix_v3 /data/training/SLURM/prime/prime_mpi

echo ""
echo "Date end          = $(date)"
