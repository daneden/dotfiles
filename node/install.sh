#!/bin/sh
# Install the node packages I want globally

curl -o- -L https://yarnpkg.com/install.sh | bash

yarn global add \
  babel-cli \
  create-react-app \
  n \
  now \
  typescript \
  vtop \
