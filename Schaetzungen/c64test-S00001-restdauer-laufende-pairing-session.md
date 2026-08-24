---
id: S00001
titel: Restdauer der laufenden Pairing-Session Rechentrainer
repo: c64test
status: Abgeschlossen
datum: 2026-08-24
anfrager: Stefan Hoffmann
bezug:
verwandt: []
---

# S00001 — Restdauer der laufenden Pairing-Session Rechentrainer

Repository: c64test · Datei: c64test-S00001-restdauer-laufende-pairing-session.md

## Anfrage

"Es laeuft gerade eine Pairing-Session, wie lange schaetzt du braucht die noch?"

Gefragt ist die Restarbeit der **laufenden** Etappe, nicht der Aufwand des
Gesamtvorhabens Rechentrainer. Kein Termin, kein Budget, keine Obergrenze genannt.

Stand aus `.claude/pair/rechentrainer.md`: Etappe "Aufgabe stellen und auswerten",
Modus `lernen`. Happen A/B gruen, C bestehend, D gelb (in Arbeit), E/F/G rot.
Codestand `src/basic/rechentrainer.bas`: Zeilen 1000-1050, Auswertung fehlt.

## Umsetzungsoptionen

### Warum hier nur eine Option steht

Mehrere Umsetzungsoptionen entstehen dort, wo **das Ziel selbst noch offen** ist —
typischerweise bei einem fruehen Stand, wenn im Anforderungs-Brainstorming
Richtungen aufkommen, die nicht entschieden werden koennen, weil die Angaben des
Auftraggebers dafuer nicht ausreichen. Dann werden Alternative A, B und C als
unterschiedliche **Loesungswege** gestaltet und jede fuer sich gezaehlt.

Dieser Fall liegt hier nicht vor. Die Etappe laeuft, ihr Fertig-Kriterium ist
schriftlich vereinbart, die Zeilennummern sind reserviert, vier von sieben Happen
sind erledigt. Es gibt genau **ein** Umsetzungsziel und dafuer genau einen
sinnvollen Weg — eine zweite Option waere hier erfunden, nur um die Form zu
erfuellen. Was noch offen ist, betrifft **spaetere** Etappen (siehe
"Nicht Gegenstand dieser Schaetzung") und wird gezaehlt, wenn es entschieden ist.

### Umsetzungsziel: Etappe "Aufgabe stellen und auswerten" abschliessen

Wortlaut des vereinbarten Fertig-Kriteriums aus der Arbeitsdatei:

> Der Rechentrainer stellt eine Multiplikationsaufgabe (1-10), liest die Antwort,
> meldet richtig oder falsch und stellt endlos die naechste Aufgabe.

Konkret liefert die Etappe: die Pruefung der eingegebenen Antwort gegen das
erwartete Produkt, je eine Rueckmeldung fuer richtig und falsch, den Ruecksprung
in die Schleife, den beobachteten Durchlauf im Emulator, den durchgaengigen Weg
vom Quelltext bis zur startenden Diskette und den uebergebenen Arbeitsstand.

Enthalten sind auch die Taetigkeiten, die regelmaessig uebersehen werden, weil sie
keinen Bildschirminhalt erzeugen (Abnahme-Durchlauf, Bau- und Startweg, Nachziehen
der Arbeitsunterlagen, Uebergabe) — sie stehen als eigene Happen im Plan.

| Scheibe | Happen | Ein-/Ausgabetyp | Standard/unklar |
|---|---|---|---|
| Aufgabe auswerten | D Antwort pruefen (Zeile 1060, Verzweigung ohne ELSE) | Antwort+Erwartung → Zweig | unklar (0,25-0,75h) |
| Aufgabe auswerten | E Erfolg melden (ab 1100) | Zweig → Bildschirmtext | Standard (~0,25h) |
| Aufgabe auswerten | F Fehler melden (ab 1150) | Zweig → Bildschirmtext | Standard (~0,25h) |
| Aufgabe stellen | G naechste Aufgabe anstossen (GOTO 1020) | Zweigende → Schleifenstart | Standard (~0,25h) |
| Abnahme | V Durchlauf im Emulator pruefen | PRG → beobachtetes Verhalten | unklar (0,25-0,75h) |
| Abnahme | X Bau und Diskettenstart durchgaengig | Quelle → startende Diskette | Standard (~0,25h) |
| Abnahme | W Arbeitsunterlagen nachziehen | Happen-Status → Dateien | Standard (~0,25h) |
| Abnahme | K Arbeitsstand uebergeben | Arbeitsstand → Versionierung | Standard (~0,25h) |

**8 Happen. 6 Standardmuster (~1,5h), 2 unklar (Bandbreite 0,5-1,5h). Gesamt: 2,0 – 3,0 Stunden.**

Der ueberwiegende Teil der Bandbreite steckt nicht im Tippen der vier fehlenden
Zeilen, sondern in den zwei unklaren Happen. Diese Unsicherheit bleibt sichtbar und
ist nicht in eine glatte Gesamtzahl hineingerechnet.

### Nicht Gegenstand dieser Schaetzung

Die folgenden Punkte sind offene Richtungsentscheidungen des Gesamtvorhabens. Sie
sind **nicht** eingerechnet, weil das Ziel dafuer noch nicht feststeht — genau hier
entstehen spaeter mehrere Alternativen, die einzeln zu zaehlen sind:

- weitere Rechenarten (Addition, Subtraktion, Division) statt nur Multiplikation
- Punktestand, Statistik, Schwierigkeitsstufen, Zeitmessung
- Abfangen von Nicht-Zahl-Eingaben und sonstige Robustheit ueber das Fertig-Kriterium hinaus
- Tonausgabe, Farb- oder Grafikgestaltung
- Portierung der BASIC-Fassung nach Assembler
- Abnahme auf echter Hardware statt im Emulator

Fuer jeden dieser Punkte gilt: eigener Auftrag, eigene Zaehlung. Der geeignete
naechste Schritt dafuer ist `/brainstorming-zu-anforderung`, nicht eine Erweiterung
dieser Schaetzung.

## Vergleich

Ein Optionsvergleich entfaellt, weil nur ein Umsetzungsziel vorliegt (Begruendung
oben). Zur Einordnung der Zahl:

| Bezug | Happen | Stunden-Bandbreite | Anmerkung |
|---|---|---|---|
| Umsetzungsziel: Etappe abschliessen | 8 | 2,0 – 3,0 | Gegenstand dieser Schaetzung |
| davon reine Auswertungslogik (D-G) | 4 | 1,0 – 1,5 | der sichtbare Teil auf dem Bildschirm |
| davon Abnahme und Uebergabe (V, X, W, K) | 4 | 1,0 – 1,5 | wird regelmaessig uebersehen |

## Annahmen und offene Punkte

- Angenommen ist, dass "die Session" die Etappe *Aufgabe stellen und auswerten* meint
  und nicht das Gesamtvorhaben Rechentrainer.
- Kein Termin, kein Budget: die Bandbreite ist reine Arbeitszeit ohne Pausen,
  Wartezeiten und Unterbrechungen.
- Der in der Arbeitsdatei festgehaltene Modus `lernen` (der Entwickler schreibt jede
  Zeile selbst) ist als Rahmenbedingung angenommen, nicht als Wahlmoeglichkeit. Ein
  Moduswechsel wuerde die Zahl senken, aber den vereinbarten Zweck der Session
  aufgeben — das ist eine Entscheidung des Auftraggebers, keine Umsetzungsoption.
- **Unklarer Happen D:** Verzweigung ohne ELSE und Sprungziele sind laut Arbeitsdatei
  offene Wissensluecke. Die Dauer haengt am Verstaendnisschritt, nicht am Tippen.
- **Unklarer Happen V:** die Pruefung im Direktmodus des Emulators wurde noch nie
  selbst durchgefuehrt; die erstmalige Nutzung kostet zusaetzliche Zeit.
- Automatisierte Tests fuer BASIC auf dem C64 gibt es in diesem Vorhaben nicht.
  "Fertig" heisst hier: beobachteter Durchlauf, nicht gruener Testlauf. Eine
  belastbarere Abnahme aendert den Umfang und damit diese Schaetzung.
- Die unklaren Happen sind **nicht** nachrecherchiert worden, um sie doch beziffern
  zu koennen. Das gehoert in die Umsetzung, nicht in die Schaetzung.

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
| Full Kit vor Beginn | #308, #300 | Umgebung, Emulator, Bau- und Startweg, Quelltextstand vollstaendig vorhanden |
| Umfang fest, Aenderung nur per Verfahren | #101, #108 | Alles unter "Nicht Gegenstand" ist ausdruecklich nicht enthalten |
| Fertig-Kriterium mit Ja/Nein pruefbar | #102, #505 | Je Happen eine zustaendige Person und ein pruefbares Ergebnis |
| Zahlen ehrgeizig, nicht abgesichert | #201, #202, #208 | Keine versteckte Sicherheit, kein Puffer enthalten |
| Ungestoerte Arbeitszeit | #407, #302 | Zerstueckelte Zeit vervielfacht dieselben Happen |
| Rangfolge im Konfliktfall geklaert | #109 | Vorher klaeren, was zuerst nachgibt: Umfang, Termin oder Qualitaet |
| Von den Ausfuehrenden getragen | #400, #405 | Gilt erst, wenn die ausfuehrende Person sie fuer erreichbar haelt |

Faellt eine dieser Bedingungen weg, ist die Schaetzung nicht ungenauer, sondern
unbrauchbar — dann wird neu gerechnet statt die Zahl verteidigt oder gestreckt.

## Notizen / Quellen

- Fertig-Kriterium, Happen-Status und Wissensluecken: `.claude/pair/rechentrainer.md`
- Codestand: `src/basic/rechentrainer.bas` (Zeilen 1000-1050)
- Zerlegung nach Skill `work-breakdown-structure`; Stand vom 2026-08-24
- Auftraggeber-Aufbereitung als HTML: `.claude/schaetzungen/S00001.html` (Generat, nicht versioniert)
- Bedingungen: Katalog der 48 Bedingungen ordentlicher Projektplanung
