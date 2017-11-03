000100*=================================================================
000200*「ＶＢからのＣＯＢＯＬプログラムの呼び出し」
000300*    ＣＯＢＯＬプログラムをＶｉｓｕａｌ　Ｂａｓｉｃのプログラム
000400*  からサブルーチンとして呼び出します。
000500*
000600*=================================================================
000700*
000800*  サブルーチン名：ＳＡＭＰＬＥ１３
000900*    ２つの値を加算した結果をＺＺＺ，ＺＺＺ，ＺＺ９の形式で
001000*  フォーマットした文字列として返します。
001100*
001200*     Copyright 2000-2015 FUJITSU LIMITED.
001300*=================================================================
001400 IDENTIFICATION DIVISION.
001500 PROGRAM-ID.    SAMPLE13.
001600 ENVIRONMENT DIVISION.
001700 DATA DIVISION.
001800 WORKING-STORAGE SECTION.
001900 01 WKDATA PIC S9(9).
002000 LINKAGE SECTION.
002100 01 DATA1 PIC S9(4) COMP-5.
002200 01 DATA2 PIC S9(4) COMP-5.
002300 01 DATA3 PIC ZZZ,ZZZ,ZZ9.
002400 PROCEDURE DIVISION WITH STDCALL LINKAGE USING DATA1 DATA2 DATA3.
002500     COMPUTE WKDATA = DATA1 * DATA2
002600     MOVE WKDATA TO DATA3
002700     EXIT PROGRAM.
