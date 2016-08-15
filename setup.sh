#!/bin/sh

# Install YADR
sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh `"

# Setup gitconfig, customizations, and extensions
./script/bootstrap.sh

# Run package manager installation scripts
./script/install
