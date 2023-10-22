#!/bin/sh
#
#SBATCH --job-name="5S-10Q-trident-outer"
#SBATCH --account=education-3me-msc-ro
#SBATCH --partition=gpu
#SBATCH --time=23:59:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --gpus-per-task=1
#SBATCH --mem-per-cpu=1G

module load miniconda3/4.12.0
conda activate trident
export shots=5
export queries=10

srun python --version
srun python -m src.trident_train --cnfg configs/mini-5,5/train_conf.json