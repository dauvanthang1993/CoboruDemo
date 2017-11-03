000100*========================================================================
000200*　管理保存メソッド   　   −サンプルプログラム「従業員管理（永続化）」−
000300*
000400*　　　SELFオブジェクトが保持する管理者従業員に固有なデータを，従業員マ
000500*　　スタクラスのファクトリオブジェクトに設定する．
000600*　　　SUPER クラスのデータ保存メソッドを呼びだす。
000700*
000800*　〇参照クラス
000900*　　１）従業員マスタクラス  （MemberMaster-class）
001000*    ２）管理者クラス　　　　（Manager-class）　　　　　←所属クラス
001100*
001200*                              Copyright 1997-2015 FUJITSU LIMITED
001300*========================================================================
001400 METHOD-ID.  Store-method  OF Manager-class.
001500 ENVIRONMENT         DIVISION.
001600 CONFIGURATION       SECTION.
001700  REPOSITORY.
001800       CLASS  MemberMaster-class
001900       CLASS  Manager-class.
002000 DATA DIVISION.
002100 WORKING-STORAGE SECTION.
002200 LINKAGE SECTION.
002300 PROCEDURE DIVISION.
002400*
002500     MOVE   特別手当  TO  特別手当  OF  MemberMaster-class.
002600     INVOKE   SUPER  "Store-method".
002700*
002800 END METHOD Store-method.
