
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


#Develop a script to check disk usage and alert if above 80%.

# Check if any filesystem is above 80% usage
echo -e "\nDisk Usage Alert:"
df -h | awk '$5 > 80 {print "Warning: " $1 " is " $5 " full!"}'
# Check if any filesystem is above 90% usage
df -h | awk '$5 > 90 {print "Critical: " $1 " is " $5 " full!"}'
# Check if any filesystem is above 95% usage
df -h | awk '$5 > 95 {print "Emergency: " $1 " is " $5 " full!"}'
# Check if any filesystem is above 99% usage
df -h | awk '$5 > 99 {print "Critical: " $1 " is " $5 " full!"}'
# Check if any filesystem is above 100% usage
df -h | awk '$5 > 100 {print "Critical: " $1 " is " $5 " full!"}'   