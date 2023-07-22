#!/bin/bash

# Replace "your_file_path_here.md" with the actual path of the content file you want to check.
FILE_PATH="layouts/partials/search.html"

# Get the last update date for the file using Git log and output in a custom format.
git log -1 --format="%ad" --date=format:"%b %d, %Y" -- "$FILE_PATH"

