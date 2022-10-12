#!/bin/bash -l

#  Author: Tom Morin
#    Date: October, 2022
# Purpose: 

subjs=($@) # You can input a list of subjects by running
# submit_job_array.sh sub-01 sub-02 ....... or just let 
# this script collect all subjects in the BIDS directory

bids=/work/tommorin/REST_BIDS

if [[ $# -eq 0 ]]; then
    # first go to data directory, grab all subjects,
    # and assign to an array
    pushd $bids
    subjs=($(ls sub-* -d))
    popd
fi

# take the length of the array
# this will be useful for indexing later
len=$(expr ${#subjs[@]} - 1) # len - 1

echo Spawning ${#subjs[@]} sub-jobs.

sbatch --array=0-$len fmriprep_onesub.sh ${subjs[@]}
