000100*========================================================================
000200*　住所クラス（Address-class）　　　－サンプルプログラム「従業員管理」－
000300*
000400*　　　従業員ひとりに対する住所データと，それを参照・更新するためのメソ
000500*    ッドを持つ。
000600*
000700*　〇継承クラス
000800*　　　Ｆｊｂａｓｅ
000900*
001000*　〇参照クラス
001100*　　　住所マスタクラス（AddressMaster-class）
001200*
001300*　〇オブジェクトデータ
001400*　　　郵便番号
001500*　　　住所
001600*
001700*　〇オブジェクトメソッド
001800*　　１）データ設定　    　 （DataSet-method）
001900*　　２）データ保存　    　 （Store-method）
002000*　　３）データ削除　    　 （RemoveAt-method）
002100*　　４）マスタファイルOPEN （Open-method）
002200*　　５）マスタファイルCLOSE（CLose-method）
002300*
002400*                              Copyright 1997-2015 FUJITSU LIMITED
002500*========================================================================
002600 CLASS-ID.   Address-class INHERITS FJBASE.
002700 ENVIRONMENT    DIVISION.
002800 CONFIGURATION    SECTION.
002900 REPOSITORY.
003000     CLASS AddressMaster-class
003100     CLASS FJBASE.
003200*
003300   FACTORY.
003400   PROCEDURE DIVISION.
003500*
003600*========================================================================
003700*　住所データ削除メソッド
003800*
003900*　　　指定された住所ＩＤの住所情報を削除する。
004000*
004100*　〇入力：　住所ＩＤ　  PIC 9(4)
004200*========================================================================
004300   METHOD-ID. RemoveAt-method.
004400   DATA DIVISION.
004500   LINKAGE SECTION.
004600   01 Ｌ－住所ＩＤ          PIC 9(04).
004700   PROCEDURE DIVISION
004800                USING  Ｌ－住所ＩＤ.
004900*
005000       INVOKE  AddressMaster-class  "RemoveAt-method"
005100                                               USING   Ｌ－住所ＩＤ.
005200*
005300   END METHOD RemoveAt-method.
005400*
005500*========================================================================
005600*　住所マスタファイルＯＰＥＮメソッド
005700*
005800*　　　住所マスタファイルをＯＰＥＮする。
005900*
006000*========================================================================
006100   METHOD-ID. Open-method.
006200   DATA DIVISION.
006300   LINKAGE SECTION.
006400   PROCEDURE DIVISION.
006500*
006600       INVOKE  AddressMaster-class  "Open-method".
006700*
006800   END METHOD Open-method.
006900*
007000*========================================================================
007100*　住所マスタファイルＣＬＯＳＥメソッド
007200*
007300*　　　住所マスタファイルをＣＬＯＳＥする。
007400*
007500*========================================================================
007600   METHOD-ID. Close-method.
007700   DATA DIVISION.
007800   LINKAGE SECTION.
007900   PROCEDURE DIVISION.
008000*
008100       INVOKE  AddressMaster-class  "CLose-method".
008200*
008300   END METHOD CLose-method.
008400*
008500   END FACTORY.
008600*
008700   OBJECT.
008800   DATA DIVISION.
008900   WORKING-STORAGE SECTION.
009000   01  郵便番号             PIC   X(007) PROPERTY.
009100   01  住所                 PIC   N(020) PROPERTY.
009200   PROCEDURE DIVISION.
009300*
009400*========================================================================
009500*　住所データ設定メソッド
009600*
009700*　　　指定された住所ＩＤの住所情報を住所マスタより読み込み，オブジェクト
009800*　　データに設定する．
009900*
010000*　〇入力：　住所ＩＤ　  PIC 9(4)
010100*========================================================================
010200   METHOD-ID. DataSet-method.
010300   DATA DIVISION.
010400   LINKAGE SECTION.
010500   01 Ｌ－住所ＩＤ          PIC 9(04).
010600   PROCEDURE DIVISION
010700             USING  Ｌ－住所ＩＤ.
010800*
010900       INVOKE  AddressMaster-class  "RetAt-method"  USING  Ｌ－住所ＩＤ.
011000       MOVE    郵便番号  OF  AddressMaster-class  TO  郵便番号.
011100       MOVE    住所      OF  AddressMaster-class  TO  住所.
011200*
011300   END METHOD DataSet-method.
011400*
011500*========================================================================
011600*　住所データ保存メソッド
011700*
011800*　　　オブジェクトデータが保持する住所情報を，従業員マスタファイルに保
011900*　　存する。
012000*
012100*　〇入力：　住所ＩＤ　  PIC 9(4)
012200*========================================================================
012300   METHOD-ID. Store-method.
012400   DATA DIVISION.
012500   LINKAGE SECTION.
012600   01 Ｌ－住所ＩＤ          PIC 9(04).
012700   PROCEDURE DIVISION
012800                USING  Ｌ－住所ＩＤ.
012900*
013000       MOVE   Ｌ－住所ＩＤ    TO  住所ＩＤ    OF  AddressMaster-class.
013100       MOVE   郵便番号        TO  郵便番号    OF  AddressMaster-class.
013200       MOVE   住所            TO  住所        OF  AddressMaster-class.
013300       INVOKE  AddressMaster-class  "Store-method".
013400*
013500   END METHOD Store-method.
013600*
013700   END OBJECT.
013800 END CLASS Address-class.
