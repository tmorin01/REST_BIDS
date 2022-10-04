#!/bin/bash

#  Author: Tom Morin
#    Date: September, 2022
# Purpose: Previously, the SBREF for post-scan rest was incorrectly unpacked

# Add dcm2niix to PATH
export PATH="$HOME/dcm2niix/build/bin/:$PATH"

# Add pigz to PATH
export PATH="$HOME/pigz-2.7/:$PATH"

SUB=$1

BIDSDIR=/Volumes/Morin_Berry/REST_BIDS/BIDS

outname=sub-${SUB}_ses-01_task-rest_run-02_sbref

dcm2niix -1 -w 1 -o $BIDSDIR/sub-$SUB/ses-01/func -f $outname $BIDSDIR/sourcedata/$SUB/Jagust_Anneb/mb_bold_mb4_2p6mmiso_SAG_post_SBRef_34
