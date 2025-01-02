#!/bin/bash

echo "This program gets the first 10 biggest files in the file system passed via positional argument"

# Check if a directory argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

path=$1
echo "Path: $path"

# Get the top 10 largest files/directories, ignoring permission errors
du -ah "$path" 2>/dev/null | sort -hr | head -n 10 > /tmp/filesize.txt

echo "This is the list of big files in the file system $path:"
cat /tmp/filesize.txt

