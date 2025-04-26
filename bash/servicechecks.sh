#Write a script that takes an argument (service name) and restarts it if not active.

#!/bin/bash

# Function to check if a service is active
check_service() {
    service_name=$1
    if systemctl is-active --quiet "$service_name"; then
        echo "Service $service_name is active."
    else
        echo "Service $service_name is not active. Restarting..."
        systemctl restart "$service_name"
        if [ $? -eq 0 ]; then
            echo "Service $service_name restarted successfully."
        else
            echo "Failed to restart service $service_name."
        fi
    fi
}
# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi
# Check if the service name is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <service_name>"
    exit 1
fi
# Check if the service exists
if ! systemctl list-units --type=service | grep -q "$1"; then
    echo "Service $1 does not exist."
    exit 1
fi
# Check if the service is active
check_service "$1"
# Check if the service is enabled  
if systemctl is-enabled --quiet "$1"; then
    echo "Service $1 is enabled."
else
    echo "Service $1 is not enabled. Enabling..."
    systemctl enable "$1"
    if [ $? -eq 0 ]; then
        echo "Service $1 enabled successfully."
    else
        echo "Failed to enable service $1."
    fi
fi
# Check if the service is running
if systemctl is-active --quiet "$1"; then
    echo "Service $1 is running."
else
    echo "Service $1 is not running. Starting..."
    systemctl start "$1"
    if [ $? -eq 0 ]; then
        echo "Service $1 started successfully."
    else
        echo "Failed to start service $1."
    fi
fi