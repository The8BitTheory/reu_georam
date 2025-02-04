#RetroDevStudio.MetaData.BASIC:2049,BASIC V2 - X16,uppercase,10,10
10 COLOR 1,11:PRINT"";
30 SCREEN 3:S=TI
40 PRINT:PRINT"            THE 8-BIT THEORY":PRINT
45 COLOR 4,11
50 PRINT"                             "
60 PRINT"                           "
70 PRINT"                           "
75 COLOR 14,11
80 PRINT"                           "
90 PRINT"                            "
100 PRINT"                          "
105 COLOR 3,11
110 PRINT"                          "
120 PRINT"                          "
130 PRINT"                           "
135 COLOR 5,11
140 PRINT"                         "
150 PRINT"                      "
160 PRINT"                    "
170 PRINT"                      "
175 COLOR 7,11
180 PRINT"                      "
190 PRINT"                    "
200 PRINT"                      "
210 PRINT"                         "
215 COLOR 8,11
220 PRINT"                         "
230 PRINT"                         "
240 PRINT"                         "
245 COLOR 2,11
250 PRINT"                         "
260 PRINT"                           "
270 PRINT
280 COLOR 1,11:PRINT"             COMMANDER X16"
290 PRINT TI-S

299 REM ########################################

300 REM STORE SCREEN TO SOMEWHERE ELSE

302 REM SET DATA-PORT 0 AND 1 ADDRESSES

310 GOSUB 500

345 REM SET MEMORY-COPY SOURCE ($2,$3) ADDRESS TO DATA-PORT 0 ($9F23)
350 POKE 2,$23
351 POKE 3,$9F

355 REM SET MEMORY-COPY DESTINATION ($4,$5) ADDRESS TO DATA-PORT 1 ($9F24)
360 POKE 4,$24
361 POKE 5,$9F

375 REM EXECUTE MEMORY-COPY
380 SYS $FEE7


382 REM ########################################
384 GET I$:IF I$="" THEN 384
386 PRINT "PRESS KEY"
388 GET I$:IF I$="" THEN 388
390 S=TI:GOSUB 400:PRINT TI-S:GOTO 384

399 REM ########################################

400 REM RESTORE SCREEN FROM SOMEWHERE ELSE
405 REM SOURCE: VRAM, DEST: VRAM

410 REM SET DATA-PORT 0 AND 1 ADDRESSES
420 GOSUB 500

455 REM SET MEMORY-COPY SOURCE ($2,$3) ADDRESS TO DATA-PORT 1 ($9F24)
460 POKE 2,$24
461 POKE 3,$9F

465 REM SET MEMORY-COPY DESTINATION ($4,$5) ADDRESS TO DATA-PORT 0 ($9F23)
470 POKE 4,$23
471 POKE 5,$9F

485 REM EXECUTE MEMORY-COPY
490 SYS $FEE7

495 RETURN



500 REM DATA-PORT 0
510 POKE $9F25,$00

520 REM SET VRAM-ADDRESS TO $1.B000
530 POKE $9F20,$00
531 POKE $9F21,$B0
532 POKE $9F22,$11

540 REM DATA-PORT 1
550 POKE $9F25,$01

560 REM SET VRAM-ADDRESS TO $1.D000
570 POKE $9F20,$00
571 POKE $9F21,$D0
572 POKE $9F22,$11

580 POKE $9F25,$00

582 REM SET MEMORY-COPY NR OF BYTES ($6,$7) TO 8192 BYTES ($2000)
584 POKE 6,$00
585 POKE 7,$20

590 RETURN


