#!/bin/bash

#  Author: Tom Morin
#    Date: October, 2022
# Purpose: copy a subject's data to the Brandeis HPCC (e.g. for preprocessing
#          with fmriprep). This script will also copy the necessary BIDS files
#          to create a BIDS compatible working directory

#   USAGE: sh push_sub_to_hpcc.sh SUBJECT_NAME

SUB=$1
ssh_key=$HOME/.ssh/brandeis_hpcc_id
remote_dir=tommorin@hpcc.brandeis.edu:/work/tommorin/REST_BIDS/

scp -i $ssh_key ../../dataset_description.json $remote_dir
scp -i $ssh_key ../../README $remote_dir
scp -i $ssh_key ../../CHANGES $remote_dir
scp -i $ssh_key ../../participants* $remote_dir
scp -i $ssh_key -r ../../sub-$1 $remote_dir

