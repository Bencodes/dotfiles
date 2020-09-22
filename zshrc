if [[ $OSTYPE == darwin* ]]; then
  export OSX=true
fi

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi

source "$BASEDIR"/.paths
source "$BASEDIR"/.env
source "$BASEDIR"/.aliases
source "$BASEDIR"/.zshlyftrc
source "$BASEDIR"/.config/zsh/init.zsh

# Init starship
eval "$(starship init zsh)"