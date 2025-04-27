#!/bin/bash
# Script to analyze disk usage for specific directories

# List of directories to check
DIRECTORIES=("/var/log" "/home" "/var/lib" "/usr" "/var/cache")

echo "Disk Usage Analysis for Specific Directories"
echo "==========================================="

# Loop through each directory and show its disk usage
for DIR in "${DIRECTORIES[@]}"; do
    # Check if directory exists
    if [ -d "$DIR" ]; then
        echo -e "\n=== $DIR ==="
        
        # Get total size of the directory
        DIR_SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "Total size: $DIR_SIZE"
        
        # Show largest subdirectories (top 3)
        echo "Largest subdirectories:"
        du -h --max-depth=1 "$DIR" 2>/dev/null | sort -hr | head -n 4 | tail -n 3 | awk '{printf "  %-8s %s\n", $1, $2}'
    else
        echo -e "\n=== $DIR === (Directory does not exist)"
    fi
done

# Show overall disk usage summary
echo -e "\nOverall Disk Usage Summary"
echo "========================="
df -h | grep -v "tmpfs" | grep -v "udev"