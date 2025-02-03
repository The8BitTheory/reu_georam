#RetroDevStudio.MetaData.BASIC:7169,BASIC V7.0,uppercase,10,10
3 LA=1:BR=1024:CP=55296
5 AN=1000

10 S=TI:PRINT"";
20 POKE53280,5:POKE53281,5
30 PRINT"                                      ";
40 PRINT" THE 8 BIT THEORY                     ";
50 PRINT"                                    ";
60 PRINT"                                   ";
70 PRINT"                                  ";
80 PRINT"                               ";
90 PRINT"                                ";
100 PRINT"                              ";
110 PRINT"                                ";
120 PRINT"                   ";
130 PRINT"                     ";
140 PRINT"                     ";
150 PRINT"                    ";
160 PRINT"                    ";
170 PRINT"                    ";
180 PRINT"                     ";
190 PRINT"                       ";
200 PRINT"                       ";
210 PRINT"                           ";
220 PRINT"                               ";
230 PRINT"                                 ";
240 PRINT"                                   ";
250 PRINT"                                     ";
260 PRINT"                                      ";
270 PRINT""TI-S

# STORE SCREEN IN REU
280 BANK 0:STASH AN,BR,0,0
290 BANK 15:STASH AN,CP,AN,0

310 GETI$:IFI$=""THEN310
320 PRINT "PRESS KEY"
330 GET I$:IFI$=""THEN330
340 S=TI:GOSUB 440:PRINT ""TI-S:GOTO 310
350 END

# FROM REU TO SCREEN
440 BANK15:FETCH AN,CP,AN,0
450 BANK 0:FETCH AN,BR,0,0

490 RETURN
