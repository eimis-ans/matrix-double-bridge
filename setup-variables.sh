#!/bin/bash
set -e

env_file=".env"

function replace_everywhere() {

    files=$(find . -type f \( -name "*.yaml" -o -name "*.yml" -o -name ".env" \))

    for file in $files; do
        # Replace the old value with the new value using sed
        sed -i "s/{{ $1 }}/$2/g" "$file"
    done

}

echo set passwords...
files=$(find . -type f \( -name "*.yaml" -o -name "*.yml" -o -name ".env" \))

# Iterate over each file
for file in $files; do
    # Replace the old value with the new value using sed
    sed -i "s/{{ password }}/$(openssl rand -hex 20)/g" "$file"
done

echo Replace variables...
while IFS= read -r line || [[ -n "$line" ]]; do
    # Skip empty lines and lines starting with #
    if [[ -z "$line" || "$line" == "#"* ]]; then
        continue
    fi
    
    # Extract the key and value from the line
    IFS="=" read -r key value <<< "$line"
    
    # Trim leading and trailing whitespace from the key and value
    key="${key#"${key%%[![:space:]]*}"}"
    key="${key%"${key##*[![:space:]]}"}"
    value="${value#"${value%%[![:space:]]*}"}"
    value="${value%"${value##*[![:space:]]}"}"
    
    # Perform operations with the key and value
    echo "Replace: $key"
    
    replace_everywhere $key $value
    
done < "$env_file"

echo done.