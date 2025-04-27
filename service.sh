#Check if service/s is running, restart if it’s not.

#!/bin/bash

# Check if the service is running

service_name="your_service_name" # Replace with your service name
service_status=$(systemctl is-active "$service_name")
if [ "$service_status" != "active" ]; then
    echo "$service_name is not running. Restarting..."
    systemctl restart "$service_name"
    if [ $? -eq 0 ]; then
        echo "$service_name restarted successfully."
    else
        echo "Failed to restart $service_name."
    fi
else
    echo "$service_name is running."
fi

# Check if the service is enabled to start on boot
service_enabled=$(systemctl is-enabled "$service_name")
if [ "$service_enabled" != "enabled" ]; then
    echo "$service_name is not enabled to start on boot. Enabling..."
    systemctl enable "$service_name"
    if [ $? -eq 0 ]; then
        echo "$service_name enabled to start on boot successfully."
    else
        echo "Failed to enable $service_name to start on boot."
    fi
else
    echo "$service_name is already enabled to start on boot."
fi

# Check if the service is running
service_status=$(systemctl is-active "$service_name")
