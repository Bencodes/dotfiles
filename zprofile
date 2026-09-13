# Keep login shells usable without loading interactive plugins or GPG setup.
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
if command -v brew >/dev/null; then
  eval "$(brew shellenv)"
else
  for brew_bin in /home/linuxbrew/.linuxbrew/bin/brew /opt/homebrew/bin/brew /usr/local/bin/brew; do
    if [[ -x "$brew_bin" ]]; then
      eval "$("$brew_bin" shellenv)"
      break
    fi
  done
fi
export PATH="$HOME/.local/bin:$HOME/.bin:$PATH"
