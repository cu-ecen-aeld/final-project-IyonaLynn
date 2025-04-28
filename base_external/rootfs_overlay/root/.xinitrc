#!/bin/sh
# Set DISPLAY and GTK environment variables
export DISPLAY=:0
export GDK_BACKEND=x11  # Force GTK to use X11
# Launch accel_gui
exec /usr/bin/accel_gui
