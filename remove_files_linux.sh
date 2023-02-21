#!/bin/bash

# Remove everything in the specified folders
sudo rm -rf /home/wethinkcode/.mozilla/firefox/*

# Create a list of exceptions
exceptions=(Downloads Desktop Documents Music Pictures Public Templates Videos)

# Loop through the directories in /home
for dir in /home/*; do
  # Check if the directory is an exception
  if [[ "${exceptions[@]}" =~ $(basename "$dir") ]]; then
    # Remove all files and subdirectories in the exception directory
    sudo rm -rf "$dir"/*
  else
    # Remove all files and subdirectories in non-exception directories except hidden files
    sudo find "$dir" -mindepth 1 -maxdepth 1 ! -name ".*" -exec rm -rf {} +
  fi
done
mkdir /home/wethinkcode/Downloads /home/wethinkcode/Desktop /home/wethinkcode/Documents /home/wethinkcode/Music /home/wethinkcode/Pictures /home/wethinkcode/Public /home/wethinkcode/Templates /home/wethinkcode/Videos
echo "Tasks complete"
