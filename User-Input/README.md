# User Input Script

This script demonstrates how to take input from a user in Bash and store it in variables.

```bash
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
```

## What the script does

- Prompts the user to enter their name.
- Stores the entered name in the variable `name`.
- Displays a welcome message using the entered name.
- Prompts for age using `read -p`.
- Accepts a password silently using `read -s`.

## Example behavior

When you run the script, it will ask for input like:

```bash
Enter your name
Shreyasi
Welcome Shreyasi
Enter Age: 25
Password is secret123
```
