#!/bin/bash

# Prompt user for input directory path
read -p "Enter directory path: " directory

# Prompt user for input permissions number
read -p "Enter permissions number: " permissions

# Navigate to the directory
cd "$directory" || { echo "Error: Directory not found"; exit 1; }

# Change permissions of all files inside the directory
chmod -R "$permissions" *

# Print directory contents and permissions settings
echo "Directory Contents:"
ls -l