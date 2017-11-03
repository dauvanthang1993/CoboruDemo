*>  Copyright 1992-2015 FUJITSU LIMITED
IDENTIFICATION DIVISION.
 PROGRAM-ID. INSATSU.
*>  このサンプルプログラムは自由形式の正書法で記述されています。
*>  翻訳時には翻訳オプションＳＲＦを使用して、正書法の形式として
*>  自由形式(FREE)を指定してください。
ENVIRONMENT DIVISION.
 CONFIGURATION SECTION.
  SPECIAL-NAMES.
    PRINTING MODE PMODE1 IS FOR MOCS
      IN   SIZE   7 POINT
      AT   PITCH  10 CPI
      WITH FONT   GOTHIC
      AT   ANGLE  0 DEGREES
      BY   FORM   F.
*>
 INPUT-OUTPUT SECTION.
  FILE-CONTROL.
    SELECT 印刷ファイル
        ASSIGN       TO  PRINTER.
    SELECT 作業ファイル
        ASSIGN       TO  作業ファイル名
        ORGANIZATION IS  LINE SEQUENTIAL.
*>
DATA DIVISION.
 FILE SECTION.
 FD  印刷ファイル.
 01  印刷レコード PIC X(60).
 FD  作業ファイル.
 01  作業レコード.
     COPY "S_REC.CBL".
*>
 WORKING-STORAGE SECTION.
 01  作業１レコード CHARACTER TYPE IS PMODE1.
     COPY "S_REC.CBL".
*>
 LINKAGE SECTION.
 01  作業ファイル名      PIC X(12).
*>
PROCEDURE DIVISION USING 作業ファイル名.
*> （１）印刷ファイルと作業ファイルをオープンします。
     OPEN OUTPUT 印刷ファイル.
     OPEN INPUT  作業ファイル.
*>
 繰り返し位置.
*> （２）作業ファイルからデータを読み込み、印刷装置に出力します。
     READ 作業ファイル INTO 作業１レコード
          AT END GO TO 終了処理.
     WRITE 印刷レコード FROM 作業１レコード AFTER ADVANCING 1 LINE.
     GO TO 繰り返し位置.
*>
 終了処理.
*> （３）印刷ファイルと作業ファイルをクローズします。
     CLOSE  印刷ファイル 作業ファイル.
END PROGRAM INSATSU.
