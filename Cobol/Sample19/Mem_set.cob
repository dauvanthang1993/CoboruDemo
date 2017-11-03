000100*========================================================================
000200*　一般データ設定メソッド  －サンプルプログラム「従業員管理（永続化）」－
000300*
000400*　　　SUPER クラスのデータ設定メソッドを呼び，全従業員に共通なデータを
000500*　　SELFオブジェクトに設定する．
000600*　　　索引ファイルから読み込んだ従業員データのうちの，一般従業員に固有
000700*　　なデータを，SELFのオブジェクトに設定する．
000800*
000900*　〇参照クラス
001000*　　１）従業員マスタクラス  （MemberMaster-class）
001100*    ２）一般クラス　　　　　（Member-class）　　　　　←所属クラス
001200*
001300*                              Copyright 1997-2015 FUJITSU LIMITED
001400*========================================================================
001500 METHOD-ID.  DataSet-method  OF Member-class.
001600 ENVIRONMENT         DIVISION.
001700 CONFIGURATION       SECTION.
001800  REPOSITORY.
001900       CLASS  MemberMaster-class
002000       CLASS  Member-class.
002100 DATA DIVISION.
002200 WORKING-STORAGE SECTION.
002300 LINKAGE SECTION.
002400 PROCEDURE DIVISION.
002500*
002600     INVOKE   SUPER  "DataSet-method".
002700     MOVE   時間外手当  OF  MemberMaster-class  TO  時間外手当.
002800     MOVE   残業時間    OF  MemberMaster-class  TO  残業時間.
002900*
003000 END METHOD DataSet-method.
