#!/bin/bash

# Define the regex pattern to match
PATTERN="\s*\[[^]]*\] - libgen\.li"

# Get the folder path from the command-line argument with "-p" flag
if [ "$1" == "-p" ]
then
  FOLDER_PATH="$2"
else
  echo "Usage: ./script.sh -p /path/to/folder"
  exit 1
fi

# Move to the folder where the files are located
cd "$FOLDER_PATH" || exit

# Loop through each file in the directory
for FILENAME in *
do
  # Check if the file matches the regex pattern
  if echo "$FILENAME" | grep -qE "$PATTERN"; then
    # Remove the regex pattern from the filename
    NEW_FILENAME=$(echo "$FILENAME" | sed -E "s/$PATTERN//")
    # Rename the file
    mv "$FILENAME" "$NEW_FILENAME"
  fi
done
