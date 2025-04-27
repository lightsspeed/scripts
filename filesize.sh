#Write a script to find all files in /var/log larger than 10MB.

#!/bin/bash

# Find all files in /var/log larger than 10MB
find /var/log -type f -size +10M -exec ls -lh {} \; | awk '{ print $9 ": " $5 }'

