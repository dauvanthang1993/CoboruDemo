000100*=======================================================================
000200*　ディクショナリノードクラス（DictionarytNode-class）－サンプルクラス－
000300*
000400*　　　ディクショナリ構造によるオブジェクト管理での，１要素を構成するデ
000500*　　ータとそれに対する手続き
000600*
000700*　〇継承クラス
000800*　　　FJBASE
000900*
001000*　〇オブジェクトデータ
001100*      対象オブジェクト  OBJECT  REFERENCE
001200*      キー長さ          PIC 9(02)
001300*      キー              PIC X  OCCURS 10 DEPENDING ON キー長さ
001400*      次の要素          OBJECT  REFERENCE
001500*      前の要素          OBJECT  REFERENCE
001600*　　　探索木要素        OBJECT  REFERENCE
001700*
001800*　〇オブジェクトメソッド
001900*　　１）キー設定メソッド (Set-Key)
002000*　　２）キー参照メソッド (Get-Key)
002100*
002200*        Copyright 1997-2015 FUJITSU LIMITED
002300*=======================================================================
002400 CLASS-ID.  DictionaryNode-class  INHERITS  FJBASE.
002500 ENVIRONMENT  DIVISION.
002600 CONFIGURATION  SECTION.
002700   REPOSITORY.
002800     CLASS  FJBASE.
002900*
003000   OBJECT.
003100   DATA  DIVISION.
003200   WORKING-STORAGE  SECTION.
003300   01  キー長さ          PIC 9(02).
003400   01  キー.
003500     02                  PIC X  OCCURS 10 DEPENDING ON キー長さ.
003600   01  対象オブジェクト  OBJECT  REFERENCE  PROPERTY.
003700   01  次の要素          OBJECT  REFERENCE  PROPERTY.
003800   01  前の要素          OBJECT  REFERENCE  PROPERTY.
003900   01  探索木要素        OBJECT  REFERENCE  PROPERTY.
004000   PROCEDURE  DIVISION.
004100*
004200*=======================================================================
004300*　キー設定メソッド（Set-Key）
004400*
004500*　〇入力：　キー値　　　　　（PIC  X ANY LENGTH）
004600*=======================================================================
004700   METHOD-ID.  Set-Key.
004800   DATA DIVISION.
004900   LINKAGE SECTION.
005000   01  Ｌ－キー       PIC  X ANY LENGTH.
005100   PROCEDURE DIVISION  USING  Ｌ－キー.
005200      COMPUTE  キー長さ  =  FUNCTION LENGTH (Ｌ－キー)
005300      MOVE  Ｌ－キー  TO  キー
005400   END METHOD  Set-Key.
005500*
005600*=======================================================================
005700*　キー参照メソッド（Set-Key）
005800*
005900*　〇出力：　キー値　　　　　（PIC  X ANY LENGTH）
006000*=======================================================================
006100   METHOD-ID.  Get-Key.
006200   DATA DIVISION.
006300   LINKAGE SECTION.
006400   01  Ｌ－キー       PIC  X ANY LENGTH.
006500   PROCEDURE DIVISION  RETURNING  Ｌ－キー.
006600      MOVE  キー  TO  Ｌ－キー
006700   END METHOD  Get-Key.
006800*
006900   END  OBJECT.
007000 END  CLASS  DictionaryNode-class.
