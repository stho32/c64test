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
