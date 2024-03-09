#!/bin/bash

#count warnings,errors,events from syslog file


errors=$(sudo awk 'tolower($0) ~ /error/{count++} END{print "errors counter = ", (count?count:0)}' /var/log/installer/syslog   )

echo $errors >> output_analysis.txt

warnings=$(sudo awk 'tolower($0) ~ /warning/{count++} END {print "warnings counter = ", (count?count:0)}' /var/log/installer/syslog )

echo $warnings >> output_analysis.txt

events=$(sudo awk 'tolower($0) ~ /event/{count++} END {print "events counter = ", (count?count:0)}' /var/log/installer/syslog )

echo $events >> output_analysis.txt



exit 0 
