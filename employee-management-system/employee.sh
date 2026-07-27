#!/bin/bash
source config.conf

mkdir -p logs
mkdir -p backup

touch "$DATABASE"
touch "$USERDATABASE"
touch "$LOGFILE"

log_action() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') : $1" >> "$LOGFILE"
}


while true
do
	echo "Employee Management System"
	echo "1. Add Employee"
	echo "2. Display Employees"
	echo "3. Search Employee"
	echo "4. Employee Count"
	echo "5. Edit Employee"
	echo "6. Delete Employee"
	echo "7. Sort Employee"
	echo "8. Backup Database"
	echo "9. Restore Database"
	echo "10. Exit"

	read -p "Enter your choice: " choice

	case $choice in

		1)
			echo "Add Employee"

			while true
			do
				read -p "Enter Employee ID: " id

				if [ -z "$id" ]
				then
					echo "Employee ID cannot be empty."
				else
					break
				fi
			done

			if grep -q "^$id|" "$DATABASE"
			then
				echo "Employee ID already exists."
			else


				while true
				do
					read -p "Enter Name: " name

					if [ -z "$name" ]
					then
						echo "Name cannot be empty. Please enter again."
					else
						break
					fi
				done

				while true
				do
					read -p "Enter Department: " dept

					if [ -z "$dept" ]
					then
						echo "Department cannot be empty."
					else
						break
					fi
				done


				while true
				do
					read -p "Enter Salary: " salary

					if [[ "$salary" =~ ^[0-9]+$ ]]
					then
						break
					else
						echo "Salary should contain numbers only."
					fi
				done

				echo "$id|$name|$dept|$salary" >> $DATABASE

			echo "Employee Added Successfully."
			log_action "Employee Added : $id"
			fi
			;;

		2)
			echo "Employee Records"

			if [ -s $DATABASE ]
			then
				printf "%-10s %-20s %-20s %-10s\n" "ID" "NAME" "DEPARTMENT" "SALARY"
				while IFS="|" read id name dept salary
				do
					printf "%-10s %-20s %-20s %-10s\n" "$id" "$name" "$dept" "$salary"
				done < $DATABASE
			else
				echo "No records found."
			fi
			;;

		3)
			read -p "Enter Employee ID: " id

			if grep -q "^$id|" $DATABASE
			then
				record=$(grep "^$id|" $DATABASE)
				IFS="|" read id name dept salary <<< "$record"
				echo "Employee Found"
				echo "ID         : $id"
				echo "Name       : $name"
				echo "Department : $dept"
				echo "Salary     : $salary"

			else
				echo "Employee not found."
			fi
			;;

		4)
			echo "Total Employees"
			count=$(wc -l < $DATABASE)
			echo "$count"
			;;

		5)
			read -p "Enter Employee ID to Edit: " id
			if grep -q "^$id|" $DATABASE
			then
				read -p "Enter New Name: " name
				read -p "Enter New Department: " dept
				read -p "Enter New Salary: " salary
				sed -i "s/^$id|.*/$id|$name|$dept|$salary/" $DATABASE
				echo "Employee Updated Successfully."
				log_action "Employee Updated : $id"
			else
				echo "Employee Not Found."
			fi

			;;

		6)
			read -p "Enter Employee ID: " id
			if grep -q "^$id|" $DATABASE
			then
				grep -v "^$id|" $DATABASE > temp.db
				mv temp.db $DATABASE
				echo "Employee Deleted Successfully"
				log_action "Employee Deleted : $id"
			else
				echo "Employee Not Found."
			fi
			;;

		7)
			sort $DATABASE > temp.db

			mv temp.db $DATABASE
			cat $DATABASE
			;;

		8)
			cp "$DATABASE" "$BACKUPDIR/"
			echo "Backup Created Successfully."
			log_action "Backup Created"

			;;

		9)
			cp "$BACKUPDIR/employees.db" "$DATABASE"
			echo "Database Restored."
			log_action "Database Restored"
			;;


		10)
			echo "Thank You!"
			break
			;;

		*)
			echo "Invalid Choice"
			;;

	esac

done
