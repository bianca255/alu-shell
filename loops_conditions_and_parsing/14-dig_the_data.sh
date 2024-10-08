#!/usr/bin/env bash
# This script processes Apache log files to display IP and HTTP status code occurrences.

# Check if a file is passed as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi

log_file="$1"

# Check if the file exists and is readable
if [ ! -f "$log_file" ] || [ ! -r "$log_file" ]; then
    echo "Error: File does not exist or is not readable."
    exit 1
fi

# Use awk to parse the log file
awk '{print $1, $9}' "$log_file" | 
    awk '{
        count[$1, $2]++
    } END {
        for (key in count) {
            split(key, arr, SUBSEP);
            print count[key], arr[1], arr[2];
        }
    }' | sort -rn

