#!/usr/bin/env zsh

export ANTIGEN_CACHE=false

# Antigen path when using Homebrew:
source $(brew --prefix)/share/antigen/antigen.zsh

autoload -U compinit
compinit

source ~/.config/zsh/theme.zsh

# History settings
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Save x items to the given history file
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=$HOME/.zsh_history

# Dir settings
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_TO_HOME
setopt PUSHD_MINUS
setopt PUSHD_SILENT
setopt CDABLE_VARS
DIRSTACKSIZE=20

# Warn before quitting
setopt CHECK_JOBS

# Use vim shortcuts within the terminal (defaults to insert mode)
bindkey -v

antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle github
antigen bundle brew
antigen bundle command-not-found
antigen bundle macos
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply
