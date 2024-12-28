#RetroDevStudio.MetaData.BASIC:2049,BASIC V2,uppercase,10,10
3 MP=57088:GB=57343:GP=57342:LA=1:BR=1024:B2=1024:CP=55296:C2=CP-32768
4 DEFFNLB(X2)=X2AND255:DEFFNHB(X2)=INT(X2/256)

5 AN=1000

# ENABLE MEGA65 I/O PERSONALITY
7 POKE53295,ASC("G"):POKE53295,ASC("S")



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
#470 GOSUB 610
470 GOSUB 750
#474 GOSUB 630
490 RETURN

# STORE SCREEN IN REU
500 REM
#530 GOSUB 600
530 GOSUB 700
#534 GOSUB 620
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


# REPRESENTS THE BASIC10 DMA FUNCTION

# MEGA STASH SCREEN

# COMMAND LSB: 0=COPY, 3=FILL
700 DL$=CHR$(0)

# COUNT LSB, MSB ($3E8 = 1000)
702 DL$=DL$+CHR$(FNLB(AN))+CHR$(FNHB(AN))

# SOURCE ADDRESS LSB,MSB ($0400 SCREEN-RAM)
703 DL$=DL$+CHR$(FNLB(B2))+CHR$(FNHB(B2))

# SOURCE ADDRESS BANK AND FLAGS (16 BANKS WITH 64KB EACH AVAILABLE)
704 DL$=DL$+CHR$(0)

# DEST ADDRESS LSB,MSB
705 DL$=DL$+CHR$(0)+CHR$(0)

# DEST ADDRESS BANK AND FLAGS
706 DL$=DL$+CHR$(4)

# COMMAND MSB
707 DL$=DL$+CHR$(0)

# MODULO (UNUSED)
708 DL$=DL$+CHR$(0)+CHR$(0)

710 GOSUB 1000

749 RETURN


# MEGA FETCH SCREEN
# COMMAND LSB: 0=COPY, 3=FILL
750 DL$=CHR$(0)

# COUNT LSB, MSB ($3E8 = 1000)
752 DL$=DL$+CHR$(FNLB(AN))+CHR$(FNHB(AN))

# SOURCE ADDRESS LSB,MSB (ZERO AT BANK 4)
753 DL$=DL$+CHR$(0)+CHR$(0)

# SOURCE ADDRESS BANK AND FLAGS (16 BANKS WITH 64KB EACH AVAILABLE)
754 DL$=DL$+CHR$(4)

# DEST ADDRESS LSB,MSB ($0400 SCREEN-RAM)
755 DL$=DL$+CHR$(FNLB(B2))+CHR$(FNHB(B2))

# DEST ADDRESS BANK AND FLAGS
756 DL$=DL$+CHR$(0)

# COMMAND MSB
757 DL$=DL$+CHR$(0)

# MODULO (UNUSED)
758 DL$=DL$+CHR$(0)+CHR$(0)

759 GOSUB 1000

799 RETURN

# MEGA STASH COLOR
800


# MEGA FETCH COLOR
850

# WRITE DMA-LIST TO MEMORY
1000 FORI=1TOLEN(DL$):A=ASC(MID$(DL$,I,1)):POKE49151+I,A:NEXT
# EXECUTE DMA JOB AT $0.C000
1005 POKE55042,0: REM DMA LIST IS IN BANK 0
1010 POKE55041,192: REM DMA LIST IS IN $C0XX
1015 POKE55040,0: REM DMA LIST IS IN $XX00, AND EXECUTE
1020 RETURN
