#!/bin/bash

read -p "Enter the directory path containing your images: " image_directory

if [ ! -d "$image_directory" ]; then
  echo "Directory does not exist."
  exit 1
fi

convert_png_to_jpg() {
  for png_file in "$picture_directory"/*.png; do
    if [ -f "$png_file" ]; then
      filename=$(basename -- "$png_file")
      filename_no_ext="${filename%.*}"
      converted_file="$picture_directory/$filename_no_ext.jpg"
      echo "Converting $filename to JPG format..."
      convert "$png_file" "$converted_file"
      rm "$png_file"
    fi
  done
}

convert_jpg_to_png() {
  for jpg_file in "$picture_directory"/*.jpg; do
    if [ -f "$jpg_file" ]; then
      filename=$(basename -- "$jpg_file")
      filename_no_ext="${filename%.*}"
      converted_file="$picture_directory/$filename_no_ext.png"
      echo "Converting $filename to PNG format..."
      convert "$jpg_file" "$converted_file"
      rm "$jpg_file"
    fi
  done
}

if [ "$1" == "png" ]; then
  convert_jpg_to_png
elif [ "$1" == "jpg" ]; then
  convert_png_to_jpg
else
  echo "Usage: $0 [png|jpg]"
  exit 1
fi
