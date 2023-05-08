#!/bin/bash

echo wethinkcode2023 | sudo -S apt-get install -y python3-tk python3-pip
pip3 install tqdm

paths() {
    desktop_folder=~/Desktop
    downloads_folder=~/Downloads
    documents_folder=~/Documents
    music_folder=~/Music
    pictures_folder=~/Pictures
    videos_folder=~/Videos
    local_folder=~/.local/bin
    trash_folder=~/.local/share/Trash/files
    wtc_config_folder=~/.config/wtc
    ssh_folder=~/.ssh

    directories=($desktop_folder $downloads_folder $documents_folder $music_folder $pictures_folder $videos_folder $local_folder $wtc_config_folder $ssh_folder $trash_folder)

    for dir in "${directories[@]}"; do
        echo "Clearing $dir..."
        delete "$dir"
    done
}

clear_home() {
    home_dir=~
    excluded_folders=("Downloads" "Documents" "Music" "Pictures" "Public" "Templates" "Videos" "Desktop")
    excluded_paths=()
    for folder in "${excluded_folders[@]}"; do
        excluded_paths+=("$home_dir/$folder")
    done
    current_time=$(date +%s)
    cutoff_time=$(echo "$current_time - 1296000" | bc)
    while IFS= read -r -d '' file; do
        file_modified_time=$(stat -c %Y "$file")
        if [[ $file_modified_time -gt $cutoff_time && ! $(basename "$file") == .* && ! ${excluded_paths[*]} =~ $file ]]; then
            if [[ -f $file ]]; then
                rm -f "$file"
            else
                rm -rf "$file"
            fi
        fi
    done < <(find "$home_dir" -not -path '*/\.*' -type f -o -type d -print0)
}

delete() {
    for file_path in "$1"/*; do
        if [[ -f $file_path ]]; then
            rm -f "$file_path"
        else
            rm -rf "$file_path"
        fi
    done
}

# Clear Firefox browser history
rm -rf ~/.mozilla/firefox

if ! command -v bc &> /dev/null; then
    echo "Please install 'bc' package"
    exit 1
fi

if ! command -v firefox &> /dev/null; then
    echo "Please install 'firefox' package"
    exit 1
fi

echo "Clearing files..."
clear_home
paths

echo "Clearing Firefox history..."
clear_firefox

echo "System successfully cleaned..."
