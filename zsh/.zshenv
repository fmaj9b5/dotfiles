LOCAL_ZSHENV="$HOME/.zshenv-local"

# Source machine-dependent configuration if any
test -e "$LOCAL_ZSHENV" && source "$LOCAL_ZSHENV"

export PATH=$HOME/bin:/usr/lib/smlnj/bin:$HOME/.stack/programs/x86_64-linux/ghc-nopie-8.0.2/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export VIMB_USER_AGENT="Mozilla/5.0 (X11; Linux x86_64; rv:50.0) Gecko/50.0 Firefox/50.0"
