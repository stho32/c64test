//----------------------------------------------------------------------
// Bildschirmausgabe ueber die KERNAL-Routine CHROUT.
//----------------------------------------------------------------------

.const CHROUT  = $ffd2          // KERNAL: Zeichen aus A ausgeben
.const CLR     = 147            // PETSCII: Bildschirm loeschen
.const ZP_TEXT = $fb            // Zeiger auf den auszugebenden Text ($fb/$fc)

//----------------------------------------------------------------------
// Loescht den Bildschirm und setzt den Cursor nach oben links.
//----------------------------------------------------------------------
bildschirm_loeschen:
    lda #CLR
    jsr CHROUT
    rts

//----------------------------------------------------------------------
// Gibt einen nullterminierten Text aus.
// Uebergabe: A = Lo-Byte, Y = Hi-Byte der Textadresse. Max. 255 Zeichen.
//----------------------------------------------------------------------
text_ausgeben:
    sta ZP_TEXT
    sty ZP_TEXT + 1
    ldy #0
text_ausgeben_schleife:
    lda (ZP_TEXT),y             // Byte an (Zeiger + Y) holen
    beq text_ausgeben_ende      // 0 beendet den Text
    jsr CHROUT
    iny
    bne text_ausgeben_schleife
text_ausgeben_ende:
    rts
