000100*========================================================================
000200*　一般クラス（Member-class）
000300*　　　　　　　　　　　　－サンプルプログラム「従業員管理（永続化）」－
000400*
000500*　　　一般従業員について固有なデータ及びメソッドを持つ。
000600*
000700*　〇継承クラス
000800*　　１）従業員クラス（AllMember-class）
000900*
001000*　〇オブジェクトデータ
001100*　　１）時間外手当　－　PIC 9(5)
001200*　　２）残業時間  　－　PIC 9(5)
001300*
001400*　〇オブジェクトメソッド
001500*　　１）オブジェクトデータに対する，GET及びSETのプロパティメソッド
001600*　　２）給与計算   （Salary-method）
001700*　　３）賞与計算   （Bonus-method）
001800*　　４）データ設定 （DataSet-method）
001900*　　５）保存　　　 （Store-method）
002000*
002100*                              Copyright 1997-2015 FUJITSU LIMITED
002200*========================================================================
002300 CLASS-ID.   Member-class INHERITS  AllMember-class.
002400 ENVIRONMENT    DIVISION.
002500 CONFIGURATION    SECTION.
002600 REPOSITORY.
002700      CLASS AllMember-class.
002800*
002900   OBJECT.
003000   DATA DIVISION.
003100   WORKING-STORAGE SECTION.
003200   01  時間外手当            PIC   9(5)        PROPERTY.
003300   01  残業時間              PIC   9(5)V9(1)   PROPERTY.
003400   PROCEDURE DIVISION.
003500*========================================================================
003600*　給与計算メソッド（OVERRIDE，PROTOTYPE）
003700*
003800*　　　一般従業員に対する給与計算を行う。
003900*
004000*　〇出力：　総支給   PIC 9(8)
004100*　〇実体：　Sala_Mem.cob
004200*========================================================================
004300   METHOD-ID.  Salary-method  PROTOTYPE  OVERRIDE.
004400   DATA DIVISION.
004500   LINKAGE SECTION.
004600    01  Ｌ－総支給          PIC   9(8).
004700   PROCEDURE   DIVISION
004800                RETURNING   Ｌ－総支給.
004900   END METHOD Salary-method.
005000*
005100*========================================================================
005200*　賞与計算メソッド（OVERRIDE，PROTOTYPE）
005300*
005400*　　　一般従業員に対する賞与計算を行う。
005500*
005600*　〇出力：　総支給    PIC 9(8)
005700*　〇実体：　Bonu_Mem.cob
005800*========================================================================
005900   METHOD-ID.  Bonus-method  PROTOTYPE  OVERRIDE.
006000   DATA DIVISION.
006100   LINKAGE SECTION.
006200    01  Ｌ－総支給          PIC   9(8).
006300   PROCEDURE   DIVISION
006400                RETURNING   Ｌ－総支給.
006500   END METHOD Bonus-method.
006600*
006700*========================================================================
006800*　データ設定メソッド（OVERRIDE,PROTOTYPE）
006900*
007000*　　　従業員データを従業員マスタより読み込み，その情報をSELFのオブジェ
007100*　　クトに反映する。
007200*
007300*　〇実体：　Mem_Set.cob
007400*========================================================================
007500   METHOD-ID.  DataSet-method  OVERRIDE  PROTOTYPE.
007600   DATA DIVISION.
007700   LINKAGE SECTION.
007800   PROCEDURE DIVISION.
007900   END METHOD DataSet-method.
008000*
008100*========================================================================
008200*　保存メソッド（OVERRIDE,PROTOTYPE）
008300*
008400*　  　SELFのオブジェクトが保持する従業員データを，従業員マスタに保存す
008500*　　る。
008600*
008700*　〇実体：　Mem_Stor.cob
008800*========================================================================
008900   METHOD-ID.  Store-method  OVERRIDE  PROTOTYPE.
009000   DATA DIVISION.
009100   LINKAGE SECTION.
009200   PROCEDURE DIVISION.
009300   END METHOD Store-method.
009400*
009500   END OBJECT.
009600  END CLASS Member-class.
