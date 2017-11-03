000010*========================================================================
000020*　管理データ設定メソッド　－サンプルプログラム「従業員管理（永続化）」－
000030*
000040*　　　SUPER クラスのデータ設定メソッドを呼び，全従業員に共通なデータを
000050*　　SELFオブジェクトに設定する．
000060*　　　索引ファイルから読み込んだ従業員データのうちの，管理者従業員に固
000070*　　有なデ－タを，SELFのオブジェクトに設定する．
000080*
000090*　〇参照クラス
000100*　　１）従業員マスタクラス  （MemberMaster-class）
000110*    ２）管理者クラス　　　　（Manager-class）　　　　←所属クラス
000120*
000130*                              Copyright 1998-2015 FUJITSU LIMITED
000140*========================================================================
000150  METHOD-ID.  DataSet-method   OF  Manager-class.
000160  ENVIRONMENT         DIVISION.
000170  CONFIGURATION       SECTION.
000180   REPOSITORY.
000190        CLASS  MemberMaster-class
000200        CLASS  Manager-class.
000210  DATA DIVISION.
000220  WORKING-STORAGE SECTION.
000230  LINKAGE SECTION.
000240  PROCEDURE DIVISION.
000250*
000260      INVOKE   SUPER  "DataSet-method".
000270      MOVE   特別手当  OF  MemberMaster-class  TO  特別手当.
000280*
000290  END METHOD DataSet-method.
