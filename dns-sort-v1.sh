#!/usr/bin/env bash

# Check if input file is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

input_file="$1"

# Check if input file exists
if [ ! -f "$input_file" ]; then
    echo "Input file '$input_file' not found."
    exit 1
fi

# Loop through each domain in the input file
while read -r domain; do
    ip=$(dig +short A "$domain")
    if [ -n "$ip" ]; then
        echo "$ip"
    else
        echo "Failed to resolve IP for '$domain'"
    fi
done < "$input_file" | sort -u
