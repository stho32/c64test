#!/bin/sh
# Baut rechentrainer.prg nach build/
set -e
cd "$(dirname "$0")"
mkdir -p build
kickass -odir "$PWD/build" -libdir src src/rechentrainer.asm
