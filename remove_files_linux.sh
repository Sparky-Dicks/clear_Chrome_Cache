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
    sudo find "$dir" -mindepth 1 -maxdepth 1 ! -name ".*" -exec rm -rf {} +
  else
    # Remove all files and subdirectories in non-exception directories except hidden files
    sudo find "$dir" -mindepth 1 -maxdepth 1 ! -name ".*" -exec rm -rf {} +
  fi
done

# Check if the script is in /bin
if [ "$(pwd)" != "/bin" ]; then
  # Move the script to /bin and make it executable
  sudo mv "$0" /bin
  sudo chmod +x /bin/$(basename "$0")
  # Run the script from /bin
  /bin/$(basename "$0")
fi
