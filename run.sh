#!/bin/sh
# Baut und startet den Rechentrainer in VICE
set -e
./build.sh
x64sc -autostart build/rechentrainer.prg
