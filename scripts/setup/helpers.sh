#!/bin/bash

print_info() {
    set +x
    echo "\n[INFO] $1\n"
    set -x
}

check_status() {
    set +x
    if [[ $? = "0" ]]; then
        echo "SUCCESS!"
    else
        echo "FAILED"
        exit 1
    fi
    set -x
}
