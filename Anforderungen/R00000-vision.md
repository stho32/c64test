---
id: R00000
titel: Vision — Rechentrainer als Lernvehikel fuer den C64
status: Lebend
angelegt: 2026-08-24
zuletzt-ergaenzt: 2026-08-24
---

# R00000: Vision — Rechentrainer als Lernvehikel fuer den C64

Kein Anforderungsdokument. Beschreibt das Gesamtziel des Vorhabens.
Wird fortgeschrieben, nie abgehakt.

## Kurzfassung

Ziel ist nicht der Rechentrainer, sondern das Programmieren des Commodore 64.
Der Rechentrainer ist das Vehikel: ein Programm, das klein genug ist, um es
jederzeit zu ueberblicken, und offen genug, um an ihm beliebig viel C64-Technik
durchzuspielen. Was es rechnet, darf laecherlich einfach bleiben — gelernt wird
an der Maschine, nicht an der Aufgabe.

## Anlass

BASIC V2 und der C64 sollen wieder in die Finger. Ein Lernprojekt braucht einen
Gegenstand, an dem sich Fortschritt zeigt; ein Rechentrainer ist klein, sofort
lauffaehig und laesst sich in jede Richtung erweitern, ohne dass ein Konzept
umgeworfen werden muss. Ein frueherer Anlauf in 6502-Assembler liegt bereits
unter `src/asm/` und bleibt als Steinbruch nutzbar.

## Zielbild

Das Programm waechst in **kleinen Inkrementen**, jedes davon eine Stufe
Schwierigkeitsgrad hoeher als das vorige. Die Reihenfolge steht nicht fest und
wird sich im Lauf der Zeit aendern — das ist beabsichtigt, nicht ein Mangel an
Planung.

Grobe Richtung:

- **Zuerst BASIC V2** — Sprachumfang auffrischen, ein lauffaehiges Programm auf
  echter Hardware, saubere Struktur trotz Zeilennummern.
- **Dann tiefer** — dort, wo BASIC nicht mehr reicht: Bildschirm- und Farb-RAM,
  KERNAL-Routinen, Timing, spaeter Assembler per `SYS` aus BASIC heraus.
- **Vielleicht irgendwann ganz Assembler**, vielleicht auch eine
  Cross-Compiler-Hochsprache als eigene Lernetappe. Beides ist offen und
  ausdruecklich nicht ausgeschlossen.

Erkennbar gelohnt hat sich das Lernen dann, wenn eine neue C64-Technik nicht
mehr nachgeschlagen, sondern eingesetzt wird.

## Nutzer und Nutzen

Es gibt **keine Zielgruppe**. Nutzer ist der Autor selbst, gemeinsam mit der KI
als Pair-Partner: zusammen durchgehen, verbessern, lernen. Der Nutzen ist der
Lernspass und das wachsende Koennen am C64 — nicht ein Rechentrainer, den
jemand benutzt.

## Leitplanken

| Leitplanke | Warum |
|---|---|
| Lauffaehig auf **echter C64-Hardware** | keine undokumentierten Adressen, keine Emulator-Eigenheiten als Grundlage |
| **Quelltext als Textdatei**, versioniert | nicht im Emulator abgetippt; `petcat -w2` erzeugt das PRG |
| **Kleine Inkremente** | jede Etappe muss fuer sich lauffaehig und ueberblickbar bleiben |
| **Pair-Arbeitsweise** mit der KI | Absicht vor Code, laufende Pruefung statt Review am Ende |
| Der frueherer Assembler-Stand bleibt liegen | Steinbruch fuer `SYS`-Routinen, kein toter Code |

## Ausdruecklich nicht Ziel

- **Kein Lernprodukt fuer Dritte.** Es gibt niemanden, der damit rechnen ueben
  soll; didaktische Qualitaet der Aufgaben ist irrelevant.
- **Keine Portierung** auf moderne Plattformen — das Ziel ist die Maschine, nicht
  das Programm.
- **Keine Abkuerzung, die das Lernen ersetzt.** Werkzeuge sind erlaubt, solange
  sie eine eigene Lernetappe sind und nicht die Beschaeftigung mit dem C64
  umgehen.
- **Kein Feature-Wettlauf.** Ein Inkrement mehr Schwierigkeitsgrad schlaegt ein
  Inkrement mehr Funktion.

## Offene Richtungsfragen

- Welche C64-Technik als naechste Schwierigkeitsstufe drankommt — bleibt bewusst
  offen und wird von Etappe zu Etappe entschieden.
- Ob und wann der Wechsel zu ueberwiegend Assembler stattfindet.
- Ob eine Cross-Compiler-Hochsprache als eigene Etappe dazukommt, und welche.
- Wie weit die Komplexitaet des Rechentrainers selbst wachsen darf, bevor er als
  Vehikel unhandlich wird.

## Ergaenzungshistorie

| Datum | Ergaenzung |
|---|---|
| 2026-08-24 | Vision angelegt (Brainstorming: keine Zielgruppe, C64 lernen als Ziel, kleine Inkremente, Cross-Compiler nicht ausgeschlossen) |
