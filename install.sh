#!/usr/bin/env bash

set -e

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Make sure we have homebrew installed
if ! which brew &> /dev/null; then
  echo "Please install homebrew https://brew.sh/"
  exit 1
fi

# Fetch our submodules
git submodule update --init --recursive --quiet

# Install the dotfiles
"${BASEDIR}/dotbot/bin/dotbot" -d "${BASEDIR}" -c install.conf.yaml

# Install the homebrew dependencies
brew tap homebrew/bundle
brew bundle --file="$BASEDIR"/Brewfile.taps
brew bundle --file="$BASEDIR"/Brewfile.brews
brew bundle --file="$BASEDIR"/Brewfile.casks
