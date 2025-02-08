#!/bin/bash

#Author: Iyona Lynn Noronha
#Instructor: Daniel Walkes
#Institution: CU Boulder

# Check if the buildroot directory exists
if [ -d "buildroot" ]; then
    # Navigate to the buildroot directory and clean
    cd buildroot || exit
    make distclean
else
    echo "Error: buildroot directory not found!"
    exit 1
fi
