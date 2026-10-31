#!/bin/bash
CONTAINER="uptime-nginx"
LOGFILE="$HOME/container_monitor.log"
STATEFILE="$HOME/.uptime-nginx-state"
EMAIL="013jaswinder@gmail.com"
if docker ps --filter "name=^${CONTAINER}$" --quiet |  grep -q .; then
   STATUS="UP"
else
   STATUS="DOWN"
fi
echo "$(date): $CONTAINER is $STATUS" >> "$LOGFILE"
PREVIOUS=$(cat "$STATEFILE" 2>/dev/null || echo "UNKNOWN")
if [ "$STATUS" != "$PREVIOUS" ]; then
    if  [ "$STATUS" = "DOWN" ]; then
         printf 'To: %s\nSubject: Docker DOWN Alert\n\nThe container %s is DOWN. Please check Docker.\n' "$EMAIL" "$CONTAINER" | msmtp -a gmail "$EMAIL"
    elif [ "$PREVIOUS" = "DOWN" ]; then
         printf 'To: %s\nSubject: Docker Recovery Alert\n\nThe container %s is UPagain. Service has recovered.\n' "$EMAIL" "$CONTAINER" | msmtp -a gmail "$EMAIL"
    fi
    echo  "$STATUS" > "$STATEFILE"
fi

