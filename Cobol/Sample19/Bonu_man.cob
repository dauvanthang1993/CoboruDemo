000100*========================================================================
000200*　賞与計算メソッド　　　　－サンプルプログラム「従業員管理（永続化）」－
000300*
000400*　　　管理者に対する賞与計算を行う。
000500*
000600*　〇所属クラス：　一般クラス
000700*　〇OVERRIDEメソッド（従業員クラス）
000800*　〇出力　　　：　総支給（PIC 9(8)）
000900*
001000*                              Copyright 1997-2015 FUJITSU LIMITED
001100*========================================================================
001200  METHOD-ID.  Bonus-method OF Manager-class.
001300  ENVIRONMENT         DIVISION.
001400  CONFIGURATION       SECTION.
001500    REPOSITORY.
001600        CLASS  Manager-class.
001700  DATA DIVISION.
001800  WORKING-STORAGE     SECTION.
001900   01  Ｗ－基本給          PIC   9(008).
002000  LINKAGE SECTION.
002100   01  Ｌ－総支給          PIC   9(008).
002200  PROCEDURE   DIVISION     RETURNING  Ｌ－総支給.
002300*
002400      MOVE   基本給  OF  SELF      TO    Ｗ－基本給.
002500      COMPUTE  Ｌ－総支給   =  (Ｗ－基本給 +  特別手当)  *  2.5.
002600*
002700  END METHOD Bonus-method.
