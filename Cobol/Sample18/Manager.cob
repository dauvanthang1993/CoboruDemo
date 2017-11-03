000100*========================================================================
000200*　管理者クラス（Manager-class）　　－サンプルプログラム「従業員管理」－
000300*
000400*　　　管理者について固有なデータ及びメソッドを持つ。
000500*
000600*　〇継承クラス
000700*　　１）従業員クラス（AllMember-class）
000800*
000900*　〇オブジェクトデータ
001000*　　１）特別手当　－　PIC 9(6)
001100*
001200*　〇オブジェクトメソッド
001300*　　１）オブジェクトデータに対する，GET及びSETのプロパティメソッド
001400*　　２）給与計算メソッド（Salary-method）
001500*　　３）賞与計算メソッド（Bonus-method）
001600*
001700*                              Copyright 1997-2015 FUJITSU LIMITED
001800*========================================================================
001900 CLASS-ID.   Manager-class INHERITS  AllMember-class.
002000 ENVIRONMENT    DIVISION.
002100 CONFIGURATION  SECTION.
002200 REPOSITORY.
002300     CLASS AllMember-class.
002400*
002500  OBJECT.
002600  DATA DIVISION.
002700  WORKING-STORAGE SECTION.
002800  01  特別手当            PIC   9(006) PROPERTY.
002900  PROCEDURE DIVISION.
003000*========================================================================
003100*　給与計算メソッド（OVERRIDE，PROTOTYPE）
003200*
003300*　　　管理者に対する給与計算を行う。
003400*
003500*　〇出力：　総支給（PIC 9(8)）
003600*　〇実体：　Sala_man.cob
003700*========================================================================
003800  METHOD-ID.     Salary-method  PROTOTYPE OVERRIDE.
003900  DATA DIVISION.
004000  LINKAGE SECTION.
004100   01  Ｌ－総支給          PIC   9(008).
004200  PROCEDURE   DIVISION
004300                 RETURNING   Ｌ－総支給.
004400  END METHOD  Salary-method.
004500*
004600*========================================================================
004700*　賞与計算メソッド（OVERRIDE，PROTOTYPE）
004800*
004900*　　　管理者に対する賞与計算を行う。
005000*
005100*　〇出力：　総支給（PIC 9(8)）
005200*　〇実体：　Bonu_man.cob
005300*========================================================================
005400  METHOD-ID.  Bonus-method PROTOTYPE OVERRIDE.
005500  DATA DIVISION.
005600  LINKAGE SECTION.
005700   01  Ｌ－総支給          PIC   9(008).
005800  PROCEDURE   DIVISION
005900               RETURNING   Ｌ－総支給.
006000  END METHOD Bonus-method.
006100*
006200  END OBJECT.
006300 END CLASS Manager-class.
