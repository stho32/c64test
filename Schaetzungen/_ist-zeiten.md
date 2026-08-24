# Ist-Zeiten

Gemessene Dauer abgeschlossener Happen. Grundlage fuer kuenftige Zaehlungen
(`/schaetzung`, Skill `work-breakdown-structure`) statt geliehener Konventionswerte.

`brutto` = Wanduhr zwischen Beginn und Abschluss, **enthaelt Pausen**.
`bestaetigt` = vom User genannte tatsaechliche Arbeitszeit. Nur diese Spalte ist ein Beleg.

| Datum | Aufgabe | Happen | Typ | geschaetzt | brutto | bestaetigt | Modus |
|---|---|---|---|---|---|---|---|
| 2026-08-24 | R00001 Startbildschirm | H1 Blockschrift zeichnen | unklar | 1,5–3h | 0,25h | | lernen → moderat |

## Notizen zu einzelnen Zeilen

- **H1**: Der Weg wurde unterwegs gewechselt. Erst `DATA`-Zahlenkolonnen mit `POKE`
  (funktionierte, war aber im Quelltext unlesbar), dann `DATA`-Zeichenketten mit
  `PRINT`. Der zweite Weg war deutlich schneller als die Zaehlung annahm — die
  Schaetzung ging von zeichenweisem `POKE` ins Bildschirm-RAM aus.
- Der Modus wechselte innerhalb des Happens von `lernen` (User schreibt) zu
  `moderat` (Claude schreibt, auf Zuruf des Users).
