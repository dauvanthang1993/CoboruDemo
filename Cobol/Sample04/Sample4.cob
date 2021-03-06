000100* Copyright 1992-2015 FUJITSU LIMITED
000200 IDENTIFICATION DIVISION.
000300  PROGRAM-ID. SAMPLE4.
000400*
000500 ENVIRONMENT DIVISION.
000600  CONFIGURATION SECTION.
000700  SPECIAL-NAMES.
000800      CRT STATUS  IS  画面入力状態.
000900  INPUT-OUTPUT SECTION.
001000  FILE-CONTROL.
001100      SELECT    索引ファイル
001200                ASSIGN       TO  OUTFILE
001300                ORGANIZATION IS  INDEXED
001400                RECORD KEY   IS  従業員番号
001500                ALTERNATE RECORD KEY IS 氏名
001600                ACCESS MODE  IS  RANDOM.
001700*
001800 DATA DIVISION.
001900  FILE SECTION.
002000  FD   索引ファイル.
002100  01   索引レコード.
002200       02  従業員番号    PIC X(6).
002300       02  氏名          PIC N(20).
002400*
002500  WORKING-STORAGE SECTION.
002600  01  画面入力状態.
002700    02  状態キー.
002800      03  状態キー１         PIC X.
002900      03  状態キー２         PIC X.
003000    02                       PIC X.
003100*
003200  CONSTANT SECTION.
003300  01  ＰＦ２キー.
003400    02                       PIC X    VALUE "1".
003500    02                       PIC X    VALUE X"02".
003600*
003700  SCREEN SECTION.
003800  01  表示画面 BLANK SCREEN BACKGROUND-COLOR IS 7
003900                            FOREGROUND-COLOR IS 0.
004000    02                LINE  5 COLUMN 13 VALUE "従業員番号：".
004100    02  従業員番号域  LINE  5 COLUMN 25 FOREGROUND-COLOR IS 1 PIC X(6) TO 従業員番号 AUTO.
004200    02                LINE 10 COLUMN 13 VALUE "氏名：".
004300    02  氏名域        LINE 10 COLUMN 20 FOREGROUND-COLOR IS 1 PIC N(20)  TO 氏名     AUTO.
004400    02  キー説明域    LINE 18 COLUMN 30 FOREGROUND-COLOR IS 4 VALUE "ＰＦ２：終了".
004500*
004600 PROCEDURE DIVISION.
004700*
004800      OPEN OUTPUT 索引ファイル.
004900*
005000  繰り返し位置.
005100** 画面を表示する。
005200      DISPLAY 表示画面.
005300** データを入力する。ＰＦ２キーが押下されたら終了処理へ分岐する。
005400      ACCEPT 表示画面.
005500      IF 状態キー = ＰＦ２キー THEN GO TO 終了処理.
005600** 索引レコードを書き出す。
005700      WRITE 索引レコード.
005800      GO TO 繰り返し位置.
005900*
006000  終了処理.
006100      CLOSE 索引ファイル.
006200      EXIT PROGRAM.
006300  END PROGRAM SAMPLE4.
