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
120 PRINT"                          "
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
301 REM SOURCE: VRAM, DEST: 40960 ($A000)

305 REM SET DATA-PORT ADDRESS
310 GOSUB 500

325 REM SET MEMORY-COPY SOURCE ($2,$3) ADDRESS TO DATA-PORT 0 ($9F23)
330 POKE 2,$23:POKE 3,$9F

335 REM SET MEMORY-COPY DESTINATION ($4,$5) ADDRESS TO $A000 (IN RAM)
340 POKE 4,$00:POKE 5,$A0

355 REM EXECUTE MEMORY-COPY
360 SYS $FEE7

369 REM ########################################
370 GET I$:IF I$="" THEN 370
375 PRINT "PRESS KEY"
380 GET I$:IF I$="" THEN 380
385 S=TI:GOSUB 410:PRINT TI-S:GOTO 370

399 REM ########################################

400 REM RESTORE SCREEN FROM SOMEWHERE ELSE
401 REM SOURCE: $A000, DEST: VRAM

405 REM SET DATA-PORT ADDRESS
410 GOSUB 500

425 REM SET MEMORY-COPY SOURCE ($2,$3) ADDRESS TO $A000
430 POKE 2,$00:POKE 3,$A0

435 REM SET MEMORY-COPY DESTINATION ($4,$5) ADDRESS TO DATA-PORT 0 ($9F23)
440 POKE 4,$23:POKE 5,$9F


455 REM EXECUTE MEMORY-COPY
460 SYS $FEE7

470 RETURN

500 REM DATA-PORT 0
510 POKE $9F25,0

520 REM SET VRAM-ADDRESS TO $1.B000
530 POKE $9F20,0:POKE $9F21,$B0:POKE $9F22,%00010001

535 REM CLEAR CTRL
540 POKE$9F25,0

545 REM SET MEMORY-COPY NR OF BYTES ($6,$7) TO 8192 BYTES ($2000)
550 POKE 6,$00:POKE 7,$20

555 RETURN
