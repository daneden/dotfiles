#!/bin/sh

if [[ `uname` == "Darwin" ]]; then
  echo 'installing atom plugins'
  apm stars --install || echo 'atom plugin installation failed'
fi

exit 0
