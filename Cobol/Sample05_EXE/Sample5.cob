*>  Copyright 1992-2015 FUJITSU LIMITED
IDENTIFICATION DIVISION.
 PROGRAM-ID. SAMPLE5.
*>  このサンプルプログラムは自由形式の正書法で記述されています。
*>  翻訳時には翻訳オプションＳＲＦを使用して、正書法の形式として
*>  自由形式(FREE)を指定してください。
ENVIRONMENT DIVISION.
 CONFIGURATION SECTION.
  SPECIAL-NAMES.
    SYSERR IS メッセージ出力先.
 INPUT-OUTPUT SECTION.
  FILE-CONTROL.
    SELECT マスタファイル
        ASSIGN       TO  INFILE
        ORGANIZATION IS  INDEXED
        ACCESS MODE  IS  SEQUENTIAL
        RECORD KEY   IS  商品コード OF マスタレコード
        ALTERNATE RECORD KEY IS 商品名 OF マスタレコード.
    SELECT 作業ファイル
        ASSIGN       TO  作業ファイル名
        ORGANIZATION IS  LINE SEQUENTIAL.
*>  自由形式では注記行は"*>"で始まる行です。
*>  "*>"の前に空白がいくつあってもかまいません。
                     *>  この行も従って注記行です
DATA DIVISION.
 FILE SECTION.
 FD  マスタファイル.
 01  マスタレコード.
     02  商品レコード.
         03  商品コード      PIC X(4).
         03  商品名          PIC N(20).
         03  単価            PIC 9(4)  BINARY.
 FD  作業ファイル.
 01  作業レコード.
     COPY "S_REC.CBL".
*>
 WORKING-STORAGE SECTION.
 01  作業ファイル名      PIC X(12) VALUE SPACE.
*>
 LINKAGE SECTION.
 01  パラメータ.
     03  パラメータ長         PIC 9(4) BINARY.
     03  パラメータ文字列.
         05  パラメータ文字   PIC X
                 OCCURS 1 TO 8 DEPENDING ON パラメータ長.
*>
PROCEDURE DIVISION USING パラメータ.
*> （１）作業ファイル名を決定します。
     IF パラメータ長 = 0
       *> 次の行は自由形式における定数の継続を示します
       DISPLAY NC"パラメータが指定されていません。"-
       "パラメータを指定してください。"             
          UPON メッセージ出力先
       GO TO 処理終了.
     IF パラメータ長 > 8
       DISPLAY NC"パラメータが８文字を超えています"
          UPON メッセージ出力先
       GO TO 処理終了.
     MOVE パラメータ文字列(1:パラメータ長) TO 作業ファイル名.
     ADD 1 TO パラメータ長.
     MOVE ".TMP" TO 作業ファイル名(パラメータ長:4).
     DISPLAY NC"作業ファイル" "(" 作業ファイル名 ")" NC"を作成します"
          UPON メッセージ出力先.
*>
*> （２）使用するファイルをオープンします。
     OPEN INPUT  マスタファイル.
     START マスタファイル FIRST RECORD.
     OPEN OUTPUT 作業ファイル.
     MOVE SPACE TO 作業レコード.
*>
*> （３）索引ファイルから読み込んだレコードを行順ファイルに書き出します。
*>       全てのレコードの処理が終了したらファイルをクローズします。
*>
 繰り返し位置.
     READ マスタファイル AT END GO TO ファイルのクローズ.
     MOVE CORR マスタレコード TO 作業レコード.
     WRITE 作業レコード.
     GO TO 繰り返し位置.
 ファイルのクローズ.
     CLOSE  マスタファイル  作業ファイル.
*>
 印刷処理.
*> （４）印刷処理ルーチンを呼び出し、行順ファイルの内容を印刷します。
     CALL "INSATSU" USING 作業ファイル名.
*>
 処理終了.
    EXIT PROGRAM.
END PROGRAM SAMPLE5.
