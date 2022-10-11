#!/bin/bash

#  Author: Tom Morin
#    Date: October, 2022
# Purpose: Unpack resting state and phase-magnitude fieldmaps for a SUB

# Add dcm2niix to PATH
export PATH="$HOME/dcm2niix/build/bin/:$PATH"

# Add dcm2bids to PATH
export PATH="$HOME/.local/bin/:$PATH"

# Add pigz to PATH
export PATH="$HOME/pigz-2.7/:$PATH"

# Load anaconda
source /Users/tommorin/opt/anaconda3/etc/profile.d/conda.sh

# Unpacking command
dcm2bids -d ../../sourcedata/${1}/Jagust_Anneb/ -p ${1} -s 01 -c configs/default_rest_fmap_config.json -o ../../ --forceDcm2niix --clobber

# Load python environment
conda activate neuropy3

# Adjust .json IntendedFor field to remove resting state scans from blip-up-blip-down
# fieldmaps
python update_fmap_jsons.py ${1}
