#!/bin/bash

if [ -e "/var/log/messages" ]; then

	echo "start running the script"

	sudo cp /var/log/messages /var/log/messages.old

	sudo truncate -s 0 /var/log/messages

	echo "done"
else
	echo "/var/log/messages doesn't exists"
fi

echo what is your name
read name
echo your name is $name

echo what is your age
read age
[[ "$age" =~ ^[0-9]+$ ]] || echo invalid age 


echo what is your country
read country
echo $country


exit 0
