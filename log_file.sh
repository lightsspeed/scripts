#Write a script to find and list all .log files in a directory.

# # and its subdirectories, and save the output to a file.


# #!/bin/bash

# # Script to find and list all .log files in a directory and its subdirectories
#and save the output to a file

# # Directory to search
DIRECTORY="/var/log/html_logs"

# # Output file
OUTPUT_FILE="/var/log/html_logs/log_files_list.txt"
# # Check if the directory exists
if [ ! -d "$DIRECTORY" ]; then
    echo "Directory $DIRECTORY does not exist."
    mkdir -p "$DIRECTORY"
    echo "Directory $DIRECTORY created."
    exit 1
fi

# # Find and list all .log files in the directory and its subdirectories
find "$DIRECTORY" -type f -name "*.log" > "$OUTPUT_FILE"
# # Check if the find command was successful
if [ $? -eq 0 ]; then
    echo "List of .log files saved to $OUTPUT_FILE"
else
    echo "Failed to find .log files in $DIRECTORY."
    exit 1
fi

# # Check if the output file is larger than 1MB
if [ $(du -b "$OUTPUT_FILE" | cut -f1) -gt 1048576 ]; then
    echo "Output file $OUTPUT_FILE is larger than 1MB."
else
    echo "Output file $OUTPUT_FILE is smaller than 1MB."
fi
# # Check if the output file is older than 7 days 

if [ $(find "$OUTPUT_FILE" -mtime +7) ]; then
    echo "Output file $OUTPUT_FILE is older than 7 days."
else
    echo "Output file $OUTPUT_FILE is not older than 7 days."
fi

# # Check if the output file is empty
if [ ! -s "$OUTPUT_FILE" ]; then
    echo "Output file $OUTPUT_FILE is empty."
else
    echo "Output file $OUTPUT_FILE is not empty."
fi

# # Check if the output file is readable
if [ -r "$OUTPUT_FILE" ]; then
    echo "Output file $OUTPUT_FILE is readable."
else
    echo "Output file $OUTPUT_FILE is not readable."
fi

# # Check if the output file is writable
if [ -w "$OUTPUT_FILE" ]; then
    echo "Output file $OUTPUT_FILE is writable."
else
    echo "Output file $OUTPUT_FILE is not writable."
fi

# # Check if the output file is executable
if [ -x "$OUTPUT_FILE" ]; then
    echo "Output file $OUTPUT_FILE is executable."
else
    echo "Output file $OUTPUT_FILE is not executable."
fi

