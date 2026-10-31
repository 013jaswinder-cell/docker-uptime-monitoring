#!/bin/bash
THRESHOLD=80
EMAIL="013jaswinder@gmail.com"
LOGFILE="$HOME/cpu_monitor.log"
CPU=$(top -bn1 | awk -F'[, ]+' '/Cpu\(s\)/ {for(i=1;i<=NF;i++) if($i=="id") print 100-$(i-1)}')
if awk "BEGIN {exit !($CPU >= $THRESHOLD)}"; then
   echo "$(date): ALERT - CPU usage is ${CPU}%" >> "$LOGFILE"
   printf 'To: %s\nSubject: CPU Usage Alert\n\nCPU usuage is %s%% threshold on %s.\n' "$EMAIL" "$CPU" "$THRESHOLD" "$(hostname)" | msmtp -a gmail "$EMAIL"
else 
   echo "$(date): CPU usage is ${CPU}%" >> "$LOGFILE"
fi
