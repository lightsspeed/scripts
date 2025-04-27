#Create a script to back up a folder to another location.

#!/bin/bash

# Script to back up a folder to another location


#backup html logs
BACKUP_DIR="/var/log/html_logs_backup"
SOURCE_DIR="/var/log/html_logs"


# Check if source directory exists if directory not exist create it
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Backup directory $BACKUP_DIR does not exist. Creating it."
    mkdir -p "$BACKUP_DIR"
fi
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory $SOURCE_DIR does not exist. Creating it."
    mkdir -p "$SOURCE_DIR"
fi
# Create a timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
# Create a backup file name
BACKUP_FILE="$BACKUP_DIR/html_logs_backup_$TIMESTAMP.tar.gz"
# Create the backup
tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" .
# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup of $SOURCE_DIR completed successfully. Backup file: $BACKUP_FILE"
else
    echo "Backup of $SOURCE_DIR failed."
    exit 1
fi
# Check disk usage of the backup directory
echo "Disk usage of backup directory $BACKUP_DIR:"
du -sh "$BACKUP_DIR"
# Check if the backup file is larger than 1GB
if [ $(du -b "$BACKUP_FILE" | cut -f1) -gt 1073741824 ]; then
    echo "Backup file $BACKUP_FILE is larger than 1GB."
else
    echo "Backup file $BACKUP_FILE is smaller than 1GB."
fi
# Check if the backup file is older than 7 days 