#!/usr/bin/env bash

set -euo pipefail

project_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly project_dir

# Find Homebrew even before the shell dotfiles have been linked.
if ! command -v brew &> /dev/null; then
  for prefix in /home/linuxbrew/.linuxbrew /opt/homebrew /usr/local; do
    if [[ -x "$prefix/bin/brew" ]]; then
      eval "$("$prefix/bin/brew" shellenv)"
      break
    fi
  done
fi
if ! command -v brew &> /dev/null; then
  echo "Please install homebrew https://brew.sh/"
  exit 1
fi

# Fetch our submodules
git -C "$project_dir" submodule update --init --recursive --quiet

# Install the homebrew dependencies
if [[ $(uname -s) == Darwin ]]; then
  # Preserve the existing best-effort macOS package installation.
  brew bundle --file="$project_dir/Brewfile.brews" || true
  brew bundle --file="$project_dir/Brewfile.casks" || true
else
  brew bundle --file="$project_dir/Brewfile.brews"
fi

# Keep machine-local settings and authentication writes out of linked files.
for auth_file in "$HOME/.gitconfig" "$HOME/.config/gh/hosts.yml" "$HOME/.config/hub"; do
  if [[ -L "$auth_file" ]]; then
    auth_copy=$(mktemp "${auth_file}.XXXXXX")
    cp -L "$auth_file" "$auth_copy"
    chmod 600 "$auth_copy"
    mv -f "$auth_copy" "$auth_file"
  fi
done

# Preserve local credential helpers while loading the shared Git preferences.
if ! git config --file "$HOME/.gitconfig" --get-all include.path | grep -Fxq "$project_dir/config/git/gitconfig"; then
  git config --file "$HOME/.gitconfig" --add include.path "$project_dir/config/git/gitconfig"
fi
chmod 600 "$HOME/.gitconfig"

# Link up the dot files
dotbot -d "$project_dir" \
  -c "$project_dir/install.conf.yaml"
