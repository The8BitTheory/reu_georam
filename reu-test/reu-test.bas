#RetroDevStudio.MetaData.BASIC:2049,BASIC V2,uppercase,10,10
3 MP=57088:GB=57343:GP=57342:LA=1:BR=1024:B2=1024:CP=55296:C2=CP-32768
4 DEFFNLB(X2)=X2AND255:DEFFNHB(X2)=INT(X2/256)

5 AN=1000


10 S=TI:PRINT"";
20 POKE53280,5:POKE53281,5
30 PRINT"                                      ";
40 PRINT"    THE 8 BIT THEORY                  ";
50 PRINT"                                    ";
60 PRINT"                                   ";
70 PRINT"                                  ";
80 PRINT"                               ";
90 PRINT"                                ";
100 PRINT"                              ";
110 PRINT"                               ";
120 PRINT"                    ";
130 PRINT"                     ";
140 PRINT"                      ";
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

# REU STASH SCREEN
280 POKEMP+2,FN LB(B2):POKEMP+3,FN HB(B2)
282 POKEMP+4,0:POKEMP+5,0
284 POKEMP+6,0
286 POKEMP+7,FN LB(AN):POKEMP+8,FN HB(AN)
288 POKEMP+1,144

# REU STASH COLOR
290 POKEMP+2,FN LB(C2):POKEMP+3,FN HB(C2) OR 128
292 POKEMP+4,FN LB(AN+1):POKEMP+5,FN HB(AN+1)
294 POKEMP+6,0
296 POKEMP+7,FN LB(AN):POKEMP+8,FN HB(AN)
298 POKEMP+1,144

310 GET I$:IF I$="" THEN 310
320 PRINT "PRESS KEY"
330 GET I$:IF I$="" THEN 330
340 S=TI:GOSUB 440:PRINT ""TI-S:GOTO 310
350 END

# REU FETCH COLOR
440 POKEMP+2,FN LB(C2):POKEMP+3,FN HB(C2) OR 128
450 POKEMP+4,FN LB(AN+1):POKEMP+5,FN HB(AN+1)
460 POKEMP+6,0
470 POKEMP+7,FN LB(AN):POKEMP+8,FN HB(AN)
480 POKEMP+1,145

# REU FETCH SCREEN
490 POKEMP+2,FN LB(B2):POKEMP+3,FN HB(B2)
500 POKEMP+4,0:POKEMP+5,0
510 POKEMP+6,0
520 POKEMP+7,FN LB(AN):POKEMP+8,FN HB(AN)
530 POKEMP+1,145


540 RETURN


#     MP     = 57088
#     MP+2,3 = CPU-RAM ADDRESS
#     MP+4,5 = REU-RAM ADDRESS
#     MP+6   = REU-BANK
#     MP+7,8 = NR OF BYTES TO COPY
#     MP+1   = TRANSACTION TYPE
#              0=STASH IN REU
#              1=FETCH FROM REU