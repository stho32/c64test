# Rechentrainer fuer den Commodore 64

Ein Rechentrainer, der auf einem echten C64 laufen soll — und ein Lernprojekt
obendrein.

## Ausrichtung

**Gearbeitet wird in Commodore BASIC V2.** Das Ziel ist zuerst, BASIC wieder
aufzufrischen; die Tiefe von Hardware und KERNAL kommt spaeter, dort wo BASIC
nicht mehr reicht.

Ein frueherer Anlauf in 6502-Assembler liegt unter [src/asm/](src/asm/). Er ist
lauffaehig und bleibt liegen: einzelne Routinen lassen sich spaeter per `SYS`
aus BASIC heraus aufrufen, wenn eine Stelle zu langsam wird. Das ist der
klassische Weg auf dem C64 — BASIC als Geruest, Maschinensprache dort, wo sie
sich lohnt.

## Aufbau

```
src/basic/      BASIC-Quellen (.bas, als Text mit Zeilennummern)
src/asm/        frueherer Assembler-Stand, per SYS nachnutzbar
build/          erzeugte PRG-Dateien (nicht versioniert)
build.sh        baut die BASIC-Fassung mit petcat
build-asm.sh    baut die Assembler-Fassung mit Kick Assembler
mache-d64.sh    packt das PRG in ein Diskettenabbild
run.sh          baut und startet das Ergebnis in VICE
```

## Werkzeuge

| Werkzeug | Wofuer |
|---|---|
| `petcat` (Teil von VICE) | wandelt BASIC-Text in ein startfaehiges PRG |
| `x64sc` (VICE) | Emulator zum Ausprobieren |
| `c1541` (Teil von VICE) | packt das PRG in ein D64-Diskettenabbild |
| `kickass` | Kick Assembler, nur fuer `src/asm/` |

BASIC wird als gewoehnliche Textdatei geschrieben und versioniert — nicht im
Emulator abgetippt. `petcat -w2` erzeugt daraus das PRG.

Jeder Build legt zusaetzlich ein D64 an. VICE startet daraus, damit der Weg
derselbe ist wie auf echter Hardware: Diskette einlegen, Programm laden.

## Bauen und starten

```sh
./run.sh          # baut und startet in VICE
./build.sh        # nur bauen
```
