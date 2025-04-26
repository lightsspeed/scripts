#Create a script to create a backup of /etc directory and store it in /backup/etc_DATE.tar.gz.

#!/bin/bash

# Check if the backup directory exists, if not create it
if [ ! -d /backup ]; then
    mkdir /backup
fi

# Get the current date in YYYY-MM-DD format
current_date=$(date +%Y-%m-%d)
# Create a backup of the /etc directory
tar -czf /backup/etc_$current_date.tar.gz /etc
# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup of /etc directory created successfully at /backup/etc_$current_date.tar.gz"
else
    echo "Failed to create backup of /etc directory"
fi
# Check if the backup file exists
if [ -f /backup/etc_$current_date.tar.gz ]; then
    echo "Backup file exists."
else
    echo "Backup file does not exist."
fi
# Check if the backup file is not empty
if [ -s /backup/etc_$current_date.tar.gz ]; then
    echo "Backup file is not empty."
else
    echo "Backup file is empty."
fi
# Check if the backup file is readable
if [ -r /backup/etc_$current_date.tar.gz ]; then
    echo "Backup file is readable."
else
    echo "Backup file is not readable."
fi