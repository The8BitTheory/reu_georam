#RetroDevStudio.MetaData.BASIC:7169,BASIC V7.0
1 GRAPHIC5:FAST
2 AN=250

3 WR=DEC("CDCC"):RR=DEC("CDDA")
4 SYS WR,63,0:SYS WR,40,1:SYS WR,55,2
5 SYS RR,,25:RREG A:SYS WR,(AOR16),25
6 SYS WR,(8*16)+9,22
7 SYS WR,40,27
8 POKE 238,39
9 PRINT""

10 S=TI
20 COLOR 6,5
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

300 GOSUB 500
310 GETI$:IFI$=""THEN310
320 PRINT "TASTE"
330 GET I$:IFI$=""THEN330
#340 S=TI:GOSUB 440:PRINT ""TI-S:GOTO 310
340 GOTO310
350 END

# FROM HIDDEN TO SCREEN
440 BANK 0:FETCH AN,BR,0,0
474 BANK15:FETCH AN,CP,AN,0
490 RETURN

# STORE SCREEN IN HIDDEN AREA
500 BANK15:SYSRR,,24:RREGA:GOSUB 550:SYSWR,(A AND 128),24: REM SET TO BLOCK COPY MODE
502 GOSUB 550:SYSWR,DEC("10"),18:GOSUB550:SYSWR,DEC("00"),19: REM DESTINATION FOR BLOCK-COPY
504 GOSUB 550:SYSWR,0,32:GOSUB550:SYSWR,0,33:REM SOURCE FOR BLOCK-COPY

508 FOR X=0TO3
510  GOSUB 550:SYSRR,,19:RREGA:AD=A:GOSUB550:SYSRR,,18:RREGA:AD=AD+A*256:PRINT "DEST"AD
512  GOSUB 550:SYSRR,,33:RREGA:AD=A:GOSUB550:SYSRR,,32:RREGA:AD=AD+A*256:PRINT "SRC"AD
514  GOSUB550:SYSWR,250,30:REM SET NR OF BYTES TO COPY + INITIATE COPY
516 NEXT
518 RETURN

550 DO:RF=PEEK(DEC("D600")):LOOP UNTIL RF>127
551 RETURN

#500 BANK 0:STASH AN,BR,0,0
#534 BANK 15:STASH AN,CP,AN,0
#560 RETURN


