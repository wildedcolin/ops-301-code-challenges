#!/bin/bash

# Function to print file size
print_file_size() {
  file=$1
  size=$(du -sh "$file" | cut -f1)
  echo "File size of $file: $size"
}

# Create backup directory if it doesn't exist
backup_dir="/var/log/backups"
sudo mkdir -p "$backup_dir"
sudo chown $(whoami) "$backup_dir"

# Get current timestamp
timestamp=$(date "+%Y%m%d%H%M%S")

# Compress syslog
syslog_file="/var/log/syslog"
syslog_backup_file="$backup_dir/syslog-$timestamp.zip"
print_file_size "$syslog_file"
sudo zip -q "$syslog_backup_file" "$syslog_file"
echo "Syslog compressed to: $syslog_backup_file"
sudo truncate -s 0 "$syslog_file" # Clear syslog
print_file_size "$syslog_backup_file"

# Compress wtmp
wtmp_file="/var/log/wtmp"
wtmp_backup_file="$backup_dir/wtmp-$timestamp.zip"
print_file_size "$wtmp_file"
sudo zip -q "$wtmp_backup_file" "$wtmp_file"
echo "Wtmp compressed to: $wtmp_backup_file"
sudo truncate -s 0 "$wtmp_file" # Clear wtmp
print_file_size "$wtmp_backup_file"

# Compare file sizes
syslog_original_size=$(du -sh "$syslog_file" | cut -f1)
syslog_compressed_size=$(du -sh "$syslog_backup_file" | cut -f1)
wtmp_original_size=$(du -sh "$wtmp_file" | cut -f1)
wtmp_compressed_size=$(du -sh "$wtmp_backup_file" | cut -f1)

echo "Comparison of file sizes:"
echo "Syslog: Original: $syslog_original_size, Compressed: $syslog_compressed_size"
echo "Wtmp: Original: $wtmp_original_size, Compressed: $wtmp_compressed_size"
