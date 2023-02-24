#!/bin/bash

# Remove everything in the specified folders
sudo rm -rf /home/wethinkcode/.mozilla/firefox/*

# List of browser names to clear browsing data for
browsers=("google-chrome" "chromium" "firefox" "brave-browser")

for browser in "${browsers[@]}"; do
    # Check if browser is installed
    if command -v "$browser" >/dev/null 2>&1; then
        # Clear browsing data for the browser
        case "$browser" in
            "google-chrome")
                rm -rf "${HOME}/.config/google-chrome/Default/*"
                ;;
            "chromium")
                rm -rf "${HOME}/.config/chromium/Default/*"
                ;;
            "firefox")
                rm -rf "${HOME}/.mozilla/firefox/*.default-release/*"
                ;;
            "brave-browser")
                rm -rf "${HOME}/.config/BraveSoftware/Brave-Browser/Default/*"
                ;;
        esac
        echo "Cleared browsing data for $browser"
    else
        echo "$browser is not installed"
    fi
done


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
