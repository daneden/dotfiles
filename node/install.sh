#!/bin/sh
# Install the node packages I want globally

curl -o- -L https://yarnpkg.com/install.sh | bash

npm install -g \
  autoprefixer \
  babel-cli \
  caniuse-cmd \
  coffee-script \
  create-react-app \
  diff-so-fancy \
  gulp-cli \
  gifify \
  jsx \
  n \
  nwb \
  parker \
  postcss-cli \
  react \
  space-hogs \
  tldr \
  vtop \
  yarn \

