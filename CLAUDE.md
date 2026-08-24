# c64test — Projektkonventionen

Rechentrainer fuer den C64. Zielplattform ist **echte Hardware**, nicht nur der
Emulator — keine undokumentierten Adressen.

## Sprache und Stack

- BASIC V2 ist die Standardsprache (`src/basic/`). Assembler (`src/asm/`) nur, wo
  BASIC nachweislich nicht reicht — Entscheidung wird vorher besprochen.
- Gebaut wird mit `./build.sh` (petcat → PRG → D64), gestartet mit `./run.sh` (VICE).

## BASIC-V2-Fallstricke

Diese drei haben in R00001 jeweils Zeit gekostet. Sie gelten fuer jede Aenderung an
`src/basic/*.bas`:

### Zeilennummern muessen in der Datei aufsteigend stehen

`petcat` uebernimmt die Reihenfolge der Quelldatei und **sortiert nicht**. Eine Zeile
`999 end` vor den `data`-Zeilen 200-310 erzeugt ein Programm, das nicht korrekt
laeuft. Nach jeder Umnummerierung pruefen:

```sh
awk '{n=$1+0; if(n<=p){print "FEHLER bei Zeile", n} p=n}' src/basic/rechentrainer.bas
```

### `RND` liefert ohne Seed bei jedem Lauf dieselbe Folge

`RND(1)` gibt die naechste Zahl einer festen Folge; der Startwert ist nach jedem
Reset gleich. `RND(-TI)` beim Programmstart hilft nicht — `TI` ist beim Autostart von
Diskette jedes Mal aehnlich. Gesaet wird deshalb **im Moment einer Benutzeraktion**
(in R00001: der Tastendruck auf dem Startbildschirm), weil erst deren Zeitpunkt
wirklich variiert.

### `get` liest Reste aus dem Tastaturpuffer

Beim Sprung von einem Programmteil in einen anderen kann noch ein Tastendruck im
Puffer stehen und die neue `get`-Schleife sofort wieder verlassen. Vor einer
Warteschleife den Puffer leerlesen:

```basic
277 get k$
278 if k$ <> "" then 277
```

### `data` mit fuehrenden Leerzeichen braucht Anfuehrungszeichen

Ohne Quotes schneidet BASIC fuehrende und nachfolgende Leerzeichen ab — bei
Blockgrafik verrutscht damit die ganze Zeile.

## Farb- und Bildschirmspeicher

| Adresse | Bedeutung |
|---|---|
| 1024 | Bildschirm-RAM, Zelle = `1024 + reihe*40 + spalte` |
| 55296 | Farb-RAM, gleiche Zellenrechnung |
| 53280 | Rahmenfarbe |
| 53281 | Hintergrundfarbe |

Bildschirmcodes sind **nicht** PETSCII-Codes — eigene Tabelle (C64 Programmer's
Reference Guide, Appendix "Screen Display Codes").

## Abnahme

Es gibt **kein** automatisiertes Testframework fuer BASIC V2 in diesem Projekt.
"Fertig" heisst: beobachteter Durchlauf im Emulator gegen jedes Akzeptanzkriterium
einzeln, danach Verifikation auf echter Hardware.
