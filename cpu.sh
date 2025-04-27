#!/bin/bash

# Configuration
INTERVAL=5    # Seconds between readings
DURATION=60   # Total duration in seconds
ITERATIONS=$((DURATION / INTERVAL))  # Number of iterations

# Function to get CPU usage percentage
get_cpu_usage() {
  # Read CPU stats from /proc/stat
  read cpu user nice system idle < /proc/stat
  total=$((user + nice + system + idle))
  used=$((user + nice + system))
  
  # Wait briefly and read again for a delta
  sleep 0.1
  read cpu user2 nice2 system2 idle2 < /proc/stat
  total2=$((user2 + nice2 + system2 + idle2))
  used2=$((user2 + nice2 + system2))
  
  # Calculate usage percentage
  used_diff=$((used2 - used))
  total_diff=$((total2 - total))
  [ $total_diff -eq 0 ] && echo "0" && return
  echo $((100 * used_diff / total_diff))
}

# Function to get memory usage percentage
get_mem_usage() {
  # Parse 'free' output for memory stats
  mem_info=$(free -m | grep Mem)
  total=$(echo "$mem_info" | awk '{print $2}')
  used=$(echo "$mem_info" | awk '{print $3}')
  [ $total -eq 0 ] && echo "0" && return
  echo $((100 * used / total))
}

# Main loop
echo "Monitoring CPU and Memory usage every ${INTERVAL} seconds for ${DURATION} seconds..."
for ((i=1; i<=ITERATIONS; i++)); do
  timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  cpu_usage=$(get_cpu_usage)
  mem_usage=$(get_mem_usage)
  echo "[$timestamp] CPU: ${cpu_usage}% | Memory: ${mem_usage}%"
  sleep $INTERVAL
done

echo "Monitoring complete"