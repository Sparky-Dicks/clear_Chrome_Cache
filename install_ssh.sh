sudo apt update
sudo apt install openssh-server
sudo ufw allow ssh
sudo systemctl status ssh
adduser adminsparky
usermod -aG sudo adminsparky
clear
su – username
