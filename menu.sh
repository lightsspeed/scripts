#Create a script that shows options: view date, check uptime, list files.

#!/bin/bash

# Function to display the menu
show_menu() {
    echo "1. View Date"
    echo "2. Check Uptime"
    echo "3. List Files"
    echo "4. Exit"
}

# Function to view date
view_date() {
    echo "Current Date and Time: $(date)"
}
# Function to check uptime
check_uptime() {
    echo "System Uptime: $(uptime -p)"
}
# Function to list files
list_files() {
    echo "Files in the current directory:"
    ls -l
}
# Main script loop
while true; do
    show_menu
    read -p "Choose an option (1-4): " choice

    case $choice in
        1)
            view_date
            ;;
        2)
            check_uptime
            ;;
        3)
            list_files
            ;;
        4)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
# End of script