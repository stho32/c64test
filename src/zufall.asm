//----------------------------------------------------------------------
// Zufallszahlen ueber den Rauschgenerator von SID-Stimme 3.
//----------------------------------------------------------------------

.const SID_FREQ_HI  = $d40f     // SID Stimme 3: Frequenz High-Byte
.const SID_FREQ_LO  = $d40e     // SID Stimme 3: Frequenz Low-Byte
.const SID_CTRL     = $d412     // SID Stimme 3: Steuerregister
.const SID_RANDOM   = $d41b     // SID Stimme 3: Oszillator-Ausgabe, liefert Rauschen
.const ZP_GRENZE = $fd          // zufallszahl: Obergrenze
.const ZP_WURF   = $fe          // zufallszahl: gezogenes Rohbyte

//----------------------------------------------------------------------
// Schaltet SID-Stimme 3 auf Rauschen, damit SID_RANDOM Zufallsbytes liefert.
// Einmalig beim Programmstart aufzurufen.
//----------------------------------------------------------------------
sid_init:
    lda #$ff
    sta SID_FREQ_LO
    sta SID_FREQ_HI
    lda #$80                    // Rauschgenerator einschalten
    sta SID_CTRL
    rts

//----------------------------------------------------------------------
// Liefert eine Zufallszahl zwischen 1 und der Obergrenze.
// Uebergabe: A = Obergrenze (1..255). Rueckgabe: A = Zahl (1..Obergrenze).
//
// Statt Modulo wird skaliert: ergebnis = (rohbyte * grenze) / 256. Das kostet
// immer genau acht Schleifendurchlaeufe — anders als Verwerfen-und-neu-ziehen
// ist die Laufzeit damit konstant. Der Preis ist eine leichte Schieflage
// (256 ist kein Vielfaches der Grenze), die sich ueber den ganzen Wertebereich
// verteilt statt sich an einem Ende zu haeufen.
//----------------------------------------------------------------------
zufallszahl:
    sta ZP_GRENZE
    lda SID_RANDOM
    sta ZP_WURF
    lda #0                      // A sammelt das High-Byte des Produkts
    ldx #8
zufallszahl_schleife:
    lsr ZP_WURF                 // niedrigstes Bit des Rohbytes ins Carry
    bcc zufallszahl_kein_bit
    clc
    adc ZP_GRENZE               // Bit gesetzt: Grenze aufaddieren
zufallszahl_kein_bit:
    ror                         // Zwischenstand samt Uebertrag nach rechts
    dex
    bne zufallszahl_schleife
    clc
    adc #1                      // 0..grenze-1 wird zu 1..grenze
    rts
