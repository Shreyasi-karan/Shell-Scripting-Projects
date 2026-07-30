#!/bin/bash

for file in *.txt
do
    if [ -f "$file" ]; then
        lines=$(wc -l < "$file")
        echo "$file : $lines lines"
    fi
done
