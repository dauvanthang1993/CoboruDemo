000010*=================================================================
000020*?uコマンド?s引?狽ﾌ受取り方?v
000030*
000040*
000050*  Copyright 2000-2015 FUJITSU LIMITED
000060*=================================================================
000070 IDENTIFICATION DIVISION.
000080  PROGRAM-ID. SAMPLE6.
000090*
000100 ENVIRONMENT DIVISION.
000110  CONFIGURATION SECTION.
000120  SPECIAL-NAMES.
000130     ARGUMENT-NUMBER IS AG-N1
000140     ARGUMENT-VALUE  IS AG-V1.
000150*
000160 DATA DIVISION.
000170 WORKING-STORAGE SECTION.
000180   01  BINARY-1    PIC 9(4)  BINARY.
000190   01  DISIPLAY-1    PIC S9(5) DISPLAY.
000200*
000210   01  BINARY-2    PIC S9(8) BINARY.
000220   01  GROUP-1.
000230     02  GROUP-1V.
000240         03  年   PIC 9999.
000250         03  月   PIC 99.
000260         03  日   PIC 99.
000270     02  GROUP1-VR  REDEFINES GROUP-1V  PIC X(8).
000280*
000290   01  BINARY-3    PIC S9(8) BINARY.
000300   01  GROUP-2.
000310     02  GROUP2-V.
000320         03  年  PIC 9999.
000330         03  月  PIC 99.
000340         03  日  PIC 99.
000350     02  GROUP2-VR  REDEFINES GROUP2-V  PIC X(8).
000360*
000370 PROCEDURE DIVISION.
000371* 	   ACCEPT BINARY-1 FROM CONSOLE
000380*     ACCEPT BINARY-1 FROM AG-N1
000390*     IF BINARY-1 NOT = 2 THEN
000400*       DISPLAY "BINARY-1に誤りがあります?D"
000410*       GO TO EXIT-P
000420*     END-IF
000430*
000431	   MOVE "19931223" TO GROUP1-VR
000432	   MOVE "20201028" TO GROUP2-VR	
000440*     ACCEPT GROUP1-VR FROM AG-V1.
000450*     IF 年 OF GROUP-1V < 1900 THEN
000460*         DISPLAY "入力日付は１９００年以?~の日付を入力してください?D"
000470*         GO TO EXIT-P
000480*     END-IF.
000490*     ACCEPT GROUP2-VR FROM AG-V1.
000500*     IF 年 OF GROUP2-V < 1900 THEN
000510*         DISPLAY "入力日付は１９００年以?~の日付を入力してください?D"
000520*         GO TO EXIT-P
000530*     END-IF.
000540     CALL "SUMCALC"  USING GROUP-1V BINARY-2.
000550     CALL "SUMCALC"  USING GROUP2-V BINARY-3.
000560*
000570     COMPUTE DISIPLAY-1 = BINARY-3 - BINARY-2.
000580     DISPLAY "GROUP4-V1の?ｷは?@" DISIPLAY-1 "日です?D".
000590*
000600 EXIT-P.
000610     EXIT PROGRAM.
000620*
000630/
000640*=================================================================
000650*  以下のプ??グラムで1900年1月1日からのGROUP4-V1を計算する.
000660*=================================================================
001220
001230 END PROGRAM  SAMPLE6.