#!/bin/bash

count=10

while [ $count -ge 1 ]
do
    echo "$count"
    sleep 1
    ((count--))
done

echo "Countdown Complete!"
