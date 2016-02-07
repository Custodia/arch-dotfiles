XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_HOME

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd
