#!/bin/bash

source ./config.env

# Create the destination directory if it doesn't exist
mkdir -p "$destination_dir"

# Clear any existing error log
> $ERROR_LOG

# commands that might produce an error, move errors to error.log
# Move CSV files from the source directory to the destination directory
mv "$source_dir"/*.csv "$destination_dir" 2>> $(pwd)/$ERROR_LOG

# Move JSON files from the source directory to the destination directory
mv "$source_dir"/*.json "$destination_dir" 2>> $(pwd)/$ERROR_LOG

# Confirm the move operation
# Check if the error log contains any data (errors)
if [ -s $ERROR_LOG ]; then
  echo "Errors detected. Please check errors in $ERROR_LOG"
else
  echo "Moved all CSV and JSON files from '$source_dir' to '$destination_dir'."
fi