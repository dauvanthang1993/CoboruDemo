000010*========================================================================
000020*　管理者クラス（Manager-class）　　－サンプルプログラム
000030*　　　　　　　　　　　　　　　　　　　　　　「従業員管理（永続化）」－
000040*
000050*　　　管理者について固有なデータ及びメソッドを持つ。
000060*
000070*　〇継承クラス
000080*　　１）従業員クラス（AllMember-class）
000090*
000100*　〇オブジェクトデータ
000110*　　１）特別手当　－　PIC S9(6)
000120*
000130*　〇オブジェクトメソッド
000140*　　１）オブジェクトデータに対する，GET及びSETのプロパティメソッド
000150*　　２）給与計算メソッド（Salary-method）
000160*　　３）賞与計算メソッド（Bonus-method）
000170*　　４）データ設定      （DataSet-method）
000180*　　５）保存 　　　     （Store-method）
000190*
000200*                              Copyright 1998-2015 FUJITSU LIMITED
000210*========================================================================
000220 CLASS-ID.   Manager-class INHERITS  AllMember-class.
000230 ENVIRONMENT    DIVISION.
000240 CONFIGURATION   SECTION.
000250 REPOSITORY.
000260     CLASS AllMember-class.
000270*
000280   OBJECT.
000290   DATA DIVISION.
000300   WORKING-STORAGE  SECTION.
000310   01  特別手当            PIC   S9(006) PROPERTY.
000320   PROCEDURE DIVISION.
000330*========================================================================
000340*　給与計算メソッド（OVERRIDE，PROTOTYPE）
000350*
000360*　　　管理者に対する給与計算を行う。
000370*
000380*　〇出力：　総支給     PIC S9(8)
000390*　〇実体：　Sala_Man.cob
000400*========================================================================
000410   METHOD-ID.     Salary-method  PROTOTYPE  OVERRIDE.
000420   DATA DIVISION.
000430   LINKAGE SECTION.
000440    01  Ｌ－総支給          PIC  S9(008).
000450   PROCEDURE   DIVISION
000460                  RETURNING   Ｌ－総支給.
000470   END METHOD  Salary-method.
000480*
000490*========================================================================
000500*　賞与計算メソッド（OVERRIDE，PROTOTYPE）
000510*
000520*　　　管理者に対する賞与計算を行う。
000530*
000540*　〇出力：　総支給    PIC S9(8)
000550*　〇実体：　Boun_Man.cob
000560*========================================================================
000570   METHOD-ID.  Bonus-method PROTOTYPE OVERRIDE.
000580   DATA DIVISION.
000590   LINKAGE SECTION.
000600    01  Ｌ－総支給          PIC   S9(008).
000610   PROCEDURE   DIVISION
000620                RETURNING   Ｌ－総支給.
000630   END METHOD Bonus-method.
000640*
000650*========================================================================
000660*　データ設定メソッド（OVERRIDE,PROTOTYPE）
000670*
000680*　　　従業員データを従業員表より読み込み，その情報をSELFのオブジェクトに
000690*　　反映する。
000700*
000710*　〇実体：　Man_Set.cob
000720*========================================================================
000730   METHOD-ID.  DataSet-method  OVERRIDE  PROTOTYPE.
000740   DATA DIVISION.
000750   LINKAGE SECTION.
000760   PROCEDURE DIVISION.
000770   END METHOD DataSet-method.
000780*
000790*========================================================================
000800*　保存メソッド（OVERRIDE,PROTOTYPE）
000810*
000820*　  　SELFのオブジェクトが保持する従業員データを，従業員表に保存する。
000830*
000840*　〇実体：　Man_Stor.cob
000850*========================================================================
000860   METHOD-ID.  Store-method  OVERRIDE  PROTOTYPE.
000870   DATA DIVISION.
000880   LINKAGE SECTION.
000890   PROCEDURE DIVISION.
000900   END METHOD Store-method.
000910*
000920   END OBJECT.
000930  END CLASS Manager-class.
