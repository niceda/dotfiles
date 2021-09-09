export EDITOR="lvim"
export TERMINAL="st"
export BROWSER="google-chrome-stable"

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# [ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc ] && shortcuts >/dev/null 2>&1 &

# if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#   exec startx
# fi
