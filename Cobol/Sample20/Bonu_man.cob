000010*========================================================================
000020*　賞与計算メソッド　　　　－サンプルプログラム「従業員管理（永続化）」－
000030*
000040*　　　管理者に対する賞与計算を行う。
000050*
000060*　〇所属クラス：　一般クラス
000070*　〇OVERRIDEメソッド（従業員クラス）
000080*　〇出力　　　：　総支給（PIC S9(8)）
000090*
000100*                              Copyright 1998-2015 FUJITSU LIMITED
000110*========================================================================
000120  METHOD-ID.  Bonus-method OF Manager-class.
000130  ENVIRONMENT         DIVISION.
000140  CONFIGURATION       SECTION.
000150    REPOSITORY.
000160        CLASS  Manager-class.
000170  DATA DIVISION.
000180  WORKING-STORAGE     SECTION.
000190   01  Ｗ－基本給          PIC   S9(008).
000200  LINKAGE SECTION.
000210   01  Ｌ－総支給          PIC   S9(008).
000220  PROCEDURE   DIVISION     RETURNING  Ｌ－総支給.
000230*
000240      MOVE   基本給  OF  SELF      TO    Ｗ－基本給.
000250      COMPUTE  Ｌ－総支給   =  (Ｗ－基本給 +  特別手当)  *  2.5.
000260*
000270  END METHOD Bonus-method.
