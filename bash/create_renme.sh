Create a file and rename it using a script.


#!/bin/bash

#create a variable and take input from the user
echo "Enter the name of the file you want to create:"
read filename
# Check if the file already exists
if [ -e "$filename" ]; then
    echo "File already exists. Please choose a different name."
    exit 1
fi
# Create a file with the given name
touch "$filename"
echo "File created: $filename"
# Rename the file
echo "Enter the new name for the file:"
read new_filename
if [ -e "$new_filename" ]; then
    echo "File with the new name already exists. Please choose a different name."
    exit 1
fi
mv "$filename" "$new_filename"
echo "File renamed to: $new_filename"

