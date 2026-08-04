#!/bin/bash

count_files() {
    dir=$1
    find "$dir" -type f | wc -l
}

read -p "Enter directory path: " path

echo "Total files: $(count_files "$path")"
