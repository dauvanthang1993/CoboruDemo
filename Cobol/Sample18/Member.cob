000100*========================================================================
000200*　一般クラス(Member-class）　　　　－サンプルプログラム「従業員管理」－
000300*
000400*　　　一般従業員について固有なデータ及びメソッドを持つ。
000500*
000600*　〇継承クラス
000700*　　１）従業員クラス（AllMember-class）
000800*
000900*　〇オブジェクトデータ
001000*　　１）時間外手当　－　PIC 9(5)
001100*　　２）残業時間  　－　PIC 9(5)
001200*
001300*　〇オブジェクトメソッド
001400*　　１）オブジェクトデータに対する，GET及びSETのプロパティメソッド
001500*　　２）給与計算（Salary-method）
001600*　　３）賞与計算（Bonus-method）
001700*
001800*                              Copyright 1997-2015 FUJITSU LIMITED
001900*========================================================================
002000 CLASS-ID.   Member-class INHERITS  AllMember-class.
002100 ENVIRONMENT    DIVISION.
002200 CONFIGURATION    SECTION.
002300 REPOSITORY.
002400     CLASS AllMember-class.
002500*
002600  OBJECT.
002700  DATA DIVISION.
002800  WORKING-STORAGE SECTION.
002900  01  時間外手当            PIC   9(5)        PROPERTY.
003000  01  残業時間              PIC   9(5)V9(1)   PROPERTY.
003100  PROCEDURE DIVISION.
003200*========================================================================
003300*　給与計算メソッド（OVERRIDE，PROTOTYPE）
003400*
003500*　　　一般従業員に対する給与計算を行う。
003600*
003700*　〇出力：　総支給（PIC 9(8)）
003800*　〇実体：　Sala_mem.cob
003900*========================================================================
004000  METHOD-ID.  Salary-method  PROTOTYPE  OVERRIDE.
004100  DATA DIVISION.
004200  LINKAGE SECTION.
004300   01  Ｌ－総支給          PIC   9(8).
004400  PROCEDURE   DIVISION
004500               RETURNING   Ｌ－総支給.
004600  END METHOD Salary-method.
004700*
004800  END OBJECT.
004900 END CLASS Member-class.
