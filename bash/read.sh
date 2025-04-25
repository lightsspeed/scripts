#Read a name from user and greet them.

#
# #!/bin/bash
#

# # Prompt the user for their name
echo "Enter your name:"
read name

# # Greet the user
echo "Hello, $name! Welcome!"
#
# # Check if the user provided a name
if [ -z "$name" ]; then
    echo "No name provided. Please run the script again and enter your name."
    exit 1
fi
# # Greet the user
echo "Hello, $name! Welcome!"