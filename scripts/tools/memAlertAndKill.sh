#!/usr/bin/bash

LOG_FILE='/home/gurkirat/script_logs/memlogs'
while true; do
    MEM_ROW=$(free | grep Mem)
    MEM_USED=$(echo $MEM_ROW | awk '{ print $3 }')
    MEM_TOTAL=$(echo $MEM_ROW | awk '{ print $2 }')
    MEM_USED1=$(($MEM_USED * 100))
    MEM_PER=$(echo $MEM_USED1 / $MEM_TOTAL | bc)
    DATE=$(date)

    if [ "$MEM_PER" -gt "85" ]; then
        heavy_process=$(ps aux --sort=-%mem | head -n 2 | tail -n 1)
        hp_command=$(echo $heavy_process | awk '{ print $11 }')
        hp_pid=$(echo $heavy_process | awk '{ print $2 }')
        hp_mem=$(echo $heavy_process | awk '{ print $4 }')
        notify-send -u critical "Mem usage high" "$hp_command is taking $hp_mem memory. It will be killed if total memusage is greater than 95%" && paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
        int_hp_mem=$(echo $hp_mem | awk '{ print int($1 + 0.5) }')

        if [ "$MEM_PER" -gt "95" ]; then
            msg="$DATE:: [MEMORY_HIGH_PROCESS_KILL] Killed $hp_command with PID $hp_pid"
            kill -9 $hp_pid
            echo msg >>$LOG_FILE
        fi

    fi

    sleep 420
done
