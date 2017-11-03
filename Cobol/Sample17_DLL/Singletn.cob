000100*========================================================================
000200*　シングルトンクラス
000300*                                   －サンプルプログラム「会議室予約」－
000400*
000500*　　NEW メソッドをOVERRIDEして，生成されるインスタンスが唯一のものである
000600*　ことを保証する
000700*
000800*　〇継承クラス
000900*　　１）FJBASE
001000*
001100*  ○ファクトリデータ
001200*　　１）管理オブジェクト　　　　－　OBJECT REFERENCE SELF
001300*
001400*　〇ファクトリメソッド
001500*　　１）NEW
001600*
001700*            Copyright 1999-2015 FUJITSU LIMITED
001800*========================================================================
001900 IDENTIFICATION  DIVISION.
002000 CLASS-ID.   シングルトン  INHERITS FJBASE.
002100 ENVIRONMENT     DIVISION.
002200 CONFIGURATION   SECTION.
002300 SPECIAL-NAMES.
002400 REPOSITORY.
002500     CLASS FJBASE.
002600*
002700 FACTORY.
002800 DATA            DIVISION.
002900 WORKING-STORAGE SECTION.
003000  01  管理オブジェクト                OBJECT REFERENCE  SELF.
003100 PROCEDURE       DIVISION.
003200*========================================================================
003300*　NEW
003400*
003500*　　管理オブジェクトは、１つしか生成されないことを保証する。
003600*
003700*　〇入力：なし
003800*　〇出力：管理オブジェクト(OBJECT REFERENCE SELF)
003900*========================================================================
004000 METHOD-ID.  NEW  OVERRIDE.
004100 DATA            DIVISION.
004200 LINKAGE         SECTION.
004300  01 Ｌ－管理オブジェクト            OBJECT REFERENCE SELF.
004400 PROCEDURE       DIVISION
004500                    RETURNING        Ｌ－管理オブジェクト.
004600     IF 管理オブジェクト = NULL THEN
004700       SET 管理オブジェクト  Ｌ－管理オブジェクト   
004800                                  TO  SUPER :: "NEW"
004900       INVOKE  管理オブジェクト   "INIT"
005000     ELSE
005100       SET Ｌ－管理オブジェクト   TO  管理オブジェクト
005200     END-IF
005300 END METHOD NEW.
005400 END FACTORY.
005500 END CLASS  シングルトン.
