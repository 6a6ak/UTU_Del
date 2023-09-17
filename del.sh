#!/bin/bash

# Default Trash folder in Ubuntu
TRASH_DIR="$HOME/.local/share/Trash/files"

# Check for a single argument
if [ "$#" -ne 1 ]; then
  echo "Usage: del filename"
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

# Move the file to the Trash folder
mv "$1" "$dest"
echo "Moved $1 to $dest"
