000100*========================================================================
000200*　住所クラス（Addr）
000300*　　　　　　　　　　　　　−オブジェクト指向機能サンプルプログラム−
000400*
000500*　　　従業員ひとりに対する住所データと，それを参照・更新するためのメソ
000600*	   ッドを持つ。
000700*
000800*　〇継承クラス
000900*　　　Ｆｊｂａｓｅ
001000*
001100*　〇オブジェクトデータ
001200*　　　１）郵便番号
001300*　　　２）住所
001400*
001500*　〇オブジェクトメソッド
001600*　　　１）住所データ設定　　（Data-Set）
001700*　　　２）住所データ取得　　（Data-Get）
001800*
001900*          Copyright 1997-2015 FUJITSU LIMITED
002000*========================================================================
002100 CLASS-ID.   Addr INHERITS FJBASE.
002200 ENVIRONMENT    DIVISION.
002300 CONFIGURATION    SECTION.
002400 REPOSITORY.
002500     CLASS FJBASE.
002600*
002700   OBJECT.
002800   DATA DIVISION.
002900   WORKING-STORAGE SECTION.
003000   01  郵便番号             PIC   X(007).
003100   01  住所                 PIC   N(015).
003200   PROCEDURE DIVISION.
003300*========================================================================
003400*　データ設定
003500*
003600*　　住所データを設定する。
003700*
003800*　〇出力：　郵便番号　    PIC   X(007)
003900*　　　　　　住所　　　    PIC   N(015)
004000*========================================================================
004100   METHOD-ID.  Data-Set.
004200   DATA DIVISION.
004300   LINKAGE SECTION.
004400    01  Ｌ−郵便番号     PIC X(07).
004500    01  Ｌ−住所         PIC N(15).
004600   PROCEDURE   DIVISION  USING  Ｌ−郵便番号  Ｌ−住所.
004700*
004800       MOVE  Ｌ−郵便番号     TO  郵便番号.
004900       MOVE  Ｌ−住所         TO  住所.
005000*
005100   END METHOD Data-Set.
005200*
005300*========================================================================
005400*　データ取得
005500*
005600*　　住所データを返却する。
005700*
005800*　〇出力：　住所データ
005900*　　　  　　　郵便番号　    PIC   X(007)
006000*　　　　  　　住所　　　    PIC   N(015)
006100*========================================================================
006200   METHOD-ID.  Data-Get.
006300   DATA DIVISION.
006400   LINKAGE SECTION.
006500    01  Ｌ−住所データ.
006600      02  Ｌ−郵便番号     PIC X(07).
006700      02  Ｌ−住所         PIC N(15).
006800   PROCEDURE   DIVISION    RETURNING  Ｌ−住所データ.
006900*
007000       MOVE  郵便番号         TO  Ｌ−郵便番号.
007100       MOVE  住所             TO  Ｌ−住所.
007200*
007300   END METHOD Data-Get.
007400*
007500   END OBJECT.
007600 END CLASS Addr.
