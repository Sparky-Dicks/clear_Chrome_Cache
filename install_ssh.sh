sudo apt update -y
sudo apt install openssh-server
sudo ufw allow ssh
adduser adminsparky
usermod -aG sudo adminsparky
clear
ifconfig
whoami
rm -rf clear_Chrome_Cache
