#!/bin/bash
#
# -- OVERVIEW ---
#
# Generates the required icons for a Chrome extension, 
# overwriting any existing files with the same name.
#
# - icon16.png
# - icon48.png
# - icon128.png
#
# Usage: ./generate_icons.sh <local_file_or_url>
#
# --- REQUIREMENTS ---
#
# ImageMagick (http://www.imagemagick.org/) must be installed.
#

# Check if we have `convert` installed
if ! command -v convert &> /dev/null; then
  echo "ImageMagick is not installed. Please install it and try again."
  echo "e.g. brew install imagemagick"
  exit 1
fi

# Check if argument is provided
if [[ -z "$1" ]]; then
  echo "Usage: $0 <local_file_or_url>"
  exit 1
fi

# Check if the provided argument is a URL or a local file
if [[ $1 =~ ^https?:// ]]; then
  # It's a URL. Download the file.
  wget "$1" -O tmp_file_to_convert.png
  input_file="tmp_file_to_convert.png"
else
  # It's a local file.
  if [[ ! -f "$1" ]]; then
    echo "The provided local file does not exist."
    exit 1
  fi
  input_file="$1"
fi

# Convert the input file to the required icon sizes
convert "$input_file" -resize 16x16 icon16.png
convert "$input_file" -resize 48x48 icon48.png
convert "$input_file" -resize 128x128 icon128.png

# If the file was downloaded, delete the temporary file
if [[ $input_file == "tmp_file_to_convert.png" ]]; then
  rm "$input_file"
fi

echo "Icons generated successfully!"
