#!/bin/bash

#check if file exists

dir="/var/log/messages_new"

if [[ -e "$dir" ]]; then
	cd $dir
	echo file exists
	for file in *
	do
		sudo mv "$file" "backups_$(stat -c "%y" $file | cut -d ' ' -f 1)_${file%.*}.${file##*.}"
		echo "$file" "backups_$(stat -c "%y" $file | cut -d ' ' -f 1)_${file%.*}.${file##*.}"
	done

	find . -name "backups_*" | sort | head -n 1 | xargs sudo rm 
else
	echo file not exists
fi

exit 0


