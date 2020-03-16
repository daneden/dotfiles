#!/bin/bash

if hash yadr 2>/dev/null; then
  yadr vim-add-plugin --url https://github.com/w0ng/vim-hybrid
  yadr vim-add-plugin --url https://github.com/tomasiser/vim-code-dark
else
  echo "yav not found, skipping Vim post-install"
fi
