# Dotfiles

## Ubuntu / Debian

Install the system prerequisites, then install Homebrew as your normal user:

```sh
sudo apt-get update
sudo apt-get install -y build-essential procps curl file git ca-certificates
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export XDG_CONFIG_HOME="$HOME/.config"
git clone https://github.com/Bencodes/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
exec zsh
```

Homebrew manages the CLI tools, including zsh, Java 21, and the Codex CLI cask.
The shared CLI Brewfile installs Codex on both macOS and Linux. Homebrew's supported
Linux prefix is `/home/linuxbrew/.linuxbrew`; see the
[Homebrew Linux instructions](https://docs.brew.sh/Homebrew-on-Linux).
The installer can also find an existing Homebrew installation on `PATH`.
Trusted third-party formulae are declared with `trusted: true` in `Brewfile.brews`.
Homebrew provisions that trust before installing them: git-pile on both platforms
and MongoDB database tools on macOS. Add the same option to a fully qualified
formula or cask entry to trust another package without trusting its entire tap.

To make zsh your login shell:

```sh
command -v zsh | sudo tee -a /etc/shells
chsh -s "$(command -v zsh)"
```

Log out and back in after changing your login shell. Shell plugins are downloaded
on the first zsh startup. Install `xdg-utils` with apt if you want the `o` alias on
a desktop. To provision the Android SDK, see below.

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

## Android SDK

After installing the dotfiles, run `install-android-sdk` and accept Google's
license prompts. Homebrew supplies `android-commandlinetools` on Linux and macOS;
the helper also installs that cask if it is missing. SDK packages are installed
with Google's `sdkmanager` into `~/Android/Sdk` on Linux or
`~/Library/Android/sdk` on macOS, matching Android Studio's defaults.

The default packages are platform-tools (`adb`, `fastboot`), API 36, build-tools
36.0.0, and API 36 sources. Installing command-line tools alone does not install
API platforms, which causes Bazel's "No Android SDK apis found" error.
Re-running the helper is safe; existing SDK packages are retained.

Pass explicit package IDs to install project-specific versions instead:

```sh
install-android-sdk 'platforms;android-35' 'build-tools;35.0.0' 'ndk;27.2.12479018'
```

Set `ANDROID_HOME` before shell startup to use another SDK directory. Both login
and interactive shells expose the SDK variables and platform-tools on `PATH`.
NDKs are optional and installed side by side; set `ANDROID_NDK_VERSION` to expose
the selected version through `ANDROID_NDK_HOME` and `ANDROID_NDK` for older tools.
The helper requires Java; the dotfiles already install Java 21.

References: [Homebrew cask](https://formulae.brew.sh/cask/android-commandlinetools),
[SDK package manager](https://developer.android.com/tools/sdkmanager).
