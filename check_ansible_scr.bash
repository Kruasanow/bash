#!/bin/bash

echo "Welcome to Ansible-checking script!"
echo "."
echo "."

usern=`whoami`
read -p "Enter a username": a
echo "$usern and $a"

checkpassword()
{

	if [ "$a" == "$usern" ]; then
		echo -n "Good username ..."
	else
		echo "Bad username... try one more time :< "
		exit 0
	fi
}

checkpassword $a
echo "go!"
x=`ls /etc/ansible/roles > ~/list.txt`
cat ~/list.txt

read -p "Enter what a playbook i will show ": p

read -p "Enter what kind of file i will show [1-file; 2-defaults; 3-tasks; 4-handlers]": x

way="/etc/ansible/roles"

case $x in
	1) ls "$way"/"$p"/file;;
	2) ls "$way"/"$p"/defaults;;
	3) ls "$way"/"$p"/tasks;;
	4) ls "$way"/"$p"/handlers;;
	*) echo "this dir is unreachible"
esac

