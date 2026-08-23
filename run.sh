#!/bin/sh
# Baut und startet den Rechentrainer in VICE
#
# x64sc wird mit bereinigter Umgebung gestartet: wird dieses Skript aus einem
# Snap heraus aufgerufen (z.B. VS-Code-Terminal), zeigt XDG_DATA_HOME in den
# Snap-Home — VICE findet seine ROMs dann nicht — und Snap-Bibliothekspfade
# brechen den Linker. Durchgereicht wird nur, was der Emulator wirklich braucht:
# HOME und XDG_DATA_HOME fuer die ROMs, DISPLAY/XAUTHORITY fuer das Fenster,
# XDG_RUNTIME_DIR fuer den PulseAudio-Socket.
set -e
./build.sh
env -i \
    HOME="$HOME" \
    PATH=/usr/bin:/bin \
    DISPLAY="$DISPLAY" \
    XAUTHORITY="${XAUTHORITY:-$HOME/.Xauthority}" \
    XDG_RUNTIME_DIR="$XDG_RUNTIME_DIR" \
    XDG_DATA_HOME="$HOME/.local/share" \
    x64sc -autostart build/rechentrainer.d64
