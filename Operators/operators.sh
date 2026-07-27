#!/bin/bash

# -----------------------------
# Operators with if-elif-else
# -----------------------------

echo "===== Employee Salary Calculator ====="

# Taking input
read -p "Enter Employee Name: " name
read -p "Enter Basic Salary: " salary
read -p "Enter Years of Experience: " exp

echo ""
echo "----- Arithmetic Operations -----"

# Arithmetic Operators
bonus=$((salary * 10 / 100))
tax=$((salary * 5 / 100))
final_salary=$((salary + bonus - tax))

echo "Basic Salary : $salary"
echo "Bonus (10%)  : $bonus"
echo "Tax (5%)     : $tax"
echo "Final Salary : $final_salary"

echo ""
echo "----- Performance Evaluation -----"

# if-elif-else using comparison operators

if [ $exp -ge 10 ]; then
    grade="A"
    echo "$name is a Senior Employee."
elif [ $exp -ge 5 ]; then
    grade="B"
    echo "$name is a Mid-Level Employee."
else
    grade="C"
    echo "$name is a Junior Employee."
fi

echo "Performance Grade: $grade"

echo ""
echo "----- Bonus Eligibility -----"

# Logical Operators

if [ $salary -ge 50000 ] && [ $exp -ge 5 ]; then
    echo "Eligible for Special Bonus."
elif [ $salary -lt 50000 ] || [ $exp -lt 5 ]; then
    echo "Not Eligible for Special Bonus."
fi

echo ""
echo "----- Comparison Operators Demo -----"
if [ $salary -eq 50000 ]; then
    echo "Salary is exactly 50000."
fi

if [ $salary -ne 50000 ]; then
    echo "Salary is not 50000."
fi

if [ $salary -gt 50000 ]; then
    echo "Salary is greater than 50000."
fi

if [ $salary -lt 50000 ]; then
    echo "Salary is less than 50000."
fi

if [ $salary -ge 50000 ]; then
    echo "Salary is greater than or equal to 50000."
fi

if [ $salary -le 50000 ]; then
    echo "Salary is less than or equal to 50000."
fi

echo ""
echo "----- NOT Operator Demo -----"

if ! [ $salary -lt 10000 ]; then
    echo "Salary is NOT less than 10000."
fi

echo ""
echo "Program Completed Successfully."