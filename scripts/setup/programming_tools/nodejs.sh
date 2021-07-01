#!/bin/bash

print_info "Starting nodejs installation"

print_info "Installing nvm ..."

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | zsh

print_info "nvm installation done ..."

print_info "Installing node and npm"

nvm install --lts
nvm use --lts

print_info "node and npm installation done ... Testing"
