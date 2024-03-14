#!/bin/bash

# set -x      # to print each command before running it (work as debugging)

pid=$$ #get the script process id PID
monitor_cpu()
{

	#pid=$1   #get script process id PID
	local cpu_utilization

	echo "monitor cpu utilization fro pid : $pid"

	while true;do
		cpu_utilization=$(ps -p $pid -o %cpu | tail -n 1)
		echo "PID $pid : $cpu_utilization"
		sleep 1

	done
}




echo "the script is starting ......"

monitor_cpu &	# call this function in background


echo "hello wolrd2 $1"
for i in $(seq 0 100); do
	echo "hello wolrd"
	sleep 0.5
done

pidstat -d -p $pid          # to get all resources usage i/o from the running scrip by using pid number

kill $! # this means kill the last background process which is here in our case the monitor_cpu function


exit 0
