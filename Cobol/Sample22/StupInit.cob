000100*=================================================================
000200* 「マルチスレッドプログラミング」
000300*     スレッド間でファイル・データを共用してオンラインショッピング
000400*   のアプリケーションを構築します。
000500*
000600*=================================================================
000700*
000800*  ファイル名： ISAInit.cob
000900*  動作概要  ： ISAPI使用時に必要な初期化プログラムです。
001000*               IISから直接呼び出されます。
001100*
001200* Copyright 1999-2015 FUJITSU LIMITED
001300*=================================================================
001400 identification division.
001500 program-id. "GetExtensionVersion".
001600 environment division.
001700 data division.
001800  working-storage section.
001900 01 オンラインショッピング起動情報 pic 9(1) is external.
002000  linkage section.
002100     copy IsapiInf.
002200*
002300 procedure division with stdcall linkage using ISAPI-INFO.
002400*
002500     move 0 to オンラインショッピング起動情報.
002600*
002700     move 1 to program-status.
002800     exit program.
