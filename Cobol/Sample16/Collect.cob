000100*=======================================================================
000200*　コレクションクラス（Collect）　　　　　　　－サンプルクラス－
000300*
000400*　　　全般的な要素の管理を行うためのデータと手続き
000500*
000600*　〇継承クラス
000700*　　　FJBASE
000800*
000900*　〇参照クラス
001000*　　　BinaryTree-class
001100*
001200*　〇オブジェクトデータ
001300*      全要素数           PIC 9(08)  COMP
001400*      先頭の要素         OBJECT  REFERENCE
001500*      最後の要素         OBJECT  REFERENCE
001600*      現在の要素         OBJECT  REFERENCE
001700*      探索木の頂点       OBJECT  REFERENCE
001800*
001900*　〇オブジェクトメソッド
002000*　　１）オブジェクトデータに対する，GET及びSETのプロパティメソッド
002100*　　２）要素の有無確認メソッド　　　　　　　　（CollectionSize-Get）
002200*　　３）次要素取得メソッド　　　　　　　　　　（NextElement-Get）
002300*　　４）前要素取得メソッド　　　　　　　　　　（PreviousElement-Get）
002400*　　５）先頭要素取得メソッド　　　　　　　　　（FirstElement-Get）
002500*　　６）全要素数加算メソッド　　　　　　　　　（Add-CollSize）
002600*　　７）全要素数減算メソッド　　　　　　　　　（Sub-CollSize）
002700*
002800*        Copyright 1997-2015 FUJITSU LIMITED
002900*=======================================================================
003000 CLASS-ID.  Collect  INHERITS  FJBASE.
003100 ENVIRONMENT  DIVISION.
003200 CONFIGURATION  SECTION.
003300   REPOSITORY.
003400     CLASS  BinaryTree-class
003500     CLASS  FJBASE.
003600*
003700   OBJECT.
003800   DATA  DIVISION.
003900   WORKING-STORAGE  SECTION.
004000   01  全要素数           PIC 9(08)  COMP  VALUE 0.
004100   01  先頭の要素         OBJECT  REFERENCE  PROPERTY.
004200   01  最後の要素         OBJECT  REFERENCE  PROPERTY.
004300   01  現在の要素         OBJECT  REFERENCE  PROPERTY.
004400   01  探索木の頂点       OBJECT  REFERENCE  BinaryTree-class  PROPERTY.
004500   PROCEDURE  DIVISION.
004600*=======================================================================
004700*　要素の有無確認メソッド（CollectionSize-Get）
004800*
004900*　　　全要素数を返却する。
005000*
005100*　〇出力：　全要素数（PIC 9(8) COMP）
005200*=======================================================================
005300   METHOD-ID.  CollectionSize-Get.
005400   DATA  DIVISION.
005500   LINKAGE  SECTION.
005600    01  Ｌ－全要素数    PIC 9(8)  COMP.
005700   PROCEDURE  DIVISION  RETURNING  Ｌ－全要素数.
005800        MOVE  全要素数  TO  Ｌ－全要素数.
005900   END  METHOD  CollectionSize-Get.
006000*
006100*=======================================================================
006200*　次要素取得メソッド（NextElement-Get）
006300*
006400*　〇出力：　オブジェクト（OBJECT REFERENCE）
006500*　〇備考
006600*　　　多態を実現するための定義であり，手続き部を持たない。サブクラスで
006700*　　OVERRIDE されて初めて意味を持つ。
006800*=======================================================================
006900   METHOD-ID.  NextElement-Get.
007000   DATA  DIVISION.
007100   WORKING-STORAGE  SECTION.
007200   LINKAGE  SECTION.
007300    01  Ｌ－オブジェクト   OBJECT  REFERENCE.
007400   PROCEDURE  DIVISION
007500                 RETURNING   Ｌ－オブジェクト.
007600   END  METHOD  NextElement-Get.
007700*
007800*=======================================================================
007900*　前要素取得メソッド（PreviousElement-Get）
008000*
008100*　〇出力：　オブジェクト（OBJECT REFERENCE）
008200*　〇備考
008300*　　　多態を実現するための定義であり，手続き部を持たない。サブクラスで
008400*　　OVERRIDE されて初めて意味を持つ。
008500*=======================================================================
008600   METHOD-ID.  PreviousElement-Get.
008700   DATA  DIVISION.
008800   WORKING-STORAGE  SECTION.
008900   LINKAGE  SECTION.
009000    01  Ｌ－オブジェクト   OBJECT  REFERENCE.
009100   PROCEDURE  DIVISION
009200                 RETURNING   Ｌ－オブジェクト.
009300   END  METHOD  PreviousElement-Get.
009400*
009500*=======================================================================
009600*　先頭要素取得メソッド（FirstElement-Get）
009700*
009800*　〇出力：　オブジェクト（OBJECT REFERENCE）
009900*　〇備考
010000*　　　多態を実現するための定義であり，手続き部を持たない。サブクラスで
010100*　　OVERRIDE されて初めて意味を持つ。
010200*=======================================================================
010300   METHOD-ID.  FirstElement-Get.
010400   DATA  DIVISION.
010500   WORKING-STORAGE  SECTION.
010600   LINKAGE  SECTION.
010700    01  Ｌ－先頭オブジェクト  OBJECT  REFERENCE.
010800   PROCEDURE  DIVISION
010900                 RETURNING  Ｌ－先頭オブジェクト.
011000   END  METHOD  FirstElement-Get.
011100*
011200*=======================================================================
011300*　全要素数加算メソッド（Add-Collsize）
011400*
011500*　　全要素数に１を加算する。
011600*=======================================================================
011700   METHOD-ID.  Add-CollSize.
011800   DATA  DIVISION.
011900   PROCEDURE  DIVISION.
012000        ADD  1  TO  全要素数.
012100   END  METHOD  Add-CollSize.
012200*
012300*=======================================================================
012400*　全要素数減算メソッド（Sub-Collsize）
012500*
012600*　　全要素数から１を減算する。
012700*=======================================================================
012800   METHOD-ID.  Sub-CollSize.
012900   DATA  DIVISION.
013000   PROCEDURE  DIVISION.
013100        SUBTRACT  1  FROM  全要素数.
013200   END  METHOD  Sub-CollSize.
013300*
013400   END  OBJECT.
013500 END  CLASS  Collect.
