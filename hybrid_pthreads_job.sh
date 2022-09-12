#!/bin/sh
#SBATCH --ntasks=8                   # Number of MPI ranks
#SBATCH --cpus-per-task=4            # Number of cores per MPI rank 
#SBATCH --nodes=2                    # Number of nodes
#SBATCH --ntasks-per-node=4          # How many tasks on each node
#SBATCH --ntasks-per-socket=2        # How many tasks on each CPU or socket
#SBATCH --distribution=cyclic:cyclic # Distribute tasks cyclically on nodes and sockets
#
#SBATCH --constrain=intel     # This particular app needs intel proc.
#
#SBATCH --mem-per-cpu=100mb          # Memory per processor
#SBATCH --time=00:05:00              # Time limit hrs:min:sec
#
#SBATCH --output=hybrid_test_%j.out  # Standard output and error log
#SBATCH --job-name=hybrid_job_test   # Job name
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

module load intel/2019 openmpi/4.0.0 raxml-ng
 
srun --mpi=pmix_v2 raxml-ng-mpi --all --msa /data/training/SLURM/dna.phy \
     --model GTR+G --threads $SLURM_CPUS_PER_TASK --prefix=./test

echo ""
echo "Date end         = $(date)"

