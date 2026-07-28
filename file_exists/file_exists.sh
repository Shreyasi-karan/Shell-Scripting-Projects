#!/bin/bash
if [ $# -eq 0 ];
then
	echo "please pass a file"
elif [ -e "$1" ];
then
	if [ -d "$1" ];
	then
		echo "$1 is a directory"
	elif [ -f "$1" ];
	then
		echo "$1 is a regular file"
	else
		echo "$1 is not a regular file or directory"
	fi
else
	echo "$1 doesno't exists"
fi
