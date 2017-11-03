000100*======================================================================
000200*　二分探索木クラス（BinaryTree-class）　　　　　　－サンプルクラス－
000300*
000400*　　　二分探索木の１要素を構成するデータと，それに対する手続き
000500*
000600*　〇継承クラス
000700*　　　FJBASE
000800*
000900*　〇参照クラス
001000*　　　DictionaryNode-class
001100*
001200*　〇オブジェクトデータ
001300*      キー長さ          PIC 9(02)
001400*      キー              PIC X  OCCURS 10 DEPENDING ON キー長さ
001500*      対象要素          OBJECT  REFERENCE  DictionaryNode-class
001600*      左部分木          OBJECT  REFERENCE
001700*      右部分木          OBJECT  REFERENCE
001800*
001900*　〇オブジェクトメソッド
002000*　　１）キー設定メソッド (Set-Key)
002100*　　２）キー参照メソッド (Get-Key)
002200*
002300*        Copyright 1997-2015 FUJITSU LIMITED
002400*======================================================================
002500 CLASS-ID.  BinaryTree-class  INHERITS  FJBASE.
002600 ENVIRONMENT  DIVISION.
002700 CONFIGURATION  SECTION.
002800   REPOSITORY.
002900     CLASS  DictionaryNode-class
003000     CLASS  FJBASE.
003100*
003200   OBJECT.
003300   DATA  DIVISION.
003400   WORKING-STORAGE  SECTION.
003500   01  キー長さ       PIC 9(02).
003600   01  キー.
003700     02               PIC X  OCCURS 10 DEPENDING ON キー長さ.
003800   01  対象要素       OBJECT  REFERENCE  DictionaryNode-class  PROPERTY.
003900   01  左部分木       OBJECT  REFERENCE  PROPERTY.
004000   01  右部分木       OBJECT  REFERENCE  PROPERTY.
004100   PROCEDURE  DIVISION.
004200*
004300*=======================================================================
004400*　キー設定メソッド（Set-Key）
004500*
004600*　〇入力：　キー値　　　　　（PIC  X ANY LENGTH）
004700*=======================================================================
004800   METHOD-ID.  Set-Key.
004900   DATA DIVISION.
005000   LINKAGE SECTION.
005100   01  Ｌ－キー       PIC X  ANY LENGTH.
005200   PROCEDURE DIVISION  USING  Ｌ－キー.
005300      COMPUTE  キー長さ  =  FUNCTION LENGTH (Ｌ－キー)
005400      MOVE  Ｌ－キー  TO  キー
005500   END METHOD  Set-Key.
005600*
005700*=======================================================================
005800*　キー参照メソッド（Set-Key）
005900*
006000*　〇出力：　キー値　　　　　（PIC  X ANY LENGTH）
006100*=======================================================================
006200   METHOD-ID.  Get-Key.
006300   DATA DIVISION.
006400   LINKAGE SECTION.
006500   01  Ｌ－キー       PIC  X ANY LENGTH.
006600   PROCEDURE DIVISION  RETURNING  Ｌ－キー.
006700      MOVE  キー  TO  Ｌ－キー
006800   END METHOD  Get-Key.
006900*
007000   END  OBJECT.
007100 END  CLASS  BinaryTree-class.
