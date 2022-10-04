#!/bin/bash

#  Author: Tom Morin
#    Date: July, 2022
# Purpose: Run fmriprep from a docker container

BIDS_dir=/Volumes/Morin_Berry/REST_BIDS/BIDS

fmriprep-docker $BIDS_dir $BIDS_dir/derivatives participant --participant-label $1 --fs-license-file /Users/tommorin/license.txt --bids-database-dir /Volumes/Morin_Berry/REST_BIDS/BIDS/code/fmriprep/layout_index.sqlite
