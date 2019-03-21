#!/bin/sh
#SBATCH --job-name=fp103f
#SBATCH --output=fp103f.out
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem-per-cpu=1000
#SBATCH --time=24:0:0
#SBATCH --partition=general

source /home/chen.alb/.bashrc
srun mono $MQ_1_6_3_3 /home/chen.alb/fp103f.xml
