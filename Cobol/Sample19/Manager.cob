000100*========================================================================
000200*　管理者クラス（Manager-class）　　－サンプルプログラム
000300*　　　　　　　　　　　　　　　　　　　　　　「従業員管理（永続化）」－
000400*
000500*　　　管理者について固有なデータ及びメソッドを持つ。
000600*
000700*　〇継承クラス
000800*　　１）従業員クラス（AllMember-class）
000900*
001000*　〇オブジェクトデータ
001100*　　１）特別手当　－　PIC 9(6)
001200*
001300*　〇オブジェクトメソッド
001400*　　１）オブジェクトデータに対する，GET及びSETのプロパティメソッド
001500*　　２）給与計算メソッド（Salary-method）
001600*　　３）賞与計算メソッド（Bonus-method）
001700*　　４）データ設定      （DataSet-method）
001800*　　５）保存 　　　     （Store-method）
001900*
002000*                              Copyright 1997-2015 FUJITSU LIMITED
002100*========================================================================
002200 CLASS-ID.   Manager-class INHERITS  AllMember-class.
002300 ENVIRONMENT    DIVISION.
002400 CONFIGURATION   SECTION.
002500 REPOSITORY.
002600     CLASS AllMember-class.
002700*
002800   OBJECT.
002900   DATA DIVISION.
003000   WORKING-STORAGE  SECTION.
003100   01  特別手当            PIC   9(006) PROPERTY.
003200   PROCEDURE DIVISION.
003300*========================================================================
003400*　給与計算メソッド（OVERRIDE，PROTOTYPE）
003500*
003600*　　　管理者に対する給与計算を行う。
003700*
003800*　〇出力：　総支給     PIC 9(8)
003900*　〇実体：　Sala_Man.cob
004000*========================================================================
004100   METHOD-ID.     Salary-method  PROTOTYPE  OVERRIDE.
004200   DATA DIVISION.
004300   LINKAGE SECTION.
004400    01  Ｌ－総支給          PIC   9(008).
004500   PROCEDURE   DIVISION
004600                  RETURNING   Ｌ－総支給.
004700   END METHOD  Salary-method.
004800*
004900*========================================================================
005000*　賞与計算メソッド（OVERRIDE，PROTOTYPE）
005100*
005200*　　　管理者に対する賞与計算を行う。
005300*
005400*　〇出力：　総支給    PIC 9(8)
005500*　〇実体：　Bonu_Man.cob
005600*========================================================================
005700   METHOD-ID.  Bonus-method PROTOTYPE OVERRIDE.
005800   DATA DIVISION.
005900   LINKAGE SECTION.
006000    01  Ｌ－総支給          PIC   9(008).
006100   PROCEDURE   DIVISION
006200                RETURNING   Ｌ－総支給.
006300   END METHOD Bonus-method.
006400*
006500*========================================================================
006600*　データ設定メソッド（OVERRIDE,PROTOTYPE）
006700*
006800*　　　従業員データを従業員マスタより読み込み，その情報をSELFのオブジェ
006900*　　クトに反映する。
007000*
007100*　〇実体：　Man_Set.cob
007200*========================================================================
007300   METHOD-ID.  DataSet-method  OVERRIDE  PROTOTYPE.
007400   DATA DIVISION.
007500   LINKAGE SECTION.
007600   PROCEDURE DIVISION.
007700   END METHOD DataSet-method.
007800*
007900*========================================================================
008000*　保存メソッド（OVERRIDE,PROTOTYPE）
008100*
008200*　  　SELFのオブジェクトが保持する従業員データを，従業員マスタに保存す
008300*　　る。
008400*
008500*　〇実体：　Man_Stor.cob
008600*========================================================================
008700   METHOD-ID.  Store-method  OVERRIDE  PROTOTYPE.
008800   DATA DIVISION.
008900   LINKAGE SECTION.
009000   PROCEDURE DIVISION.
009100   END METHOD Store-method.
009200*
009300   END OBJECT.
009400  END CLASS Manager-class.
