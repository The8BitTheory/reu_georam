#RetroDevStudio.MetaData.BASIC:2049,BASIC V2,uppercase,10,10
1 MP=56832:M2=MP-32768:GB=57343:GP=57342:LA=1:BR=1024:B2=1024:CP=55296:C2=CP-32768
2 DEF FN LB(X2)=X2 AND 255:DEF FN HB(X2)=INT(X2/256)

3 AN=250

# GEORAM LOW- AND HIGH-BYTE
4 GL=FN LB(M2):GH=FN HB(M2)OR128

# SCREENRAM LOW- AND HIGH-BYTES
5 DIM SL(3),SH(3)
6 FOR X=0 TO 3

7  VL=B2+AN*X
8  SL(X)=FN LB(VL)
9  SH(X)=FN HB(VL)

11  VL=C2+AN*X
12  CL(X)=FN LB(VL)
13  CH(X)=FN HB(VL)OR128

14 NEXT

20 S=TI:PRINT"";
25 POKE53281,8:POKE646,1
30 PRINT"                                        ";
40 PRINT"                      THE 8 BIT THEORY  ";
50 PRINT"                                        ";
60 PRINT"                               ";
70 PRINT"                              ";
80 PRINT"                            ";
90 PRINT"                           ";
100 PRINT"                         ";
110 PRINT"                      ";
120 PRINT"                     ";
130 PRINT"                    ";
140 PRINT"                    ";
150 PRINT"                         ";
160 PRINT"                              ";
170 PRINT"                      ";
180 PRINT"                      ";
190 PRINT"                    ";
200 PRINT"                       ";
210 PRINT"                       ";
220 PRINT"                         ";
230 PRINT"                        ";
240 PRINT"                         ";
250 PRINT"                                      ";
270 PRINT
280 PRINT ""TI-S

290 FOR X=0TO3
292  POKE GP,X
294  GOSUB 700
296  POKE GP,X+4
298  GOSUB 790
300 NEXT

310 GET I$:IF I$="" THEN 310
320 PRINT "PRESS KEY"
330 GET I$:IF I$="" THEN 330
340 S=TI:GOSUB 440:PRINT TI-S:GOTO 310
350 END


# FROM GEORAM TO SCREEN
440 FOR X=0TO3
454  POKE GP,X+4
456  GOSUB 760
458  POKE GP,X
460  GOSUB 730
480 NEXT
490 RETURN

# STORE SCREEN IN GEORAM
700 POKE53,GL
705 POKE54,GH
710 POKE781,SL(X)
715 POKE782,SH(X)
720 POKE780,AN
725 SYS46728
729 RETURN

# RESTORE SCREEN FROM GEORAM
730 POKE53,SL(X)
735 POKE54,SH(X)
740 POKE781,GL
745 POKE782,GH
750 POKE780,AN
755 SYS46728
759 RETURN

# RESTORE COLOR FROM GEORAM
760 POKE53,CL(X)
765 POKE54,CH(X)
770 POKE781,GL
775 POKE782,GH
780 POKE780,AN
785 SYS46728
789 RETURN

# STORE COLOR IN GEORAM
790 POKE53,GL
795 POKE54,GH
800 POKE781,CL(X)
805 POKE782,CH(X)
810 POKE780,AN
815 SYS46728
819 RETURN

