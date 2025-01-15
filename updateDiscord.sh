#!/bin/bash

# path for the Discord JSON
file="/opt/discord/resources/build_info.json"

# Verifica se o arquivo existe
if [ ! -f "$file" ]; then
  echo "file $file not found!"
  exit 1
fi

# Verifica se o script está sendo executado como root
if [ "$EUID" -ne 0 ]; then
  echo "Please run with sudo"
  exit 1
fi
# Read the discord version
version=$(grep -oP '(?<="version": ")[^"]*' $file)

# Divide the version in variables (major, minor, patch)
IFS='.' read -r major minor patch <<< "$version"

# Increase the number of version (adjustable: major, minor ou patch)
minor=0
patch=$((patch + 1)) 

# New version formatted 
new_version="$major.$minor.$patch"

# Replace the version (with sudo)
sed -i "s/\"version\": \"$version\"/\"version\": \"$new_version\"/" $file

echo "Updated the $version to $new_version"
