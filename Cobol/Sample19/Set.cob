000100*========================================================================
000200*　従業員データ設定メソッド
000300*　　　　　　　　　　　　－サンプルプログラム「従業員管理（永続化）」－
000400*
000500*　　　索引ファイルから読み込んだ従業員データのうちの，全従業員に共通な
000600*　　データを，SELFのオブジェクトに設定する。
000700*　　　住所オブジェクトを生成し，その参照をSELFのオブジェクトに設定する。
000800*
000900*　〇参照クラス
001000*　　１）従業員マスタクラス　（MemberMaster-class）
001100*    ２）従業員クラス　　　　（AllMember-class）　　　←所属クラス
001200*
001300*                              Copyright 1997-2015 FUJITSU LIMITED
001400*========================================================================
001500 METHOD-ID.  DataSet-method  OF AllMember-class.
001600 ENVIRONMENT         DIVISION.
001700 CONFIGURATION       SECTION.
001800  REPOSITORY.
001900       CLASS  MemberMaster-class
002000       CLASS  Address-class
002100       CLASS  AllMember-class.
002200 DATA DIVISION.
002300 WORKING-STORAGE SECTION.
002400  01  Ｗ－住所ＩＤ               PIC 9(04).
002500  01  Ｗ－住所オブジェクト       OBJECT REFERENCE Address-class.
002600 LINKAGE SECTION.
002700 PROCEDURE DIVISION.
002800*
002900      MOVE    従業員番号       OF  MemberMaster-class  TO   従業員番号.
003000      MOVE    氏名             OF  MemberMaster-class  TO   氏名.
003100      MOVE    入社年月日       OF  MemberMaster-class  TO   入社年月日.
003200      MOVE    退社年月日       OF  MemberMaster-class  TO   退社年月日.
003300      MOVE    職級             OF  MemberMaster-class  TO   職級.
003400      MOVE    基本給           OF  MemberMaster-class  TO   基本給.
003500      MOVE    総支給           OF  MemberMaster-class  TO   総支給.
003600*
003700      MOVE    従業員番号       TO  Ｗ－住所ＩＤ.
003800      INVOKE  Address-class  "new"  RETURNING  Ｗ－住所オブジェクト.
003900      INVOKE  Ｗ－住所オブジェクト "DataSet-method"  USING  Ｗ－住所ＩＤ.
004000*
004100      SET     住所参照         TO   Ｗ－住所オブジェクト.
004200*
004300 END METHOD DataSet-method.
