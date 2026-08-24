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
| C Antwort einlesen | bestehend | Zeile 1050, INPUT |
| D Antwort pruefen | gelb | Zeile 1060 in Arbeit: `if c=a*b then 1100` |
| E Erfolg melden | rot | ab Zeile 1100 |
| F Fehler melden | rot | ab Zeile 1150 |
| G naechste Aufgabe anstossen | rot | GOTO zurueck in die Schleife |

Zeilennummern-Reservierung: 1060 Pruefung, 1100 Erfolg, 1150 Fehler.

## Wissensluecken-Liste (Skill pair, Abschnitt Wissenstransfer)

Nachgeholt: pha/pla, sbc+Carry, cmp+bcc/bcs, (zp),y — im Assembler-Anlauf.
Offen fuer BASIC: IF/THEN-Sprungziele, kein ELSE, GOTO-Endlosschleife,
Immediate Mode als Testersatz (Konzept vermittelt, noch nicht selbst genutzt).
