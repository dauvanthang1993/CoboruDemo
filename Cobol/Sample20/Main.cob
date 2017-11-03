000010*========================================================================
000020*  従業員管理プログラム（永続化）　　　−オブジェクト指向機能サンプル−
000030*
000040*　　　追加，更新，削除等の結果がデータベースに保存されますので，前回の
000050*　　処理が終了した時点の状態を初期状態として，再実行することができます。
000060*
000070*　〇機能
000080*　　１）従業員情報の登録
000090*　　２）従業員情報の削除
000100*  　３）従業員情報の修正
000110*  　４）給与計算及び各従業員毎の給与情報の参照
000120*  　５）職級毎の従業員住所録印刷
000130*
000140*　〇参照クラス
000150*　　１）住所クラス　　　　　（Address-class）
000160*　　２）従業員クラス　　　　（AllMember-class）
000170*　　３）一般従業員クラス　　（Member-class）
000180*　　４）管理者クラス　　　　（Manager-class）
000190*
000200*　〇使用データベース表
000210*　　１）従業員表
000220*　　２）住所表
000230*
000240*　〇環境変数
000250*　　　ＰＦ２及びＰＦ３キーを有効とするために，環境変数情報として以下を
000260*　　指定してください。
000270*
000280*  　　  TERMINATOR=!PF1,PF2-PF3,!PF4-PF12
000290*
000300*                              Copyright 1998-2015 FUJITSU LIMITED
000310*========================================================================
000320 PROGRAM-ID.   Main.
000330 ENVIRONMENT  DIVISION.
000340 CONFIGURATION  SECTION.
000350   REPOSITORY.
000360      CLASS  Address-class
000370      CLASS  Member-class
000380      CLASS  AllMember-class
000390      CLASS  Manager-class.
000400*
000410   SPECIAL-NAMES.
000420        CRT  STATUS  IS  画面入力状態.
000430*
000440   INPUT-OUTPUT         SECTION.
000450   FILE-CONTROL.
000460       SELECT  印刷ファイル  ASSIGN  TO  PRINTER.
000470 DATA                   DIVISION.
000480   FILE                 SECTION.
000490   FD  印刷ファイル.
000500   01  出力レコード     PIC X(125).
000510   WORKING-STORAGE      SECTION.
000520*
000530   01  従業員データ.
000540      02  Ｗ−従業員番号              PIC S9(04).
000550      02  Ｗ−氏名                    PIC  X(16).
000560      02  Ｗ−郵便番号.
000570         03  Ｗ−郵便番号１           PIC  X(03).
000580         03  Ｗ−郵便番号２           PIC  X(04).
000590      02  Ｗ−住所                    PIC  X(40).
000600      02  Ｗ−入社年月日              PIC  X(08).
000610      02  Ｗ−退社年月日              PIC  X(08).
000620      02  Ｗ−職級                    PIC S9(01).
000630      02  Ｗ−基本給                  PIC S9(08).
000640      02  Ｗ−特別手当                PIC S9(06).
000650      02  Ｗ−時間外手当              PIC S9(05).
000660      02  Ｗ−総支給                  PIC S9(08).
000670*
000680   01  Ｗ−従業員情報.
000690      02  Ｗ−番号情報                PIC S9(04).
000700      02  Ｗ−職級情報                PIC S9(01).
000710*
000720   01  Ｗ−更新情報.
000730      02  Ｗ−更新従業員数            PIC 9(2)  VALUE 0.
000740      02  Ｗ−更新従業員情報          OCCURS 99.
000750         03  Ｗ−更新従業員番号          PIC S9(04).
000760         03  Ｗ−更新総支給              PIC S9(08).
000770*
000780   01  画面−選択番号                 PIC  X(01).
000790   01  画面−職級選択                 PIC  X(01).
000800   01  画面データ.
000810      02  画面−従業員番号            PIC S9(04).
000820      02  画面−氏名                  PIC  X(16).
000830      02  画面−郵便番号.
000840         03  画面−郵便番号１         PIC  X(03).
000850         03  画面−郵便番号２         PIC  X(04).
000860      02  画面−住所                  PIC  X(40).
000870      02  画面−入社年月日            PIC  X(08).
000880      02  画面−退社年月日            PIC  X(08).
000890      02  画面−職級                  PIC S9(01).
000900      02  画面−基本給                PIC S9(08).
000910      02  画面−特別手当              PIC S9(06).
000920      02  画面−メッセージ            PIC  X(65).
000930      02  画面−時間外手当            PIC S9(05).
000940      02  画面−残業時間              PIC  999.9.
000950      02  画面−総支給                PIC S9(08).
000960      02  画面−確認                  PIC  X(01).
000970*
000980   01  印刷ヘッダ１.
000990      02                              PIC  X(05)  VALUE  SPACE.
001000      02                              PIC  N(02)  VALUE  NC"＜　".
001010      02  印刷−見出し                PIC  N(04)  VALUE  SPACE.
001020      02                              PIC  N(05)  VALUE  NC"住所録　＞".
001030      02                              PIC  X(98)  VALUE  SPACE.
001040   01  印刷ヘッダ２.
001050      02                              PIC  X(05)  VALUE  SPACE.
001060      02                              PIC  N(05)  VALUE  NC"従業員番号".
001070      02                              PIC  X(04)  VALUE  SPACE.
001080      02                              PIC  N(03)  VALUE  NC"氏　名".
001090      02                              PIC  X(14)  VALUE  SPACE.
001100      02                              PIC  N(03)  VALUE  NC"住　所".
001110      02                              PIC  X(80)  VALUE  SPACE.
001120   01  印刷データ.
001130      02                              PIC  X(05)  VALUE  SPACE.
001140      02  印刷−従業員番号            PIC  9(04).
001150      02                              PIC  X(10)  VALUE  SPACE.
001160      02  印刷−氏名                  PIC  X(16).
001170      02                              PIC  X(04)  VALUE  SPACE.
001180      02  印刷−郵便番号.
001190         03  印刷−郵便番号１         PIC  X(03).
001200         03                           PIC  X(01)  VALUE  "-".
001210         03  印刷−郵便番号２         PIC  X(04).
001220      02                              PIC  X(02)  VALUE  SPACE.
001230      02  印刷−住所                  PIC  X(40).
001240      02                              PIC  X(28)  VALUE  SPACE.
001250*
001260   01  画面入力状態.
001270      02  状態キー.
001280         03  状態キー１               PIC  X(01).
001290         03  状態キー２               PIC  X(01).
001300      02                              PIC  X(01).
001310   01  終了キー.
001320        03                            PIC  X(01)    VALUE       "1".
001330        03                            PIC  X(01)    VALUE       x"02".
001340   01  確定キー.
001350        03                            PIC  X(01)    VALUE       "1".
001360        03                            PIC  X(01)    VALUE       x"03".
001370*
001380   01  復帰値                         PIC  9(01).
001390*
001400   01  従業員−オブジェクト    OBJECT REFERENCE  AllMember-class.
001410   01  従業員−ファクトリ      OBJECT REFERENCE
001420                                      FACTORY OF AllMember-class.
001430   01  管理者−オブジェクト    OBJECT REFERENCE  Manager-class.
001440   01  一般社員−オブジェクト  OBJECT REFERENCE  Member-class.
001450   01  住所−オブジェクト      OBJECT REFERENCE  Address-class.
001460   01  共通−オブジェクト      OBJECT REFERENCE.
001470*
001480   SCREEN               SECTION.
001490   01  従業員管理画面    BLANK    SCREEN.
001500        03  VALUE    NC"−−＜従業員管理＞−−" LINE  02  COLUMN  29.
001510        03  VALUE    NC"１．従業員情報登録"     LINE  04  COLUMN  31.
001520        03  VALUE    NC"２．従業員情報削除"     LINE  06  COLUMN  31.
001530        03  VALUE    NC"３．従業員情報修正"     LINE  08  COLUMN  31.
001540        03  VALUE    NC"４．給与計算"           LINE  10  COLUMN  31.
001550        03  VALUE    NC"５．住所録"             LINE  12  COLUMN  31.
001560        03  VALUE    NC"Ｘ．終了"               LINE  14  COLUMN  31.
001570        03  VALUE    NC"選択番号＝＝＞"         LINE  16  COLUMN  31.
001580        03  コード   PIC X(01)                  LINE  16  COLUMN  46
001590            USING    画面−選択番号             UNDERLINE.
001600*
001610   01  従業員登録画面    BLANK    SCREEN.
001620        03  VALUE    NC"−−＜従業員登録＞−−" LINE  02  COLUMN  29.
001630        03  VALUE    NC"従業員番号"             LINE  04  COLUMN  11.
001640        03  番号１   PIC  9(04)                 LINE  04  COLUMN  25
001650            USING    画面−従業員番号           UNDERLINE.
001660        03  VALUE    NC"氏名"                   LINE  06  COLUMN  11.
001670        03  Ｗ−氏名１   PIC X(16)              LINE  06  COLUMN  25
001680            USING    画面−氏名                 UNDERLINE.
001690        03  VALUE    NC"住所"                   LINE  08  COLUMN  11.
001700        03  郵便１１ PIC X(03)                  LINE  08  COLUMN  25
001710            USING    画面−郵便番号１           UNDERLINE.
001720        03  VALUE    "-"               LINE  08  COLUMN  28  UNDERLINE.
001730        03  郵便１２ PIC X(04)                  LINE  08  COLUMN  29
001740            USING    画面−郵便番号２           UNDERLINE.
001750        03  住所１   PIC X(40)                  LINE  08  COLUMN  34
001760            USING    画面−住所                 UNDERLINE.
001770        03  VALUE    NC"入社年月日"             LINE  10  COLUMN  11.
001780        03  入社１   PIC X(08)                  LINE  10  COLUMN  25
001790            USING    画面−入社年月日           UNDERLINE.
001800        03  VALUE    NC"職級"                   LINE  12  COLUMN  11.
001810        03  職級１   PIC  9(01)                 LINE  12  COLUMN  25
001820            USING    画面−職級                 UNDERLINE.
001830        03  VALUE    NC"基本給"                 LINE  14  COLUMN  11.
001840        03  基本１   PIC  9(08)                 LINE  14  COLUMN  25
001850            USING    画面−基本給               UNDERLINE.
001860        03  VALUE    NC"特別手当"               LINE  16  COLUMN  11.
001870        03  特別１   PIC  9(06)                 LINE  16  COLUMN  27
001880            USING    画面−特別手当             UNDERLINE.
001890        03  VALUE    NC"時間外手当"             LINE  18  COLUMN  11.
001900        03  時間外１ PIC  9(05)                 LINE  18  COLUMN  28
001910            USING    画面−時間外手当           UNDERLINE.
001920        03  メッセージ１ PIC X(65)              LINE  20  COLUMN  11
001930            USING    画面−メッセージ           UNDERLINE.
001940        03  VALUE    NC"Ｆ２：終了　Ｆ３：登録" LINE  22  COLUMN  43.
001950*
001960   01  従業員選択画面    BLANK    SCREEN.
001970        03  VALUE    NC"−−＜従業員選択＞−−" LINE  02  COLUMN  29.
001980        03  VALUE    NC"従業員番号"             LINE  04  COLUMN  11.
001990        03  番号２   PIC  9(04)                 LINE  04  COLUMN  25
002000            USING    画面−従業員番号           UNDERLINE.
002010        03  メッセージ２ PIC X(65)              LINE  20  COLUMN  11
002020            USING    画面−メッセージ           UNDERLINE.
002030        03  VALUE    NC"Ｆ２：終了　Ｆ３：選択" LINE  22  COLUMN  43.
002040*
002050   01  従業員修正画面    BLANK    SCREEN.
002060        03  VALUE    NC"−−＜従業員修正＞−−" LINE  02  COLUMN  29.
002070        03  VALUE    NC"氏名"                   LINE  04  COLUMN  11.
002080        03  氏名３   PIC X(16)                  LINE  04  COLUMN  25
002090            USING    画面−氏名                 UNDERLINE.
002100        03  VALUE    NC"住所"                   LINE  06  COLUMN  11.
002110        03  郵便３１ PIC X(03)                  LINE  06  COLUMN  25
002120            USING    画面−郵便番号１           UNDERLINE.
002130        03  VALUE    "-"               LINE  06  COLUMN  28  UNDERLINE.
002140        03  郵便３２ PIC X(04)                  LINE  06  COLUMN  29
002150            USING    画面−郵便番号２           UNDERLINE.
002160        03  住所３   PIC X(40)                  LINE  06  COLUMN  34
002170            USING    画面−住所                 UNDERLINE.
002180        03  VALUE    NC"入社年月日"             LINE  08  COLUMN  11.
002190        03  入社３   PIC X(08)                  LINE  08  COLUMN  25
002200            USING    画面−入社年月日           UNDERLINE.
002210        03  VALUE    NC"退社年月日"             LINE  10  COLUMN  11.
002220        03  退社３   PIC X(08)                  LINE  10  COLUMN  25
002230            USING    画面−退社年月日           UNDERLINE.
002240        03  VALUE    NC"職級"                   LINE  12  COLUMN  11.
002250        03  職級３   PIC  9(01)                 LINE  12  COLUMN  25
002260            USING    画面−職級                 UNDERLINE.
002270        03  VALUE    NC"基本給"                 LINE  14  COLUMN  11.
002280        03  基本３   PIC  9(08)                 LINE  14  COLUMN  25
002290            USING    画面−基本給               UNDERLINE.
002300        03  VALUE    NC"特別手当"               LINE  16  COLUMN  11.
002310        03  特別３   PIC  9(06)                 LINE  16  COLUMN  27
002320            USING    画面−特別手当             UNDERLINE.
002330        03  VALUE    NC"時間外手当"             LINE  18  COLUMN  11.
002340        03  時間外３ PIC  9(05)                 LINE  18  COLUMN  28
002350            USING    画面−時間外手当           UNDERLINE.
002360        03  VALUE    NC"残業時間"               LINE  20  COLUMN  11.
002370        03  残業時間３   PIC  999.9             LINE  20  COLUMN  28
002380            USING    画面−残業時間             UNDERLINE.
002390        03  VALUE    NC"Ｆ２：取消　Ｆ３：修正" LINE  22  COLUMN  43.
002400*
002410   01  職級選択画面    BLANK    SCREEN.
002420        03  VALUE    NC"−−＜住所録印刷＞−−" LINE  02  COLUMN  29.
002430        03  VALUE    NC"１．管理者"             LINE  04  COLUMN  31.
002440        03  VALUE    NC"２．一般社員"           LINE  06  COLUMN  31.
002450        03  VALUE    NC"選択番号＝＝＞"         LINE  14  COLUMN  31.
002460        03  コード   PIC X(01)                  LINE  14  COLUMN  46
002470            USING    画面−職級選択             UNDERLINE.
002480*
002490        03  VALUE    NC"Ｆ２：終了　Ｆ３：印刷" LINE  22  COLUMN  43.
002500*
002510   01  給与情報参照選択画面    BLANK    SCREEN.
002520        03  VALUE    NC"−−＜給与計算結果の参照＞−−"
002530                                                LINE  02  COLUMN  5.
002540        03  VALUE  NC"給与計算処理が完了しました。"
002550                                                LINE  04  COLUMN  7.
002560        03  VALUE
002570            NC"各従業員の給与情報を参照したい場合は，"
002580                                                LINE  06  COLUMN  7.
002590        03  VALUE
002600            NC"以下に従業員番号を入力して下さい。"
002610                                                LINE  06  COLUMN  45.
002620        03  VALUE    NC"従業員番号"             LINE  08  COLUMN  7.
002630        03  番号２   PIC  9(04)                 LINE  08  COLUMN  21
002640            USING    画面−従業員番号           UNDERLINE.
002650        03  VALUE    NC"Ｆ２：終了　Ｆ３：選択" LINE  22  COLUMN  43.
002660*
002670   01  給与情報参照画面    BLANK    SCREEN.
002680        03  VALUE    NC"−−＜給与計算結果＞−−" LINE  02  COLUMN  29.
002690        03  VALUE    NC"従業員番号"             LINE  04  COLUMN  11.
002700        03  番号４   PIC  9(04)                 LINE  04  COLUMN  25
002710            USING    画面−従業員番号           UNDERLINE.
002720        03  VALUE    NC"氏名"                   LINE  06  COLUMN  11.
002730        03  Ｗ−氏名４   PIC X(16)              LINE  06  COLUMN  25
002740            USING    画面−氏名                 UNDERLINE.
002750        03  VALUE    NC"職級"                   LINE  08  COLUMN  11.
002760        03  職級４   PIC  9(01)                 LINE  08  COLUMN  25
002770            USING    画面−職級                 UNDERLINE.
002780        03  VALUE    NC"基本給"                 LINE  10  COLUMN  11.
002790        03  基本４   PIC  9(08)                 LINE  10  COLUMN  25
002800            USING    画面−基本給               UNDERLINE.
002810        03  VALUE    NC"特別手当"               LINE  12  COLUMN  11.
002820        03  特別４   PIC  9(06)                 LINE  12  COLUMN  27
002830            USING    画面−特別手当             UNDERLINE.
002840        03  VALUE    NC"時間外手当"             LINE  14  COLUMN  11.
002850        03  時間外４ PIC  9(05)                 LINE  14  COLUMN  28
002860            USING    画面−時間外手当           UNDERLINE.
002870        03  VALUE    NC"×"                     LINE  14  COLUMN  36.
002880        03  VALUE    NC"残業時間"               LINE  14  COLUMN  40.
002890        03  残業時間４ PIC  999.9               LINE  14  COLUMN  49
002900            USING    画面−残業時間             UNDERLINE.
002910        03  VALUE    NC"総支給"                 LINE  16  COLUMN  11.
002920        03  総支給４ PIC  9(08)                 LINE  16  COLUMN  25
002930            USING    画面−総支給               UNDERLINE.
002940        03  VALUE    NC"Ｆ２：終了"             LINE  22  COLUMN  50.
002950*
002960   01  削除確認画面    BLANK    SCREEN.
002970        03  VALUE    NC"−−＜従業員選択＞−−" LINE  02  COLUMN  29.
002980        03  VALUE    NC"従業員番号"             LINE  04  COLUMN  11.
002990        03  番号２   PIC  9(04)                 LINE  04  COLUMN  25
003000            USING    画面−従業員番号           UNDERLINE.
003010        03  VALUE    "削除してよろしいですか？（Y/N）"
003020                                                LINE  06  COLUMN  11.
003030        03  確認     PIC X(1)                   LINE  06  COLUMN  45
003040            USING    画面−確認                 UNDERLINE.
003050*
003060*========================================================================
003070*  メイン処理
003080*========================================================================
003090 PROCEDURE                  DIVISION.
003100*
003110     PERFORM    初期処理.
003120     PERFORM    主処理  UNTIL  画面−選択番号  =  "x"  OR "X".
003130     PERFORM    終了処理.
003140     STOP RUN.
003150*
003160*========================================================================
003170*  初期処理
003180*
003190*　　　データベースに接続する。
003200*========================================================================
003210 初期処理     SECTION.
003220*
003230     INVOKE  AllMember-class "Connect-factory-method".
003240*
003250 初期処理出口.
003260     EXIT.
003270*
003280*========================================================================
003290*  主処理
003300*========================================================================
003310 主処理     SECTION.
003320*
003330     PERFORM     従業員管理画面処理.
003340*
003350 主処理出口.
003360     EXIT.
003370*
003380*========================================================================
003390*  終了処理
003400*
003410*　　　データベースを切断する。
003420*========================================================================
003430 終了処理        SECTION.
003440*
003450     INVOKE  AllMember-class "Disconnect-factory-method".
003460*
003470 終了処理出口.
003480     EXIT.
003490*
003500*========================================================================
003510*  従業員管理画面処理
003520*
003530*（１）従業員管理画面（初期画面）を表示し，処理の選択を要求する。
003540*========================================================================
003550 従業員管理画面処理         SECTION.
003560*
003570      INITIALIZE  状態キー.
003580      MOVE      SPACE    TO    画面−選択番号.
003590      DISPLAY   従業員管理画面.
003600      ACCEPT    従業員管理画面.
003610      EVALUATE  画面−選択番号
003620      WHEN  "1"
003630          PERFORM  従業員登録画面処理  UNTIL  状態キー  =  終了キー
003640      WHEN  "2"
003650          PERFORM  従業員情報削除処理  UNTIL  状態キー  =  終了キー
003660      WHEN  "3"
003670          PERFORM  従業員情報修正処理  UNTIL  状態キー  =  終了キー
003680      WHEN  "4"
003690          INVOKE   AllMember-class "SetTop-factory-method"
003700                                             RETURNING  Ｗ−従業員情報
003710          PERFORM  従業員オブジェクト獲得処理
003720          PERFORM  給与計算処理      UNTIL  従業員−オブジェクト  =  NULL
003730          PERFORM  給与情報参照処理  UNTIL  状態キー  =  終了キー
003740      WHEN  "5"
003750          PERFORM  住所録印刷処理
003760      END-EVALUATE.
003770*
003780 従業員管理画面処理出口.
003790      EXIT.
003800*
003810*=======================================================================
003820*  従業員オブジェクト獲得処理
003830*
003840*（１）指定された従業員番号に対応する従業員データのオブジェクトを，「従
003850*　　業員−オブジェクト」に獲得する。
003860*　　　従業員番号に対応する従業員データが存在しない場合，「従業員−オブ
003870*　　ジェクト」には，NULLを設定する。
003880*
003890*========================================================================
003900 従業員オブジェクト獲得処理    SECTION.
003910*
003920          EVALUATE  Ｗ−職級情報
003930          WHEN      1
003940              INVOKE Manager-class "NEW"
003950                                  RETURNING 従業員−オブジェクト
003960          WHEN      2
003970              INVOKE Member-class "NEW"
003980                                  RETURNING 従業員−オブジェクト
003990          WHEN      OTHER
004000              SET   従業員−オブジェクト  TO   NULL
004010              GO  TO  従業員オブジェクト獲得処理出口
004020          END-EVALUATE.
004030          INVOKE  従業員−オブジェクト  "RetAt-method"
004040                                      USING       Ｗ−番号情報
004050                                      RETURNING   従業員−オブジェクト.
004060*
004070 従業員オブジェクト獲得処理出口.
004080       EXIT.
004090*
004100*========================================================================
004110*  従業員登録画面処理
004120*
004130*（１）新規登録者の情報入力を要求し，入力された情報をオブジェクトに設定
004140*　　する。
004150*　・　ＰＦ３キーにより入力が確定し，ＰＦ４キーにより処理を終了する。
004160*　・　入力された職級が１又は２でなければ，再度入力を要求する。
004170*
004180*【注意】
004190*　　新規登録者の従業員番号として，既存の番号を指定した場合，既存の従業
004200*　員情報は，新規登録情報と置き変わってしまいます。
004210*========================================================================
004220 従業員登録画面処理         SECTION.
004230*
004240      INITIALIZE  画面データ.
004250*
004260 従業員情報入力.
004270      DISPLAY  従業員登録画面.
004280      MOVE  SPACE  TO  画面−メッセージ
004290      ACCEPT   従業員登録画面.
004300*
004310      EVALUATE  状態キー
004320      WHEN      終了キー
004330          GO  TO  従業員登録画面処理出口
004340      WHEN      確定キー
004350          IF  NOT ( 画面−職級  =  1     OR
004360                      画面−職級  =  2 )
004370              MOVE
004380             "「職級」に１（管理者）又は２（一般社員）を設定して下さい。"
004390                                                 TO  画面−メッセージ
004400              GO  TO  従業員情報入力
004410          ELSE
004420              PERFORM  データ設定
004430              MOVE  0  TO  総支給  OF  従業員−オブジェクト
004440              INVOKE   従業員−オブジェクト  "Store-method"
004450          END-IF
004460      END-EVALUATE.
004470*
004480 従業員登録画面処理出口.
004490      EXIT.
004500*
004510*========================================================================
004520*  従業員情報削除処理
004530*
004540*（１）従業員番号を指定し，その従業員番号の従業員情報を削除する。
004550*　・　ＰＦ３キーにより確定し，ＰＦ４キーにより処理を終了する。
004560*
004570*========================================================================
004580 従業員情報削除処理         SECTION.
004590*
004600      INITIALIZE  画面データ.
004610*
004620 従業員情報削除.
004630      INITIALIZE  状態キー.
004640      DISPLAY     従業員選択画面.
004650      ACCEPT      従業員選択画面.
004660*
004670      EVALUATE    状態キー
004680      WHEN        終了キー
004690          GO  TO  従業員情報削除処理出口
004700      WHEN        確定キー
004710          MOVE  SPACE  TO  画面−確認
004720          DISPLAY   削除確認画面
004730          ACCEPT    確認
004740          IF  画面−確認  =  "Y"  OR
004750              画面−確認  =  "y"
004760          THEN
004770              INVOKE  AllMember-class  "RemoveAt-factory-method"
004780                                  USING     BY CONTENT  画面−従業員番号
004790                                  RETURNING             復帰値
004800          ELSE
004810              INITIALIZE   状態キー
004820              MOVE  SPACE  TO  画面−メッセージ
004830              GO  TO  従業員情報削除
004840          END-IF
004850*
004860          IF  復帰値  =  0
004870          THEN
004880              MOVE  "削除完了しました。"         TO  画面−メッセージ
004890          ELSE
004900              MOVE  "削除できませんでした。従業員番号を確認して下さい。"
004910                                                 TO  画面−メッセージ
004920          END-IF
004930          GO  TO  従業員情報削除
004940      END-EVALUATE.
004950*
004960 従業員情報削除処理出口.
004970      EXIT.
004980*
004990*========================================================================
005000*　データ設定処理
005010*
005020*（１）職級毎のオブジェクトを生成し，職級固有の入力情報を設定する。
005030*  ・　入力された職級が１（管理者）ならば，Manager-class のオブジェクト
005040*　　を生成し，特別手当の値をそのオブジェクトに設定する。
005050*　・　入力された職級が２（一般社員）ならば，一般社員クラスのオブジェク
005060*　　トを生成し，時間外手当の値をそのオブジェクトに設定する。
005070*（２）共通の入力情報を（１）で作成したオブジェクトに設定する。
005080*（３）Address-class のオブジェクトを獲得し，そのオブジェクト参照を（１
005090*　　）で作成したオブジェクトに設定した後，入力された住所データを設定す
005100*　　る。
005110*========================================================================
005120 データ設定       SECTION.
005130*
005140      EVALUATE  画面−職級
005150******  　管理者  *****
005160      WHEN  1
005170          INVOKE   Manager-class  "new"  RETURNING  管理者−オブジェクト
005180          SET      従業員−オブジェクト   TO   管理者−オブジェクト
005190          MOVE     画面−特別手当         TO
005200                              特別手当    OF  管理者−オブジェクト
005210******  一般社員  *****
005220      WHEN  2
005230          INVOKE   Member-class  "new"  RETURNING  一般社員−オブジェクト
005240          SET      従業員−オブジェクト   TO   一般社員−オブジェクト
005250          MOVE     画面−時間外手当       TO
005260                              時間外手当  OF   一般社員−オブジェクト
005270          MOVE     画面−残業時間         TO
005280                              残業時間    OF   一般社員−オブジェクト
005290      END-EVALUATE.
005300*
005310      MOVE   画面−従業員番号  TO  従業員番号   OF  従業員−オブジェクト.
005320      MOVE   画面−氏名        TO  氏名         OF  従業員−オブジェクト.
005330      MOVE   画面−入社年月日  TO  入社年月日   OF  従業員−オブジェクト.
005340      MOVE   画面−退社年月日  TO  退社年月日   OF  従業員−オブジェクト.
005350      MOVE   画面−職級        TO  職級         OF  従業員−オブジェクト.
005360      MOVE   画面−基本給      TO  基本給       OF  従業員−オブジェクト.
005370*
005380      INVOKE  Address-class  "new"   RETURNING  住所−オブジェクト.
005390      SET    住所参照  OF  従業員−オブジェクト TO  住所−オブジェクト.
005400      MOVE   画面−郵便番号    TO    郵便番号   OF  住所−オブジェクト.
005410      MOVE   画面−住所        TO    住所       OF  住所−オブジェクト.
005420*
005430 データ設定出口.
005440      EXIT.
005450*
005460*========================================================================
005470*  従業員情報修正処理
005480*
005490*（１）従業員選択画面を表示し，修正する従業員の従業員コードの入力を要求
005500*　　する。
005510*（２）入力されたＰＦキー毎の処理を行う。
005520*　・　ＰＦ２（終了キー）が入力されたならば，処理を終了するために，制御
005530*　　を出口に移行する。
005540*　・　ＰＦ３（確定キー）が入力されたならば，指定された従業員番号の従業
005550*　　員オブジェクトを獲得し，データ取得処理及び従業員情報修正画面処理を
005560*　　行う。
005570*=======================================================================
005580 従業員情報修正処理         SECTION.
005590*
005600      INITIALIZE  画面データ  Ｗ−従業員番号.
005610      DISPLAY  従業員選択画面.
005620      ACCEPT   従業員選択画面.
005630*
005640      EVALUATE  状態キー
005650      WHEN      終了キー
005660          GO  TO  従業員情報修正処理出口
005670      WHEN      確定キー
005680          INVOKE  AllMember-class "SyokukyuGet-factory-method"
005690                                            USING      画面−従業員番号
005700                                            RETURNING  Ｗ−職級情報
005710          IF  Ｗ−職級情報  NOT = 0
005720          THEN
005730              MOVE  画面−従業員番号   TO  Ｗ−番号情報
005740              PERFORM  従業員オブジェクト獲得処理
005750              PERFORM     データ取得
005760              INITIALIZE  状態キー
005770              PERFORM     従業員情報修正画面処理
005780                          UNTIL  状態キー  =  終了キー  OR  確定キー
005790          END-IF
005800      END-EVALUATE.
005810*
005820 従業員情報修正処理出口.
005830      EXIT.
005840*
005850*========================================================================
005860*  データ取得処理
005870*
005880*（１）取り出した従業員オブジェクトの情報を参照し，処理を切りわける。
005890*  ・　指定された従業員番号のオブジェクトならば，必要な情報を画面データ
005900*　　に設定する。
005910*　・　指定された従業員番号のオブジェクトでなければ，次のオブジェクトを
005920*　　獲得する。
005930*========================================================================
005940 データ取得       SECTION.
005950*
005960        MOVE  氏名        OF  従業員−オブジェクト  TO  画面−氏名.
005970        MOVE  入社年月日  OF  従業員−オブジェクト  TO  画面−入社年月日.
005980        MOVE  退社年月日  OF  従業員−オブジェクト  TO  画面−退社年月日.
005990        MOVE  職級        OF  従業員−オブジェクト  TO  画面−職級.
006000        MOVE  基本給      OF  従業員−オブジェクト  TO  画面−基本給.
006010        IF    画面−職級  =  1
006020        THEN
006030            MOVE   特別手当    OF  従業員−オブジェクト AS  Manager-class
006040                                                    TO   画面−特別手当
006050        ELSE
006060            MOVE   時間外手当  OF  従業員−オブジェクト AS  Member-class
006070                                                    TO   画面−時間外手当
006080            MOVE   残業時間    OF  従業員−オブジェクト AS  Member-class
006090                                                    TO   画面−残業時間
006100        END-IF.
006110        SET    住所−オブジェクト TO  住所参照  OF  従業員−オブジェクト.
006120        MOVE   郵便番号    OF  住所−オブジェクト    TO  画面−郵便番号.
006130        MOVE   住所        OF  住所−オブジェクト    TO  画面−住所.
006140*
006150 データ取得出口.
006160      EXIT.
006170*
006180*========================================================================
006190*  従業員情報修正画面処理
006200*
006210*（１）従業員情報修正画面を表示し，情報の修正を要求する。
006220*（２）修正後入力されたＰＦキー毎の処理を行う。
006230*　・　ＰＦ２（終了キー）が入力されたならば，修正を無効とするために，何
006240*　　もせずに制御を出口に移行する。
006250*　・　ＰＦ３（確定キー）が入力されたならばデータ設定処理を行った後，修
006260*　　正情報の保存処理を行う。
006270*========================================================================
006280 従業員情報修正画面処理         SECTION.
006290      DISPLAY  従業員修正画面.
006300      ACCEPT   従業員修正画面.
006310*
006320      EVALUATE   状態キー
006330      WHEN       終了キー
006340          GO  TO  従業員情報修正画面処理出口
006350      WHEN       確定キー
006360          PERFORM  データ設定
006370          MOVE  0  TO  総支給  OF  従業員−オブジェクト
006380          INVOKE   従業員−オブジェクト  "Store-method"
006390      END-EVALUATE.
006400*
006410 従業員情報修正画面処理出口.
006420      EXIT.
006430*
006440*========================================================================
006450*  給与計算処理
006460*
006470*（１）給与計算を行うメソッドを実行し，その結果をオブジェクトに設定して
006480*　　，データベース表に反映する。その後，次の従業員オブジェクトを獲得す
006490*　　る。
006500*========================================================================
006510 給与計算処理         SECTION.
006520*
006530      MOVE  従業員−オブジェクト::"Salary-method"  TO  Ｗ−総支給.
006540      INVOKE   AllMember-class  "Update-factory-method"
006550                                 USING  Ｗ−総支給.
006560      INVOKE   AllMember-class  "NextGet-factory-method"
006570                                 RETURNING  Ｗ−従業員情報.
006580      PERFORM  従業員オブジェクト獲得処理.
006590*========================================================================
006600*【注意】
006610*    カーソルを使用したUPDATE文（位置付け）およびDELETE文（位置付け）が使
006620*  用できない場合のプログラム修正について
006630*
006640*    カーソルを使用したUPDATE文（位置付け）およびDELETE文（位置付け）が使
006650*  用できない環境では、現在の給与計算処理 SECTION（006510〜006560）を以下
006660*  （006660〜006770）のように修正してください。
006670*========================================================================
006680*     MOVE  従業員−オブジェクト::"Salary-method"  TO  Ｗ−総支給.
006690*     ADD   1             TO  Ｗ−更新従業員数.
006700*     MOVE  Ｗ−番号情報  TO  Ｗ−更新従業員番号(Ｗ−更新従業員数).
006710*     MOVE  Ｗ−総支給    TO  Ｗ−更新総支給(Ｗ−更新従業員数).
006720*     INVOKE   AllMember-class  "NextGet-factory-method"
006730*                                RETURNING  Ｗ−従業員情報.
006740*     PERFORM  従業員オブジェクト獲得処理.
006750*     IF  従業員−オブジェクト = NULL
006760*     THEN
006770*         INVOKE   AllMember-class  "AllUpdate-factory-method"
006780*                                    USING  Ｗ−更新情報
006790*     END-IF.
006800*========================================================================
006810*
006820 給与計算処理出口.
006830      EXIT.
006840*
006850*========================================================================
006860*  給与情報参照処理
006870*
006880*（１）給与情報参照選択画面を表示し，参照する従業員の従業員コードの入力
006890*　　を要求する。
006900*（２）入力されたＰＦキー毎の処理を行う。
006910*　・　ＰＦ２（終了キー）が入力されたならば，処理を終了するために，制御
006920*　　を出口に移行する。
006930*　・　ＰＦ３（確定キー）が入力されたならば，指定された従業員番号の従業
006940*　　員オブジェクトを獲得し，データ取得処理を行い，給与情報を表示する。
006950*========================================================================
006960 給与情報参照処理         SECTION.
006970*
006980      INITIALIZE  画面データ  Ｗ−従業員番号.
006990      DISPLAY  給与情報参照選択画面.
007000      ACCEPT   給与情報参照選択画面.
007010*
007020      EVALUATE  状態キー
007030      WHEN      終了キー
007040          GO  TO  給与情報参照処理出口
007050      WHEN      確定キー
007060          INVOKE  AllMember-class  "SyokukyuGet-factory-method"
007070                                    USING      画面−従業員番号
007080                                    RETURNING  Ｗ−職級情報
007090*
007100          MOVE   画面−従業員番号    TO    Ｗ−番号情報
007110          PERFORM  従業員オブジェクト獲得処理
007120*
007130          IF  従業員−オブジェクト  NOT =  NULL
007140          THEN
007150              PERFORM  データ取得
007160              MOVE   総支給  OF  従業員−オブジェクト  TO  画面−総支給
007170              INITIALIZE  状態キー
007180              PERFORM  UNTIL  状態キー  =  終了キー
007190                  DISPLAY  給与情報参照画面
007200                  ACCEPT   給与情報参照画面
007210              END-PERFORM
007220          END-IF
007230          INITIALIZE  状態キー
007240      END-EVALUATE.
007250*
007260 給与情報参照処理出口.
007270      EXIT.
007280*
007290*========================================================================
007300*  住所録印刷処理
007310*
007320*（１）職級選択画面を表示し，職級の選択要求を行う。
007330*（２）選択されたＰＦキー毎の処理を行う。
007340*　・　ＰＦ２（終了キー）が入力されたならば，出口に制御を移行する。
007350*　・　ＰＦ３（確定キー）が入力されたならば，選択された職級に対する住所
007360*　　録の印刷処理を行う。
007370*========================================================================
007380 住所録印刷処理         SECTION.
007390*
007400      INITIALIZE  画面−職級選択.
007410      DISPLAY  職級選択画面.
007420      ACCEPT   職級選択画面.
007430*
007440      EVALUATE  状態キー
007450      WHEN      終了キー
007460          GO  TO  住所録印刷処理出口
007470      WHEN      確定キー
007480          INVOKE   AllMember-class  "SetTop-factory-method"
007490                                     RETURNING  Ｗ−従業員情報
007500          PERFORM  従業員オブジェクト獲得処理
007510*
007520          IF   従業員−オブジェクト  =  NULL
007530          THEN
007540              GO  TO  住所録印刷処理出口
007550          END-IF
007560*
007570          OPEN  OUTPUT  印刷ファイル
007580          PERFORM  ヘッダー出力処理
007590          PERFORM  印刷処理
007600                   UNTIL  従業員−オブジェクト  =  NULL
007610          CLOSE  印刷ファイル
007620      END-EVALUATE.
007630*
007640 住所録印刷処理出口.
007650      EXIT.
007660*
007670*========================================================================
007680*  ヘッダー出力処理
007690*
007700*（１）選択された職級に対する住所録の，ヘッダー部分を印刷する。
007710*========================================================================
007720 ヘッダー出力処理         SECTION.
007730*
007740      INITIALIZE  印刷ヘッダ１ 印刷ヘッダ２.
007750*
007760      IF  画面−職級選択  =  1
007770      THEN
007780          MOVE  NC"管理者"            TO    印刷−見出し
007790      END-IF.
007800      IF  画面−職級選択  =  2
007810      THEN
007820          MOVE  NC"一般社員"          TO    印刷−見出し
007830      END-IF.
007840      WRITE  出力レコード   FROM   印刷ヘッダ１  AFTER  PAGE.
007850      WRITE  出力レコード   FROM   印刷ヘッダ２  AFTER  2.
007860*
007870 ヘッダー出力処理出口.
007880      EXIT.
007890*
007900*========================================================================
007910*  印刷処理
007920*
007930*（１）データベース表を順次読み込んで従業員オブジェクトを生成し，対象と
007940*　　なる職級であれば情報をレコードに設定し，印刷ファイルに書き込む。
007950*========================================================================
007960 印刷処理         SECTION.
007970      INITIALIZE  印刷データ.
007980      MOVE   職級  OF  従業員−オブジェクト  TO  Ｗ−職級.
007990*
008000      IF  (画面−職級選択  =  1  AND  Ｗ−職級  =  1)  OR
008010          (画面−職級選択  =  2  AND  Ｗ−職級  =  2)
008020      THEN
008030          MOVE   従業員番号  OF  従業員−オブジェクト  TO
008040                                                     印刷−従業員番号
008050          MOVE   氏名        OF  従業員−オブジェクト  TO  印刷−氏名
008060*
008070          SET    住所−オブジェクト  TO
008080                                 住所参照  OF  従業員−オブジェクト
008090          MOVE   郵便番号    OF  住所−オブジェクト  TO  Ｗ−郵便番号
008100          MOVE   Ｗ−郵便番号１                      TO  印刷−郵便番号１
008110          MOVE   Ｗ−郵便番号２                      TO  印刷−郵便番号２
008120          MOVE   住所        OF  住所−オブジェクト  TO  印刷−住所
008130*
008140          WRITE  出力レコード    FROM  印刷データ  AFTER  2
008150      END-IF.
008160*
008170      INVOKE   AllMember-class  "NextGet-factory-method"
008180                                 RETURNING  Ｗ−従業員情報.
008190      PERFORM  従業員オブジェクト獲得処理.
008200 印刷処理出口.
008210      EXIT.
008220*
008230 END PROGRAM Main.
