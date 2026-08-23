#!/bin/sh
# Packt build/rechentrainer.prg in ein D64-Diskettenabbild fuer echte Hardware
set -e
cd "$(dirname "$0")"
rm -f build/rechentrainer.d64
# -format erwartet "name,id"; der Dateiname auf der Diskette bleibt kurz
c1541 -format "rechentrainer,rt" d64 build/rechentrainer.d64 \
      -attach build/rechentrainer.d64 \
      -write build/rechentrainer.prg rechentrainer >/dev/null
