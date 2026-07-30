#!/bin/bash

# Read first number
while true
do
    read -p "Enter the first number: " num1
    if [[ -z "$num1" ]]; then
        echo "First number cannot be empty."
    elif [[ "$num1" =~ ^-?[0-9]+$ ]]; then
        break
    else
        echo "Please enter a valid number."
    fi
done

# Read second number
while true
do
    read -p "Enter the second number: " num2
    if [[ -z "$num2" ]]; then
        echo "Second number cannot be empty."
    elif [[ "$num2" =~ ^-?[0-9]+$ ]]; then
        break
    else
        echo "Please enter a valid number."
    fi
done

# Read third number
while true
do
    read -p "Enter the third number: " num3
    if [[ -z "$num3" ]]; then
        echo "Third number cannot be empty."
    elif [[ "$num3" =~ ^-?[0-9]+$ ]]; then
        break
    else
        echo "Please enter a valid number."
    fi
done

# Compare numbers
if [ "$num1" -eq "$num2" ] && [ "$num2" -eq "$num3" ]; then
    echo "All three numbers are equal."

elif [ "$num1" -eq "$num2" ] && [ "$num1" -gt "$num3" ]; then
    echo " $num2 is the largest."

elif [ "$num1" -eq "$num3" ] && [ "$num1" -gt "$num2" ]; then
    echo "$num3 is the largest."

elif [ "$num2" -eq "$num3" ] && [ "$num2" -gt "$num1" ]; then
    echo "$num2 is the largest."

elif [ "$num1" -gt "$num2" ] && [ "$num1" -gt "$num3" ]; then
    echo "$num1 is the largest."

elif [ "$num2" -gt "$num1" ] && [ "$num2" -gt "$num3" ]; then
    echo "$num2 is the largest."

else
    echo "$num3 is the largest."
fi
