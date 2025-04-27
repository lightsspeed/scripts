#Make a script to rename all .txt files in a folder by appending _backup.


#!/bin/bash

# Check if the directory is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi
# Check if the directory exists
if [ ! -d "$1" ]; then
    echo "Directory $1 does not exist."
    exit 1
fi
# Check if the directory is writable
if [ ! -w "$1" ]; then
    echo "Directory $1 is not writable."
    exit 1
fi
# Loop through all .txt files in the directory
for file in "$1"/*.txt; do
    # Check if the file exists
    if [ ! -f "$file" ]; then
        echo "File $file does not exist."
        continue
    fi
    # Check if the file is writable
    if [ ! -w "$file" ]; then
        echo "File $file is not writable."
        continue
    fi
    # Rename the file by appending _backup
    mv "$file" "${file%.txt}_backup.txt"
    # Check if the rename was successful
    if [ $? -eq 0 ]; then
        echo "File $file renamed to ${file%.txt}_backup.txt successfully."
    else
        echo "Failed to rename file $file."
    fi
done
# Check if there are any .txt files in the directory
if [ "$(ls -A "$1"/*.txt 2>/dev/null)" ]; then
    echo "There are .txt files in the directory."
else
    echo "No .txt files found in the directory."
fi
# Check if the renamed files exist
for file in "$1"/*_backup.txt; do
    # Check if the file exists
    if [ -f "$file" ]; then
        echo "Renamed file $file exists."
    else
        echo "Renamed file $file does not exist."
    fi
done
# Check if the renamed files are not empty
for file in "$1"/*_backup.txt; do
    # Check if the file is not empty
    if [ -s "$file" ]; then
        echo "Renamed file $file is not empty."
    else
        echo "Renamed file $file is empty."
    fi
done
# Check if the renamed files are readable
for file in "$1"/*_backup.txt; do
    # Check if the file is readable
    if [ -r "$file" ]; then
        echo "Renamed file $file is readable."
    else
        echo "Renamed file $file is not readable."
    fi
done
# Check if the renamed files are writable
for file in "$1"/*_backup.txt; do
    # Check if the file is writable
    if [ -w "$file" ]; then
        echo "Renamed file $file is writable."
    else
        echo "Renamed file $file is not writable."
    fi
done
# Check if the renamed files are executable
for file in "$1"/*_backup.txt; do
    # Check if the file is executable
    if [ -x "$file" ]; then
        echo "Renamed file $file is executable."
    else
        echo "Renamed file $file is not executable."
    fi
done
# Check if the renamed files are regular files
for file in "$1"/*_backup.txt; do
    # Check if the file is a regular file
    if [ -f "$file" ]; then
        echo "Renamed file $file is a regular file."
    else
        echo "Renamed file $file is not a regular file."
    fi
done