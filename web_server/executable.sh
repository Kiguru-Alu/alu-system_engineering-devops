#!/bin/bash

# Grant execute permission to all files in the current directory
for file in *; do
    if [ -f "$file" ]; then
        chmod +x "$file"
        echo "Made executable: $file"
    fi
done

