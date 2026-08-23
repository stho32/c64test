#!/bin/sh
# Baut rechentrainer.prg nach build/
set -e
mkdir -p build
kickass -odir build rechentrainer.asm
