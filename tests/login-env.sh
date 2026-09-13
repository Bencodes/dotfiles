#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
# A headless login must preserve credentials and an existing SSH agent.
HOMEBREW_PREFIX=/tmp/brew SSH_AUTH_SOCK=/tmp/existing-agent HOMEBREW_GITHUB_API_TOKEN=test-token \
  bash -c 'source ./env; [[ $SSH_AUTH_SOCK == /tmp/existing-agent && $HOMEBREW_GITHUB_API_TOKEN == test-token ]]' </dev/null
zsh -n zprofile
! grep -q '~/.config/gh/hosts.yml:' install.conf.yaml
! grep -q '~/.config/hub:' install.conf.yaml
echo 'Login environment checks passed'
