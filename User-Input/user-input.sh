#!/bin/bash
#print the line
echo "Enter your name"
#read the input from user and store it in variable name
read name
#print the name entered by user
echo "Welcome $name"
#print the age entered by user in variable age in one line
read -p "Enter Age: " age
#print the password entered by user
read -s password
echo "Password is $password"