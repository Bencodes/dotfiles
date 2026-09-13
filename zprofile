# Login shells (including remote Codex) need Homebrew without interactive setup.
for brew_bin in /home/linuxbrew/.linuxbrew/bin/brew /opt/homebrew/bin/brew /usr/local/bin/brew; do
  if [[ -x "$brew_bin" ]]; then
    eval "$("$brew_bin" shellenv)"
    break
  fi
done
export PATH="$HOME/.local/bin:$HOME/.bin:$PATH"
