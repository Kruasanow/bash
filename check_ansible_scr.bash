#!/bin/bash

echo "Welcome to Ansible-checking script!"
echo "."
echo "."

usern=`whoami`
read -p "Enter a username": a

checkpassword()
{

	if [ "$a" == "$usern" ]; then
		echo "Good username ..."
	else
		echo "Bad username... try one more time :< "
		exit 0
	fi
}

checkpassword $a
read -p "Input ur ROLE's dir /etc/ansible/": z

x=`ls /etc/ansible/$z > ~/list.txt`
cat -n ~/list.txt

read -p "Enter what a playbook i will show ": np

p1=`cat ~/list.txt | head -n$np | tail -n1`
p=`cat -n ~/list.txt | grep -E $np`
rm ~/list.txt

read -p "Enter what kind of file i will show [1-file; 2-defaults; 3-tasks; 4-handlers]": x

way="/etc/ansible/roles"

case $x in
	1) ls "$way"/"$p1"/files;;
	2) ls "$way"/"$p1"/defaults;;
	3) ls "$way"/"$p1"/tasks;;
	4) ls "$way"/"$p1"/handlers;;
	*) echo "this dir is unreachible"
esac

