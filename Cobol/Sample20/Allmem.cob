000010*========================================================================
000020*　従業員クラス（AllMember-class）
000030*                        －サンプルプログラム「従業員管理（永続化）」
000040*
000050*　　　全ての従業員について共通なデータ及びメソッドを持つ。
000060*
000070*　〇継承クラス
000080*　　１）Fjbase
000090*
000100*　〇参照クラス
000110*　　１）従業員マスタクラス　　（MemberMaster-class）
000120*　　２）住所クラス　　　　　　（Address-class）
000130*
000140*　〇オブジェクトデータ
000150*　　１）従業員番号　－　PIC  S9(4)
000160*　　２）氏名　　　　－　PIC   X(16)
000170*　　３）入社年月日　－　PIC   X(8)
000180*　　４）退社年月日　－　PIC   X(8)
000190*　　５）職級　　　　－　PIC  S9(1)
000200*　　６）基本給　　　－　PIC  S9(8)
000210*　　７）総支給　　　－　PIC  S9(8)
000220*　　８）住所参照　　－　object REFERENCE Address-class
000230*
000240*　〇ファクトリメソッド
000250*　  １）接続　　　　　　　　（Connect-factory-method）
000260*　  ２）切断　　　　　　　　（Disconnect-factory-method）
000270*　  ３）従業員表先頭位置づけ（SetTop-factory-method）
000280*　  ４）従業員データ削除　　（RemoveAt-factory-method）
000290*　  ５）職級取得　　　　　　（SyokukyuGet-factory-method）
000300*　  ６）従業員データ更新　　（Update-factory-method）
000310*　  ７）次従業員情報取得　　（NextGet-factory-method）
000320*　  ８）従業員データ一括更新（AllUpdate-factory-method）
000330*
000340*　〇オブジェクトメソッド
000350*　　１）オブジェクトデータに対する，GET及びSETのプロパティメソッド
000360*　  ２）接続　　　　　　　　（Connect-method）
000370*　  ３）切断　　　　　　　　（Disconnect-method）
000380*　  ４）従業員表先頭位置づけ（SetTop-method）
000390*　  ５）従業員データ削除　　（RemoveAt-method）
000400*　  ６）職級取得　　　　　　（SyokukyuGet-method）
000410*　  ７）従業員データ更新　　（Update-method）
000420*　  ８）次従業員情報取得　　（NextGet-method）
000430*　  ９）従業員データ一括更新（AllUpdate-method）
000440*　１０）給与計算　　　　　　（Saraly-method）
000450*　１１）賞与計算　　　　　　（Bonus-method）
000460*　１２）在籍チェック　　　　（IOCheck-method）
000470*　１３）データ設定　　　　　（DataSet-method）
000480*　１４）保存　　　　　　　　（Store-method）
000490*　１５）エラー表示　　　　　（ErrorDisplay-method）
000500*
000510*                              Copyright 1998-2015 FUJITSU LIMITED
000520*========================================================================
000530 CLASS-ID.   AllMember-class INHERITS  FJBASE.
000540 ENVIRONMENT    DIVISION.
000550 CONFIGURATION    SECTION.
000560 SPECIAL-NAMES.
000570      SYMBOLIC CONSTANT
000580       レコードあり            IS    0
000590       レコードなし            IS    1
000600
000610       ＣＯＮＮＥＣＴ文        IS    0
000620       ＤＩＳＣＯＮＮＥＣＴ文  IS    1
000630       ＣＯＭＭＩＴ文          IS    2
000640       ＳＥＬＥＣＴ文          IS    3
000650       ＩＮＳＥＲＴ文          IS    4
000660       ＵＰＤＡＴＥ文          IS    5
000670       ＤＥＬＥＴＥ文          IS    6
000680       ＯＰＥＮ文              IS    7
000690       ＣＬＯＳＥ文            IS    8
000700       ＦＥＴＣＨ文            IS    9
000710       位置付けＵＰＤＡＴＥ文  IS   10.
000720
000730 REPOSITORY.
000740      CLASS FJBASE
000750      CLASS MemberMaster-class
000760      CLASS Address-class.
000770*
000780  FACTORY.
000790   DATA DIVISION.
000800   WORKING-STORAGE SECTION.
000810    01  ＤＢアクセス－オブジェクト  OBJECT REFERENCE SELF.
000820   PROCEDURE DIVISION.
000830*
000840*========================================================================
000850*　接続ファクトリメソッド（Connect-factory-method）
000860*
000870*　　　データベースアクセスのためのSELFオブジェクトを生成し，接続メソッド
000880*　　にデータベースへの接続を依頼する。
000890*========================================================================
000900   METHOD-ID.  Connect-factory-method.
000910   DATA DIVISION.
000920   PROCEDURE DIVISION.
000930*
000940       INVOKE SELF "new"
000950                        RETURNING ＤＢアクセス－オブジェクト.
000960       INVOKE ＤＢアクセス－オブジェクト "Connect-method".
000970*
000980   END METHOD Connect-factory-method.
000990*
001000*========================================================================
001010*　切断ファクトリメソッド（Disconnect-factory-method）
001020*
001030*　　　切断メソッドにデータベースの切断を依頼する。
001040*========================================================================
001050   METHOD-ID.  Disconnect-factory-method.
001060   DATA DIVISION.
001070   PROCEDURE DIVISION.
001080*
001090       INVOKE ＤＢアクセス－オブジェクト "Disconnect-method".
001100*
001110   END METHOD Disconnect-factory-method.
001120*
001130*========================================================================
001140*　先頭位置づけファクトリメソッド（SetTop-factory-method）
001150*
001160*      従業員表先頭位置づけを従業員先頭位置づけメソッドに依頼する。
001170*
001180*　〇出力：　従業員情報
001190*　　　　　　　　従業員番号    PIC S9(4)
001200*　　　　　　　　職級          PIC S9(1)
001210*========================================================================
001220   METHOD-ID. SetTop-factory-method.
001230   DATA DIVISION.
001240   LINKAGE SECTION.
001250   01  Ｌ－従業員情報.
001260      02  Ｌ－番号情報                PIC S9(04).
001270      02  Ｌ－職級情報                PIC S9(01).
001280   PROCEDURE DIVISION RETURNING Ｌ－従業員情報.
001290*
001300       INVOKE ＤＢアクセス－オブジェクト "SetTop-method"
001310                                        RETURNING Ｌ－従業員情報.
001320*
001330   END METHOD SetTop-factory-method.
001340*
001350*========================================================================
001360*　従業員データ削除ファクトリメソッド（RemoveAt-factory-method）
001370*
001380*      従業員データ削除を従業員データ削除メソッドに依頼する。
001390*========================================================================
001400   METHOD-ID. RemoveAt-factory-method.
001410   DATA DIVISION.
001420   LINKAGE SECTION.
001430    01  Ｌ－従業員番号      PIC S9(04).
001440    01  Ｌ－復帰値          PIC  9(01).
001450   PROCEDURE DIVISION USING Ｌ－従業員番号
001460                      RETURNING Ｌ－復帰値.
001470*
001480       INVOKE ＤＢアクセス－オブジェクト "RemoveAt-method"
001490                                      USING Ｌ－従業員番号
001500                                      RETURNING Ｌ－復帰値.
001510*
001520   END METHOD RemoveAt-factory-method.
001530*
001540*========================================================================
001550*　職級取得ファクトリメソッド（SyokukyuGet-factory-method）
001560*
001570*      職級取得を職級取得メソッドに依頼する。
001580*
001590*　〇入力：　従業員番号         PIC S9(8)
001600*　〇出力：　職級               PIC S9(1)
001610*========================================================================
001620   METHOD-ID. SyokukyuGet-factory-method.
001630   DATA DIVISION.
001640   LINKAGE SECTION.
001650    01  Ｌ－従業員番号           PIC S9(4).
001660    01  Ｌ－職級                 PIC S9(1).
001670   PROCEDURE DIVISION USING Ｌ－従業員番号
001680                      RETURNING Ｌ－職級.
001690*
001700       INVOKE ＤＢアクセス－オブジェクト "SyokukyuGet-method"
001710                                        USING Ｌ－従業員番号
001720                                        RETURNING Ｌ－職級.
001730*
001740   END METHOD SyokukyuGet-factory-method.
001750*
001760*========================================================================
001770*　従業員データ更新ファクトリメソッド（Update-factory-method）
001780*
001790*      従業員データ更新を従業員データメソッドに依頼する。
001800*
001810*　〇入力：　総支給         PIC S9(8)
001820*=======================================================================
001830   METHOD-ID. Update-factory-method.
001840   DATA DIVISION.
001850   LINKAGE SECTION.
001860    01  Ｌ－総支給                  PIC S9(08).
001870   PROCEDURE DIVISION USING  Ｌ－総支給.
001880*
001890       INVOKE ＤＢアクセス－オブジェクト "Update-method"
001900                                        USING Ｌ－総支給.
001910*
001920   END METHOD Update-factory-method.
001930*
001940*========================================================================
001950*　次従業員情報取得ファクトリメソッド（NextGet-factory-method）
001960*
001970*　　　次従業員情報取得を次従業員情報取得メソッドに依頼する。
001980*
001990*　〇出力：　従業員情報
002000*　　　　　　　　従業員番号    PIC S9(4)
002010*　　　　　　　　職級          PIC S9(1)
002020*========================================================================
002030   METHOD-ID. NextGet-factory-method.
002040   DATA DIVISION.
002050   LINKAGE SECTION.
002060   01  Ｌ－従業員情報.
002070      02  Ｌ－番号情報                PIC S9(04).
002080      02  Ｌ－職級情報                PIC S9(01).
002090   PROCEDURE DIVISION RETURNING Ｌ－従業員情報.
002100*
002110       INVOKE ＤＢアクセス－オブジェクト "NextGet-method"
002120                                        RETURNING Ｌ－従業員情報.
002130*
002140   END METHOD NextGet-factory-method.
002150*
002160*========================================================================
002170*　従業員データ一括更新ファクトリメソッド（AllUpdate-factory-method）
002180*
002190*      従業員データ一括更新を従業員データメソッドに依頼する。
002200*
002210*　〇入力：　更新情報
002220*                更新従業員数    PIC  9(2)
002230*                更新従業員情報  OCCURS 99
002240*                    更新従業員情報  PIC S9(4)
002250*                    更新従業員情報  PIC S9(8)
002260*=======================================================================
002270   METHOD-ID. AllUpdate-factory-method.
002280   DATA DIVISION.
002290   LINKAGE SECTION.
002300   01  Ｌ－更新情報.
002310      02  Ｌ－更新従業員数            PIC 9(2).
002320      02  Ｌ－更新従業員情報          OCCURS 99.
002330         03  Ｌ－更新従業員番号          PIC S9(04).
002340         03  Ｌ－更新総支給              PIC S9(08).
002350   PROCEDURE DIVISION USING Ｌ－更新情報.
002360*
002370       INVOKE ＤＢアクセス－オブジェクト "AllUpdate-method"
002380                                        USING Ｌ－更新情報.
002390*
002400   END METHOD AllUpdate-factory-method.
002410*
002420  END FACTORY.
002430*
002440  OBJECT.
002450   DATA DIVISION.
002460   WORKING-STORAGE SECTION.
002470   01  従業員番号          PIC   S9(004) PROPERTY.
002480   01  氏名                PIC    X(016) PROPERTY.
002490   01  入社年月日          PIC    X(008) PROPERTY.
002500   01  退社年月日          PIC    X(008) PROPERTY.
002510   01  職級                PIC   S9(001) PROPERTY.
002520   01  基本給              PIC   S9(008) PROPERTY.
002530   01  総支給              PIC   S9(008) PROPERTY.
002540   01  住所参照            OBJECT  REFERENCE  Address-class PROPERTY.
002550*
002560     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
002570   01  SQLSTATE            PIC    X(5).
002580   01  SQLCODE             PIC   S9(9) COMP-5.
002590   01  SQLMSG              PIC    X(256).
002600     EXEC SQL END   DECLARE SECTION END-EXEC.
002610   01  Ｗ－ＳＱＬ文識別    PIC    9(2).
002620
002630  PROCEDURE DIVISION.
002640*
002650*========================================================================
002660*　接続メソッド（Connect-method）
002670*
002680*　　　データベースに接続（デフォルトサーバに接続）する。
002690*========================================================================
002700   METHOD-ID.  Connect-method.
002710   DATA DIVISION.
002720   WORKING-STORAGE SECTION.
002730   CONSTANT SECTION.
002740   LINKAGE SECTION.
002750   PROCEDURE DIVISION.
002760*
002770       EXEC SQL
002780           CONNECT TO DEFAULT
002790       END-EXEC.
002800*
002810       IF SQLSTATE NOT = "00000" AND SQLSTATE NOT = "01000"
002820       THEN
002830           MOVE ＣＯＮＮＥＣＴ文  TO Ｗ－ＳＱＬ文識別
002840           INVOKE SELF "ErrorDisplay-method"
002850                        USING Ｗ－ＳＱＬ文識別
002860       END-IF.
002870*
002880   END METHOD Connect-method.
002890*
002900*========================================================================
002910*　切断メソッド（Disconnect-method）
002920*
002930*　　　トランザクションを確定させ，データベースを切断する。
002940*========================================================================
002950   METHOD-ID.  Disconnect-method.
002960   DATA DIVISION.
002970   WORKING-STORAGE SECTION.
002980   CONSTANT SECTION.
002990   LINKAGE SECTION.
003000   PROCEDURE DIVISION.
003010*
003020       EXEC SQL
003030           COMMIT WORK
003040       END-EXEC.
003050*
003060       EXEC SQL
003070           DISCONNECT DEFAULT
003080       END-EXEC.
003090*
003100   END METHOD Disconnect-method.
003110*
003120*========================================================================
003130*　職級取得メソッド（SyokukyuGet-method）
003140*
003150*　　　指定された従業員番号の従業員データか存在するならば，職級値を獲得
003160*　　し返却する。
003170*　　　指定された従業員番号の従業員データが存在しないならば，０を返却す
003180*　　る。
003190*
003200*　〇入力：　従業員番号         PIC S9(8)
003210*　〇出力：　職級               PIC S9(1)
003220*========================================================================
003230   METHOD-ID.  SyokukyuGet-method.
003240   DATA DIVISION.
003250   WORKING-STORAGE SECTION.
003260   LINKAGE SECTION.
003270      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
003280    01  Ｌ－従業員番号           PIC S9(4).
003290    01  Ｌ－職級                 PIC S9(1).
003300      EXEC SQL END   DECLARE SECTION END-EXEC.
003310   PROCEDURE DIVISION  USING     Ｌ－従業員番号
003320                       RETURNING Ｌ－職級.
003330*
003340       MOVE  0   TO  Ｌ－職級.
003350*
003360       EXEC SQL
003370           SELECT 職級 INTO :Ｌ－職級 FROM 従業員表
003380            WHERE 従業員番号 = :Ｌ－従業員番号
003390       END-EXEC.
003400*
003410       IF SQLCODE NOT = 100 AND SQLSTATE NOT = "00000"
003420       THEN
003430           MOVE ＳＥＬＥＣＴ文  TO Ｗ－ＳＱＬ文識別
003440           INVOKE SELF "ErrorDisplay-method"
003450                        USING Ｗ－ＳＱＬ文識別
003460       END-IF.
003470*
003480   END METHOD SyokukyuGet-method.
003490*
003500*========================================================================
003510*　従業員データ取得メソッド（RetAt-method）
003520*
003530*　　　指定した従業員番号の従業員データを保持する，オブジェクトインスタ
003540*　　ンスを生成し，返却する。
003550*
003560*　〇入力：　従業員番号          PIC S9(8)
003570*　〇出力：　従業員オブジェクト  OBJECT REFERENCE SELF
003580*========================================================================
003590   METHOD-ID.  RetAt-method.
003600   DATA DIVISION.
003610   WORKING-STORAGE SECTION.
003620      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
003630    01  Ｗ－従業員番号             PIC S9(004).
003640    01  Ｗ－氏名                   PIC  X(016).
003650    01  Ｗ－入社年月日             PIC  X(008).
003660    01  Ｗ－退社年月日             PIC  X(008).
003670    01  Ｗ－職級                   PIC S9(001).
003680    01  Ｗ－基本給                 PIC S9(008).
003690    01  Ｗ－総支給                 PIC S9(008).
003700    01  Ｗ－時間外手当             PIC S9(5).
003710    01  Ｗ－残業時間               PIC S9(5)V9(1).
003720    01  Ｗ－特別手当               PIC S9(6).
003730      EXEC SQL END   DECLARE SECTION END-EXEC.
003740   CONSTANT SECTION.
003750   LINKAGE SECTION.
003760      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
003770    01  Ｌ－従業員番号             PIC S9(4).
003780      EXEC SQL END   DECLARE SECTION END-EXEC.
003790    01  Ｌ－従業員オブジェクト     OBJECT REFERENCE  CLASS OF SELF.
003800   PROCEDURE DIVISION  USING     Ｌ－従業員番号
003810                       RETURNING Ｌ－従業員オブジェクト.
003820*
003830       EXEC SQL
003840           SELECT 氏名, 入社年月日, 退社年月日, 職級,
003850                  基本給, 総支給, 時間外手当, 残業時間,
003860                  特別手当
003870            INTO :Ｗ－氏名,:Ｗ－入社年月日,:Ｗ－退社年月日,:Ｗ－職級,
003880                 :Ｗ－基本給,:Ｗ－総支給,:Ｗ－時間外手当,:Ｗ－残業時間,
003890                 :Ｗ－特別手当  FROM 従業員表
003900            WHERE 従業員番号 = :Ｌ－従業員番号
003910       END-EXEC.
003920*
003930       MOVE  Ｌ－従業員番号  TO  従業員番号 OF MemberMaster-class .
003940       MOVE  Ｗ－氏名        TO  氏名       OF MemberMaster-class .
003950       MOVE  Ｗ－入社年月日  TO  入社年月日 OF MemberMaster-class .
003960       MOVE  Ｗ－退社年月日  TO  退社年月日 OF MemberMaster-class .
003970       MOVE  Ｗ－職級        TO  職級       OF MemberMaster-class .
003980       MOVE  Ｗ－基本給      TO  基本給     OF MemberMaster-class .
003990       MOVE  Ｗ－総支給      TO  総支給     OF MemberMaster-class .
004000       MOVE  Ｗ－時間外手当  TO  時間外手当 OF MemberMaster-class .
004010       MOVE  Ｗ－残業時間    TO  残業時間   OF MemberMaster-class .
004020       MOVE  Ｗ－特別手当    TO  特別手当   OF MemberMaster-class .
004030*
004040       IF SQLCODE NOT = 100 AND SQLSTATE NOT = "00000"
004050       THEN
004060           MOVE ＳＥＬＥＣＴ文  TO Ｗ－ＳＱＬ文識別
004070           INVOKE SELF "ErrorDisplay-method"
004080                        USING Ｗ－ＳＱＬ文識別
004090       END-IF.
004100*
004110       IF SQLCODE NOT = 100
004120       THEN
004130           INVOKE   SELF :: "GETCLASS" "new"  RETURNING  Ｌ－従業員オブジェクト
004140           INVOKE   Ｌ－従業員オブジェクト  "DataSet-method"
004150       ELSE
004160           SET  Ｌ－従業員オブジェクト   TO   NULL
004170       END-IF.
004180*
004190   END METHOD RetAt-method.
004200*
004210*========================================================================
004220*　次従業員情報取得メソッド（NextGet-method）
004230*
004240*　　　カーソルを従業員表の次の行に位置づけ，従業員番号及び職級情報を獲得
004250*　　する。
004260*
004270*　〇出力：　従業員情報
004280*　　　　　　　　従業員番号    PIC S9(4)
004290*　　　　　　　　職級          PIC S9(1)
004300*========================================================================
004310   METHOD-ID.  NextGet-method.
004320   DATA DIVISION.
004330   WORKING-STORAGE SECTION.
004340      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
004350    01  Ｗ－従業員番号       PIC S9(04).
004360    01  Ｗ－職級             PIC S9(01).
004370      EXEC SQL END   DECLARE SECTION END-EXEC.
004380   CONSTANT SECTION.
004390   LINKAGE SECTION.
004400    01  Ｌ－従業員情報.
004410      02  Ｌ－従業員番号       PIC S9(04).
004420      02  Ｌ－職級             PIC S9(01).
004430   PROCEDURE DIVISION
004440               RETURNING Ｌ－従業員情報.
004450*
004460       EXEC SQL
004470         DECLARE CURSOR01 CURSOR FOR
004480          SELECT 従業員番号, 職級 FROM 従業員表
004490           FOR UPDATE
004500       END-EXEC.
004510
004520       EXEC SQL
004530         FETCH CURSOR01 INTO :Ｗ－従業員番号, :Ｗ－職級
004540       END-EXEC.
004550*
004560       IF SQLCODE NOT = 100 AND SQLSTATE NOT = "00000"
004570       THEN
004580           MOVE ＦＥＴＣＨ文  TO Ｗ－ＳＱＬ文識別
004590           INVOKE SELF "ErrorDisplay-method"
004600                        USING Ｗ－ＳＱＬ文識別
004610       END-IF.
004620
004630       IF SQLCODE = 100 THEN
004640           MOVE  0                    TO   Ｌ－従業員番号
004650           MOVE  0                    TO   Ｌ－職級
004660           EXEC SQL
004670               CLOSE CURSOR01
004680           END-EXEC
004690       ELSE
004700           MOVE  Ｗ－従業員番号       TO   Ｌ－従業員番号
004710           MOVE  Ｗ－職級             TO   Ｌ－職級
004720       END-IF.
004730*
004740   END METHOD NextGet-method.
004750*
004760*========================================================================
004770*　従業員表先頭位置づけメソッド（SetTop-method）
004780*
004790*　　　カーソルを従業員表の先頭行に位置づけ，先頭行の従業員情報（従業員番
004800*　　号，職級）を獲得する。
004810*
004820*　〇出力：　従業員情報
004830*　　　　　　　　従業員番号    PIC S9(4)
004840*　　　　　　　　職級          PIC S9(1)
004850*========================================================================
004860   METHOD-ID.  SetTop-method.
004870   DATA DIVISION.
004880   WORKING-STORAGE SECTION.
004890      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
004900    01  Ｗ－従業員番号       PIC S9(04).
004910    01  Ｗ－職級             PIC S9(01).
004920      EXEC SQL END   DECLARE SECTION END-EXEC.
004930   CONSTANT SECTION.
004940   LINKAGE SECTION.
004950    01  Ｌ－従業員情報.
004960      02  Ｌ－従業員番号       PIC S9(04).
004970      02  Ｌ－職級             PIC S9(01).
004980   PROCEDURE DIVISION
004990                 RETURNING  Ｌ－従業員情報.
005000*
005010       EXEC SQL
005020           OPEN CURSOR01
005030       END-EXEC.
005040*
005050       IF SQLSTATE NOT = "00000"
005060       THEN
005070           MOVE ＯＰＥＮ文  TO Ｗ－ＳＱＬ文識別
005080           INVOKE SELF "ErrorDisplay-method"
005090                        USING Ｗ－ＳＱＬ文識別
005100       END-IF.
005110
005120       EXEC SQL
005130           FETCH CURSOR01 INTO :Ｗ－従業員番号, :Ｗ－職級
005140       END-EXEC.
005150*
005160       IF SQLCODE NOT = 100 AND SQLSTATE NOT = "00000"
005170       THEN
005180           MOVE ＦＥＴＣＨ文  TO Ｗ－ＳＱＬ文識別
005190           INVOKE SELF "ErrorDisplay-method"
005200                        USING Ｗ－ＳＱＬ文識別
005210       END-IF.
005220*
005230       IF SQLCODE = 100
005240       THEN
005250           MOVE  0                    TO   Ｌ－従業員番号
005260           MOVE  0                    TO   Ｌ－職級
005270           EXEC SQL
005280               CLOSE CURSOR01
005290           END-EXEC
005300       ELSE
005310           MOVE  Ｗ－従業員番号       TO   Ｌ－従業員番号
005320           MOVE  Ｗ－職級             TO   Ｌ－職級
005330       END-IF.
005340*
005350   END METHOD SetTop-method.
005360*
005370*========================================================================
005380*　従業員データ削除メソッド（RemoveAt-method）
005390*
005400*　　　指定された従業員番号のレコードを，従業員表及び住所表から削除する。
005410*　　　削除が成功した場合，復帰値として０を，指定された従業員番号に対応
005420*　　する従業員情報が存在しない等の理由から，削除が不成功に終わった場合
005430*　　，復帰値として１を返却する。
005440*
005450*　〇入力：　従業員番号     PIC S9(4)
005460*　〇出力：　復帰値         PIC  9(1)
005470*========================================================================
005480   METHOD-ID.  RemoveAt-method.
005490   DATA DIVISION.
005500   WORKING-STORAGE SECTION.
005510   CONSTANT SECTION.
005520   LINKAGE SECTION.
005530     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
005540    01  Ｌ－従業員番号      PIC S9(04).
005550     EXEC SQL END   DECLARE SECTION END-EXEC.
005560    01  Ｌ－復帰値          PIC  9(01).
005570   PROCEDURE DIVISION
005580               USING    Ｌ－従業員番号   RETURNING   Ｌ－復帰値.
005590*
005600       EXEC SQL
005610           DELETE FROM 従業員表 WHERE 従業員番号 = :Ｌ－従業員番号
005620       END-EXEC.
005630*
005640       IF SQLCODE NOT = 100 AND SQLSTATE NOT = "00000"
005650       THEN
005660           MOVE ＤＥＬＥＴＥ文  TO Ｗ－ＳＱＬ文識別
005670           INVOKE SELF "ErrorDisplay-method"
005680                        USING Ｗ－ＳＱＬ文識別
005690       END-IF.
005700*
005710       IF SQLCODE NOT = 100
005720       THEN
005730           MOVE  0   TO  Ｌ－復帰値
005740           INVOKE  Address-class  "new"
005750                                   RETURNING       住所参照
005760           INVOKE  住所参照  "RemoveAt-method"
005770                              USING       Ｌ－従業員番号
005780           SET 住所参照 TO NULL
005790
005800       ELSE
005810           MOVE  1   TO  Ｌ－復帰値
005820       END-IF.
005830*
005840   END METHOD RemoveAt-method.
005850*
005860*========================================================================
005870*　給与計算メソッド
005880*
005890*　　　多態を実現するための定義であり，サブクラスでOVERRIDEされることに
005900*　　より，初めて意味を持つ。
005910*
005920*　〇出力：　総支給  PIC S9(8)
005930*========================================================================
005940   METHOD-ID.  Salary-method.
005950   DATA DIVISION.
005960   LINKAGE SECTION.
005970    01  Ｌ－総支給          PIC   S9(008).
005980   PROCEDURE   DIVISION    RETURNING   Ｌ－総支給.
005990   END METHOD  Salary-method.
006000*
006010*========================================================================
006020*　賞与計算メソッド
006030*
006040*　　　多態を実現するための定義であり，サブクラスでOVERRIDEされることに
006050*　　より，初めて意味を持つ。
006060*
006070*　〇出力：　総支給  PIC S9(8)
006080*========================================================================
006090   METHOD-ID.  Bonus-method.
006100   DATA DIVISION.
006110   LINKAGE SECTION.
006120    01  Ｌ－総支給          PIC   S9(008).
006130   PROCEDURE   DIVISION    RETURNING   Ｌ－総支給.
006140   END METHOD Bonus-method.
006150*
006160*========================================================================
006170*　在籍チェックメソッド
006180*
006190*　〇出力：　在籍区分  PIC X(1)
006200*========================================================================
006210   METHOD-ID.  IOCheck-method.
006220   DATA DIVISION.
006230   LINKAGE SECTION.
006240    01  在籍区分        PIC   X(001).
006250   PROCEDURE   DIVISION    RETURNING   在籍区分.
006260*
006270       IF  退社年月日     =     SPACE
006280       THEN
006290            MOVE     "0"         TO     在籍区分
006300       ELSE
006310            MOVE     "1"         TO     在籍区分
006320       END-IF.
006330*
006340   END METHOD IOCheck-method.
006350*
006360*========================================================================
006370*　データ設定メソッド
006380*
006390*　（１）データベース表から読み込んだ従業員データのうちの，全従業員に共通
006400*　　　なデータを，SELFのオブジェクトに設定する。
006410*　（２）住所オブジェクトを生成し，データベース表より読み込んだデータを設
006420*　　　定する。
006430*========================================================================
006440   METHOD-ID.  DataSet-method  PROTOTYPE.
006450   DATA DIVISION.
006460   LINKAGE SECTION.
006470   PROCEDURE DIVISION.
006480   END METHOD DataSet-method.
006490*
006500*========================================================================
006510*　従業員保存メソッド（Store-method）
006520*
006530*　（１）SELFオブジェクトが保持する従業員データを従業員表に保存する。
006540*　（２）SELFオブジェクトが保持する住所データのオブジェクト参照から，
006550*　　  その住所オブジェクトが保持する住所データを住所表に保存する。
006560*
006570*=======================================================================
006580   METHOD-ID.  Store-method.
006590   ENVIRONMENT         DIVISION.
006600   DATA DIVISION.
006610   WORKING-STORAGE SECTION.
006620      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
006630    01  Ｗ－従業員番号             PIC S9(004).
006640    01  Ｗ－氏名                   PIC  X(016).
006650    01  Ｗ－入社年月日             PIC  X(008).
006660    01  Ｗ－退社年月日             PIC  X(008).
006670    01  Ｗ－職級                   PIC S9(001).
006680    01  Ｗ－基本給                 PIC S9(008).
006690    01  Ｗ－総支給                 PIC S9(008).
006700    01  Ｗ－時間外手当             PIC S9(5).
006710    01  Ｗ－残業時間               PIC S9(5)V9(1).
006720    01  Ｗ－特別手当               PIC S9(6).
006730      EXEC SQL END   DECLARE SECTION END-EXEC.
006740    01  Ｗ－ＲＥＡＤ結果           PIC 9(1).
006750   LINKAGE SECTION.
006760   PROCEDURE DIVISION.
006770*
006780       MOVE  従業員番号  TO  Ｗ－従業員番号.
006790*
006800       EXEC SQL
006810           SELECT 職級
006820            INTO :Ｗ－職級  FROM 従業員表
006830            WHERE 従業員番号 = :Ｗ－従業員番号
006840       END-EXEC.
006850*
006860       IF SQLCODE NOT = 100 AND SQLSTATE NOT = "00000"
006870       THEN
006880           MOVE ＳＥＬＥＣＴ文  TO Ｗ－ＳＱＬ文識別
006890           INVOKE SELF "ErrorDisplay-method"
006900                        USING Ｗ－ＳＱＬ文識別
006910       END-IF.
006920*
006930       IF SQLCODE = 100
006940       THEN
006950            MOVE  レコードなし   TO  Ｗ－ＲＥＡＤ結果
006960       ELSE
006970            MOVE  レコードあり   TO  Ｗ－ＲＥＡＤ結果
006980       END-IF.
006990*
007000       MOVE  氏名        TO  Ｗ－氏名.
007010       MOVE  入社年月日  TO  Ｗ－入社年月日.
007020       MOVE  退社年月日  TO  Ｗ－退社年月日.
007030       MOVE  職級        TO  Ｗ－職級.
007040       MOVE  基本給      TO  Ｗ－基本給.
007050       MOVE  総支給      TO  Ｗ－総支給.
007060
007070       IF  Ｗ－職級 = 1
007080       THEN
007090           MOVE  特別手当    OF MemberMaster-class TO  Ｗ－特別手当
007100       ELSE
007110           MOVE  時間外手当  OF MemberMaster-class TO  Ｗ－時間外手当
007120           MOVE  残業時間    OF MemberMaster-class TO  Ｗ－残業時間
007130       END-IF.
007140*
007150       IF  Ｗ－ＲＥＡＤ結果  =  レコードなし
007160       THEN
007170           IF Ｗ－職級 = 1
007180           THEN
007190               EXEC SQL
007200                   INSERT INTO
007210                    従業員表(従業員番号,氏名,入社年月日,退社年月日,職級,
007220                             基本給,総支給,特別手当)
007230                    VALUES(:Ｗ－従業員番号,:Ｗ－氏名,:Ｗ－入社年月日,
007240                           :Ｗ－退社年月日,:Ｗ－職級,:Ｗ－基本給,
007250                           :Ｗ－総支給,:Ｗ－特別手当)
007260               END-EXEC
007270           ELSE
007280               EXEC SQL
007290                   INSERT INTO
007300                    従業員表(従業員番号,氏名,入社年月日,退社年月日,職級,
007310                             基本給,総支給,時間外手当,残業時間)
007320                    VALUES(:Ｗ－従業員番号,:Ｗ－氏名,:Ｗ－入社年月日,
007330                           :Ｗ－退社年月日,:Ｗ－職級,:Ｗ－基本給,
007340                           :Ｗ－総支給,:Ｗ－時間外手当,:Ｗ－残業時間)
007350               END-EXEC
007360           END-IF
007370*
007380           IF SQLSTATE NOT = "00000"
007390           THEN
007400               MOVE ＩＮＳＥＲＴ文  TO Ｗ－ＳＱＬ文識別
007410               INVOKE SELF "ErrorDisplay-method"
007420                            USING Ｗ－ＳＱＬ文識別
007430           END-IF
007440       END-IF.
007450
007460       IF  Ｗ－ＲＥＡＤ結果  =  レコードあり
007470           IF Ｗ－職級 = 1
007480           THEN
007490               EXEC SQL
007500                   UPDATE 従業員表
007510                    SET 氏名 = :Ｗ－氏名, 入社年月日 = :Ｗ－入社年月日,
007520                        退社年月日 = :Ｗ－退社年月日, 職級 = :Ｗ－職級,
007530                        基本給 = :Ｗ－基本給, 総支給 = :Ｗ－総支給,
007540                        特別手当 = :Ｗ－特別手当
007550                     WHERE 従業員番号 = :Ｗ－従業員番号
007560               END-EXEC
007570           ELSE
007580               EXEC SQL
007590                   UPDATE 従業員表
007600                    SET 氏名 = :Ｗ－氏名, 入社年月日 = :Ｗ－入社年月日,
007610                        退社年月日 = :Ｗ－退社年月日, 職級 = :Ｗ－職級,
007620                        基本給 = :Ｗ－基本給, 総支給 = :Ｗ－総支給,
007630                        時間外手当 = :Ｗ－時間外手当,
007640                        残業時間 = :Ｗ－残業時間
007650                     WHERE 従業員番号 = :Ｗ－従業員番号
007660               END-EXEC
007670           END-IF
007680*
007690           IF SQLSTATE NOT = "00000"
007700           THEN
007710               MOVE ＵＰＤＡＴＥ文  TO Ｗ－ＳＱＬ文識別
007720               INVOKE SELF "ErrorDisplay-method"
007730                            USING Ｗ－ＳＱＬ文識別
007740           END-IF
007750       END-IF.
007760*
007770       INVOKE  住所参照  "Store-method"  USING  従業員番号.
007780*
007790   END METHOD Store-method.
007800*
007810*========================================================================
007820*　従業員データ更新メソッド（Update-method）
007830*
007840*      計算された従業員の総支給データを従業員表に保存する。
007850*
007860*　〇入力：　総支給           PIC S9(8)
007870*=======================================================================
007880   METHOD-ID.  Update-method.
007890   ENVIRONMENT         DIVISION.
007900   DATA DIVISION.
007910   WORKING-STORAGE SECTION.
007920      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
007930    01  Ｗ－従業員番号             PIC S9(4).
007940      EXEC SQL END   DECLARE SECTION END-EXEC.
007950   LINKAGE SECTION.
007960      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
007970    01  Ｌ－総支給                 PIC S9(008).
007980      EXEC SQL END   DECLARE SECTION END-EXEC.
007990   PROCEDURE DIVISION USING Ｌ－総支給.
008000*
008010       EXEC SQL
008020           UPDATE 従業員表
008030            SET 総支給 = :Ｌ－総支給
008040             WHERE CURRENT OF CURSOR01
008050       END-EXEC.
008060*
008070       IF SQLSTATE NOT = "00000"
008080       THEN
008090           MOVE 位置付けＵＰＤＡＴＥ文  TO  Ｗ－ＳＱＬ文識別
008100           INVOKE SELF "ErrorDisplay-method"
008110                        USING Ｗ－ＳＱＬ文識別
008120       END-IF.
008130*
008140   END METHOD Update-method.
008150*
008160*========================================================================
008170*　従業員データ一括更新メソッド（AllUpdate-method）
008180*
008190*      計算された全ての従業員の総支給データを従業員表に保存する。
008200*    ※  カーソルを使用したUPDATE文（位置付け）およびDELETE文（位置付け）
008210*      が不可能な場合に実行されるメソッドである。
008220*
008230*　〇入力：　更新情報
008240*                更新従業員数    PIC  9(2)
008250*                更新従業員情報  OCCURS 99
008260*                    更新従業員情報  PIC S9(4)
008270*                    更新従業員情報  PIC S9(8)
008280*=======================================================================
008290   METHOD-ID.  AllUpdate-method.
008300   ENVIRONMENT         DIVISION.
008310   DATA DIVISION.
008320   WORKING-STORAGE SECTION.
008330      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
008340    01  Ｗ－従業員番号             PIC S9(4).
008350    01  Ｗ－総支給                 PIC S9(8).
008360      EXEC SQL END   DECLARE SECTION END-EXEC.
008370   LINKAGE SECTION.
008380    01  Ｌ－更新情報.
008390       02  Ｌ－更新従業員数            PIC 9(2).
008400       02  Ｌ－更新従業員情報          OCCURS 99.
008410          03  Ｌ－更新従業員番号          PIC S9(04).
008420          03  Ｌ－更新総支給              PIC S9(08).
008430   PROCEDURE DIVISION USING Ｌ－更新情報.
008440*
008450       MOVE ＵＰＤＡＴＥ文  TO  Ｗ－ＳＱＬ文識別
008460*
008470       PERFORM UNTIL Ｌ－更新従業員数 = 0
008480           MOVE  Ｌ－更新従業員番号(Ｌ－更新従業員数)
008490                                   TO  Ｗ－従業員番号
008500           MOVE  Ｌ－更新総支給(Ｌ－更新従業員数)
008510                                   TO  Ｗ－総支給
008520           EXEC SQL
008530               UPDATE 従業員表
008540                SET 総支給 = :Ｗ－総支給
008550                 WHERE 従業員番号 = :Ｗ－従業員番号
008560           END-EXEC
008570*
008580           IF SQLSTATE NOT = "00000"
008590           THEN
008600               INVOKE SELF "ErrorDisplay-method"
008610                            USING Ｗ－ＳＱＬ文識別
008620           END-IF
008630           SUBTRACT  1  FROM Ｌ－更新従業員数
008640       END-PERFORM.
008650*
008660   END METHOD AllUpdate-method.
008670*
008680*========================================================================
008690*　データベースアクセスエラー表示メソッド（ErrorDisplay-method）
008700*
008710*      データベースアクセス時にエラーが発生した場合に，エラー内容を表示し
008720*    て，アプリケーションを終了する。
008730*      なお，ＣＯＮＮＥＣＴ文以外でエラーが発生した場合は、コネクションの
008740*    切断を行う。
008750*
008760*　〇入力：　ＳＱＬ文識別     PIC 9(2)
008770*========================================================================
008780   METHOD-ID.  ErrorDisplay-method.
008790   ENVIRONMENT         DIVISION.
008800   DATA DIVISION.
008810   LINKAGE SECTION.
008820    01  Ｌ－ＳＱＬ文識別    PIC 9(2).
008830   PROCEDURE DIVISION USING  Ｌ－ＳＱＬ文識別.
008840*
008850       DISPLAY NC"データベースアクセス時にエラーが発生しました".
008860       DISPLAY " ".
008870       DISPLAY "SQLSTATE :" SQLSTATE.
008880       DISPLAY "SQLMSG   :" SQLMSG.
008890*
008900       IF  Ｌ－ＳＱＬ文識別  NOT =  ＣＯＮＮＥＣＴ文
008910       THEN
008920           EXEC SQL
008930               ROLLBACK WORK
008940           END-EXEC
008950*
008960           EXEC SQL
008970               DISCONNECT DEFAULT
008980           END-EXEC
008990       END-IF.
009000*
009010       DISPLAY NC"アプリケーションを終了します".
009020       STOP RUN.
009030*
009040   END METHOD ErrorDisplay-method.
009050*
009060   END OBJECT.
009070  END CLASS AllMember-class.
