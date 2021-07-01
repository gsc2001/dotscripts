#!/bin/bash

print_info() {
    echo "[INFO] $1"
}

check_status() {
    if [[ $? = "0" ]]; then
        echo "SUCCESS!"
    else
        echo "FAILED"
        exit 1
    fi
}
