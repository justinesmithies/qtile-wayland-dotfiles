#!/bin/sh

# Autostart script for Qtile

cmd_exist() { unalias "$1" >/dev/null 2>&1 ; command -v "$1" >/dev/null 2>&1 ;}
__kill() { kill -9 "$(pidof "$1")" >/dev/null 2>&1 ; }
__start() { sleep 1 && "$@" >/dev/null 2>&1 & }
__running() { pidof "$1" >/dev/null 2>&1 ;}

systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

# Kanshi

if cmd_exist kanshi ; then
    __kill kanshi
    __start kanshi
fi

# wlsunset

if cmd_exist wlsunset ; then
    __kill wlsunset
    __start wlsunset -l 57.4 -L -1.9
fi

# Authentication dialog

if [ -f /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 ]; then
    __kill polkit-gnome-authentication-agent-1
    __start /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
fi

# Notification daemon

if cmd_exist dunst ; then
    __kill dunst
    __start dunst
fi

# Swayidle daemon

if cmd_exist swayidle ; then
    __kill swayidle
    __start swayidle
fi
