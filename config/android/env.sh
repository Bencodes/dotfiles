#!/usr/bin/env bash

# Share the same SDK between Android Studio, Bazel, and command-line tools.
if [[ -z ${ANDROID_HOME:-} ]]; then
  if [[ $OSTYPE == darwin* ]]; then
    export ANDROID_HOME="${ANDROID_SDK_ROOT:-$HOME/Library/Android/sdk}"
  else
    export ANDROID_HOME="${ANDROID_SDK_ROOT:-$HOME/Android/Sdk}"
  fi
fi
# Legacy tools still read this variable; keep it consistent with ANDROID_HOME.
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"

# NDK versions belong to individual projects. Only advertise one when selected.
if [[ -n ${ANDROID_NDK_VERSION:-} ]]; then
  export ANDROID_NDK_HOME="$ANDROID_HOME/ndk/$ANDROID_NDK_VERSION"
  export ANDROID_NDK="$ANDROID_NDK_HOME"
fi
