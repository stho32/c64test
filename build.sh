#!/bin/sh
# Baut die BASIC-Fassung nach build/rechentrainer.prg
set -e
cd "$(dirname "$0")"
mkdir -p build
# -w2 = BASIC V2, wie es der C64 spricht
petcat -w2 -o build/rechentrainer.prg -- src/basic/rechentrainer.bas
