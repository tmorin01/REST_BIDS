#!/bin/bash

#  Author: Tom Morin
#    Date: August, 2022
# Purpose: Unzip all .tar.gz files in sourcedata directory

pdir=../../sourcedata

while read sub; do
    echo $sub
    tar -xvf $pdir/${sub}.tar.gz
    mv Volumes/Untitled/* $pdir
    rm -Rf Volumes
    mv $pdir/${sub}/* $pdir/${sub}/Jagust_Anneb
done<$1