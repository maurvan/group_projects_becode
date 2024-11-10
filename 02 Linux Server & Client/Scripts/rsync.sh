#!/bin/bash

# Define source and destination directories
SOURCE="/var/backups"
DESTINATION="/mnt"

# Define log file for output
LOG_FILE="/var/log/backup_rsync.log"

# Timestamp for log entries
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Ensure that the source and destination directories exist
if [ ! -d "$SOURCE" ]; then
  echo "$TIMESTAMP: ERROR - Source directory $SOURCE does not exist." >> "$LOG_FILE"
  exit 1
fi

if [ ! -d "$DESTINATION" ]; then
  echo "$TIMESTAMP: ERROR - Destination directory $DESTINATION does not exist." >> "$LOG_FILE"
  exit 1
fi

# Perform rsync from source to destination
echo "$TIMESTAMP: Starting backup from $SOURCE to $DESTINATION..." >> "$LOG_FILE"
rsync -av --delete "$SOURCE/" "$DESTINATION/" >> "$LOG_FILE" 2>&1

# Check if the rsync command was successful
if [ $? -eq 0 ]; then
  echo "$TIMESTAMP: Backup completed successfully." >> "$LOG_FILE"
else
  echo "$TIMESTAMP: ERROR - Backup failed." >> "$LOG_FILE"
fi
