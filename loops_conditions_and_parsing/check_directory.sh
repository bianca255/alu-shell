#!/usr/bin/env bash
# This script checks the contents of a specified directory

dir="${1:-.}"  # Use the provided argument or default to the current directory

# Check if the directory exists
if [[ ! -d "$dir" ]]; then
    echo "The specified path is not a directory."
    exit 1
fi

# Count the number of files
count=$(find "$dir" -maxdepth 1 -type f | wc -l)
dash_files=$(find "$dir" -maxdepth 1 -type f -name "*-*" | wc -l)
special_files=$(find "$dir" -maxdepth 1 -type f -name ".*" | wc -l)

if [[ $count -eq 0 ]]; then
    echo "empty folder"
elif [[ $dash_files -gt 0 && $special_files -gt 0 ]]; then
    echo "folder with - files and special files"
elif [[ $dash_files -gt 0 ]]; then
    echo "folder with - files"
else
    echo "simple folder"
fi

