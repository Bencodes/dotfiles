# Dotfiles

## Ubuntu / Debian

Install the system prerequisites, then install Homebrew as your normal user:

```sh
sudo apt-get update
sudo apt-get install -y build-essential procps curl file git ca-certificates
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export XDG_CONFIG_HOME="$HOME/.config"
brew trust mongodb/brew keith/formulae
git clone https://github.com/Bencodes/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
exec zsh
```

Homebrew manages the CLI tools, including zsh and Java 21. Its supported Linux
prefix is `/home/linuxbrew/.linuxbrew`; see the
[Homebrew Linux instructions](https://docs.brew.sh/Homebrew-on-Linux).
The installer can also find an existing Homebrew installation on `PATH`.
The trust command allows Homebrew to load the third-party MongoDB and git-pile
taps already used by this repository.

To make zsh your login shell:

```sh
command -v zsh | sudo tee -a /etc/shells
chsh -s "$(command -v zsh)"
```

Log out and back in after changing your login shell. Shell plugins are downloaded
on the first zsh startup. Install `xdg-utils` with apt if you want the `o` alias on
a desktop, and install Android SDK tools separately under `~/Android/Sdk`.

Linux skips macOS casks, the macOS Alacritty configuration, and legacy entries
for aws-okta, Codex, Cursor CLI, and smali that no longer have Homebrew formulae.
Install those tools separately if needed. GPG uses Homebrew's terminal pinentry;
tmux copies to its buffer (desktop clipboard integration is handled by tmux-yank).

## macOS

Install [Homebrew](https://brew.sh), then run `./install.sh`. Both the CLI Brewfile
and the cask Brewfile are installed. Some legacy package names may need updating
for a fresh install.
