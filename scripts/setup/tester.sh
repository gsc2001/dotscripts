#!/bin/bash -x

# test node
print_info "Starting Tests ..."

print_info "Testing node"
node -v
check_status

print_info "Testing npm"
npm -v
check_status

print_info "Testing virtual env wrapper by creating a virtual env general"

mkvirtualenv general

check_status
