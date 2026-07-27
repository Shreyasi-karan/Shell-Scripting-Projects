# Variables in Bash

This script demonstrates how to create, use, and make a variable readonly in Bash.

```bash
#!/bin/bash
#assigning variable
name="Shreyasi"
company="CGI"
#calling variable
echo "Name: $name"
echo "Company: $company"

#constant variable
readonly PI=3.14
echo $PI
PI=5
```

## What the script does

- Assigns values to variables named `name` and `company`.
- Prints those variable values using `echo`.
- Creates a constant variable using `readonly`.
- Attempts to change the readonly variable, which will cause an error.

## Example output

```bash
Name: Shreyasi
Company: CGI
3.14
```
