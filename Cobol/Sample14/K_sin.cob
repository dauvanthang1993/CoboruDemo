000100* Copyright 1992-2015 FUJITSU LIMITED
000200 IDENTIFICATION DIVISION.
000300 PROGRAM-ID. K_SIN.
000400*
000500 ENVIRONMENT DIVISION.
000600 CONFIGURATION SECTION.
000700 INPUT-OUTPUT SECTION.
000800 FILE-CONTROL.
000900      SELECT OPTIONAL 貯金ファイル
001000                ASSIGN  TO "tyokin.dat"
001100                ORGANIZATION IS  INDEXED
001200                RECORD KEY   IS  口座番号
001300                ACCESS MODE  IS  RANDOM.
001400*
001500 DATA DIVISION.
001600 FILE SECTION.
001700 FD   貯金ファイル.
001800 01   貯金レコード.
001900      03 口座番号     PIC  9(5).
002000      03 暗証番号     PIC  9(4).
002100      03 氏名         PIC  N(6).
002200      03 貯金額       PIC  9(9).   
002300*
002400 WORKING-STORAGE SECTION.
002500 77 新規口座数        PIC  9(6).
002600 77 新規口座チェック  PIC  9(4).
002700*
002800 LINKAGE SECTION.
002900 01 ＶＢ氏名          PIC  N(6).
003000 01 ＶＢ貯金額        PIC S9(9) COMP-5.
003100 01 ＶＢ暗証番号      PIC S9(4) COMP-5.
003200 01 ＶＢ口座番号      PIC  X(5).
003300 01 エラー番号        PIC  9(4) COMP-5.
003400*
003500 PROCEDURE DIVISION WITH STDCALL LINKAGE 
003600      USING ＶＢ氏名 ＶＢ貯金額 ＶＢ暗証番号 ＶＢ口座番号 エラー番号.
003700*
003800      OPEN I-O 貯金ファイル
003900*
004000      MOVE 0 TO 新規口座チェック
004100      MOVE 1 TO 口座番号
004200*
004300* 使用されている口座番号を読み飛ばしていき
004400* 口座番号が発見できなくなるまで口座番号を＋１していき
004500* 発見できなくなった時点の口座番号を新規口座番号とする
004600*
004700      PERFORM UNTIL 新規口座チェック NOT = 0
004800            READ 貯金ファイル
004900                  INVALID KEY
005000                        MOVE 口座番号 TO 新規口座数
005100                        MOVE 1 TO 新規口座チェック
005200                  NOT INVALID KEY
005300                        ADD 1 TO 口座番号
005400            END-READ
005500      END-PERFORM
005600*
005700      PERFORM 口座数チェック
005800*
005900      MOVE ＶＢ貯金額 TO 貯金額
006000      MOVE ＶＢ暗証番号 TO 暗証番号
006100      MOVE ＶＢ氏名 TO 氏名
006200*
006300      MOVE 氏名 TO ＶＢ氏名
006400      MOVE 口座番号 TO ＶＢ口座番号
006500*
006600      MOVE 0 TO エラー番号
006700      WRITE 貯金レコード
006800      CLOSE 貯金ファイル
006900      EXIT PROGRAM.
007000*
007100*新規口座が口座数の制限をオーバーしていないかチェック
007200 口座数チェック.
007300      IF 新規口座数 > 50
007400            MOVE 11 TO エラー番号
007500            CLOSE 貯金ファイル
007600            EXIT PROGRAM
007700      END-IF
007800      MOVE 新規口座数 TO 口座番号.
007900
