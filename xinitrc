#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
xset s off
xset -dpms
xset s noblank
export USER="ubuntu"

#locales
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8


#make Qt use the GTK theme
export QT_STYLE_OVERRIDE="gtk"
export DESKTOP_SESSION="gnome"

#background picture
feh --bg-scale /etc/X11/bg.png
. /etc/X11/Xsession

