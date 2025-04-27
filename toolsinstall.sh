Build a script to check if curl, git, and docker are installed.

# # Check if curl is installed
if ! command -v curl &> /dev/null; then
    echo "curl is not installed. Installing..."
    apt-get install curl -y
    if [ $? -eq 0 ]; then
        echo "curl installed successfully."
    else
        echo "Failed to install curl."
    fi
else
    echo "curl is already installed."
fi
# # Check if git is installed
if ! command -v git &> /dev/null; then
    echo "git is not installed. Installing..."
    apt-get install git -y
    if [ $? -eq 0 ]; then
        echo "git installed successfully."
    else
        echo "Failed to install git."
    fi
else
    echo "git is already installed."
fi
# # Check if docker is installed
if ! command -v docker &> /dev/null; then
    echo "docker is not installed. Installing..."
    apt-get install docker.io -y
    if [ $? -eq 0 ]; then
        echo "docker installed successfully."
    else
        echo "Failed to install docker."
    fi
else
    echo "docker is already installed."
fi
# # Check if curl is up to date
if [ "$(apt-cache policy curl | grep Installed | awk '{print $2}')" != "$(apt-cache policy curl | grep Candidate | awk '{print $2}')" ]; then
    echo "curl is not up to date. Updating..."
    apt-get update curl -y
    if [ $? -eq 0 ]; then
        echo "curl updated successfully."
    else
        echo "Failed to update curl."
    fi
else
    echo "curl is up to date."
fi
# # Check if git is up to date
if [ "$(apt-cache policy git | grep Installed | awk '{print $2}')" != "$(apt-cache policy git | grep Candidate | awk '{print $2}')" ]; then
    echo "git is not up to date. Updating..."
    apt-get update git -y
    if [ $? -eq 0 ]; then
        echo "git updated successfully."
    else
        echo "Failed to update git."
    fi
else
    echo "git is up to date."
fi
# # Check if docker is up to date
if [ "$(apt-cache policy docker.io | grep Installed | awk '{print $2}')" != "$(apt-cache policy docker.io | grep Candidate | awk '{print $2}')" ]; then
    echo "docker is not up to date. Updating..."
    apt-get update docker.io -y
    if [ $? -eq 0 ]; then
        echo "docker updated successfully."
    else
        echo "Failed to update docker."
    fi
else
    echo "docker is up to date."
fi
# # Check if curl is running
if systemctl is-active --quiet curl; then
    echo "curl is running."
else
    echo "curl is not running."
fi
# # Check if git is running
if systemctl is-active --quiet git; then
    echo "git is running."
else
    echo "git is not running."
fi
# # Check if docker is running
if systemctl is-active --quiet docker; then
    echo "docker is running."
else
    echo "docker is not running."
fi