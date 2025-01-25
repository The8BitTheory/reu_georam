#RetroDevStudio.MetaData.BASIC:8193,BASIC 65,uppercase,10,10
2 MP=57088:GB=57343:GP=57342:LA=1:BR=1024:CP=55296:BN=4
3 DEFFNLB(X2)=X2-(INT(X2/256)*256):DEFFNHB(X2)=INT(X2/256)


10 S=TI:PRINTCHR$(27)"4";
20 POKE53280,5:POKE53281,5
30 PRINT"                          "
40 PRINT"    THE 8 BIT THEORY       "
50 PRINT"                          "
60 PRINT"                          "
70 PRINT"                          "
80 PRINT"                        "
90 PRINT"                          "
100 PRINT"                         "
110 PRINT"                           "
120 PRINT"                 "
130 PRINT"                   "
140 PRINT"                     "
150 PRINT"                    "
160 PRINT"                    "
170 PRINT"                    "
180 PRINT"                    "
190 PRINT"                     "
200 PRINT"                    "
210 PRINT"                       "
220 PRINT"                          "
230 PRINT"                           "
240 PRINT"                            "
250 PRINT"                             "
260 PRINT"                             "
270 PRINT TI-S "SECONDS";

280 REM STORE SCREEN TO OFF-SCREEN
290 EDMA 0,$400,$800,$8000000
300 EDMA 0,$400,$FF80000,$8000400

310 GET I$:IF I$="" THEN 310
320 PRINT "PRESS KEY"
330 GET I$:IF I$="" THEN 330
340 S=TI:GOSUB 400:PRINT ""TI-S:GOTO 310
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

