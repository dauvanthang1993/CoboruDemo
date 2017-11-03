000100* Copyright 1992-2015 FUJITSU LIMITED
000200 IDENTIFICATION DIVISION.
000300  PROGRAM-ID. SAMPLE2.
000400*
000500 ENVIRONMENT DIVISION.
000600  INPUT-OUTPUT SECTION.
000700   FILE-CONTROL.
000800     SELECT データファイル
000900         ASSIGN       TO  INFILE
001000         ORGANIZATION IS  LINE SEQUENTIAL.
001100     SELECT 索引ファイル
001200         ASSIGN       TO  OUTFILE
001300         ORGANIZATION IS  INDEXED
001400         RECORD KEY   IS  商品コード  OF  索引レコード
001500         ALTERNATE RECORD KEY IS  商品名  OF  索引レコード
001600         ACCESS MODE  IS  SEQUENTIAL.
001700*
001800 DATA DIVISION.
001900  FILE SECTION.
002000  FD  データファイル.
002100  01  データレコード.
002200      02  商品レコード.
002300          03  商品コード    PIC X(4).
002400          03                PIC X.
002500          03  商品名        PIC N(20).
002600          03                PIC X.
002700          03  単価          PIC 9(4).
002800  FD  索引ファイル.
002900  01  索引レコード.
003000      COPY  SYOHINM.
003100*
003200 PROCEDURE DIVISION.
003300**（１）使用するファイルをオープンします。
003400      OPEN INPUT  データファイル.
003500      OPEN OUTPUT 索引ファイル.
003600*
003700  繰り返し位置.
003800**（２）行順ファイルから読み込んだレコードを索引レコードに編集し、索引フ
003900**    ァイルに書き出します。全てのレコードを読み込んだら、終了処理に分岐
004000**    します。
004100      READ データファイル AT END GO TO 終了処理.
004200      MOVE CORR データレコード TO 索引レコード.
004300      WRITE 索引レコード.
004400      GO TO 繰り返し位置.
004500*
004600  終了処理.
004700**（３）使用したファイルをクローズします。
004800      CLOSE  データファイル  索引ファイル.
004900 END PROGRAM SAMPLE2.
