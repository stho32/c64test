# R00001: Startbildschirm für den Rechentrainer

## Beschreibung

Der Rechentrainer bekommt einen Startbildschirm im Textmodus, der vor dem eigentlichen Übungsmodus erscheint. Der Schriftzug "RECHENTRAINER" steht als mehrzeilige Blockschrift oben — zweizeilig gesetzt ("RECHEN" über "TRAINER"), weil einzeilig 13 Buchstaben nicht in 40 Spalten passen. Darunter leuchtet "START" in einem Farbverlauf. Rahmen und Bildschirmhintergrund sind fest schwarz; die einzige Animation ist der Farbverlauf auf "START", der in einer Endlosschleife läuft, bis eine beliebige Taste gedrückt wird. Nach 5 gelösten Aufgaben kehrt der Trainer zum Startbildschirm zurück.

Zahlt ein auf: [Vision](R00000-vision.md) — nächste Lernetappe nach dem BASIC-Grundgeruest, jetzt Bildschirm- und Farb-RAM als neue C64-Technik.

## User Stories

**US1 — Startbildschirm sehen**
Als Spieler will ich beim Programmstart einen animierten Startbildschirm sehen, damit der Rechentrainer wie ein richtiges Computerspiel wirkt.
- Given: Programm wird gestartet (RUN)
- When: der Startbildschirm erscheint
- Then: "RECHENTRAINER" steht als Blockschrift oben, "START" darunter in Farbverlauf, Rahmen und Hintergrund sind schwarz

**US2 — In den Trainer einsteigen**
Als Spieler will ich mit einem beliebigen Tastendruck vom Startbildschirm in den Übungsmodus wechseln, damit ich sofort loslegen kann.
- Given: Startbildschirm läuft in Endlosschleife
- When: eine beliebige Taste wird gedrückt
- Then: der bestehende Rechentrainer-Übungsmodus startet

**US3 — Zurück zum Startbildschirm**
Als Spieler will ich nach 5 gelösten Aufgaben zurück zum Startbildschirm kommen, damit eine Runde einen erkennbaren Anfang und ein Ende hat.
- Given: 5 Aufgaben wurden im Übungsmodus richtig gelöst
- When: die 5. Aufgabe korrekt beantwortet ist
- Then: der Startbildschirm erscheint erneut

## Akzeptanzkriterien

### Darstellung
- [ ] "RECHENTRAINER" erscheint als mehrzeilige Blockschrift, zweizeilig gesetzt ("RECHEN" über "TRAINER")
- [ ] "START" erscheint darunter, gut lesbar abgesetzt vom Titel
- [ ] Rahmen und Bildschirmhintergrund sind fest schwarz
- [ ] Der Titel ist weiß eingefärbt und damit vor dem schwarzen Grund lesbar
- [ ] "START"-Text durchläuft einen sichtbaren, fortlaufenden Farbverlauf

### Interaktion
- [ ] Startbildschirm-Animation läuft in Endlosschleife, bis eine Taste gedrückt wird
- [ ] Beliebiger Tastendruck beendet den Startbildschirm und startet den Übungsmodus
- [ ] Übungsmodus (bestehende Rechenaufgaben-Logik) läuft danach unverändert weiter
- [ ] Ein Tastendruck, der beim Betreten des Startbildschirms noch im Tastaturpuffer steht, beendet ihn nicht sofort
- [ ] Die Aufgabenfolge unterscheidet sich zwischen zwei Programmläufen

### Rückweg
- [ ] Nach 5 korrekt gelösten Aufgaben in Folge kehrt das Programm zum Startbildschirm zurück
- [ ] Der Aufgabenzähler wird beim Rücksprung zum Startbildschirm zurückgesetzt

### Technik
- [ ] Umsetzung in reinem BASIC V2, kein Assembler/SYS
- [ ] Farb- und Rahmen-/Hintergrundsteuerung über `POKE` (Farb-RAM 55296, Rahmen 53280, Hintergrund 53281)
- [ ] Läuft auf echter C64-Hardware (keine undokumentierten Adressen)

## Status

- [ ] Offen

## Technische Details

### Zielverzeichnisse

| Verzeichnis | Zweck |
|---|---|
| `src/basic/` | BASIC-V2-Quelltext des Rechentrainers |

### Zu ändernde Dateien

| Datei | Änderung |
|---|---|
| `src/basic/rechentrainer.bas` | Startbildschirm-Routine (Blockschrift, Farbanimation, Tastaturabfrage) ergänzen; Aufgabenzähler und Rücksprung im bestehenden Übungsmodus-Loop einbauen |

### Vermutete Komponenten

| Komponente | Verantwortung |
|---|---|
| Startbildschirm-Routine | Blockschrift-Ausgabe "RECHENTRAINER" aus `DATA`-Zeichenketten per `PRINT`, Titel-Einfärbung und "START"-Farbverlauf per `POKE` ins Farb-RAM, nicht-blockierende Tastaturabfrage (`GET`) mit vorherigem Leeren des Tastaturpuffers |
| Übungsmodus-Loop (bestehend, erweitert) | Aufgabenzähler mitführen, nach 5 gelösten Aufgaben zurück zur Startbildschirm-Routine springen |

### Tests

| Testdatei | Prüft |
|---|---|
| — | Kein automatisiertes Testframework für BASIC V2 im Projekt vorgesehen; Verifikation manuell im Emulator und auf echter Hardware gemäß Akzeptanzkriterien |

## Abhängigkeiten

- Abhängig von: —
- Blockiert: —

## Notizen

### Verworfene Alternativen

- Normale PETSCII-Großbuchstaben statt Blockschrift — verworfen, zu wenig "Spiele-Titel"-Wirkung
- Eingefärbter Text ohne echten Blockfont — verworfen aus gleichem Grund
- Automatischer Übergang nach Zeit statt Tastendruck — verworfen, aktive Interaktion gewünscht
- SYS-Routine (Assembler) für die Farbanimation — verworfen, bleibt reines BASIC V2 für diese Etappe
- Zyklisch wechselnder Bildschirmhintergrund — **gebaut, im Emulator gesehen und danach verworfen**: fester schwarzer Hintergrund wirkt ruhiger und lässt den Farbverlauf auf "START" besser zur Geltung kommen
- Blockschrift aus `DATA`-Zahlenkolonnen zeichenweise per `POKE` ins Bildschirm-RAM — funktionierte, war aber im Quelltext nicht lesbar; ersetzt durch `DATA`-Zeichenketten mit `PRINT`
- Echter PETSCII-Vollblock `CHR$(160)` als Blockzeichen — verworfen, weil er sich in einer Textquelldatei schlecht eintippen lässt; stattdessen `#`

### Out-of-scope

- Kein Assembler/SYS-Einsatz (bewusst zurückgestellt für spätere Etappe)
- Kein Soundeffekt beim Start
- Kein Pause-/Highscore-/Menü-System — nur Start/Übung/Rückkehr
- Keine Hintergrund-Animation (siehe Verworfene Alternativen)
