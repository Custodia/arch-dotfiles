setxkbmap fi
xrdb -merge ~/.Xresources
sxhkd &
exec bspwm
