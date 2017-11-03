000100*========================================================================
000200*　従業員クラス（AllMember-class）
000300*                        －サンプルプログラム「従業員管理（永続化）」
000400*
000500*　　　全ての従業員について共通なデータ及びメソッドを持つ。
000600*
000700*　〇継承クラス
000800*　　１）Fjbase
000900*
001000*　〇参照クラス
001100*　　１）従業員マスタクラス　　（MemberMaster-class）
001200*　　２）住所クラス　　　　　　（Address-class）
001300*
001400*　〇オブジェクトデータ
001500*　　１）従業員番号　－　PIC  9(4)
001600*　　２）氏名　　　　－　PIC  N(8)
001700*　　３）入社年月日　－　PIC  X(8)
001800*　　４）退社年月日　－　PIC  X(8)
001900*　　５）職級　　　　－　PIC  9(1)
002000*　　６）基本給　　　－　PIC  9(8)
002100*　　７）総支給　　　－　PIC  9(8)
002200*　　８）住所参照　　－　object REFERENCE Address-class
002300*
002400*　〇ファクトリメソッド
002500*　　１）職級取得　　　　（SyokukyuGet-method）
002600*　　２）従業員データ取得（RetAt-method）
002700*　　３）次従業員情報取得（NextGet-method）
002800*　　４）先頭位置づけ　　（SetTop-method）
002900*　　５）従業員データ削除（RemoveAt-method）
003000*　　６）マスタＯＰＥＮ　（MasterOpen-method）
003100*　　７）マスタＣＬＯＳＥ（MasterClose-method）
003200*
003300*　〇オブジェクトメソッド
003400*　　１）オブジェクトデータに対する，GET及びSETのプロパティメソッド
003500*　　２）給与計算　　　　（Saraly-method）
003600*　　３）賞与計算　　　　（Bonus-method）
003700*　　４）在籍チェック　　（IOCheck-method）
003800*　　５）データ設定　　　（DataSet-method）
003900*　　６）保存　　　　　　（Store-method）
004000*
004100*                              Copyright 1997-2015 FUJITSU LIMITED
004200*========================================================================
004300 CLASS-ID.   AllMember-class INHERITS  FJBASE.
004400 ENVIRONMENT    DIVISION.
004500 CONFIGURATION    SECTION.
004600 REPOSITORY.
004700      CLASS FJBASE
004800      CLASS MemberMaster-class
004900      CLASS Address-class.
005000*
005100  FACTORY.
005200  PROCEDURE DIVISION.
005300*
005400*========================================================================
005500*　職級取得メソッド（SyokukyuGet-method）
005600*
005700*　　　指定された従業員番号の従業員データか存在するならば，職級値を獲得
005800*　　し返却する。
005900*　　　指定された従業員番号の従業員データが存在しないならば，０を返却す
006000*　　る。
006100*
006200*　〇入力：　従業員番号         （PIC 9(8)）
006300*　〇出力：　職級               （PIC 9(1))
006400*========================================================================
006500   METHOD-ID.  SyokukyuGet-method.
006600   DATA DIVISION.
006700   WORKING-STORAGE SECTION.
006800    01  Ｗ－復帰値               PIC 9(1).
006900   LINKAGE SECTION.
007000    01  Ｌ－従業員番号           PIC 9(4).
007100    01  Ｌ－職級                 PIC 9(1).
007200   PROCEDURE DIVISION  USING     Ｌ－従業員番号
007300                       RETURNING Ｌ－職級.
007400*
007500       MOVE  0   TO  Ｌ－職級.
007600       INVOKE  MemberMaster-class  "RetAt-method"
007700                                    USING      Ｌ－従業員番号
007800                                    RETURNING  Ｗ－復帰値.
007900       IF Ｗ－復帰値  =  0
008000       THEN
008100           MOVE    職級  of  MemberMaster-class   TO  Ｌ－職級
008200       END-IF.
008300*
008400   END METHOD SyokukyuGet-method.
008500*
008600*========================================================================
008700*　従業員データ取得メソッド
008800*
008900*　　　指定した従業員番号の従業員データを保持する，オブジェクトインスタ
009000*　　ンスを生成し，返却する．
009100*
009200*　〇入力：　従業員番号         （PEC 9(8)）
009300*　〇出力：　従業員オブジェクト （OBJECT REFERENCE SELF）
009400*========================================================================
009500   METHOD-ID.  RetAt-method.
009600   DATA DIVISION.
009700   WORKING-STORAGE SECTION.
009800    01  Ｗ－復帰値                 PIC 9(1).
009900   CONSTANT SECTION.
010000   LINKAGE SECTION.
010100    01  Ｌ－従業員番号             PIC 9(4).
010200    01  Ｌ－従業員オブジェクト     OBJECT REFERENCE  SELF.
010300   PROCEDURE DIVISION  USING     Ｌ－従業員番号
010400                       RETURNING Ｌ－従業員オブジェクト.
010500*
010600       INVOKE   MemberMaster-class  "RetAt-method"
010700                                          USING       Ｌ－従業員番号
010800                                          RETURNING   Ｗ－復帰値
010900*
011000       IF Ｗ－復帰値  =  0
011100       THEN
011200           INVOKE   SELF   "new"  RETURNING  Ｌ－従業員オブジェクト
011300           INVOKE   Ｌ－従業員オブジェクト  "DataSet-method"
011400       ELSE
011500           SET  Ｌ－従業員オブジェクト   TO   NULL
011600       END-IF.
011700*
011800   END METHOD RetAt-method.
011900*
012000*========================================================================
012100*　次従業員情報取得メソッド
012200*
012300*　　　従業員ファイルの参照位置を，次のレコードに位置づけ，従業員番号及
012400*　　び職級情報を獲得する。
012500*
012600*　〇出力：　従業員情報
012700*　　　　　　　　従業員番号    PIC 9(4)
012800*　　　　　　　　職級          PIC 9(1)
012900*========================================================================
013000   METHOD-ID.  NextGet-method.
013100   DATA DIVISION.
013200   WORKING-STORAGE SECTION.
013300    01  Ｗ－復帰値             PIC 9(01).
013400   CONSTANT SECTION.
013500   LINKAGE SECTION.
013600    01  Ｌ－従業員情報.
013700      02  Ｌ－従業員番号       PIC 9(04).
013800      02  Ｌ－職級             PIC 9(01).
013900   PROCEDURE DIVISION
014000               RETURNING Ｌ－従業員情報.
014100*
014200       INVOKE   MemberMaster-class  "RetNext-method"
014300                                     RETURNING   Ｌ－従業員情報.
014400*
014500   END METHOD NextGet-method.
014600*
014700*========================================================================
014800*　従業員マスタ先頭位置づけメソッド
014900*
015000*　　　従業員マスタの参照レコードを先頭のレコードに位置づけ，先頭レコー
015100*　　ドの従業員情報（従業員番号，職級）を獲得する。
015200*
015300*　〇出力：　従業員情報
015400*　　　　　　　　従業員番号    PIC 9(4)
015500*　　　　　　　　職級          PIC 9(1)
015600*========================================================================
015700   METHOD-ID.  SetTop-method.
015800   DATA DIVISION.
015900   WORKING-STORAGE SECTION.
016000   CONSTANT SECTION.
016100   LINKAGE SECTION.
016200    01  Ｌ－従業員情報.
016300      02  Ｌ－従業員番号       PIC 9(04).
016400      02  Ｌ－職級             PIC 9(01).
016500   PROCEDURE DIVISION
016600                 RETURNING  Ｌ－従業員情報.
016700*
016800       INVOKE  MemberMaster-class  "SetTop-method"
016900                                    RETURNING  Ｌ－従業員情報.
017000*
017100   END METHOD SetTop-method.
017200*
017300*========================================================================
017400*　従業員データ削除メソッド
017500*
017600*　　　指定された従業員番号のレコードを，従業員マスタ及び住所マスタから
017700*　　削除する。
017800*　　　削除が成功した場合，復帰値として０を，指定された従業員番号に対応
017900*　　する従業員情報が存在しない等の理由から，削除が不成功に終わった場合
018000*　　，復帰値として１を返却する。
018100*========================================================================
018200   METHOD-ID.  RemoveAt-method.
018300   DATA DIVISION.
018400   WORKING-STORAGE SECTION.
018500   CONSTANT SECTION.
018600   LINKAGE SECTION.
018700    01  Ｌ－従業員番号      PIC 9(04).
018800    01  Ｌ－復帰値          PIC 9(01).
018900   PROCEDURE DIVISION
019000               USING    Ｌ－従業員番号   RETURNING   Ｌ－復帰値.
019100*
019200       INVOKE  MemberMaster-class  "RemoveAt-method"
019300                                           USING       Ｌ－従業員番号
019400                                           RETURNING   Ｌ－復帰値
019500       IF Ｌ－復帰値  = 0
019600       THEN
019700           INVOKE  Address-class  "RemoveAt-method"
019800                                           USING       Ｌ－従業員番号
019900       END-IF.
020000*
020100   END METHOD RemoveAt-method.
020200*
020300*========================================================================
020400*　マスタＯＰＥＮメソッド
020500*
020600*　　　従業員マスタファイル及び住所マスタファイルのＯＰＥＮを依頼する。
020700*
020800*========================================================================
020900   METHOD-ID.  MasterOpen-method.
021000   DATA DIVISION.
021100   WORKING-STORAGE SECTION.
021200   CONSTANT SECTION.
021300   LINKAGE SECTION.
021400   PROCEDURE DIVISION.
021500*
021600       INVOKE  MemberMaster-class   "Open-method".
021700       INVOKE  Address-class        "Open-method".
021800*
021900   END METHOD MasterOpen-method.
022000*
022100*========================================================================
022200*　マスタＣＬＯＳＥメソッド
022300*
022400*　　　従業員マスタファイル及び住所マスタファイルのＣＬＯＳＥを依頼する。
022500*
022600*========================================================================
022700   METHOD-ID.  MasterClose-method.
022800   DATA DIVISION.
022900   WORKING-STORAGE SECTION.
023000   CONSTANT SECTION.
023100   LINKAGE SECTION.
023200   PROCEDURE DIVISION.
023300*
023400       INVOKE  MemberMaster-class   "Close-method".
023500       INVOKE  Address-class        "Close-method".
023600*
023700   END METHOD MasterClose-method.
023800*
023900   END FACTORY.
024000*
024100   OBJECT.
024200   DATA DIVISION.
024300   WORKING-STORAGE SECTION.
024400   01  従業員番号          PIC   9(004) PROPERTY.
024500   01  氏名                PIC   N(008) PROPERTY.
024600   01  入社年月日          PIC   X(008) PROPERTY.
024700   01  退社年月日          PIC   X(008) PROPERTY.
024800   01  職級                PIC   9(001) PROPERTY.
024900   01  基本給              PIC   9(008) PROPERTY.
025000   01  総支給              PIC   9(008) PROPERTY.
025100   01  住所参照            OBJECT  REFERENCE  Address-class PROPERTY.
025200   PROCEDURE DIVISION.
025300*========================================================================
025400*　給与計算メソッド
025500*
025600*　　　多態を実現するための定義であり，サブクラスでOVERRIDEされることに
025700*　　より，初めて意味を持つ．
025800*
025900*　〇出力：　総支給（PIC 9(8)）
026000*========================================================================
026100   METHOD-ID.  Salary-method.
026200   DATA DIVISION.
026300   LINKAGE SECTION.
026400    01  Ｌ－総支給          PIC   9(008).
026500   PROCEDURE   DIVISION    RETURNING   Ｌ－総支給.
026600   END METHOD  Salary-method.
026700*
026800*========================================================================
026900*　賞与計算メソッド
027000*
027100*　　　多態を実現するための定義であり，サブクラスでOVERRIDEされることに
027200*　　より，初めて意味を持つ．
027300*
027400*　〇出力：　総支給（PIC 9(8)）
027500*========================================================================
027600   METHOD-ID.  Bonus-method.
027700   DATA DIVISION.
027800   LINKAGE SECTION.
027900    01  Ｌ－総支給          PIC   9(008).
028000   PROCEDURE   DIVISION    RETURNING   Ｌ－総支給.
028100   END METHOD Bonus-method.
028200*
028300*========================================================================
028400*　在籍チェックメソッド
028500*
028600*　〇出力：　在籍区分（PIC X(1)）
028700*========================================================================
028800   METHOD-ID.  IOCheck-method.
028900   DATA DIVISION.
029000   LINKAGE SECTION.
029100    01  在籍区分        PIC   X(001).
029200   PROCEDURE   DIVISION    RETURNING   在籍区分.
029300*
029400       IF  退社年月日     =     SPACE
029500       THEN
029600            MOVE     "0"         TO     在籍区分
029700       ELSE
029800            MOVE     "1"         TO     在籍区分
029900       END-IF.
030000*
030100   END METHOD IOCheck-method.
030200*
030300*========================================================================
030400*　データ設定メソッド
030500*
030600*　（１）索引ファイルから読み込んだ従業員データのうちの，全従業員に共通
030700*　　　なデータを，SELFのオブジェクトに設定する．
030800*　（２）住所オブジェクトを生成し，索引ファイルより読み込んだデータを設
030900*　　　定する．
031000*========================================================================
031100   METHOD-ID.  DataSet-method  PROTOTYPE.
031200   DATA DIVISION.
031300   LINKAGE SECTION.
031400   PROCEDURE DIVISION.
031500   END METHOD DataSet-method.
031600*
031700*========================================================================
031800*　保存メソッド（PROTOTYPE）
031900*
032000*　 SELFのオブジェクトが保持する従業員データを，従業員マスタに保存する。
032100*
032200*========================================================================
032300   METHOD-ID.  Store-method  PROTOTYPE.
032400   DATA DIVISION.
032500   LINKAGE SECTION.
032600   PROCEDURE DIVISION.
032700   END METHOD Store-method.
032800*
032900   END OBJECT.
033000  END CLASS AllMember-class.
