000010*========================================================================
000020*　一般保存メソッド　　　　－サンプルプログラム「従業員管理（永続化）」－
000030*
000040*　　　SELFオブジェクトが保持する一般従業員に固有なデータを，従業員マス
000050*　　タクラスのファクトリデータに設定する．
000060*　　　SUPER クラスのデータ保存メソッドを呼びだす。
000070*
000080*　〇参照クラス
000090*　　１）従業員マスタクラス  （MemberMaster-class）
000100*    ２）一般クラス　　　　　（Member-class）　　　　　←所属クラス
000110*
000120*                              Copyright 1998-2015 FUJITSU LIMITED
000130*========================================================================
000140 METHOD-ID.  Store-method  OF Member-class.
000150 ENVIRONMENT         DIVISION.
000160 CONFIGURATION       SECTION.
000170  REPOSITORY.
000180       CLASS  MemberMaster-class
000190       CLASS  Member-class.
000200 DATA DIVISION.
000210 WORKING-STORAGE SECTION.
000220 LINKAGE SECTION.
000230 PROCEDURE DIVISION.
000240*
000250     MOVE   時間外手当  TO  時間外手当  OF  MemberMaster-class.
000260     MOVE   残業時間    TO  残業時間    OF  MemberMaster-class.
000270     INVOKE   SUPER  "Store-method".
000280*
000290 END METHOD Store-method.
