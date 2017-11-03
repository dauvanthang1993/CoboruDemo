000100*=================================================================
000200* 「マルチスレッドプログラミング」
000300*     スレッド間でファイル・データを共用してオンラインショッピング
000400*   のアプリケーションを構築します。
000500*
000600*=================================================================
000700*
000800*  ファイル名： ISATerm.cob
000900*  動作概要  ： ISAPI使用時に必要な終了処理プログラムです。
001000*               IISから直接呼び出されます。
001100*
001200* Copyright 1999-2015 FUJITSU LIMITED
001300*=================================================================
001400 identification division.
001500 program-id. "TerminateExtension".
001600 environment division.
001700 data division.
001800  linkage section.
001900     copy IsapiFlg.
002000*
002100 procedure division with stdcall linkage using ISAPI-FLAG.
002200*
002300     move 1 to program-status.
002400     exit program.
