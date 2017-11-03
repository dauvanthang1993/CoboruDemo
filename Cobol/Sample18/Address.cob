000100*========================================================================
000200*　住所クラス（Address-class）　　　－サンプルプログラム「従業員管理」－
000300*
000400*　　　従業員ひとりに対する住所データと，それを参照・更新するためのメソ
000500*　　ッドを持つ。
000600*
000700*　〇継承クラス
000800*　　　Ｆｊｂａｓｅ
000900*
001000*　〇オブジェクトデータ
001100*　　　郵便番号
001200*　　　住所
001300*
001400*　〇オブジェクトメソッド
001500*　　　オブジェクトデータに対する，GET及びSETのプロパティメソッド
001600*
001700*                              Copyright 1997-2015 FUJITSU LIMITED
001800*========================================================================
001900 CLASS-ID.   Address-class INHERITS FJBASE.
002000 ENVIRONMENT    DIVISION.
002100 CONFIGURATION  SECTION.
002200 REPOSITORY.
002300     CLASS FJBASE.
002400*
002500   OBJECT.
002600   DATA DIVISION.
002700   WORKING-STORAGE SECTION.
002800   01  郵便番号             PIC   X(007) PROPERTY.
002900   01  住所                 PIC   N(020) PROPERTY.
003000   PROCEDURE DIVISION.
003100*
003200   END OBJECT.
003300  END CLASS Address-class.
