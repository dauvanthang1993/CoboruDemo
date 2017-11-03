000100*========================================================================
000200*　給与計算メソッド　　　　　　　　　－サンプルプログラム「従業員管理」－
000300*
000400*　　　管理者に対する給与計算を行う。
000500*
000600*　〇所属クラス：　管理者クラス
000700*　〇OVERRIDEメソッド（従業員クラス）
000800*　〇出力　　　：　総支給（PIC 9(8)）
000900*                              Copyright 1997-2015 FUJITSU LIMITED
001000*========================================================================
001100 METHOD-ID.  Salary-method  OF  Manager-class.
001200 ENVIRONMENT        DIVISION.
001300 CONFIGURATION      SECTION.
001400   REPOSITORY.
001500       CLASS  Manager-class.
001600 DATA DIVISION.
001700 WORKING-STORAGE    SECTION.
001800  01  Ｗ－基本給      PIC   9(008).
001900 LINKAGE SECTION.
002000  01  Ｌ－総支給      PIC   9(008).
002100 PROCEDURE   DIVISION    RETURNING   Ｌ－総支給.
002200*
002300     INVOKE  SUPER  "Salary-method"  RETURNING  Ｗ－基本給.
002400     COMPUTE  Ｌ－総支給   =   Ｗ－基本給  +  特別手当.
002500*
002600 END METHOD Salary-method.
