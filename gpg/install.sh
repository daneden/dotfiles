#!/bin/sh

if [ "$(uname)" == "Darwin" ]; then
  echo "# Connects gpg-agent to the OSX keychain via the brew-installed
# pinentry program from GPGtools. This is the OSX 'magic sauce',
# allowing the gpg key's passphrase to be stored in the login
# keychain, enabling automatic key signing.
pinentry-program /usr/local/bin/pinentry-mac" > $HOME/.gnupg/gpg-agent.conf
fi

if [ tail -1 $HOME/.gnupg/gpg.conf != "use-agent" ]; then
  echo "use-agent" >> $HOME/.gnupg/gpg.conf
fi
