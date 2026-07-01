#!/usr/bin/env bash
# shellcheck disable=SC1090

if [[ $OSTYPE == darwin* ]]; then
  export OSX=true
fi

# Find Homebrew before adding its tools to PATH.
if command -v brew >/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  export HOMEBREW_PREFIX
elif [[ $OSTYPE == linux* ]]; then
  export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
elif [[ -x /opt/homebrew/bin/brew ]]; then
  export HOMEBREW_PREFIX="/opt/homebrew"
else
  export HOMEBREW_PREFIX="/usr/local"
fi

source ~/.paths
source ~/.env
source ~/.aliases
source ~/.completions
source ~/.config/zsh/init.zsh

# Optionally load zshlyftrc
if [ -f ~/.zshlyftrc ]; then
  source ~/.zshlyftrc
fi

# Init starship
eval "$(starship init zsh)"
