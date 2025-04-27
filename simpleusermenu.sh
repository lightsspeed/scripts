#Create a menu-based script that allows: create user, delete user, list users.

#!/bin/bash

# Function to create a user
create_user() {
    read -p "Enter username: " username
    read -sp "Enter password: " password
    echo
    sudo useradd -m -s /bin/bash "$username"
    echo "$username:$password" | sudo chpasswd
    sudo usermod -aG sudo "$username"
    echo "User $username created and added to the sudo group."
}
# Function to delete a user
delete_user() {
    read -p "Enter username to delete: " username
    sudo userdel -r "$username"
    echo "User $username deleted."
}

# Function to list users
list_users() {
    echo "List of users:"
    cut -d: -f1 /etc/passwd
}
# Function to display the menu
display_menu() {
    echo "1. Create User"
    echo "2. Delete User"
    echo "3. List Users"
    echo "4. Exit"
}
# Main script
while true; do
    display_menu
    read -p "Choose an option: " choice
    case $choice in
        1) create_user ;;
        2) delete_user ;;
        3) list_users ;;
        4) exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done
# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi
# Check if the script is run with a valid argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <username>"
    exit 1
fi
# Check if the user already exists
if id "$1" &>/dev/null; then
    echo "User $1 already exists"
    exit 1
fi
