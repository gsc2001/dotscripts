#!/bin/bash

print_info "Zsh installed ... Copying config files"

cp ../../../config/zsh/.zshrc ~/.zshrc
cp ../../../config/zsh/.aliases ~/.aliases
cp ../../../config/zsh/.oh-my-zsh ~/.oh-my-zsh -r

print_info "Done Copying ... Testing"

zsh -v

check_status
