#!/usr/bin/env bash
# shellcheck disable=SC1090

if [[ $OSTYPE == darwin* ]]; then
  export OSX=true
fi

# Homebrew prefix — hardcoded to avoid needing brew on PATH at init time
export HOMEBREW_PREFIX="/opt/homebrew"

source ~/.paths
source ~/.env
source ~/.aliases
source ~/.config/zsh/init.zsh
source ~/.completions

# Optionally load zshlyftrc
if [ -f ~/.zshlyftrc ]; then
  source ~/.zshlyftrc
fi

# Init starship
eval "$(starship init zsh)"
