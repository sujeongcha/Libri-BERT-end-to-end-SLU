#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=5
#SBATCH --time=1:00:00
#SBATCH --mem-per-cpu=10GB
#SBATCH --job-name=fluent_merged_model
#SBATCH --mail-type=END
#SBATCH --mail-user=mtp363@nyu.edu
#SBATCH --output=fluent_merged_model_print_%j.out
#SBATCH --gres=gpu:v100:1
  
# Refer to https://sites.google.com/a/nyu.edu/nyu-hpc/documentation/prince/batch/submitting-jobs-with-sbatch
# for more information about the above options

# Remove all unused system modules
module purge

# Activate the conda environment
module load anaconda3
source activate alexa_env

# Execute the script
python train.py --num-epochs=1

# And we're done!
