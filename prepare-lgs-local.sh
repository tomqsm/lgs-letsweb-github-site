#!/bin/bash

hugo --baseURL "http://localhost:3000"
wait
./pagefind --source "public"

# Define the directory paths
public_dir="public"
githubpages_dir="githubpages"
lgs_dir="$githubpages_dir/lgs-letsweb-github-site"

# Check if the public directory exists
if [ ! -d "$public_dir" ]; then
    # If it doesn't exist, print an error message and exit
    echo "public dir must exist"
    exit 1
fi

# Check if the githubpages/lgs directory exists
if [ -d "$lgs_dir" ]; then
    # If it exists, remove the existing githubpages/lgs directory
    rm -rf "$lgs_dir"
fi

# Create a new githubpages/lgs directory
mkdir -p "$lgs_dir"
# Copy the contents of the public directory to githubpages/lgs
cp -r "$public_dir"/* "$lgs_dir"
