#!/bin/sh

username=$(whoami)

# Ask for the administrator password upfront
sudo -v -p "\
  You're about to change a lot of things on your computer. We're gonna need a password.
  Enter password: "

sudo ./script/bootstrap.sh -u "$username"
