#!/usr/bin/env bash

if [[ $OSTYPE == darwin* ]]; then
  export OSX=true
fi

source ~/.paths
source ~/.env
source ~/.aliases
source ~/.config/zsh/init.zsh
source ~/.completions

# Optionally load zshlyftrc
if [ -f ~/.zshlyftrc ]; then
  source ~/.zshlyftrc
fi

# Init starshipz
eval "$(starship init zsh)"

