#!/bin/sh
# Baut die Assembler-Fassung nach build/rechentrainer.prg
set -e
cd "$(dirname "$0")"
mkdir -p build
kickass -odir "$PWD/build" -libdir src/asm src/asm/rechentrainer.asm
