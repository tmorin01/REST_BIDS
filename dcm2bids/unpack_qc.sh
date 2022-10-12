#!/bin/bash

#  Author: Tom Morin
#    Date: October, 2022
# Purpose: Quality control of unpacking

# NEEDSWORK: Unpack additional fmap and apply to resting state?

# Check Anatomy
    # Exists?
    # sub-SUB_ses-01_T1w.json
    # sub-SUB_ses-01_T1w.nii.gz

# Check Fieldmaps
    # Exists?
    # sub-SUB_ses-01_dir-AP_run-01_epi.json
    # sub-SUB_ses-01_dir-AP_run-01_epi.nii.gz
    # sub-SUB_ses-01_dir-AP_run-02_epi.json
    # sub-SUB_ses-01_dir-AP_run-02_epi.nii.gz
    # sub-SUB_ses-01_dir-AP_run-03_epi.json
    # sub-SUB_ses-01_dir-AP_run-03_epi.nii.gz
    # sub-SUB_ses-01_dir-AP_run-04_epi.json
    # sub-SUB_ses-01_dir-AP_run-04_epi.nii.gz
    # sub-SUB_ses-01_dir-PA_run-01_epi.json
    # sub-SUB_ses-01_dir-PA_run-01_epi.nii.gz
    # sub-SUB_ses-01_dir-PA_run-02_epi.json
    # sub-SUB_ses-01_dir-PA_run-02_epi.nii.gz
    # sub-SUB_ses-01_dir-PA_run-03_epi.json
    # sub-SUB_ses-01_dir-PA_run-03_epi.nii.gz
    # sub-SUB_ses-01_dir-PA_run-04_epi.json
    # sub-SUB_ses-01_dir-PA_run-04_epi.nii.gz

    # Check intended-for:
    # each fmap run should be intended for the corresponding task run (remove rest intended for)


# Check Functional
    # Exists?
    # sub-SUB_ses-01_task-realestate_run-01_sbref.json
    # sub-SUB_ses-01_task-realestate_run-01_sbref.nii.gz
    # sub-SUB_ses-01_task-realestate_run-01_bold.json
    # sub-SUB_ses-01_task-realestate_run-01_bold.nii.gz
    # sub-SUB_ses-01_task-realestate_run-02_sbref.json
    # sub-SUB_ses-01_task-realestate_run-02_sbref.nii.gz
    # sub-SUB_ses-01_task-realestate_run-02_bold.json
    # sub-SUB_ses-01_task-realestate_run-02_bold.nii.gz
    # sub-SUB_ses-01_task-realestate_run-03_sbref.json
    # sub-SUB_ses-01_task-realestate_run-03_sbref.nii.gz
    # sub-SUB_ses-01_task-realestate_run-03_bold.json
    # sub-SUB_ses-01_task-realestate_run-03_bold.nii.gz
    # sub-SUB_ses-01_task-realestate_run-04_sbref.json
    # sub-SUB_ses-01_task-realestate_run-04_sbref.nii.gz
    # sub-SUB_ses-01_task-realestate_run-04_bold.json
    # sub-SUB_ses-01_task-realestate_run-04_bold.nii.gz
    # sub-SUB_ses-01_task-rest_run-01_sbref.json
    # sub-SUB_ses-01_task-rest_run-01_sbref.nii.gz
    # sub-SUB_ses-01_task-rest_run-01_bold.json
    # sub-SUB_ses-01_task-rest_run-01_bold.nii.gz
    # sub-SUB_ses-01_task-rest_run-02_sbref.json
    # sub-SUB_ses-01_task-rest_run-02_sbref.nii.gz
    # sub-SUB_ses-01_task-rest_run-02_bold.json
    # sub-SUB_ses-01_task-rest_run-02_bold.nii.gz

    # Check number of frames for each. Resting state should have 300 frames
    # Task should have 246

