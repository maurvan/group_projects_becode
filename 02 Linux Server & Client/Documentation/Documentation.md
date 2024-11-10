# Project Overview

This project involves setting up a comprehensive Linux-based infrastructure for a local library that aims to minimize costs by utilizing open-source software. The setup consists of a server and a workstation, both configured to support the library's daily operations with essential services and applications.

## Objectives

The primary objectives of this project are:
- **Set up a Linux-based server** to run essential network services: DHCP, DNS, and Nginx web server.
- **Configure the server** to handle dynamic IP assignment for internal devices, resolve domain names for internal resources, and host a local webpage.
- **Automate backup processes** using `cron` to ensure regular and secure backups of key service configurations.
- **Enable remote management** of the server through SSH, allowing for easy troubleshooting and configuration updates.
- **Provide a workstation** with the necessary applications for daily tasks, such as LibreOffice, Gimp, and Mullvad browser, all configured with automatic IP addressing from the server's DHCP service.

## Software and hardware used
In this project, the following components were used to set up the library’s IT infrastructure:

- **Virtualization Platform**:
    - **VirtualBox**: Used to create and manage virtual machines (VMs) that simulate the library’s server and workstation environment.
- **Server VM**:
    - **VM1: Library Server (Ubuntu Server)**: A virtual machine running **Ubuntu Server**, configured with the required services (DHCP, DNS, and Nginx web server).
- **Workstation VM**:
    - **VM2: Library Workstation (Ubuntu Desktop)**: A virtual machine running **Ubuntu Desktop**, equipped with essential applications such as **LibreOffice**, **Gimp**, and **Mullvad Browser**.
- **Services and Software**:
    - **ISC DHCP Server**: Used for providing dynamic IP addressing to the internal network.
    - **BIND DNS Server**: Used for resolving internal network resources and forwarding external DNS queries.
    - **Nginx**: Configured as a web server to host a local webpage for the library.
    - **Cron**: Used for scheduling weekly backups of configuration files.
    - **SSH**: For remote management of the server.
- **Backup System**:
    - **rsync** (Optional): For placing backups on a separate partition, mounted only during the backup process.

## Installation & Configuration manuals

- [Server Installation](/Manuals/Server_Installation.md)
- [SSH](/Manuals/SSH.md)
- [DHCP](/Manuals/DHCP.md)
- [DNS](/Manuals/DNS.md)
- [nginx](/Manuals/nginx.md)
- [cron](/Manuals/cron.md)
- [rsync](/Manuals/rsync.md)
