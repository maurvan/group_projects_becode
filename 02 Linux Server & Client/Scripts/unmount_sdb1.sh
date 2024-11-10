#!/bin/bash

# Define the device and mount point
DEVICE="/dev/sdb1"
MOUNT_POINT="/mnt"

# Check if the device is mounted at the specified mount point
if mountpoint -q "$MOUNT_POINT"; then
    echo "Unmounting $DEVICE from $MOUNT_POINT..."
    sudo umount "$DEVICE"
    
    # Check if the unmount was successful
    if [ $? -eq 0 ]; then
        echo "$DEVICE successfully unmounted from $MOUNT_POINT."
    else
        echo "Failed to unmount $DEVICE from $MOUNT_POINT."
    fi
else
    echo "$DEVICE is not mounted at $MOUNT_POINT."
fi
