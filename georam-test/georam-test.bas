#RetroDevStudio.MetaData.BASIC:2049,BASIC V2,uppercase,10,10
3 MP=56832:M2=MP-32768:GB=57343:GP=57342:LA=1:BR=1024:B2=1024:CP=55296:C2=CP-32768
4 DEFFNLB(X2)=X2AND255:DEFFNHB(X2)=INT(X2/256)

5 AN=250

10 S=TI:PRINT"";
20 POKE53281,8:POKE646,1
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
298  GOSUB 715
300 NEXT

310 GETI$:IFI$=""THEN310
320 PRINT "PRESS KEY"
330 GET I$:IFI$=""THEN330
340 S=TI:GOSUB 440:PRINT TI-S:GOTO 310
350 END


# FROM GEORAM TO SCREEN
440 REM 
450 FOR X=0TO3
454  POKE GP,X+4
456  GOSUB 710
458  POKE GP,X
460  GOSUB 705
480 NEXT
490 RETURN

# STORE SCREEN IN GEORAM
700 POKE53,FN LB(M2):POKE54,FN HB(M2)OR128
701 POKE781,FN LB(B2+AN*X):POKE782,FN HB(B2+AN*X)
702 POKE780,AN:SYS46728:RETURN

# RESTORE SCREEN FROM GEORAM
705 POKE53,FN LB(B2+AN*X):POKE54,FN HB(B2+AN*X)
706 POKE781,FN LB(M2):POKE782,FN HB(M2)OR128
707 POKE780,AN:SYS46728:RETURN

# RESTORE COLOR FROM GEORAM
710 POKE53,FN LB(C2+AN*X):POKE54,FN HB(C2+AN*X)OR128
711 POKE781,FN LB(M2):POKE782,FN HB(M2)OR128
712 POKE780,AN:SYS46728:RETURN

# STORE COLOR IN GEORAM
715 POKE53,FN LB(M2):POKE54,FN HB(M2)OR128
716 POKE781,FN LB(C2+AN*X):POKE782,FN HB(C2+AN*X)OR128
717 POKE780,AN:SYS46728:RETURN



