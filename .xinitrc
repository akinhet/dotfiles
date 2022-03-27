#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#export QT_STYLE_OVERRIDE="adwaita"
export QT_QPA_PLATFORMTHEME="qt5ct"

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --output DP-2 --auto --mode 1920x1080 --primary --rate 75
xrandr --output DP-4 --auto --mode 1920x1080 --right-of DP-2 --rate 75

xset +fp /usr/share/fonts/TTF &
xset fp rehash &

setxkbmap pl

#nitrogen --restore &
#picom -b --experimental-backends &
#/home/akinhet/.statusbar &
/home/akinhet/git/small-scripts/notifications.sh &
pulseaudio-equalizer enable &
lxqt-policykit-agent &

(sleep 2 && discord) &
(sleep 2 && steam) &
(sleep 2 && firefox) &

#eval $(gnome-keyring-daemon --start)
#export SSH_AUTH_SOCK

export TERMINAL="st"

exec dwm
