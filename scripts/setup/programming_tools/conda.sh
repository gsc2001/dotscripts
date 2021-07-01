#!/bin/bash -x

print_info "Installing Miniconda ..."

bash ../../../external/Miniconda3-latest-Linux-x86_64.sh

print_info "Installation Done ... Testing"

conda -v

check_status
