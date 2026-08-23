//----------------------------------------------------------------------
// Rechentrainer fuer den C64 — Kick Assembler
// Erster Schritt: Text ausgeben und beenden.
//----------------------------------------------------------------------

.encoding "petscii_upper"

BasicUpstart2(start)

* = $0810 "Hauptprogramm"

start:
    jsr sid_init
    jsr bildschirm_loeschen
    lda #<text                  // Lo-Byte der Textadresse
    ldy #>text                  // Hi-Byte der Textadresse
    jsr text_ausgeben
    lda #100                    // Obergrenze
    jsr zufallszahl
    jsr zahl_ausgeben
ende:
    rts                         // zurueck zum BASIC

.import source "bildschirm.asm"
.import source "zufall.asm"

text:
    .text "RECHENTRAINER"
    .byte 13, 0
