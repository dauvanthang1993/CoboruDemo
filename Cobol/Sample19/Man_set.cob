000100*========================================================================
000200*　管理データ設定メソッド　−サンプルプログラム「従業員管理（永続化）」−
000300*
000400*　　　SUPER クラスのデータ設定メソッドを呼び，全従業員に共通なデータを
000500*　　SELFオブジェクトに設定する．
000600*　　　索引ファイルから読み込んだ従業員データのうちの，管理者従業員に固
000700*　　有なデ−タを，SELFのオブジェクトに設定する．
000800*
000900*　〇参照クラス
001000*　　１）従業員マスタクラス  （MemberMaster-class）
001100*    ２）管理者クラス　　　　（Manager-class）　　　　←所属クラス
001200*
001300*                              Copyright 1997-2015 FUJITSU LIMITED
001400*========================================================================
001500  METHOD-ID.  DataSet-method   OF  Manager-class.
001600  ENVIRONMENT         DIVISION.
001700  CONFIGURATION       SECTION.
001800   REPOSITORY.
001900        CLASS  MemberMaster-class
002000        CLASS  Manager-class.
002100  DATA DIVISION.
002200  WORKING-STORAGE SECTION.
002300  LINKAGE SECTION.
002400  PROCEDURE DIVISION.
002500*
002600      INVOKE   SUPER  "DataSet-method".
002700      MOVE   特別手当  OF  MemberMaster-class  TO  特別手当.
002800*
002900  END METHOD DataSet-method.
