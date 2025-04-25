#Write a script that checks CPU usage and alerts if it crosses threshold.

#!/bin/bash

# Set the threshold for CPU usage (in percentage)
THRESHOLD=80
# Get the current CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
# Check if CPU usage exceeds the threshold
if (( $(echo "$CPU_USAGE > $THRESHOLD" | bc -l) )); then
    echo "Warning: CPU usage is at ${CPU_USAGE}% which exceeds the threshold of ${THRESHOLD}%."
else
    echo "CPU usage is at ${CPU_USAGE}%, which is within the acceptable range."
fi
# Optional: Send an alert (e.g., email, log, etc.)
# echo "Sending alert..."
# mail -s "CPU Usage Alert" 