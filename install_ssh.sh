sudo apt update -y
expect "assword"
send -- "wtc"
sudo apt install openssh-server
sudo ufw allow ssh100
sudo adduser adminsparky

expect "assword"
send -- "my_password"
expect "again"
send -- "my_password"

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

expect "details"
send -- "y\r"

usermod -aG sudo adminsparky
clear
ifconfig
whoami
rm -rf clear_Chrome_Cache
