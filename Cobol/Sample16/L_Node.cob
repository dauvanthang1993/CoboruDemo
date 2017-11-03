000100*=======================================================================
000200*　リストノードクラス（ListNode-class）　　　　　　　－サンプルクラス－
000300*
000400*　　　リスト構造によるオブジェクト管理での，１要素を構成するデータとそれ
000500*　　に対する手続き
000600*
000700*　〇継承クラス
000800*　　　FJBASE
000900*
001000*　〇オブジェクトデータ
001100*      対象オブジェクト  OBJECT  REFERENCE
001200*      次の要素          OBJECT  REFERENCE
001300*      前の要素          OBJECT  REFERENCE
001400*
001500*　〇オブジェクトメソッド
001600*　　１）オブジェクトデータに対する，GET及びSETのプロパティメソッド
001700*
001800*        Copyright 1997-2015 FUJITSU LIMITED
001900*=======================================================================
002000 CLASS-ID.  ListNode-class  INHERITS  FJBASE.
002100 ENVIRONMENT  DIVISION.
002200 CONFIGURATION  SECTION.
002300   REPOSITORY.
002400     CLASS  FJBASE.
002500*
002600   OBJECT.
002700   DATA  DIVISION.
002800   WORKING-STORAGE  SECTION.
002900   01  対象オブジェクト  OBJECT  REFERENCE  PROPERTY.
003000   01  次の要素          OBJECT  REFERENCE  PROPERTY.
003100   01  前の要素          OBJECT  REFERENCE  PROPERTY.
003200   PROCEDURE  DIVISION.
003300*
003400   END  OBJECT.
003500 END  CLASS  ListNode-class.
