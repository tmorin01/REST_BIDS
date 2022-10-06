#!/bin/bash -l

#  Author: Tom Morin
#    Date: July, 2022
# Purpose: Run fmriprep from a singularity container. Adapted from Andy's Brain
#          Book and FMRIPREP documentation:
#          andysbrainbook.readthedocs.io/en/latest/OpenScience/OS/fMRIPrep.html
#          fmriprep.org/en/1.5.9/singularity.html

#SBATCH --account=guest
#SBATCH --partition=guest-compute
#SBATCH --time=00:24:00
#SBATCH --job-name=fmriprep-omp
#SBATCH --output=fmriprep_%j.o
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=4G
#SBATCH --cpus-per-task 16


# Load necessary modules
shopt -s expand_aliases
source ~/.bash_aliases
load_singularity
load_freesurfer

# Set User Inputs
BIDS_dir=/work/tommorin/REST_BIDS
SUB=$1
nthreads=12
mem=20 #gb

# Convert virtual memory from gb to mb
mem=`echo "${mem//[!0-9]/}"` #remove gb at end
mem_mb=`echo $(((mem*1000)-5000))` # reduce some mem for buffer space during preproc

export SINGULARITYENV_TEMPLATEFLOW_HOME="/templateflow"
export SINGULARITYENV_FS_LICENSE=/freesurfer/license.txt

# Run fmriprep
echo "Running fmriprep..."
unset PYTHONPATH
singularity run --cleanenv -B /share/labs/berry/freesurfer/7.3.2:/freesurfer -B $BIDS_dir:/data -B /home/tommorin/.cache/templateflow:/templateflow -B $BIDS_dir/work:/work /share/labs/berry/fmriprep.simg \
  /data /data/derivatives \
  participant \
  --participant-label $SUB \
  --skip-bids-validation \
  --md-only-boilerplate \
  --fs-license-file $SINGULARITYENV_FS_LICENSE \
  --output-spaces MNI152NLin2009cAsym:res-2 fsaverage \
  --nthreads $nthreads \
  --mem_mb $mem_mb \
  --stop-on-first-crash \
  --omp-nthreads 8 \
  -w /work/
