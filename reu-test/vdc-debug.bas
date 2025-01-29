#RetroDevStudio.MetaData.BASIC:7169,BASIC V7.0
1 GRAPHIC5:FAST:GOSUB 1000
2 AN=250
3 WR=DEC("CDCC"):RR=DEC("CDDA")

# BC(3,1) = BLOCK-COPY
# 0 = SCREEN-RAM TO HIDDEN
# 1 = COLOR-RAM TO HIDDEN
# 2 = HIDDEN TO SCREEN-RAM
# 3 = HIDDEN TO COLOR-RAM
#     0=SOURCE
#     1=DESTINATION

4 DIM BC(3,1)
5 BC(0,0)=0:   BC(0,1)=4096
6 BC(1,0)=2048:BC(1,1)=6144
7 BC(2,0)=4096:BC(2,1)=0
8 BC(3,0)=6144:BC(3,1)=2048

9 GOSUB 300

10 SYS RR,,28:RREGA:SYS WR,(A OR FN SB(4)),28
11 S=TI
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
272 GETKEY I$

# SET BIT - RESULT NEEDS TO BE OR'ED WITH BYTE
278 DEF FN SB(B)=2B

# REMOVE BIT - RESULT NEEDS TO BE AND'ED WITH BYTE
279 DEF FN RB(B)=255-2B

280 DEF FN HB(X)=INT(X/256)
281 DEF FN LB(X)=X-(INT(X/256))*256

# STORE SCREEN-RAM AND COLOR-RAM
282 OP=0:GOSUB 400:GOSUB 405
283 OP=1:GOSUB 400:GOSUB 405
285 PRINT "TASTE":
287 GETKEY I$

290 OP=3:GOSUB 400:GOSUB 405
292 OP=2:GOSUB 400:GOSUB 405
294 GETKEY I$
296 GOTO 285

# SET SCREEN TO 40 COLS
300 SYS WR,63,0:SYS WR,40,1:SYS WR,55,2
302 SYS RR,,25:RREG A:SYS WR,(AOR16),25
304 SYS WR,(8*16)+9,22
306 SYS WR,40,27
308 POKE 238,39
310 PRINT""
312 RETURN


# SETUP BLOCK-COPY
400 SYSWR,FNHB(BC(OP,1)),18:SYSWR,FNLB(BC(OP,1)),19: REM DESTINATION FOR BLOCK-COPY
401 SYSWR,FNHB(BC(OP,0)),32:SYSWR,FNLB(BC(OP,0)),33:REM SOURCE FOR BLOCK-COPY
402 SYSRR,,24:RREGA:SYSWR,(A OR FNSB(7)),24: REM SET TO BLOCK-COPY MODE
403 RETURN

# EXECUTE BLOCK-COPY
405 FOR X=0TO7
406  SYSWR,250,30:REM SET NR OF BYTES TO COPY + INITIATE COPY
407 NEXT
408 RETURN

# SET BIT - RESULT NEEDS TO BE OR'ED WITH BYTE
1000 DEF FN SB(B)=2B

# REMOVE BIT
1010 

2000 RETURN