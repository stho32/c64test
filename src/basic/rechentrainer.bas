100 restore
110 rem schwarzer rand und schwarzer hintergrund, fest
120 poke 53280, 0
130 poke 53281, 0
140 print chr$(147);
150 print
160 for i = 1 to 11
170 read a$
180 print a$
190 next i
200 rem titel weiss faerben
210 for i = 40 to 479
220 poke 55296+i, 1
230 next i
240 print
250 print
260 print "                 start"
270 rem 55873 = farb-ram der ersten start-zelle (zeile 14, spalte 17)
275 rem tastaturpuffer leeren: sonst reisst ein rest-tastendruck aus dem
276 rem uebungsmodus den startbildschirm sofort wieder weg
277 get k$
278 if k$ <> "" then 277
280 p = 0
290 rem farbverlauf: jede der 5 zellen bekommt eine um p verschobene helle farbe
300 for i = 0 to 4
310 c = i + p
320 if c > 7 then c = c - 8
330 poke 55873+i, c+8
340 next i
350 get k$
360 if k$ = "" then 370
362 rem zufallsfolge mit der wartezeit bis zum tastendruck saeen -
364 rem ti ist beim autostart immer aehnlich, der tastendruck nicht
366 x = rnd(-ti)
368 goto 1000
370 for d = 1 to 60
380 next d
390 p = p + 1
400 if p > 7 then p = 0
410 goto 300
500 rem anfuehrungszeichen noetig: sonst frisst basic die fuehrenden leerzeichen
510 data "        ### ### ### # # ### # #"
520 data "        # # #   #   # # #   ###"
530 data "        ### ### #   ### ### ###"
540 data "        ##  #   #   # # #   # #"
550 data "        # # ### ### # # ### # #"
560 data ""
570 data "      ### ### ### ### # # ### ###"
580 data "       #  # # # #  #  ### #   # #"
590 data "       #  ### ###  #  ### ### ###"
600 data "       #  ##  # #  #  # # #   ## "
610 data "       #  # # # # ### # # ### # #"
1000 print chr$(147);
1005 z = 0
1010 print "rechentrainer"
1020 a=int(rnd(1)*10)+1
1030 b=int(rnd(1)*10)+1
1040 print a;"*";b;"=";
1050 input c
1060 if c=a*b then 1100
1070 print "leider nein. versuche es erneut."
1080 goto 1050
1100 print "yess! genau das ist es. toll gemacht."
1105 z = z + 1
1107 rem nach 5 richtigen zurueck zum startbildschirm
1108 if z = 5 then goto 100
1110 print ""
1120 print "... und eine neue aufgabe:"
1130 goto 1020
