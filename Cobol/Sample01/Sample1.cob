000100* Copyright 1992-2015 FUJITSU LIMITED
000200 IDENTIFICATION DIVISION.
000300  PROGRAM-ID. SAMPLE1.
000400*
000500 DATA DIVISION.
000600  WORKING-STORAGE SECTION.
000700  01  単語一覧.
000800      02     PIC X(10) VALUE "apple".
000900      02     PIC X(10) VALUE "black".
001000      02     PIC X(10) VALUE "cobol".
001100      02     PIC X(10) VALUE "dog".
001200      02     PIC X(10) VALUE "eye".
001300      02     PIC X(10) VALUE "fault".
001400      02     PIC X(10) VALUE "good".
001500      02     PIC X(10) VALUE "high".
001600      02     PIC X(10) VALUE "idea".
001700      02     PIC X(10) VALUE "junior".
001800      02     PIC X(10) VALUE "king".
001900      02     PIC X(10) VALUE "love".
002000      02     PIC X(10) VALUE "medium".
002100      02     PIC X(10) VALUE "new".
002200      02     PIC X(10) VALUE "open".
002300      02     PIC X(10) VALUE "pig".
002400      02     PIC X(10) VALUE "queen".
002500      02     PIC X(10) VALUE "review".
002600      02     PIC X(10) VALUE "smile".
002700      02     PIC X(10) VALUE "tomorrow".
002800      02     PIC X(10) VALUE "understand".
002900      02     PIC X(10) VALUE "version".
003000      02     PIC X(10) VALUE "wood".
003100      02     PIC X(10) VALUE "xylophone".
003200      02     PIC X(10) VALUE "yesterday".
003300      02     PIC X(10) VALUE "zoo".
003400      02     PIC X(10) VALUE "**error**".
003500 01  単語表  REDEFINES  単語一覧.
003600     02  単語  OCCURS 27 TIMES.
003700         03  先頭文字  PIC X.
003800         03            PIC X(9).
003900 01  繰り返し回数      PIC 9(3).
004000 01  入力文字          PIC X.
004100 01  入力要求メッセージ  PIC X(30)
004200     VALUE  "hay nhap 1 ki tu aphabe"
004300*
004400 PROCEDURE DIVISION.
004500  データ入力  SECTION.
004600**（１）要求メッセージを出力します。出力後、改行は行いません。
004700       DISPLAY 入力要求メッセージ WITH NO ADVANCING.
004800**（２）アルファベット１文字を入力します。
004900       ACCEPT  入力文字.
005000*
005100  単語の検索  SECTION.
005200**（３）アルファベットに対応する単語を検索します。
005300       PERFORM TEST BEFORE
005400               VARYING 繰り返し回数 FROM 1 BY 1
005500               UNTIL 繰り返し回数 > 26
005600          IF 入力文字 = 先頭文字 (繰り返し回数)
005700            THEN EXIT PERFORM
005800           END-IF
005900        END-PERFORM.
006000*
006100  単語の表示  SECTION.
006200**（４）アルファベットに対応する単語を表示します。
006300       DISPLAY 単語 (繰り返し回数).
006400*
006500       EXIT PROGRAM.
006600   END PROGRAM SAMPLE1.