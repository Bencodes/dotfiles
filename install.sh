#!/bin/bash

set -euo pipefail

project_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly project_dir

# Make sure we have homebrew installed
if ! which brew &> /dev/null; then
  echo "Please install homebrew https://brew.sh/"
  exit 1
fi

# Fetch our submodules
git submodule update --init --recursive --quiet

# Install the homebrew dependencies
brew tap homebrew/bundle
brew bundle --file="$project_dir/Brewfile.taps"
brew bundle --file="$project_dir/Brewfile.brews"
brew bundle --file="$project_dir/Brewfile.casks"

# Update the antigen dependencies
antigen update

# Link up the dot files
"$project_dir/dotbot/bin/dotbot" -d "$project_dir" \
  -c "$project_dir/install.conf.yaml"
