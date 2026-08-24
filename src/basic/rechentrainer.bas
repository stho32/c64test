100 print chr$(147);
110 print
120 for i = 1 to 11
130 read a$
140 print a$
150 next i
160 restore
170 end
200 rem anfuehrungszeichen noetig: sonst frisst basic die fuehrenden leerzeichen
210 data "        ### ### ### # # ### # #"
220 data "        # # #   #   # # #   ###"
230 data "        ### ### #   ### ### ###"
240 data "        ##  #   #   # # #   # #"
250 data "        # # ### ### # # ### # #"
260 data ""
270 data "      ### ### ### ### # # ### ###"
280 data "       #  # # # #  #  ### #   # #"
290 data "       #  ### ###  #  ### ### ###"
300 data "       #  ##  # #  #  # # #   ## "
310 data "       #  # # # # ### # # ### # #"
1000 print chr$(147);
1010 print "rechentrainer"
1020 a=int(rnd(1)*10)+1
1030 b=int(rnd(1)*10)+1
1040 print a;"*";b;"=";
1050 input c
1060 if c=a*b then 1100
1070 print "leider nein. versuche es erneut."
1080 goto 1050
1100 print "yess! genau das ist es. toll gemacht."
1110 print ""
1120 print "... und eine neue aufgabe:"
1130 goto 1020
