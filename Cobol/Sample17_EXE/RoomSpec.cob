000100*========================================================================
000200*　会議室情報クラス
000300*                                   －サンプルプログラム「会議室予約」－
000400*
000500*　　会議室情報（会議室名、定員、内線といった会議室固有の情報）について
000600*　固有なデータ及びメソッドを持つ。
000700*
000800*　〇継承クラス
000900*　　１）仕様クラス
001000*
001100*            Copyright 1999-2015 FUJITSU LIMITED
001200*========================================================================
001300 IDENTIFICATION  DIVISION.
001400 CLASS-ID.   会議室情報クラス  INHERITS 仕様クラス.
001500 ENVIRONMENT     DIVISION.
001600 CONFIGURATION   SECTION.
001700 REPOSITORY.
001800     CLASS 仕様クラス
001900     .
002000 FACTORY.
002100 DATA            DIVISION.
002200 BASED-STORAGE   SECTION.
002300 WORKING-STORAGE SECTION.
002400 PROCEDURE       DIVISION.
002500 END FACTORY.
002600*
002700 OBJECT.
002800 DATA DIVISION.
002900 BASED-STORAGE   SECTION.
003000 WORKING-STORAGE SECTION.
003100 END OBJECT.
003200 END CLASS  会議室情報クラス.
