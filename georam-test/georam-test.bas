#RetroDevStudio.MetaData.BASIC:2049,BASIC V2,uppercase,10,10
1 MP=56832:M2=MP-32768:GB=57343:GP=57342:LA=1:BR=1024:B2=1024:CP=55296:C2=CP-32768
2 DEFFNLB(X2)=X2AND255:DEFFNHB(X2)=INT(X2/256)

3 AN=250

# GEORAM LOW- AND HIGH-BYTE
4 GL=FN LB(M2):GH=FN HB(M2)OR128

# SCREENRAM LOW- AND HIGH-BYTES
5 DIM SL(3),SH(3)
6 FOR X=0 TO 3

7  VL=B2+AN*X
8  SL(X)=FN LB(VL)
9  SH(X)=FN HB(VL)

#10  Y=X+4
11  VL=C2+AN*X
12  CL(X)=FN LB(VL)
13  CH(X)=FN HB(VL)OR128

14 NEXT

# BY(X,Y)
# X:0=SCREEN-RAM
# X:1=COLOR-RAM

#6 DIM BY(1,1)

#7 AD(0)=


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
700 POKE53,GL:POKE54,GH
701 POKE781,SL(X):POKE782,SH(X)
702 POKE780,AN:SYS46728:RETURN

# RESTORE SCREEN FROM GEORAM
705 POKE53,SL(X):POKE54,SH(X)
706 POKE781,GL:POKE782,GH
707 POKE780,AN:SYS46728:RETURN

# RESTORE COLOR FROM GEORAM
710 POKE53,CL(X):POKE54,CH(X)
711 POKE781,GL:POKE782,GH
712 POKE780,AN:SYS46728:RETURN

# STORE COLOR IN GEORAM
715 POKE53,GL:POKE54,GH
716 POKE781,CL(X):POKE782,CH(X)
717 POKE780,AN:SYS46728:RETURN



