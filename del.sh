#!/bin/bash
# ANSI escape codes for colored output
RED_BG="\033[41m"
BLACK_TEXT="\033[30m"
RESET="\033[0m"

# Default Trash folder in Ubuntu
TRASH_DIR="$HOME/.local/share/Trash/files"

# Check for a single argument
if [ "$#" -ne 1 ]; then
  echo -e "${RED_BG}${BLACK_TEXT}Usage: del filename${RESET}"
  exit 1
fi

# Check if a file with the same name already exists in the Trash folder
filename=$(basename -- "$1")
extension="${filename##*.}"
filename_noext="${filename%.*}"
timestamp=$(date +%Y%m%d%H%M%S)
dest="$TRASH_DIR/$filename"

if [ -e "$dest" ]; then
  dest="$TRASH_DIR/${filename_noext}_${timestamp}.${extension}"
fi

# Ask for user confirmation
echo -e "${RED_BG}${BLACK_TEXT}Are you sure you want to move $1 to Trash? [y/N]${RESET}"
read -r answer

if [ "$answer" != "Y" ] && [ "$answer" != "y" ]; then
  echo "Operation cancelled."
  exit 1
fi

# Move the file to the Trash folder
mv "$1" "$dest" && echo -e "${RED_BG}${BLACK_TEXT}Moved $1 to $dest${RESET}" || echo -e "${RED_BG}${BLACK_TEXT}Failed to move $1${RESET}"
