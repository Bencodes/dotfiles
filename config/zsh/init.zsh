#!/usr/bin/env zsh

source $(dirname ${(%):-%x})/antigen/antigen.zsh
source ~/.config/zsh/theme.zsh

antigen use oh-my-zsh
antigen bundle adb
antigen bundle brew
antigen bundle github
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle Aloxaf/fzf-tab

if [[ is_macos ]]; then 
  antigen bundle osx 
fi

antigen apply
