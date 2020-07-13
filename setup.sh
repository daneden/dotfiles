#!/bin/sh

# Set up color escape codes
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[1;33m'
export NC='\033[0m' # No Color

export WAITING="${YELLOW}○ ${NC}"
export DONE="${GREEN}✓ ${NC}"

# Setup gitconfig, customizations, and extensions
echo "${WAITING}Bootstrapping... (copying dotfiles and creating directories)";
./script/bootstrap.sh
echo "${DONE}Done bootstrapping\n";

# Run package manager installation scripts
./script/install
