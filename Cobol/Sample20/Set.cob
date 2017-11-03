000010*========================================================================
000020*　従業員データ設定メソッド
000030*　　　　　　　　　　　　－サンプルプログラム「従業員管理（永続化）」－
000040*
000050*　　　データベース表から読み込んだ従業員データのうちの，全従業員に共通な
000060*　　データを，SELFのオブジェクトに設定する。
000070*　　　住所オブジェクトを生成し，その参照をSELFのオブジェクトに設定する。
000080*
000090*　〇参照クラス
000100*　　１）従業員マスタクラス　（MemberMaster-class）
000110*    ２）従業員クラス　　　　（AllMember-class）　　　←所属クラス
000120*
000130*                              Copyright 1998-2015 FUJITSU LIMITED
000140*========================================================================
000150 METHOD-ID.  DataSet-method  OF AllMember-class.
000160 ENVIRONMENT         DIVISION.
000170 CONFIGURATION       SECTION.
000180  REPOSITORY.
000190       CLASS  MemberMaster-class
000200       CLASS  Address-class
000210       CLASS  AllMember-class.
000220 DATA DIVISION.
000230 WORKING-STORAGE SECTION.
000240  01  Ｗ－住所識別               PIC S9(04).
000250  01  Ｗ－住所オブジェクト       OBJECT REFERENCE Address-class.
000260 LINKAGE SECTION.
000270 PROCEDURE DIVISION.
000280*
000290      MOVE    従業員番号       OF  MemberMaster-class  TO   従業員番号.
000300      MOVE    氏名             OF  MemberMaster-class  TO   氏名.
000310      MOVE    入社年月日       OF  MemberMaster-class  TO   入社年月日.
000320      MOVE    退社年月日       OF  MemberMaster-class  TO   退社年月日.
000330      MOVE    職級             OF  MemberMaster-class  TO   職級.
000340      MOVE    基本給           OF  MemberMaster-class  TO   基本給.
000350      MOVE    総支給           OF  MemberMaster-class  TO   総支給.
000360*
000370      MOVE    従業員番号       TO  Ｗ－住所識別.
000380      INVOKE  Address-class  "NEW"  RETURNING  Ｗ－住所オブジェクト.
000390      INVOKE  Ｗ－住所オブジェクト "DataSet-method"  USING  Ｗ－住所識別.
000400*
000410      SET     住所参照         TO   Ｗ－住所オブジェクト.
000420*
000430 END METHOD DataSet-method.
