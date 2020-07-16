#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# stop beeping at me, yo
xset -b

# maps Caps Lock to Esc
xmodmap ~/.Xmodmap

# set background
xsetroot -solid "#eee8d5"

# get xresources
xrdb -merge -cpp /usr/bin/cpp ~/.Xresources

# kill the rat
unclutter -noevents -idle 1 &

# set cursor
xsetroot -cursor_name left_ptr

# enable trackpoint vertical scrolling
xinput --set-prop "TPPS/2 ALPS TrackPoint" "Evdev Wheel Emulation" 1
xinput --set-prop "TPPS/2 ALPS TrackPoint" "Evdev Wheel Emulation Button" 2
xinput --set-prop "TPPS/2 ALPS TrackPoint" "Evdev Wheel Emulation Timeout" 200

# enable trackpoint horizontal scrolling
xinput --set-prop "TPPS/2 ALPS TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

# disable touchpad
xinput --set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 0

# set a different accel profile
xinput --set-prop "TPPS/2 ALPS TrackPoint" "Device Accel Profile" 3

# start xscreensaver
xscreensaver -no-splash &

# start our WM
exec spectrwm
