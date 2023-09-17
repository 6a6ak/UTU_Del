# UTU_Del (`del`)

## Introduction

This is a simple Bash script named `del` that moves any file or folder to the Ubuntu default Trash folder (`~/.local/share/Trash/files`). This provides a safer alternative to using `rm` by allowing you to restore deleted files from the Trash if necessary.

## Features

- Checks for the existence of the Trash folder and uses it for deleted files.
- Allows deletion of only one file at a time for safety.
- Checks if a file with the same name already exists in the Trash folder.
- Appends a timestamp to filenames to resolve conflicts.

## Requirements

- Ubuntu Desktop or similar GNOME-based Linux distributions.
- Bash shell.

## Installation

1. Save the script in a file, for example, `del.sh`.
2. Make it executable: `chmod +x del.sh`.
3. Optionally, move it to a directory in your `PATH`, e.g., `sudo mv del.sh /usr/local/bin/del`.

## Usage

To delete a file, navigate to its folder in the terminal and use the `del` command:

```

del filename

```
