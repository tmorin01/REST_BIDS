#!/bin/bash -l

#  Author: Tom Morin
#    Date: October, 2022
# Purpose: Run fmriprep from a singularity container for one subject
#          Adapted from Andy's Brain Book and fMRIPrep documentation:
#          andysbrainbook.readthedocs.io/en/latest/OpenScience/OS/fMRIPrep.html
#          fmriprep.org/en/1.5.9/singularity.html
#          NOTE: Typically, submit this script as a job array using the script:
#                submit_fmriprep_job_array.sh

#SBATCH --account=guest
#SBATCH --partition=guest-compute
#SBATCH --time=24:00:00
#SBATCH --job-name=fmriprep
#SBATCH --output=fmriprep_%j.o
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=4G
#SBATCH --cpus-per-task=16

subjs=($@)
SUB=${subjs[$SLURM_ARRAY_TASK_ID]}
#SUB=$1
echo $SUB

# SLEEP to stagger calls to fmriprep
sleep ${SLURM_ARRAY_TASK_ID}m

# Load necessary modules
shopt -s expand_aliases
source ~/.bash_aliases
load_singularity
load_freesurfer

# Set User Inputs
BIDS_dir=/work/tommorin/REST_BIDS
WORK_dir=/work/tommorin/fmriprep_work_$SUB
nthreads=12
mem=20 #gb

mkdir -p $WORK_dir

# Convert virtual memory from gb to mb
mem=`echo "${mem//[!0-9]/}"` #remove gb at end
mem_mb=`echo $(((mem*1000)-5000))` # reduce some mem for buffer space during preproc

export SINGULARITYENV_TEMPLATEFLOW_HOME="/templateflow"
export SINGULARITYENV_FS_LICENSE=/freesurfer/license.txt

# Run fmriprep
echo "Running fmriprep..."
singularity run --cleanenv --no-home \
  -B /share/labs/berry/freesurfer/7.3.2:/freesurfer \
  -B $BIDS_dir:/data \
  -B /home/tommorin/.cache/templateflow:/templateflow \
  -B $WORK_dir:/workdir \
  /share/labs/berry/fmriprep-22.0.2.simg \
  /data \
  /data/derivatives \
  participant \
  --participant-label $SUB \
  --skip-bids-validation \
  --md-only-boilerplate \
  --fs-license-file /freesurfer/license.txt \
  --output-spaces MNI152NLin2009cAsym:res-2 fsaverage \
  --nthreads $nthreads \
  --mem_mb $mem_mb \
  --omp-nthreads 8 \
  -w /workdir/ \
  -vv
