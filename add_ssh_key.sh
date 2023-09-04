#!/bin/bash

# Your SSH public key
public_key_path="id_rsa.pub"

# Add your public key to the authorized_keys file on this machine
cat "$public_key_path" >> "$HOME/.ssh/authorized_keys"

echo "SSH setup completed!"
