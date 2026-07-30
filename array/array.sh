#!/bin/bash

files=("test.txt" "data.txt" "log.txt" "demo.txt" "notes.txt")

for file in "${files[@]}"
do
    if [ -f "$file" ]; then
        echo "$file exists."
    else
        echo "$file does not exist."
    fi
done
