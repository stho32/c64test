# Ist-Zeiten

Gemessene Dauer abgeschlossener Happen. Grundlage fuer kuenftige Zaehlungen
(`/schaetzung`, Skill `work-breakdown-structure`) statt geliehener Konventionswerte.

`brutto` = Wanduhr zwischen Beginn und Abschluss, **enthaelt Pausen**.
`bestaetigt` = vom User genannte tatsaechliche Arbeitszeit. Nur diese Spalte ist ein Beleg.

| Datum | Aufgabe | Happen | Typ | geschaetzt | brutto | bestaetigt | Modus |
|---|---|---|---|---|---|---|---|
| 2026-08-24 | R00001 Startbildschirm | H1 Blockschrift zeichnen | unklar | 1,5–3h | 0,25h | | lernen → moderat |
| 2026-08-24 | R00001 Startbildschirm | H2 START mit Farbverlauf | unklar | 1,5–3h | 0,11h | | fortschritt |
| 2026-08-24 | R00001 Startbildschirm | H3 Hintergrundfarbe zyklisch | Standard | 0,5h | 0,05h | | fortschritt |
| 2026-08-24 | R00001 Startbildschirm | H4 Endlosschleife / Animationstakt | Standard | 0,5h | 0,02h | | fortschritt |
| 2026-08-24 | R00001 Startbildschirm | H5 Tastaturabfrage GET | Standard | 0,5h | 0,02h | | fortschritt |
| 2026-08-24 | R00001 Startbildschirm | H6 Sprung in Uebungsmodus | Standard | 0,25h | 0,01h | | fortschritt |
| 2026-08-24 | R00001 Startbildschirm | H7 Aufgabenzaehler | Standard | 0,5h | 0,02h | | fortschritt |
| 2026-08-24 | R00001 Startbildschirm | H8 Reset + Ruecksprung | Standard | 0,5h | 0,02h | | fortschritt |
| 2026-08-24 | R00001 Startbildschirm | H9 Abnahme im Emulator | unklar | 0,5–1,5h | 0,1h | | fortschritt |
| 2026-08-24 | R00001 Startbildschirm | H10 Abnahme echte Hardware | unklar | 0,5–1h | n/a | | fortschritt |

## Notizen zu einzelnen Zeilen

- **H1**: Der Weg wurde unterwegs gewechselt. Erst `DATA`-Zahlenkolonnen mit `POKE`
  (funktionierte, war aber im Quelltext unlesbar), dann `DATA`-Zeichenketten mit
  `PRINT`. Der zweite Weg war deutlich schneller als die Zaehlung annahm — die
  Schaetzung ging von zeichenweisem `POKE` ins Bildschirm-RAM aus.
- Der Modus wechselte innerhalb des Happens von `lernen` (User schreibt) zu
  `moderat` (Claude schreibt, auf Zuruf des Users).
- **H3 wurde nach dem Bauen wieder entfernt.** Die Hintergrundanimation lief, der
  User entschied sich dann fuer festes Schwarz. Die Zeit ist trotzdem angefallen und
  steht deshalb in der Tabelle — Aufwand, der in keinem Ergebnis mehr sichtbar ist,
  faellt sonst systematisch aus der Erfahrungsbasis heraus.
- **Spalte `bestaetigt` bleibt in dieser Sitzung durchgehend leer.** Der User hat die
  Nachfrage nach der tatsaechlichen Arbeitszeit ausdruecklich abgelehnt. Die
  Brutto-Werte sind damit nur Obergrenzen und **kein Beleg** — sie enthalten die
  Wartezeit auf Rueckmeldungen zwischen den Etappen.
- Die Brutto-Werte fuer H2 bis H8 sind aus einem gemeinsamen Zeitfenster (20:50–20:57)
  anteilig aufgeteilt, weil die Happen in einem Zug gebaut wurden. Einzeln gemessen
  wurde nur H1.
- **H10 ohne Brutto-Wert:** der Test auf echter Hardware lief ausserhalb dieser
  Sitzung. Ergebnis "erfolgreich" ist belegt, die Dauer nicht — deshalb `n/a` statt
  einer geschaetzten Zahl.
- **Gesamt R00001:** gezaehlt 6,75–11,25h, gemessen rund 0,5h brutto ohne H10. Die
  Zaehlung ging durchgehend von zeichenweisem `POKE` ins Bildschirm-RAM aus; der
  tatsaechliche Weg (`DATA`-Zeichenketten mit `PRINT`) war um ein Vielfaches
  kuerzer. **Lehre fuer kuenftige Zaehlungen:** bei BASIC-Bildschirmausgabe zuerst
  pruefen, ob `PRINT` reicht, bevor ein `POKE`-Happen angesetzt wird.
