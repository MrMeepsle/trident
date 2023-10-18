#!/bin/sh
#
#SBATCH --job-name="5S-10Q-trident"
#SBATCH --account=education-3me-msc-ro
#SBATCH --partition=gpu
#SBATCH --time=11:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --gpus-per-task=1
#SBATCH --mem-per-cpu=1G

module load miniconda3/4.12.0
conda activate trident
export shots=5
export queries=10

srun python --version
srun python -m src.trident_train --cnfg configs/mini-5,5/train_conf.json --dataset custom --root ./datasets/inner_set_supermarket_TRIDENT --n-ways 5 --k-shots ${shots} --q-shots ${queries} --iterations 16500 --inner-lr 0.0008 --meta-lr 0.00008 --experiment inner_classes_train_val