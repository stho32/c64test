//----------------------------------------------------------------------
// Rechentrainer fuer den C64 — Kick Assembler
// Erster Schritt: Text ausgeben und beenden.
//----------------------------------------------------------------------

.encoding "petscii_upper"

.const CHROUT = $ffd2           // KERNAL: Zeichen aus A ausgeben

BasicUpstart2(start)

* = $0810 "Hauptprogramm"

start:
    ldx #0
schleife:
    lda text,x
    beq ende                    // 0 beendet den Text
    jsr CHROUT
    inx
    bne schleife
ende:
    rts                         // zurueck zum BASIC

text:
    .text "HELLO WORLD"
    .byte 13, 0
