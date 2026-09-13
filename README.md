# Dotfiles

## Ubuntu / Debian

Install the system prerequisites, then install Homebrew as your normal user:

```sh
sudo apt-get update
sudo apt-get install -y build-essential procps curl file git ca-certificates
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export XDG_CONFIG_HOME="$HOME/.config"
brew trust keith/formulae
git clone https://github.com/Bencodes/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
exec zsh
```

Homebrew manages the CLI tools, including zsh, Java 21, and the Codex CLI cask.
The shared CLI Brewfile installs Codex on both macOS and Linux. Homebrew's supported
Linux prefix is `/home/linuxbrew/.linuxbrew`; see the
[Homebrew Linux instructions](https://docs.brew.sh/Homebrew-on-Linux).
The installer can also find an existing Homebrew installation on `PATH`.
The trust command allows Homebrew to load the third-party git-pile tap already
used by this repository.

To make zsh your login shell:

```sh
command -v zsh | sudo tee -a /etc/shells
chsh -s "$(command -v zsh)"
```

Log out and back in after changing your login shell. Shell plugins are downloaded
on the first zsh startup. Install `xdg-utils` with apt if you want the `o` alias on
a desktop, and install Android SDK tools separately under `~/Android/Sdk`.

Noninteractive login shells (`zsh -lc`) load Homebrew and user CLI paths without
starting shell plugins or GPG. Existing SSH agents and environment-provided
Homebrew tokens are preserved; the token placeholder remains the default.

Authenticate GitHub CLI with `gh auth login`. GitHub CLI and Hub authentication
files stay local instead of being linked into this repository. On reinstall,
existing auth symlinks are replaced with private local copies. `~/.gitconfig` also
stays local and includes the shared Git settings, preserving credential helpers
created by `gh auth setup-git`.

Linux skips macOS casks, the macOS Alacritty configuration, and legacy entries
for Cursor CLI and smali that no longer have Homebrew formulae.
MongoDB database tools are also skipped because that tap ships macOS binaries.
Install those tools separately if needed. GPG uses Homebrew's terminal pinentry;
tmux copies to its buffer (desktop clipboard integration is handled by tmux-yank).

## macOS

Install [Homebrew](https://brew.sh), then run `./install.sh`. Both the CLI Brewfile
and the cask Brewfile are installed. Some legacy package names may need updating
for a fresh install.
