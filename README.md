# Top10LargestFilesAnalyzer.sh

# Get Biggest Files

This Bash script retrieves the first 10 biggest files in the specified directory, displaying their sizes in a human-readable format. It gracefully handles permission errors, ensuring that the output is clean and accurate.

## Usage

### Prerequisites

- A Unix-based system (e.g., Linux, macOS)
- Bash shell
- `du` and `sort` utilities available

### Execution

To run the script, use the following command:

```bash
./get_biggest_files.sh <directory>
Replace <directory> with the path of the directory you want to scan. For example:

bash
./get_biggest_files.sh /home/user/documents
Example Output
plaintext
This program gets the first 10 biggest files in the file system passed via positional argument
Path: /home/user/documents
This is the list of big files in the file system /home/user/documents:
2.0G    /home/user/documents/file1.zip
1.5G    /home/user/documents/file2.iso
...
Script Details
bash
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
Notes
Ensure the script has executable permissions. If not, make it executable using:

bash
chmod +x get_biggest_files.sh
The output is saved to a temporary file (/tmp/filesize.txt) and then printed to the console.
