#!/bin/bash

# Set the Desktop path (modify if needed)
DESKTOP="$HOME/Desktop"

# Define categories and their extensions
declare -A FILE_CATEGORIES
FILE_CATEGORIES=(
    ["Documents"]="pdf docx txt xls ppt odt csv"
    ["Images"]="jpg jpeg png gif svg bmp tiff"
    ["Videos"]="mp4 mkv avi mov wmv flv"
    ["Music"]="mp3 wav flac aac ogg"
    ["Archives"]="zip rar tar.gz 7z"
    ["Scripts"]="sh py js html css php"
)

# Create category folders if they don't exist
for category in "${!FILE_CATEGORIES[@]}"; do
    mkdir -p "$DESKTOP/$category"
done

# Move files to respective folders
for file in "$DESKTOP"/*; do
    [ -f "$file" ] || continue  # Skip if not a file

    extension="${file##*.}"
    
    moved=false
    for category in "${!FILE_CATEGORIES[@]}"; do
        if [[ " ${FILE_CATEGORIES[$category]} " =~ " $extension " ]]; then
            mv "$file" "$DESKTOP/$category/"
            echo "Moved $file to $category folder"
            moved=true
            break
        fi
    done

    # Move unidentified files to "Others"
    if [ "$moved" = false ]; then
        mkdir -p "$DESKTOP/Others"
        mv "$file" "$DESKTOP/Others/"
        echo "Moved $file to Others folder"
    fi
done

echo "File organization complete!"

