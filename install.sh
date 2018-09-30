#!/bin/bash

set -e

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Make sure we set up our submodules
git submodule update --init --recursive --quiet

# Install everything
"${BASEDIR}/dotbot/bin/dotbot" -d "${BASEDIR}" -c install.conf.yaml
