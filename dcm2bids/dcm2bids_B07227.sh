#!/bin/bash

#  Author: Tom Morin
#    Date: August, 2022
# Purpose: Unpack a subject's DICOMS to BIDS format for REST study

# Add dcm2niix to PATH
export PATH="$HOME/dcm2niix/build/bin/:$PATH"

# Add dcm2bids to PATH
export PATH="/Users/thomasmorin/.local/bin/:$PATH"

# Add pigz to PATH
export PATH="$HOME/pigz-2.7/:$PATH"

# Call dcm2bids
dcm2bids -d ../../sourcedata/B07227/Jagust_Anneb\ -\ 1/ -p B07227 -s 01 -c configs/B07227_BIDS_config.json -o ../../ --forceDcm2niix