# The Brewfile handles Homebrew-based app and library installs, but there may
# still be updates and installables in the Mac App Store. There's a nifty
# command line interface to it that we can use to just install everything, so
# yeah, let's do that.

echo "› sudo softwareupdate -i -a"
sudo -p "\
  Updating OS X and Mac App Store apps may require a password. \
  Enter password: " softwareupdate -i -a

# Brewfile also installs the pinentry app, and we want to tell GPG to use
# that for passphrase entry so we can take advantage of OS X keychain.
echo "pinentry-program /usr/local/bin/pinentry-mac" > $HOME/.gnupg/gpg-agent.conf
