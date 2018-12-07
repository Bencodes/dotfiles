#!/usr/bin/env bash

set -e

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Make sure we set up our submodules
git submodule update --init --recursive --quiet

# Install everything
"${BASEDIR}/dotbot/bin/dotbot" -d "${BASEDIR}" -c install.conf.yaml


# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing 'sudo' time stamp until '.osx' has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Setup OSX
./osx

# Homebrew
if ! which brew &> /dev/null; then
  echo "Please install homebrew"
  exit 1
fi
