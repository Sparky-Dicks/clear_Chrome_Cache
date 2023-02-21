#!/bin/bash

# Find the script in the current directory or any subdirectories
script_path=$(find . -name "remove_files_linux.sh" -print -quit)

if [ -z "$script_path" ]; then
  echo "Script not found!"
else
  # Move the script to /bin and make it executable
  sudo mv "$script_path" /bin
  sudo chmod +x /bin/remove_files_linux.sh
  echo "Script moved and made executable."
  remove_files_linux.sh
  echo "Thank you, thats all you need to do."
fi
