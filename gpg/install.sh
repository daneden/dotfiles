#!/bin/sh

echo "# Enables GPG to find gpg-agent
use-standard-socket

" > $HOME/.gnupg/gpg-agent.conf

if [ "$(uname)" == "Darwin" ]; then
  echo "# Connects gpg-agent to the OSX keychain via the brew-installed
# pinentry program from GPGtools. This is the OSX 'magic sauce',
# allowing the gpg key's passphrase to be stored in the login
# keychain, enabling automatic key signing.
pinentry-program /usr/local/bin/pinentry-mac" >> $HOME/.gnupg/gpg-agent.conf
fi

echo "use-agent" >> $HOME/.gnupg/gpg.conf
