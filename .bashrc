# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# User specific aliases and functions

SCRATCH=/scratch/chen.alb
SC=/scratch/chen.alb

MQ_1_6_2_3=~/MQ_1.6.2.3/bin/MaxQuantCmd.exe
MQ_1_6_2_10=~/MQ_1.6.2.10/bin/MaxQuantCmd.exe
MQ_1_6_3_2=~/MQ_1.6.3.2/bin/MaxQuantCmd.exe
MQ_1_6_3_3=~/MQ_1.6.3.3/bin/MaxQuantCmd.exe


# load slurm modules
module load legacy/2018-05-18
module load openmpi/3.1.2
module load gcc/8.1.0
module load python/3.7.0
module load anaconda3/3.7
module load matlab/R2018a 

module load mono-5.10.1.47
module load git-2.9.5
