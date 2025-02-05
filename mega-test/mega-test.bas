#RetroDevStudio.MetaData.BASIC:2049,BASIC V2,uppercase,10,10
2 MP=57088:GB=57343:GP=57342:LA=1:BR=1024:CP=55296:BN=1
3 DEFFNLB(X2)=X2-(INT(X2/256)*256):DEFFNHB(X2)=INT(X2/256)

4 AN=1000
5 GOSUB 2000

# ENABLE MEGA65 I/O PERSONALITY
6 POKE53295,ASC("G"):POKE53295,ASC("S")

10 S=TI:PRINT"";
20 POKE53280,11:POKE53281,11
30 PRINT"";
60 PRINT
70 PRINT"                                       ";
80 PRINT"                     THE 8-BIT THEORY"
90 PRINT"                                       ";
100 PRINT"                     ";
110 PRINT"                                    ";
120 PRINT"                           ";
130 PRINT"                               ";
140 PRINT"                             ";
150 PRINT"                                  ";
160 PRINT"                            ";
170 PRINT"                               ";
180 PRINT"                            ";
190 PRINT"                               ";
200 PRINT"                           ";
210 PRINT"                                  64";
220 PRINT"                    ";
230 PRINT"                                       ";
240 PRINT"                  "
270 POKE 646,1:PRINT""TI-S

# MEGA STASH SCREEN
280 DL=0
290 GOSUB 1000

# MEGA STASH COLOR
300 DL=2
305 GOSUB 1000

310 GET I$:IF I$="" THEN 310
320 PRINT "PRESS KEY"
330 GET I$:IF I$="" THEN 330
340 S=TI:GOSUB 440:PRINT ""TI-S:GOTO 310
350 END

# MEGA FETCH COLOR
440 DL=3
450 GOSUB 1000

# MEGA FETCH SCREEN
460 DL=1
470 GOSUB 1000

490 RETURN

# WRITE DMA-LIST TO MEMORY
900 FOR I=1 TO LEN(DL$)
905  A=ASC(MID$(DL$,I,1))
910  POKE49151+I+(DL*12),A
915 NEXT
920 RETURN

# EXECUTE DMA JOB AT $0.C000

# SET DMA LIST BANK 0
1000 POKE55042,0

# SET DMA LIST HIGH-BYTE
1010 POKE55041,192

# SET DMA LIST LOW-BYTE, AND EXECUTE
1015 POKE55040,DL*12

1020 RETURN

######
# STORE SCREEN IN BANK 1
######

# COMMAND LSB: 0=COPY, 3=FILL
2000 DL$=CHR$(0)

# COUNT LSB, MSB ($3E8 = 1000)
2002 DL$=DL$+CHR$(FNLB(AN))+CHR$(FNHB(AN))

# SOURCE ADDRESS LSB,MSB ($0400 SCREEN-RAM)
2003 DL$=DL$+CHR$(FNLB(BR))+CHR$(FNHB(BR))

# SOURCE ADDRESS BANK AND FLAGS (16 BANKS WITH 64KB EACH AVAILABLE)
2004 DL$=DL$+CHR$(0)

# DEST ADDRESS LSB,MSB
2005 DL$=DL$+CHR$(0)+CHR$(0)

# DEST ADDRESS BANK AND FLAGS
2006 DL$=DL$+CHR$(BN)

# COMMAND MSB
2007 DL$=DL$+CHR$(0)

# MODULO (UNUSED)
2008 DL$=DL$+CHR$(0)+CHR$(0)

2009 DL=0:GOSUB 900


######
# RETRIEVE SCREEN FROM BANK 1
######
# COMMAND LSB: 0=COPY, 3=FILL
2050 DL$=CHR$(0)

# COUNT LSB, MSB ($3E8 = 1000)
2052 DL$=DL$+CHR$(FNLB(AN))+CHR$(FNHB(AN))

# SOURCE ADDRESS LSB,MSB (ZERO AT BANK 4)
2053 DL$=DL$+CHR$(0)+CHR$(0)

# SOURCE ADDRESS BANK AND FLAGS (16 BANKS WITH 64KB EACH AVAILABLE)
2054 DL$=DL$+CHR$(BN)

# DEST ADDRESS LSB,MSB ($0400 SCREEN-RAM)
2055 DL$=DL$+CHR$(FNLB(BR))+CHR$(FNHB(BR))

# DEST ADDRESS BANK AND FLAGS
2056 DL$=DL$+CHR$(0)

# COMMAND MSB
2057 DL$=DL$+CHR$(0)

# MODULO (UNUSED)
2058 DL$=DL$+CHR$(0)+CHR$(0)
2059 DL=1:GOSUB 900


###################
# STORE COLORS IN BANK 1
######

# COMMAND LSB: 0=COPY, 3=FILL
2100 DL$=CHR$(0)

# COUNT LSB, MSB ($3E8 = 1000)
2102 DL$=DL$+CHR$(FNLB(AN))+CHR$(FNHB(AN))

# SOURCE ADDRESS LSB,MSB
2103 DL$=DL$+CHR$(FNLB(CP))+CHR$(FNHB(CP))

# SOURCE ADDRESS BANK AND FLAGS  (BIT 7 SETS I/O ACCESS)
2104 DL$=DL$+CHR$(128)

# DEST ADDRESS LSB,MSB
2105 DL$=DL$+CHR$(FNLB(AN))+CHR$(FNHB(AN))

# DEST ADDRESS BANK AND FLAGS
2106 DL$=DL$+CHR$(BN)

# COMMAND MSB
2107 DL$=DL$+CHR$(0)

# MODULO (UNUSED)
2108 DL$=DL$+CHR$(0)+CHR$(0)
2109 DL=2:GOSUB 900

####################
# RETRIEVE COLORS FROM BANK 1
######

# COMMAND LSB: 0=COPY, 3=FILL
2150 DL$=CHR$(0)

# COUNT LSB, MSB ($3E8 = 1000)
2152 DL$=DL$+CHR$(FNLB(AN))+CHR$(FNHB(AN))

# SOURCE ADDRESS LSB,MSB (ZERO AT BANK 4)
2153 DL$=DL$+CHR$(FNLB(AN))+CHR$(FNHB(AN))

# SOURCE ADDRESS BANK AND FLAGS (16 BANKS WITH 64KB EACH AVAILABLE)
2154 DL$=DL$+CHR$(BN)

# DEST ADDRESS LSB,MSB
2155 DL$=DL$+CHR$(FNLB(CP))+CHR$(FNHB(CP))

# DEST ADDRESS BANK AND FLAGS (BIT 7 SETS I/O ACCESS)
2156 DL$=DL$+CHR$(128)

# COMMAND MSB
2157 DL$=DL$+CHR$(0)

# MODULO (UNUSED)
2158 DL$=DL$+CHR$(0)+CHR$(0)
2159 DL=3:GOSUB 900

2199 RETURN


# PERFORMANCE COMPARISON

# 11 JIFFIES WHEN USING THE REU
# 40 JIFFIES WHEN ALWAYS BUILDING THE DMA-LIST
# 28 JIFFIES WHEN ASSIGNING THE DMA-LIST TO DL$
#  5 JIFFIES WHEN ONLY 3 POKES ARE NEEDED (DMA LISTS ARE PREPARED IN MEM)


#LDA #$70    A9 70
#STA $640    80 40 D6
#NOP         EA
# 169, 112, 128, 64, 214, 234

