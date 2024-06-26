#!/bin/bash

# Define the output file
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
OUTPUT_FILE="netstat_output_$timestamp.csv"

# Define the duration (in seconds) for which the script should run
DURATION=$((60 * 10))  # 10 minutes, you can adjust this value

# Define the interval (in seconds) between each capture
INTERVAL=60  # 1 minute

# Capture the start time
START_TIME=$(date +%s)

# Create the CSV header if the file doesn't exist

# Function to capture netstat output and append to the CSV file
capture_netstat() {
  local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  echo "Timestamp: $timestamp" >> $OUTPUT_FILE
  netstat -an >> $OUTPUT_FILE
  echo "" >> $OUTPUT_FILE
}

# Run the loop for the specified duration
while [ $(( $(date +%s) - START_TIME )) -lt $DURATION ]; do
    capture_netstat
    sleep $INTERVAL
done
