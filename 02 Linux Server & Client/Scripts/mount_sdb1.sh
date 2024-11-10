#!/bin/bash

# Define the device and mount point
DEVICE="/dev/sdb1"
MOUNT_POINT="/mnt"

# Check if the device is already mounted at the specified mount point
if mountpoint -q "$MOUNT_POINT"; then
    echo "$DEVICE is already mounted at $MOUNT_POINT."
else
    echo "Mounting $DEVICE to $MOUNT_POINT..."
    sudo mount "$DEVICE" "$MOUNT_POINT"
    
    # Check if the mount was successful
    if [ $? -eq 0 ]; then
        echo "$DEVICE successfully mounted to $MOUNT_POINT."
    else
        echo "Failed to mount $DEVICE to $MOUNT_POINT."
    fi
fi
