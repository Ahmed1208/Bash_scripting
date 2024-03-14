#!/bin/bash


#define usage meassage
usage()
{
	echo "usage $0 -a <backup_location> -b <log_criteria> -c <report_format> [-f <config_file>]"
	echo "options"
	echo " -a <backup_location> required argument 1"
	echo " -b <log_criteria> required argument 2"
	echo " -c <report_format> required argumet 3"
	echo " -f <file> optional config file to get the data"
exit 1
}

check_input()
{
	if [ -z $backup_location ] || [ -z $log_criteria ] || [ -z $report_format ] ; then
		echo "you must enter first 3 args"
		usage
	fi
}

#inti variables
backup_location=
log_criteria=
report_format=
file=


#parse options
while getopts ":a:b:c:f:" opt; do
	case $opt in
		a) backup_location="$OPTARG" ;;
		b) log_criteria="$OPTARG" ;;
		c) report_format="$OPTARG" ;;
		f) file="$OPTARG" ;;
		\?) usage ;;
	esac
done

#check for required args
if [ -n "$file" ] ;then
	echo "i will read from the config file directly"
	source $file
	backup_location=$backup_location_
	log_criteria=$log_criteria_
	report_format=$report_format_
	check_input
else
	check_input
	
fi

#process argument
echo "backup_location : $backup_location"
echo "log_criteria : $log_criteria"
echo "report_format : $report_format"
echo "file : $file"








