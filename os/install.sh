#!/bin/sh

# OS-specific updates and software management
if [ "`uname`" == "Darwin" ]; then
  echo "› sudo softwareupdate -i -a"
  sudo -p "\
  Updating OS X and Mac App Store apps may require a password. \
  Enter password: " softwareupdate -i -a

  source ./clean-mail.sh
  source ./set-defaults.sh

  # Brewfile also installs the pinentry app, and we want to tell GPG to use
  # that for passphrase entry so we can take advantage of OS X keychain.
  echo "pinentry-program /usr/local/bin/pinentry-mac" > $HOME/.gnupg/gpg-agent.conf

  curl -fsSL https://raw.githubusercontent.com/supermarin/Alcatraz/deploy/Scripts/install.sh | sh
elif [ "`uname`" == "Linux" ]; then
  # Linux/Ubuntu specific management in here
  exit
fi
