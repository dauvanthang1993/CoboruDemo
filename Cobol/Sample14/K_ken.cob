000100* Copyright 1992-2015 FUJITSU LIMITED
000200 IDENTIFICATION DIVISION.
000300 PROGRAM-ID. K_KEN.
000400*
000500 ENVIRONMENT   DIVISION.
000600 CONFIGURATION SECTION.
000700 INPUT-OUTPUT  SECTION.
000800 FILE-CONTROL.
000900      SELECT  貯金ファイル
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
002500 77 暗証チェック      PIC  9(4).
002600*
002700 LINKAGE SECTION.
002800 01 ＶＢ口座番号      PIC  9(5) COMP-5.
002900 01 ＶＢ暗証番号      PIC S9(4) COMP-5.
003000 01 ＶＢ氏名          PIC  N(6).
003100 01 ＶＢ貯金額        PIC S9(9) COMP-5.
003200 01 エラー番号        PIC  9(4) COMP-5.
003300*
003400 PROCEDURE DIVISION WITH STDCALL LINKAGE
003500      USING ＶＢ口座番号 ＶＢ暗証番号 ＶＢ氏名 ＶＢ貯金額 エラー番号.
003600*
003700      OPEN I-O 貯金ファイル
003800*
003900      MOVE ＶＢ口座番号 TO 口座番号
004000*
004100      READ 貯金ファイル
004200            INVALID KEY
004300                  MOVE 7 TO エラー番号
004400                  PERFORM ファイルを閉じる
004500                  EXIT PROGRAM
004600            NOT INVALID KEY
004700                  PERFORM 暗証番号チェック
004800                  PERFORM 貯金データ設定
004900      END-READ
005000      PERFORM ファイルを閉じる
005100      EXIT PROGRAM.
005200*
005300*入力された暗証番号がレコード上の暗証番号と一致しているかチェック
005400*
005500 暗証番号チェック.
005600      COMPUTE 暗証チェック = ＶＢ暗証番号 - 暗証番号
005700      IF 暗証チェック NOT = 0
005800            MOVE 8 TO エラー番号
005900            PERFORM ファイルを閉じる
006000            EXIT PROGRAM
006100      END-IF.
006200
006300 貯金データ設定.
006400
006500      MOVE 口座番号 TO ＶＢ口座番号
006600      MOVE 氏名     TO ＶＢ氏名
006700      MOVE 貯金額   TO ＶＢ貯金額
006800      MOVE 0        TO エラー番号.
006900
007000 ファイルを閉じる.
007100      CLOSE 貯金ファイル.
