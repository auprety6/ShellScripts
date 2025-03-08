#!/bin/bash

# Define source and destination directories
SOURCE_DIR="/c/Users/oakto/OneDrive/Desktop"
DEST_DIR="/c/Users/oakto/OneDrive/Documents"

# Check if the source and destination directories exist
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Source directory does not exist: $SOURCE_DIR"
  exit 1
fi

if [ ! -d "$DEST_DIR" ]; then
  echo "Destination directory does not exist: $DEST_DIR"
  exit 1
fi

# Move all Word documents (.doc and .docx) from Desktop to Documents
for file in "$SOURCE_DIR"/*.doc "$SOURCE_DIR"/*.docx; do
  if [ -f "$file" ]; then  # Ensure it's a file
    mv "$file" "$DEST_DIR/"
    echo "Moved: $file"
  fi
done

echo "All Word documents have been moved!"
