# Pair-Arbeitsdatei: Rechentrainer

Fertig-Kriterium: Rechentrainer stellt eine Multiplikationsaufgabe (1-10),
liest die Antwort, meldet richtig/falsch, stellt endlos die naechste Aufgabe.

Modus: lernen (User schreibt jede Zeile in src/basic/rechentrainer.bas).

WBS-Visualisierung: .claude/pair/wbs-rechentrainer.html (lokal, nicht versioniert)

## Etappe: Aufgabe stellen und auswerten

Status je Happen (siehe WBS-Datei fuer den Graph):

| Happen | Status | Notiz |
|---|---|---|
| A Zufallszahlen ziehen | gruen | Zeilen 1020/1030 |
| B Aufgabe formatieren | gruen | Zeile 1040 |
| C Antwort einlesen | gruen | Zeile 1050, INPUT |
| D Antwort pruefen | gruen | Zeile 1060: `if c=a*b then 1100`, sonst Fallthrough (Retry gleiche Aufgabe) |
| E Erfolg melden | gruen | Zeile 1100/1110/1120 |
| F Fehler melden | gruen | Zeile 1070/1080: Meldung + GOTO 1050 |
| G naechste Aufgabe anstossen | gruen | Zeile 1130: `GOTO 1020` (kein Clear/Titel-Reprint), Endlosschleife bestaetigt |

Zeilennummern-Reservierung: 1060 Pruefung, 1100 Erfolg, 1150 Fehler.

## Wissensluecken-Liste (Skill pair, Abschnitt Wissenstransfer)

Nachgeholt: pha/pla, sbc+Carry, cmp+bcc/bcs, (zp),y — im Assembler-Anlauf.
Offen fuer BASIC: IF/THEN-Sprungziele, kein ELSE, GOTO-Endlosschleife,
Immediate Mode als Testersatz (Konzept vermittelt, noch nicht selbst genutzt).
