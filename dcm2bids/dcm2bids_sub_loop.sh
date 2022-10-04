#!/bin/bash

#  Author: Tom Morin
#    Date: August, 2022
# Purpose: Unpack a subject's DICOMS to BIDS format for REST study

# Add dcm2niix to PATH
export PATH="$HOME/dcm2niix/build/bin/:$PATH"

# Add dcm2bids to PATH
export PATH="$HOME/.local/bin/:$PATH"

# Add pigz to PATH
export PATH="$HOME/pigz-2.7/:$PATH"

# Call dcm2bids
while read SUB; do
	echo $SUB
	dcm2bids -d ../../sourcedata/${SUB}/Jagust_Anneb/ -p ${SUB} -s 01 -c configs/${SUB}_BIDS_config.json -o ../../ --forceDcm2niix --clobber
done<some_subs