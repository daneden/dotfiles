#!/usr/bin/env bash

if [[ `uname` == "Darwin" ]]; then
  echo 'installing atom plugins'
  apm stars --install
fi
