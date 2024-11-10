#!/bin/bash

# Define backup directory
BACKUP_DIR="/var/backups"
TIMESTAMP=$(date +'%Y-%m-%d')
BACKUP_PATH="$BACKUP_DIR/backup_$TIMESTAMP"

# Define the backup archive filename
BACKUP_ARCHIVE="$BACKUP_PATH.tar.gz"

# Define directories and files to back up
DHCP_CONFIG_DIR="/etc/dhcp"
DHCP_CONFIG="/etc/dhcp/dhcpd.conf"
DHCP_ISC_CONFIG="/etc/default/isc-dhcp-server"
NETPLAN_CONFIG="/etc/netplan/50-cloud-init.yaml"
NETPLAN_CONFIG_DIR="/etc/netplan"
SYSCTL_CONFIG="/etc/sysctl.conf"
IPTABLES_CONFIG="/etc/iptables/rules.v4"
IPTABLES_CONFIG_DIR="/etc/iptables"
DNS_CONFIG_DIR="/etc/bind"
NGINX_CONFIG_DIR="/etc/nginx"
NGINX_SITES_AVAILABLE="/etc/nginx/sites-available"
NGINX_SITES_ENABLED="/etc/nginx/sites-enabled"

# Check if backup directory exists; if not, create it
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Backup directory does not exist. Creating it..."
    mkdir -p "$BACKUP_DIR"
fi

# Create a timestamped backup directory (temporarily used for organizing files)
mkdir -p "$BACKUP_PATH"

# Backup DHCP config
if [ -d "$DHCP_CONFIG_DIR" ]; then
    echo "Backing up DHCP configuration..."
    mkdir -p "$BACKUP_PATH/dhcp"
    cp "$DHCP_CONFIG" "$BACKUP_PATH/dhcp/dhcpd.conf"
    cp "$DHCP_ISC_CONFIG" "$BACKUP_PATH/dhcp/isc-dhcp-server"
else
    echo "DHCP configuration file not found!"
fi

# Backup netplan
if [ -d "$NETPLAN_CONFIG_DIR" ]; then
    echo "Backing up netplan..."
    mkdir -p "$BACKUP_PATH/netplan"
    cp "$NETPLAN_CONFIG" "$BACKUP_PATH/netplan/50-cloud-init.yaml"
else
    echo "Netplan not found!"
fi

# Backup iptables
if [ -d "$IPTABLES_CONFIG_DIR" ]; then
    echo "Backing up iptables..."
    mkdir -p "$BACKUP_PATH/iptables"
    cp "$IPTABLES_CONFIG" "$BACKUP_PATH/iptables/rules.v4"
else
    echo "Iptables not found!"
fi

# Backup systctl
if [ -f "$SYSCTL_CONFIG" ]; then
    echo "Backing up sysctl..."
    cp "$SYSCTL_CONFIG" "$BACKUP_PATH/sysctl.conf"
else
    echo "sysctl not found!"
fi

# Backup DNS config (for BIND)
if [ -d "$DNS_CONFIG_DIR" ]; then
    echo "Backing up DNS configuration..."
    cp -r "$DNS_CONFIG_DIR" "$BACKUP_PATH/bind"
else
    echo "DNS configuration file not found!"
fi

# Backup Nginx config
if [ -d "$NGINX_CONFIG_DIR" ]; then
    echo "Backing up Nginx configuration..."
    cp -r "$NGINX_CONFIG_DIR" "$BACKUP_PATH/nginx"
    
    if [ -d "$NGINX_SITES_AVAILABLE" ]; then
        cp -r "$NGINX_SITES_AVAILABLE" "$BACKUP_PATH/nginx/sites-available"
    fi
    if [ -d "$NGINX_SITES_ENABLED" ]; then
        cp -r "$NGINX_SITES_ENABLED" "$BACKUP_PATH/nginx/sites-enabled"
    fi
else
    echo "Nginx configuration directory not found!"
fi

# Create a compressed tarball (gzip) of the backup directory
echo "Compressing backup into a single archive..."
tar -czf "$BACKUP_ARCHIVE" -C "$BACKUP_DIR" "backup_$TIMESTAMP"

# Print success message
echo "Backup completed successfully. Archive stored at $BACKUP_ARCHIVE."

# Clean up the temporary backup directory after creating the archive
rm -rf "$BACKUP_PATH"
