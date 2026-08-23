//----------------------------------------------------------------------
// Bildschirmausgabe ueber die KERNAL-Routine CHROUT.
//----------------------------------------------------------------------

.const CHROUT  = $ffd2          // KERNAL: Zeichen aus A ausgeben
.const CLR     = 147            // PETSCII: Bildschirm loeschen
.const ZIFFER_NULL = 48         // PETSCII: Zeichen '0'
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

//----------------------------------------------------------------------
// Gibt eine Zahl als Dezimalziffern aus, ohne fuehrende Nullen.
// Uebergabe: A = Zahl (0..255).
//
// Der 6502 kann nicht dividieren; Hunderter und Zehner werden deshalb durch
// wiederholtes Abziehen ermittelt. Der Einer bleibt als Rest in A und wird
// waehrend der Ausgabe der vorderen Stellen auf dem Stack geparkt.
//----------------------------------------------------------------------
zahl_ausgeben:
    ldx #0                      // X zaehlt die Hunderter
zahl_ausgeben_hunderter:
    cmp #100
    bcc zahl_ausgeben_zehner_start
    sbc #100
    inx
    jmp zahl_ausgeben_hunderter
zahl_ausgeben_zehner_start:
    ldy #0                      // Y zaehlt die Zehner
zahl_ausgeben_zehner:
    cmp #10
    bcc zahl_ausgeben_stellen
    sbc #10
    iny
    jmp zahl_ausgeben_zehner
zahl_ausgeben_stellen:
    pha                         // Einer aufheben
    cpx #0
    beq zahl_ausgeben_ohne_hunderter
    txa
    jsr ziffer_ausgeben
zahl_ausgeben_ohne_hunderter:
    cpx #0                      // Zehner nur weglassen, wenn auch die
    bne zahl_ausgeben_zehnerstelle
    cpy #0                      // Hunderterstelle leer geblieben ist
    beq zahl_ausgeben_einer
zahl_ausgeben_zehnerstelle:
    tya
    jsr ziffer_ausgeben
zahl_ausgeben_einer:
    pla
    jsr ziffer_ausgeben
    rts

//----------------------------------------------------------------------
// Gibt eine einzelne Ziffer aus. Uebergabe: A = Wert (0..9).
//----------------------------------------------------------------------
ziffer_ausgeben:
    clc
    adc #ZIFFER_NULL
    jsr CHROUT
    rts
