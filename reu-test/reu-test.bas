#RetroDevStudio.MetaData.BASIC:2049,BASIC V2
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

300 GOSUB 500
310 GETI$:IFI$=""THEN310
320 PRINT "TASTE"
330 GET I$:IFI$=""THEN330
340 S=TI:GOSUB 440:PRINT ""TI-S:GOTO 310
350 END

# FROM REU TO SCREEN
440 REM 
470 GOSUB 610
474 GOSUB 630
490 RETURN

# STORE SCREEN IN REU
500 REM
530 GOSUB 600
534 GOSUB 620
560 RETURN

# REU STASH SCREEN
600 POKEMP+2,FN LB(B2):POKEMP+3,FN HB(B2)
601 POKEMP+4,0:POKEMP+5,0
602 POKEMP+6,0
603 POKEMP+7,FN LB(AN):POKEMP+8,FN HB(AN)
604 POKEMP+1,220
609 RETURN

# REU FETCH SCREEN
610 POKEMP+2,FN LB(B2):POKEMP+3,FN HB(B2)
611 POKEMP+4,0:POKEMP+5,0
612 POKEMP+6,0
613 POKEMP+7,FN LB(AN):POKEMP+8,FN HB(AN)
614 POKEMP+1,221
619 RETURN

# REU STASH COLOR
620 POKEMP+2,FN LB(C2):POKEMP+3,FN HB(C2) OR 128
621 POKEMP+4,FN LB(AN+1):POKEMP+5,FN HB(AN+1)
622 POKEMP+6,0
623 POKEMP+7,FN LB(AN):POKEMP+8,FN HB(AN)
624 POKEMP+1,220
629 RETURN

# REU FETCH COLOR
630 POKEMP+2,FN LB(C2):POKEMP+3,FN HB(C2) OR 128
631 POKEMP+4,FN LB(AN+1):POKEMP+5,FN HB(AN+1)
632 POKEMP+6,0
633 POKEMP+7,FN LB(AN):POKEMP+8,FN HB(AN)
634 POKEMP+1,221
639 RETURN
