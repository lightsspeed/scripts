#Make a script that creates a user and sets a default password.
#and add the user to the sudo group.
#!/bin/bash
# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi
# Check if the username is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <username>"
    exit 1
fi
# Check if the password is provided
if [ -z "$2" ]; then
    echo "Usage: $0 <username> <password>"
    exit 1
fi
# Check if the user already exists
if id "$1" &>/dev/null; then
    echo "User $1 already exists"
    exit 1
fi
# Create the user with the provided username and password
useradd -m -s /bin/bash "$1"
echo "$1:$2" | chpasswd
# Add the user to the sudo group
usermod -aG sudo "$1"
# Check if the user was created successfully
if id "$1" &>/dev/null; then
    echo "User $1 created successfully and added to the sudo group"
else
    echo "Failed to create user $1"
    exit 1
fi
# Check if the user is in the sudo group
if groups "$1" | grep -q "\bsudo\b"; then
    echo "User $1 is in the sudo group"
else
    echo "User $1 is not in the sudo group"
    exit 1
fi
# Check if the user can run sudo commands
if sudo -l -U "$1" &>/dev/null; then
    echo "User $1 can run sudo commands"
else
    echo "User $1 cannot run sudo commands"
    exit 1
fi
# Check if the user can run sudo commands without a password
if sudo -l -U "$1" | grep -q "(ALL : ALL) NOPASSWD: ALL"; then
    echo "User $1 can run sudo commands without a password"
else
    echo "User $1 cannot run sudo commands without a password"
    exit 1
fi

