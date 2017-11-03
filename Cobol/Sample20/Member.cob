000010*========================================================================
000020*　一般クラス（Member-class）
000030*　　　　　　　　　　　　－サンプルプログラム「従業員管理（永続化）」－
000040*
000050*　　　一般従業員について固有なデータ及びメソッドを持つ。
000060*
000070*　〇継承クラス
000080*　　１）従業員クラス（AllMember-class）
000090*
000100*　〇オブジェクトデータ
000110*　　１）時間外手当　－　PIC S9(5)
000120*　　２）残業時間  　－　PIC S9(5)
000130*
000140*　〇オブジェクトメソッド
000150*　　１）オブジェクトデータに対する，GET及びSETのプロパティメソッド
000160*　　２）給与計算   （Salary-method）
000170*　　３）賞与計算   （Bonus-method）
000180*　　４）データ設定 （DataSet-method）
000190*　　５）保存　　　 （Store-method）
000200*
000210*                              Copyright 1998-2015 FUJITSU LIMITED
000220*========================================================================
000230 CLASS-ID.   Member-class INHERITS  AllMember-class.
000240 ENVIRONMENT    DIVISION.
000250 CONFIGURATION    SECTION.
000260 REPOSITORY.
000270      CLASS AllMember-class.
000280*
000290   OBJECT.
000300   DATA DIVISION.
000310   WORKING-STORAGE SECTION.
000320   01  時間外手当            PIC   S9(5)        PROPERTY.
000330   01  残業時間              PIC   S9(5)V9(1)   PROPERTY.
000340   PROCEDURE DIVISION.
000350*========================================================================
000360*　給与計算メソッド（OVERRIDE，PROTOTYPE）
000370*
000380*　　　一般従業員に対する給与計算を行う。
000390*
000400*　〇出力：　総支給   PIC S9(8)
000410*　〇実体：　Sala_Mem.cob
000420*========================================================================
000430   METHOD-ID.  Salary-method  PROTOTYPE  OVERRIDE.
000440   DATA DIVISION.
000450   LINKAGE SECTION.
000460    01  Ｌ－総支給          PIC   S9(8).
000470   PROCEDURE   DIVISION
000480                RETURNING   Ｌ－総支給.
000490   END METHOD Salary-method.
000500*
000510*========================================================================
000520*　賞与計算メソッド（OVERRIDE，PROTOTYPE）
000530*
000540*　　　一般従業員に対する賞与計算を行う。
000550*
000560*　〇出力：　総支給    PIC S9(8)
000570*　〇実体：　Boun_Mem.cob
000580*========================================================================
000590   METHOD-ID.  Bonus-method  PROTOTYPE  OVERRIDE.
000600   DATA DIVISION.
000610   LINKAGE SECTION.
000620    01  Ｌ－総支給          PIC   S9(8).
000630   PROCEDURE   DIVISION
000640                RETURNING   Ｌ－総支給.
000650   END METHOD Bonus-method.
000660*
000670*========================================================================
000680*　データ設定メソッド（OVERRIDE,PROTOTYPE）
000690*
000700*　　　従業員データを従業員表より読み込み，その情報をSELFのオブジェクトに
000710*　　反映する。
000720*
000730*　〇実体：　Mem_Set.cob
000740*========================================================================
000750   METHOD-ID.  DataSet-method  OVERRIDE  PROTOTYPE.
000760   DATA DIVISION.
000770   LINKAGE SECTION.
000780   PROCEDURE DIVISION.
000790   END METHOD DataSet-method.
000800*
000810*========================================================================
000820*　保存メソッド（OVERRIDE,PROTOTYPE）
000830*
000840*　  　SELFのオブジェクトが保持する従業員データを，従業員表に保存する。
000850*
000860*　〇実体：　Mem_Stor.cob
000870*========================================================================
000880   METHOD-ID.  Store-method  OVERRIDE  PROTOTYPE.
000890   DATA DIVISION.
000900   LINKAGE SECTION.
000910   PROCEDURE DIVISION.
000920   END METHOD Store-method.
000930*
000940   END OBJECT.
000950  END CLASS Member-class.
