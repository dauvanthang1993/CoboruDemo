000100*========================================================================
000201*　従業員保存メソッド　　－サンプルプログラム「従業員管理（永続化）」－
000302*
000403*　　　SELFオブジェクトが保持する従業員データのうちの，全従業員に共通な
000504*　　データを，従業員マスタクラスのファクトリオブジェクトに設定し，保存
000605*　　メソッドを呼ぶ。
000706*　　　SELFオブジェクトが保持する住所オブジェクトのオブジェクト参照から
000807*　　，その住所オブジェクトが保持する住所データを，住所マスタクラスのフ
000908*　ァクトリオブ
001009*　　ジェクトに設定する。
001110*
001211*　〇参照クラス
001312*　　１）従業員マスタクラス　（MemberMaster-class）
001413*    ２）従業員クラス　　　　（AllMember-class）　　　←所属クラス
001514*
001615*                              Copyright 1997-2015 FUJITSU LIMITED
001716*=======================================================================
001817 METHOD-ID.  Store-method  OF AllMember-class.
001918 ENVIRONMENT         DIVISION.
002019 CONFIGURATION       SECTION.
002120  REPOSITORY.
002221       CLASS  MemberMaster-class
002322       CLASS  Address-class
002423       CLASS  AllMember-class.
002524 DATA DIVISION.
002625 WORKING-STORAGE SECTION.
002726 LINKAGE SECTION.
002827 PROCEDURE DIVISION.
002928*
003029     MOVE    従業員番号           TO  従業員番号  OF  MemberMaster-class.
003130     MOVE    氏名                 TO  氏名        OF  MemberMaster-class.
003231     MOVE    入社年月日           TO  入社年月日  OF  MemberMaster-class.
003332     MOVE    退社年月日           TO  退社年月日  OF  MemberMaster-class.
003433     MOVE    職級                 TO  職級        OF  MemberMaster-class.
003534     MOVE    基本給               TO  基本給      OF  MemberMaster-class.
003635     MOVE    総支給               TO  総支給      OF  MemberMaster-class.
003736     INVOKE  MemberMaster-class   "Store-method".
003837*
003938     INVOKE  住所参照  "Store-method"  USING  従業員番号.
004039*
004140 END METHOD Store-method.
