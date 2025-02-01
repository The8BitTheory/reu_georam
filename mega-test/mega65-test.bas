#RetroDevStudio.MetaData.BASIC:8193,BASIC 65,uppercase,10,10
10 S=TI:PRINTCHR$(27)"4";
20 POKE53280,11:POKE53281,11:COLOR 1
30 PRINT
40 PRINT"                     THE 8-BIT THEORY"
50 PRINT
60 PRINT
70 PRINT"                  "
80 PRINT"                  "
90 PRINT"                  "
100 PRINT"                     "
110 PRINT"                                  "
120 PRINT"                            "
130 PRINT"                               "
140 PRINT"                         "
150 PRINT"                              "
160 PRINT"                       "
170 PRINT"                                 "
180 PRINT"                          "
190 PRINT"                               "
200 PRINT"                           "
210 PRINT"                                  "
220 PRINT"                    "
230 PRINT"                  "
240 PRINT"                  "
270 COLOR 1:PRINT:PRINT "PRINT:"TI-S "SECONDS";

280 REM STORE SCREEN TO OFF-SCREEN
290 EDMA 0,$400,$800,$8000000
300 EDMA 0,$400,$FF80000,$8000400

310 GET I$:IF I$="" THEN 310
320 PRINT "PRESS KEY"
330 GET I$:IF I$="" THEN 330
340 S=TI:GOSUB 400:PRINT "DMA:  "TI-S "SECONDS";:GOTO 310
350 END


400 EDMA 0,$400,$8000000,$800
405 EDMA 0,$400,$8000400,$FF80000
410 RETURN



# PERFORMANCE COMPARISON

# 11 JIFFIES WHEN USING THE REU
# 40 JIFFIES WHEN ALWAYS BUILDING THE DMA-LIST
# 28 JIFFIES WHEN ASSIGNING THE DMA-LIST TO DL$
#  5 JIFFIES WHEN ONLY 3 POKES ARE NEEDED (DMA LISTS ARE PREPARED IN MEM)


#LDA #$70    A9 70
#STA $640    80 40 D6
#NOP         EA
# 169, 112, 128, 64, 214, 234

