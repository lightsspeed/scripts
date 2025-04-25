
#!/bin/bash
# Script to show overall disk usage of the server

echo "Overall Disk Usage Summary"
echo "=========================="

# Show filesystem usage for all mounted filesystems
echo -e "\nFilesystem Usage:"
df -h | grep -v "tmpfs" | grep -v "udev"

# Show largest directories in root filesystem
echo -e "\nTop 5 Largest Directories in Root:"
du -h --max-depth=1 / 2>/dev/null | sort -hr | head -n 6 | grep -v "^0" 

# Show total system usage
echo -e "\nTotal System Usage:"
TOTAL=$(df -h --total | grep "total" | awk '{print $2}')
USED=$(df -h --total | grep "total" | awk '{print $3}')
AVAIL=$(df -h --total | grep "total" | awk '{print $4}')
PERCENTAGE=$(df -h --total | grep "total" | awk '{print $5}')

echo "Total Size: $TOTAL"
echo "Used: $USED ($PERCENTAGE)"
echo "Available: $AVAIL"