000010*=======================================================================
000020*　管理給与計算メソッド　　　　　　－サンプルプログラム「従業員管理」－
000030*
000040*　　　管理者に対する給与計算を行う。
000050*
000060*　〇所属クラス：　管理者クラス
000070*　〇出力　　　：　総支給（PIC S9(8)）
000080*
000090*                              Copyright 1998-2015 FUJITSU LIMITED
000100*=======================================================================
000110 METHOD-ID.  Salary-method  OF Manager-class.
000120 ENVIRONMENT        DIVISION.
000130 CONFIGURATION      SECTION.
000140   REPOSITORY.
000150       CLASS  Manager-class.
000160 DATA DIVISION.
000170 WORKING-STORAGE    SECTION.
000180  01  Ｗ－基本給         PIC   S9(008).
000190 LINKAGE SECTION.
000200  01  Ｌ－総支給         PIC   S9(008).
000210 PROCEDURE   DIVISION    RETURNING   Ｌ－総支給.
000220*
000230     MOVE   基本給  OF  SELF     TO    Ｗ－基本給.
000240     COMPUTE  Ｌ－総支給   =   Ｗ－基本給  +  特別手当.
000250*
000260 END METHOD Salary-method.
