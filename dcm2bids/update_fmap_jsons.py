#  Author: Tom Morin
#    Date: October, 2022
# Purpose: Adjust .json IntendedFor field to remove resting state scans from 
#          blip-up-blip-down fieldmaps

import json
import sys

SUB = sys.argv[1]
RUNS = ["01","04"]
BLIPS = ["AP", "PA"]

for r in RUNS:
    for b in BLIPS:
        fp = "../../sub-"+SUB+"/ses-01/fmap/sub-"+SUB+"_ses-01_dir-"+b+"_run-"+r+"_epi.json"
        print("Updating " + fp)

        with open(fp, "r") as jsonFile:
            data = json.load(jsonFile)

        old_intended_for = data["IntendedFor"]
        new_intended_for = [i for i in old_intended_for if "rest" not in i]
        data["IntendedFor"] = new_intended_for

        with open(fp, "w") as jsonFile:
            json.dump(data, jsonFile)
