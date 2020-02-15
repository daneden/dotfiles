#!/bin/bash

if hash rvm 2>/dev/null; then
  yav --url https://github.com/w0ng/vim-hybrid
  yav --url https://github.com/tomasiser/vim-code-dark
else
  echo "yav not found, skipping Vim post-install"
fi