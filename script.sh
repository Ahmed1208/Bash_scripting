#!/bin/bash

if [ -e "/var/log/messages" ]; then

	echo "start running the script"

	sudo cp /var/log/messages /var/log/messages.old

	sudo truncate -s 0 /var/log/messages

	echo "done"
else
	echo "/var/log/messages doesn't exists"
fi

exit 0
