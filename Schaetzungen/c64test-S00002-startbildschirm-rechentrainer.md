---
id: S00002
titel: Startbildschirm fuer den Rechentrainer (R00001)
repo: c64test
status: Abgeschlossen
datum: 2026-08-24
anfrager: Stefan Hoffmann
bezug: R00001
verwandt: [S00001]
---

# S00002 — Startbildschirm fuer den Rechentrainer (R00001)

Repository: c64test · Datei: c64test-S00002-startbildschirm-rechentrainer.md

## Anfrage

"Wie viel Aufwand steckt in R00001?" — reine Aufwandsfrage, kein Budget, keine
Deadline genannt. Zweck und Anlass sind aus der Anforderung selbst ableitbar:
naechste Lernetappe des Rechentrainers nach dem BASIC-Grundgeruest, jetzt
Bildschirm- und Farb-RAM als neue C64-Technik (siehe [R00001](../Anforderungen/R00001-startbildschirm-rechentrainer.md)).

## Umsetzungsoptionen

### Warum hier nur eine Option steht

R00001 liegt als fertige Anforderung mit ausformulierten Akzeptanzkriterien vor.
Das Ziel ist nicht offen — es gibt keine Richtungsentscheidung, die noch durch
Alternativen zu klaeren waere. Eine zweite Option waere hier erfunden, nur um die
Form zu erfuellen.

### Umsetzungsziel: R00001 vollstaendig umsetzen

Wortlaut aus der Anforderung: Startbildschirm im Textmodus mit "RECHENTRAINER" als
mehrzeiliger PETSCII-Blockschrift, "START" darunter mit Farbverlauf, gleichmaessig
wechselnder Bildschirmhintergrund, Endlosschleife bis Tastendruck, danach
Uebungsmodus; nach 5 geloesten Aufgaben Ruecksprung zum Startbildschirm.

Konkret liefert diese Zaehlung: die Startbildschirm-Routine (Blockschrift,
Farbverlauf, Hintergrundanimation, Tastaturabfrage), den Aufgabenzaehler samt
Ruecksprung im bestehenden Uebungsmodus-Loop, sowie die Abnahme im Emulator und auf
echter Hardware gemaess Akzeptanzkriterien.

| Scheibe | Happen | Ein-/Ausgabetyp | Standard/unklar |
|---|---|---|---|
| Startbildschirm anzeigen | H1 Blockschrift "RECHENTRAINER" zeichnen | Text/Font-Layout → Bildschirm-RAM | unklar (1,5-3h) |
| Startbildschirm anzeigen | H2 "START" mit Farbverlauf darstellen | Farbfolge → Farb-RAM zyklisch | unklar (1,5-3h) |
| Startbildschirm anzeigen | H3 Hintergrundfarbe zyklisch wechseln | Frame-Zaehler → $D021 | Standard (~0,5h) |
| Startbildschirm anzeigen | H4 Endlosschleife/Animationstakt | Schleifenkoerper → Fortschritt H2/H3 | Standard (~0,5h) |
| In Uebungsmodus wechseln | H5 nicht-blockierende Tastaturabfrage (GET) | Tastaturpuffer → Boolean | Standard (~0,5h) |
| In Uebungsmodus wechseln | H6 Sprung zur bestehenden Uebungsmodus-Zeile | Trigger → GOTO | Standard (~0,25h) |
| Zurueck zum Startbildschirm | H7 Aufgabenzaehler mitfuehren | Ergebnis korrekt → Zaehler+1 | Standard (~0,5h) |
| Zurueck zum Startbildschirm | H8 bei Zaehler=5: reset + Sprung zum Startbildschirm | Zaehlerstand → GOTO+Reset | Standard (~0,5h) |
| Abnahme | H9 Durchlauf im Emulator pruefen (alle Akzeptanzkriterien) | PRG → beobachtetes Verhalten | unklar (0,5-1,5h) |
| Abnahme | H10 Verifikation auf echter Hardware, Adressen gegen Referenz pruefen | PRG → beobachtetes Verhalten am Geraet | unklar (0,5-1h) |

**10 Happen. 6 Standardmuster (zusammen ~2,75h), 4 unklar (Bandbreite 4,0-8,5h).
Gesamt: 6,75 – 11,25 Stunden.**

Der groesste Teil der Unsicherheit steckt in H1 und H2 — beides ist fuer dieses
Projekt neue Technik (PETSCII-Blockschrift-Layout, Farb-RAM-Adressierung fuer
zyklische Verlaeufe), waehrend Zaehler, Sprungziele und Tastaturabfrage bekannte
BASIC-V2-Muster sind.

### Nicht Gegenstand dieser Schaetzung

- Assembler-/SYS-Umsetzung der Animation — laut Anforderung bewusst fuer eine
  spaetere Etappe zurueckgestellt
- Soundeffekte, Pause-/Highscore-/Menue-System — laut Anforderung explizit
  ausgeschlossen
- weitere Rechenarten, Schwierigkeitsstufen, Punktestand — nicht Teil von R00001
- Aufbau eines automatisierten Testframeworks fuer BASIC V2 — existiert im Projekt
  nicht und ist nicht Gegenstand dieser Anforderung

Fuer jeden dieser Punkte gilt: eigener Auftrag, eigene Zaehlung — der geeignete
naechste Schritt waere `/brainstorming-zu-anforderung`.

## Vergleich

Ein Optionsvergleich entfaellt (Begruendung oben). Zur Einordnung der Zahl:

| Bezug | Happen | Stunden-Bandbreite | Anmerkung |
|---|---|---|---|
| Umsetzungsziel: R00001 vollstaendig | 10 | 6,75 – 11,25 | Gegenstand dieser Schaetzung |
| davon Startbildschirm-Darstellung (H1-H4) | 4 | 4,0 – 7,0 | neue Technik, groesster Unsicherheitsanteil |
| davon Uebergaenge/Zaehler (H5-H8) | 4 | 1,75 – 1,75 | bekannte BASIC-V2-Muster |
| davon Abnahme (H9-H10) | 2 | 1,0 – 2,5 | Emulator + echte Hardware |

## Annahmen und offene Punkte

- **Arbeitsweise, belegt:** die abgeschlossene `/pair`-Sitzung zum Rechentrainer lief
  im Modus `lernen` — "User schreibt jede Zeile in src/basic/rechentrainer.bas"
  (`.claude/pair/rechentrainer.md`, Commit `6eb6b13`, Datei inzwischen entfernt).
  Ob die naechste Etappe ebenso laeuft, ist nicht vereinbart worden.
- **Vermutung (nicht belegt):** wird wieder im Modus `lernen` gearbeitet, duerfte die
  tatsaechliche Dauer ueber dieser Zahl liegen, weil Wissenstransfer Zeit kostet, die
  in den Happen nicht steckt. Um wie viel, ist offen — dafuer gibt es keinen
  Messwert. Die Arbeitsweise ist eine Rahmenbedingung, keine Umsetzungsoption.
- **H1 (Blockschrift zeichnen), belegt:** `src/basic/rechentrainer.bas` enthaelt
  in Zeile 1000-1130 keinen einzigen `POKE` und keinen Zugriff auf den
  Bildschirmspeicher; die Anforderung verlangt ihn ausdruecklich
  ([R00001](../Anforderungen/R00001-startbildschirm-rechentrainer.md),
  Akzeptanzkriterium "Umsetzung in reinem BASIC V2 mit POKE auf Bildschirm-/Farb-RAM").
  Die Technik ist in diesem Projekt also noch nie verwendet worden.
- **H2 (Farbverlauf ueber Farb-RAM), belegt:** dieselbe Lage wie H1 — kein
  Farb-RAM-Zugriff im vorhandenen Quelltext; zusaetzlich verlangt R00001, dass der
  Verlauf **unabhaengig vom Hintergrund** laeuft, also zwei Farbquellen
  gleichzeitig bedient werden.
- **H9 (Abnahme im Emulator), belegt:** im Repository existiert kein Testframework
  und kein automatisierter Testlauf fuer BASIC V2 — die Abnahme ist ein beobachteter
  Durchlauf gegen jedes Akzeptanzkriterium einzeln.
- **H10 (Verifikation auf echter Hardware), nicht bekannt:** R00001 verlangt den
  Nachweis auf echter Hardware; welcher Uebertragungsweg dorthin zur Verfuegung
  steht (Floppy, Kabel, SD2IEC), ist **dem Ersteller dieser Schaetzung nicht
  bekannt**. Ueber den Projektzustand ist damit nichts gesagt — steht der Weg
  bereits fest, schrumpft dieser Anteil.
- **Vermutung (nicht belegt):** bei H1 und H2 duerfte der Entwurfsschritt — Layout
  der Blockschrift, Wahl der Farbfolge — mehr Zeit kosten als das Schreiben der
  `POKE`-Befehle. Dafuer gibt es in diesem Projekt keinen Erfahrungswert; die
  Bandbreite ist entsprechend weit gehalten.
- **Besetzung:** gerechnet ist fuer dieselbe Besetzung und Arbeitsweise wie bisher
  (Pair-Arbeit am vorhandenen Quelltextstand). Erfahrung, Tempo und Verfuegbarkeit
  der ausfuehrenden Personen sind **nicht bewertet worden** — dazu liegen keine
  Belege vor. Bei anderer Besetzung gilt diese Zahl nicht — dann muss spezifischer
  neu gerechnet werden.
- **Stunden je Happen, ungemessen:** die angesetzten Zeiten — auch die der sechs
  Standardmuster — sind ein Konventionswert aus dem Skill
  `work-breakdown-structure`, **kein Erfahrungswert dieses Projekts**. Gemessene
  Ist-Zeiten liegen nicht vor (`Schaetzungen/_ist-zeiten.md` existiert noch nicht);
  der scheinbar sichere Teil der Zahl ist damit genauso ungeprueft wie die
  Bandbreite, er sieht nur praeziser aus.
- Die unklaren Happen sind nicht nachrecherchiert worden, um sie doch beziffern zu
  koennen — das gehoert in die Umsetzung, nicht in die Schaetzung.

## Bedingungen, unter denen diese Schaetzung gilt

**Eine Schaetzung ist keine Garantie.** Die tatsaechliche Arbeitszeit kann geringer
UND hoeher ausfallen. Die Bandbreite gilt nur, solange die Arbeit geschuetzt und
kontrolliert ablaeuft. Nummern verweisen auf den Katalog der 48 Bedingungen
ordentlicher Projektplanung (`commands/projekt/bedingungen.md`).

| Bedingung | Nr. | Kern |
|---|---|---|
| Keine parallele Arbeit | #200, #204, #301 | Stunden gelten fuer Arbeit an einer Sache; Wechselkosten sind nicht eingerechnet |
| Benannter Ansprechpartner mit Mandat | #103, #107 | Eine Person, namentlich, darf ueber Umfang und Abweichung entscheiden |
| Rueckmeldungen zuegig | #309, #303 | Wartezeit auf Antworten ist nicht enthalten und schlaegt 1:1 durch |
| Full Kit vor Beginn | #308, #300 | Umgebung, Emulator, Uebertragungsweg zur echten Hardware, Quelltextstand vollstaendig vorhanden |
| Umfang fest, Aenderung nur per Verfahren | #101, #108 | Alles unter "Nicht Gegenstand" ist ausdruecklich nicht enthalten |
| Fertig-Kriterium mit Ja/Nein pruefbar | #102, #505 | Je Happen eine zustaendige Person und ein pruefbares Ergebnis |
| Zahlen ehrgeizig, nicht abgesichert | #201, #202, #208 | Keine versteckte Sicherheit, kein Puffer enthalten |
| Ungestoerte Arbeitszeit | #407, #302 | Zerstueckelte Zeit vervielfacht dieselben Happen |
| Rangfolge im Konfliktfall geklaert | #109 | Vorher klaeren, was zuerst nachgibt: Umfang, Termin oder Qualitaet |
| Von den Ausfuehrenden getragen | #400, #405 | Gilt erst, wenn die ausfuehrende Person sie fuer erreichbar haelt |

Faellt eine dieser Bedingungen weg, ist die Schaetzung nicht ungenauer, sondern
unbrauchbar — dann wird neu gerechnet statt die Zahl verteidigt oder gestreckt.

## Notizen / Quellen

- Anforderung und Akzeptanzkriterien: [R00001](../Anforderungen/R00001-startbildschirm-rechentrainer.md)
- Codestand: `src/basic/rechentrainer.bas` (Zeilen 1000-1130, Uebungsmodus besteht bereits)
- Zerlegung nach Skill `work-breakdown-structure`; Stand vom 2026-08-24
- Auftraggeber-Aufbereitung als HTML: `.claude/schaetzungen/c64test-S00002-startbildschirm-rechentrainer.html` (Generat, nicht versioniert)
- Bedingungen: Katalog der 48 Bedingungen ordentlicher Projektplanung
