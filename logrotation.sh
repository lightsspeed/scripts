#!/bin/bash

# Configuration
LOG_FILE="/var/log/myapp.log"  # Path to the log file
TIMESTAMP=$(date +%Y%m%d_%H%M%S)  # Timestamp format: YYYYMMDD_HHMMSS

# Create log file if it doesn't exist and set secure permissions
if [ ! -f "$LOG_FILE" ]; then
  touch "$LOG_FILE" || { echo "Error: Failed to create $LOG_FILE"; exit 1; }
  chmod 664 "$LOG_FILE" || { echo "Error: Failed to set permissions on $LOG_FILE"; exit 1; }
fi

# Check if the log file is writable
if [ ! -w "$LOG_FILE" ]; then
  echo "Error: $LOG_FILE is not writable"
  exit 1
fi

# Warn if the log file is empty, but continue
if [ ! -s "$LOG_FILE" ]; then
  echo "Warning: $LOG_FILE is empty, proceeding with rotation"
fi

# Rotate the log file
mv "$LOG_FILE" "${LOG_FILE}.${TIMESTAMP}" || { echo "Error: Failed to rotate $LOG_FILE"; exit 1; }

# Create a new empty log file with same permissions
touch "$LOG_FILE" || { echo "Error: Failed to create new $LOG_FILE"; exit 1; }
chmod 664 "$LOG_FILE" || { echo "Error: Failed to set permissions on $LOG_FILE"; exit 1; }

echo "Log rotated successfully: ${LOG_FILE}.${TIMESTAMP} created, new $LOG_FILE started"

# Optional: Signal the application to use the new log file (uncomment and adjust as needed)
# kill -HUP $(pidof myapp) || echo "Warning: Failed to signal application"