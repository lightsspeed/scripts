#Write a script to monitor uptime of a server and log it hourly.

#!/bin/bash

# Check if the log file exists, if not create it
if [ ! -f /var/log/uptime.log ]; then
    touch /var/log/uptime.log
fi

# Get the current date and time
current_date=$(date +"%Y-%m-%d %H:%M:%S")
# Get the uptime of the server
uptime_info=$(uptime -p)
# Log the uptime information to the log file
echo "$current_date - $uptime_info" >> /var/log/uptime.log
# Check if the log file was updated successfully
if [ $? -eq 0 ]; then
    echo "Uptime information logged successfully at $current_date"
else
    echo "Failed to log uptime information"
fi
# Check if the log file is not empty
if [ -s /var/log/uptime.log ]; then
    echo "Log file is not empty."
else
    echo "Log file is empty."
fi
# Check if the log file is readable
if [ -r /var/log/uptime.log ]; then
    echo "Log file is readable."
else
    echo "Log file is not readable."
fi