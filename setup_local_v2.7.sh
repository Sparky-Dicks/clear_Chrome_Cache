#!/bin/bash

# Install SSH on the client device (assuming it's also a Linux machine)
sudo apt-get update
sudo apt-get install -y ssh

# Get the IP address of the client device using ifconfig
ip_address=$(ifconfig wlo1 | awk '/inet / {print $2}')

# Send the IP address to your local machine via SSH
local_machine_user="wethinkcode"
local_machine_ip="20.20.18.24"

sshpass -p "kam" ssh $local_machine_user@$local_machine_ip "echo $ip_address >> ~/Documents/Scripts/ips.txt"
