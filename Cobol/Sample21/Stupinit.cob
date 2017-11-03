000100*=================================================================
000200* 「マルチスレッドプログラミング」
000300*     スレッド間でファイル・データを共用して認証処理を実現します
000400*
000500*=================================================================
000600*
000700*  ファイル名： ISAInit.cob
000800*  動作概要  ： ISAPI使用時に必要な初期化プログラムです。
000900*               IISから直接呼び出されます。
001000*
001100* Copyright 1999-2015 FUJITSU LIMITED
001200*=================================================================
001300 identification division.
001400 program-id. "GetExtensionVersion".
001500 environment division.
001600 data division.
001700  working-storage section.
001800 01 認証サービス起動情報 pic 9(1) is external.
001900  linkage section.
002000     copy IsapiInf.
002100*
002200 procedure division with stdcall linkage using ISAPI-INFO.
002300*
002400     move 0 to 認証サービス起動情報.
002500*
002600     move 1 to program-status.
002700     exit program.
