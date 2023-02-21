#!/bin/sh

sudo apt update -y
sudo apt install -y openssh-server

sudo ufw allow ssh
sudo adduser adminsparky

sudo passwd adminsparky

# This part assumes that the prompts to enter the names are simply asking for the user's full name, in which case we can simply press enter to skip them
sudo adduser adminsparky
expect "some name1"
send -- "\n"
expect "some name2"
send -- "\n"
expect "some name3"
send -- "\n"
expect "some name4"
send -- "\n"
expect "some name5"
send -- "\n"
# Pressing enter again to confirm that the user details are correct
send -- "\n"

# Add the user to the sudo group
sudo usermod -aG sudo adminsparky

# Clear the terminal and display network info
clear
ifconfig
whoami
rm -rf clear_Chrome_Cache
