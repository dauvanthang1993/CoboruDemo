000100*========================================================================
000200*　従業員管理クラス（Control-member-class）
000300*                                   −サンプルプログラム「従業員管理」−
000400*
000500*　　　従業員を管理する従業員辞書参照データおよびメソッドを持つ
000600*
000700*　〇継承クラス
000800*　　１）FJBASE
000900*
001000*　〇参照クラス
001100*　　１）ディクショナリクラス     (Dict)
001200*　　２）住所クラス               (Address-class)
001300*　　３）従業員クラス             (AllMember-class)
001400*　　４）一般従業員クラス         (Member-class)
001500*　　５）管理者クラス             (Manager-class)
001600*
001700*　〇オブジェクトデータ
001800*　　１）従業員辞書参照　−　OBJECT REFERENCE  Dict
001900*
002000*　〇オブジェクトメソッド
002100*　　１）従業員登録メソッド       (Regist-member)
002200*　　２）従業員情報獲得メソッド   (Get-member-info)
002300*　　４）従業員削除メソッド       (Remove-member)
002400*　　５）給与計算メソッド         (Cal-salary)
002500*　　６）給与獲得メソッド         (Get-salary)
002600*　　７）住所印刷メソッド         (Print-address)
002700*
002800*                              Copyright 1997-2015 FUJITSU LIMITED
002900*========================================================================
003000 CLASS-ID.   Control-member-class INHERITS  FJBASE.
003100 ENVIRONMENT      DIVISION.
003200 CONFIGURATION    SECTION.
003300 REPOSITORY.
003400     CLASS  FJBASE
003500     CLASS  Dict
003600     CLASS  Address-class
003700     CLASS  AllMember-class
003800     CLASS  Member-class
003900     CLASS  Manager-class.
004000*
004100  OBJECT.
004200   DATA DIVISION.
004300   WORKING-STORAGE SECTION.
004400   01  従業員辞書−オブジェクト  USAGE  OBJECT REFERENCE  Dict.
004500    PROCEDURE DIVISION.
004600*=======================================================================
004700*　INITメソッド (INIT)
004800*
004900*（１）NEWメソッドから呼ばれる。オブジェクトデータを初期化するメソッド。
005000*=======================================================================
005100   METHOD-ID.  INIT  OVERRIDE.
005200   DATA DIVISION.
005300   WORKING-STORAGE SECTION.
005400   LINKAGE SECTION.
005500   PROCEDURE DIVISION.
005600*
005700      INVOKE  Dict "NEW"  RETURNING  従業員辞書−オブジェクト
005800*
005900   END METHOD  INIT.
006000*
006100*=======================================================================
006200*　従業員登録メソッド (Regist-member)
006300*
006400*　○入力：  従業員番号       (PIC 9(04))
006500*            氏名             (PIC N(08))
006600*            郵便番号
006700*              郵便番号１     (PIC X(03))
006800*              郵便番号２     (PIC X(04))
006900*            住所             (PIC N(20))
007000*            入社年月日       (PIC X(08))
007100*            退社年月日       (PIC X(08))
007200*            職級             (PIC 9(01))
007300*            基本給           (PIC 9(08))
007400*            特別手当         (PIC 9(06))
007500*            時間外手当       (PIC 9(05))
007600*            残業時間         (PIC 999.9)
007700*　○出力：　復帰値           (PIC 9(4) COMP)
007800*          0 : 登録成功
007900*          1 : 登録失敗（職級誤り）
008000*=======================================================================
008100   METHOD-ID.  Regist-member.
008200   DATA DIVISION.
008300   WORKING-STORAGE SECTION.
008400   01  従業員−オブジェクト    USAGE  OBJECT REFERENCE  AllMember-class.
008500   01  管理者−オブジェクト    USAGE  OBJECT REFERENCE  Manager-class.
008600   01  一般社員−オブジェクト  USAGE  OBJECT REFERENCE  Member-class.
008700   01  住所−オブジェクト      USAGE  OBJECT REFERENCE  Address-class.
008800   LINKAGE SECTION.
008900   01  Ｌ−従業員番号     PIC 9(04).
009000   01  Ｘ−従業員番号     REDEFINES Ｌ−従業員番号  PIC X(04).
009100   01  Ｌ−氏名           PIC N(08).
009200   01  Ｌ−郵便番号.
009300      02  Ｌ−郵便番号１  PIC X(03).
009400      02  Ｌ−郵便番号２  PIC X(04).
009500   01  Ｌ−住所           PIC N(20).
009600   01  Ｌ−入社年月日     PIC X(08).
009700   01  Ｌ−退社年月日     PIC X(08).
009800   01  Ｌ−職級           PIC 9(01).
009900   01  Ｌ−基本給         PIC 9(08).
010000   01  Ｌ−特別手当       PIC 9(06).
010100   01  Ｌ−時間外手当     PIC 9(05).
010200   01  Ｌ−残業時間       PIC 999.9.
010300   01  Ｒ−復帰値         PIC 9(04) COMP.
010400   PROCEDURE DIVISION
010500     USING  Ｌ−従業員番号
010600            Ｌ−氏名
010700            Ｌ−郵便番号
010800            Ｌ−住所
010900            Ｌ−入社年月日
011000            Ｌ−退社年月日
011100            Ｌ−職級
011200            Ｌ−基本給
011300            Ｌ−特別手当
011400            Ｌ−時間外手当
011500            Ｌ−残業時間
011600     RETURNING  Ｒ−復帰値.
011700*
011800       IF  NOT ( Ｌ−職級  =  1    OR
011900                 Ｌ−職級  =  2 )  THEN
012000         MOVE  1  TO  Ｒ−復帰値
012100         EXIT METHOD
012200       END-IF
012300
012400       PERFORM  データ設定
012500       INVOKE   従業員辞書−オブジェクト  "Element-PutAt"
012600          USING              Ｘ−従業員番号
012700                 BY CONTENT  従業員−オブジェクト
012800       MOVE  0  TO  Ｒ−復帰値
012900       EXIT METHOD.
013000*=======================================================================
013100*　データ設定処理
013200*
013300*（１）職級毎のオブジェクトを生成し，職級固有の入力情報を設定する。
013400*  ・　入力された職級が１（管理者）ならば，Manager-class のオブジェクト
013500*　　を生成し，特別手当の値をそのオブジェクトに設定する。
013600*　・　入力された職級が２（一般社員）ならば，一般社員クラスのオブジェク
013700*　　トを生成し，時間外手当の値をそのオブジェクトに設定する。
013800*（２）共通の入力情報を（１）で作成したオブジェクトに設定する。
013900*（３）Address-class のオブジェクトを獲得し，そのオブジェクト参照を（１
014000*　　）で作成したオブジェクトに設定した後，入力された住所データを設定す
014100*　　る。
014200*=======================================================================
014300 データ設定       SECTION.
014400*
014500     EVALUATE  Ｌ−職級
014600*****　　管理者　****
014700     WHEN  1
014800         INVOKE  Manager-class  "NEW"  RETURNING  管理者−オブジェクト
014900         SET     従業員−オブジェクト  TO   管理者−オブジェクト
015000         MOVE    Ｌ−特別手当          TO
015100                   特別手当    OF  管理者−オブジェクト
015200*****　一般社員　****
015300     WHEN  2
015400         INVOKE  Member-class  "NEW"   RETURNING  一般社員−オブジェクト
015500         SET     従業員−オブジェクト  TO   一般社員−オブジェクト
015600         MOVE    Ｌ−時間外手当        TO
015700                   時間外手当  OF  一般社員−オブジェクト
015800         MOVE    Ｌ−残業時間          TO
015900                   残業時間    OF  一般社員−オブジェクト
016000     END-EVALUATE.
016100*
016200     INVOKE    Address-class   "NEW"   RETURNING  住所−オブジェクト.
016300     MOVE   Ｌ−郵便番号     TO    郵便番号   OF  住所−オブジェクト.
016400     MOVE   Ｌ−住所         TO    住所       OF  住所−オブジェクト.
016500*
016600     INVOKE  従業員−オブジェクト  "Initial-method"
016700      USING  Ｌ−従業員番号
016800             Ｌ−氏名
016900             Ｌ−入社年月日
017000             Ｌ−退社年月日
017100             Ｌ−職級
017200             Ｌ−基本給
017300             住所−オブジェクト
017400             .
017500*
017600 データ設定出口.
017700     EXIT.
017800*
017900   END METHOD  Regist-member.
018000*
018100*=======================================================================
018200*　従業員情報獲得メソッド（Get-member-info）
018300*
018400*　〇入力：　従業員番号（PIC 9(1)）
018500*　〇出力：　復帰値    （PIC 9(4) COMP）
018600*            0 : 削除成功
018700*            1 : 削除失敗
018800*=======================================================================
018900   METHOD-ID.  Get-member-info.
019000   DATA DIVISION.
019100   WORKING-STORAGE SECTION.
019200   01  従業員−オブジェクト   USAGE  OBJECT REFERENCE  AllMember-class.
019300   01  住所−オブジェクト     USAGE  OBJECT REFERENCE  Address-class.
019400   01  共通−オブジェクト     USAGE  OBJECT REFERENCE.
019500   LINKAGE SECTION.
019600   01  Ｌ−従業員番号         PIC 9(04).
019700   01  Ｘ−従業員番号         REDEFINES Ｌ−従業員番号  PIC X(04).
019800   01  Ｌ−氏名               PIC N(08).
019900   01  Ｌ−郵便番号.
020000      02  Ｌ−郵便番号１      PIC X(03).
020100      02  Ｌ−郵便番号２      PIC X(04).
020200   01  Ｌ−住所               PIC N(20).
020300   01  Ｌ−入社年月日         PIC X(08).
020400   01  Ｌ−退社年月日         PIC X(08).
020500   01  Ｌ−職級               PIC 9(01).
020600   01  Ｌ−基本給             PIC 9(08).
020700   01  Ｌ−特別手当           PIC 9(06).
020800   01  Ｌ−時間外手当         PIC 9(05).
020900   01  Ｌ−残業時間           PIC 999.9.
021000   01  Ｒ−復帰値             PIC 9(04) COMP.
021100   PROCEDURE DIVISION
021200     USING  Ｌ−従業員番号
021300            Ｌ−氏名
021400            Ｌ−郵便番号
021500            Ｌ−住所
021600            Ｌ−入社年月日
021700            Ｌ−退社年月日
021800            Ｌ−職級
021900            Ｌ−基本給
022000            Ｌ−特別手当
022100            Ｌ−時間外手当
022200            Ｌ−残業時間
022300     RETURNING  Ｒ−復帰値.
022400*
022500         SET  共通−オブジェクト  TO
022600              従業員辞書−オブジェクト :: "Element-Get" (Ｘ−従業員番号)
022700         IF   共通−オブジェクト  NOT =  NULL
022800         THEN
022900             SET  従業員−オブジェクト  TO
023000                  共通−オブジェクト  AS  AllMember-class
023100             PERFORM  データ取得
023200             MOVE  0  TO  Ｒ−復帰値
023300         ELSE
023400             MOVE  1  TO  Ｒ−復帰値
023500         END-IF
023600         EXIT METHOD.
023700*=======================================================================
023800*  データ取得処理
023900*
024000*（１）取り出した従業員オブジェクトの情報を参照し，処理を切りわける。
024100*  ・　指定された従業員番号のオブジェクトならば，必要な情報を設定する。
024200*　・　指定された従業員番号のオブジェクトでなければ，次のオブジェクトを
024300*　　獲得する。
024400*=======================================================================
024500 データ取得       SECTION.
024600*
024700       INVOKE  従業員−オブジェクト  "Get-member-info"
024800        USING  Ｌ−氏名
024900               Ｌ−入社年月日
025000               Ｌ−退社年月日
025100               Ｌ−職級
025200               Ｌ−基本給
025300               住所−オブジェクト
025400               .
025500       IF     Ｌ−職級  =  1
025600       THEN
025700           MOVE  特別手当   OF 従業員−オブジェクト AS Manager-class
025800             TO  Ｌ−特別手当
025900       ELSE
026000           MOVE  時間外手当 OF 従業員−オブジェクト AS Member-class
026100             TO  Ｌ−時間外手当
026200           MOVE  残業時間   OF 従業員−オブジェクト AS Member-class
026300             TO  Ｌ−残業時間
026400       END-IF.
026500       MOVE  郵便番号 OF 住所−オブジェクト  TO  Ｌ−郵便番号.
026600       MOVE  住所     OF 住所−オブジェクト  TO  Ｌ−住所.
026700*
026800 データ取得出口.
026900     EXIT.
027000*
027100   END METHOD Get-member-info.
027200*
027300*=======================================================================
027400*　従業員削除メソッド（Remove-member）
027500*
027600*　〇入力：　従業員番号（PIC 9(1)）
027700*　〇出力：　復帰値    （PIC 9(4) COMP）
027800*          0 : 削除成功
027900*          1 : 削除失敗
028000*=======================================================================
028100   METHOD-ID.  Remove-member.
028200   DATA DIVISION.
028300   WORKING-STORAGE SECTION.
028400   LINKAGE SECTION.
028500   01  Ｌ−従業員番号  PIC 9(04).
028600   01  Ｘ−従業員番号  REDEFINES Ｌ−従業員番号  PIC X(04).
028700   01  Ｒ−復帰値      PIC 9(04)  COMP.
028800   PROCEDURE DIVISION
028900     USING  Ｌ−従業員番号
029000     RETURNING  Ｒ−復帰値.
029100*
029200       MOVE  従業員辞書−オブジェクト :: "Remove-At" (Ｘ−従業員番号)
029300         TO  Ｒ−復帰値
029400       EXIT METHOD.
029500*
029600   END METHOD Remove-member.
029700*
029800*=======================================================================
029900*　給与計算メソッド（Cal-salary）
030000*
030100*（１）従業員全員の給与を計算し、それぞれの従業員オブジェクトに結果を反
030200*　　　映する。
030300*=======================================================================
030400   METHOD-ID.  Cal-salary.
030500   DATA DIVISION.
030600   WORKING-STORAGE SECTION.
030700   01  共通−オブジェクト    USAGE OBJECT REFERENCE.
030800   01  従業員−オブジェクト  USAGE OBJECT REFERENCE  AllMember-class.
030900   LINKAGE SECTION.
031000   PROCEDURE DIVISION.
031100*
031200         SET  共通−オブジェクト    TO
031300              従業員辞書−オブジェクト :: "FirstElement-Get"
031400         SET  従業員−オブジェクト  TO
031500              共通−オブジェクト  AS  AllMember-class
031600         PERFORM  給与計算処理    UNTIL  従業員−オブジェクト  =  NULL
031700         EXIT METHOD.
031800*
031900*=======================================================================
032000*  給与計算処理
032100*
032200*（１）給与計算を行うメソッドを実行し，その結果をオブジェクトに反映した
032300*　　後，次の従業員オブジェクトを獲得する。
032400*=======================================================================
032500 給与計算処理         SECTION.
032600*
032700     MOVE  従業員−オブジェクト :: "Salary-method"
032800       TO    総支給  OF  従業員−オブジェクト.
032900     SET   共通−オブジェクト    TO
033000             従業員辞書−オブジェクト :: "NextElement-Get".
033100     SET   従業員−オブジェクト  TO
033200             共通−オブジェクト  AS  AllMember-class.
033300*
033400 給与計算処理出口.
033500     EXIT.
033600*
033700   END METHOD Cal-salary.
033800*
033900*=======================================================================
034000*　給与獲得メソッド（Get-salary）
034100*
034200*　〇入力：　従業員番号（PIC 9(1)）
034300*　〇出力：　復帰値    （PIC 9(4) COMP）
034400*            0 : 獲得成功
034500*            1 : 獲得失敗 (該当者なし)
034600*=======================================================================
034700   METHOD-ID.  Get-salary.
034800   DATA DIVISION.
034900   WORKING-STORAGE SECTION.
035000   01  共通−オブジェクト    USAGE  OBJECT REFERENCE.
035100   01  従業員−オブジェクト  USAGE  OBJECT REFERENCE  AllMember-class.
035200   LINKAGE SECTION.
035300   01  Ｌ−従業員番号  PIC 9(04).
035400   01  Ｘ−従業員番号  REDEFINES Ｌ−従業員番号  PIC X(04).
035500   01  Ｌ−総支給      PIC 9(08).
035600   01  Ｒ−復帰値      PIC 9(04)  COMP.
035700   PROCEDURE DIVISION
035800     USING  Ｌ−従業員番号
035900            Ｌ−総支給
036000     RETURNING  Ｒ−復帰値.
036100*
036200         SET  共通−オブジェクト    TO
036300              従業員辞書−オブジェクト :: "Element-Get" (Ｘ−従業員番号)
036400         SET  従業員−オブジェクト  TO
036500              共通−オブジェクト AS AllMember-class
036600*
036700         IF  従業員−オブジェクト  NOT =  NULL
036800         THEN
036900             MOVE  総支給 OF 従業員−オブジェクト  TO  Ｌ−総支給
037000             MOVE  0  TO  Ｒ−復帰値
037100         ELSE
037200             MOVE  1  TO  Ｒ−復帰値
037300         END-IF
037400   END METHOD Get-salary.
037500*
037600*=======================================================================
037700*　住所印刷メソッド（Print-address）
037800*
037900*　〇入力：　選択職級（PIC 9(1)）
038000*　〇出力：　住所録
038100*=======================================================================
038200   METHOD-ID.  Print-address.
038300   ENVIRONMENT    DIVISION.
038400   INPUT-OUTPUT    SECTION.
038500   FILE-CONTROL.
038600       SELECT  印刷ファイル  ASSIGN  TO  PRINTER.
038700   DATA DIVISION.
038800   FILE            SECTION.
038900   FD  印刷ファイル.
039000   01  出力レコード   PIC X(125).
039100   WORKING-STORAGE SECTION.
039200   01  印刷ヘッダ１.
039300     02                       PIC X(05)  VALUE  SPACE.
039400     02                       PIC N(02)  VALUE  NC"＜　".
039500     02  印刷−見出し         PIC N(04)  VALUE  SPACE.
039600     02                       PIC N(05)  VALUE  NC"住所録　＞".
039700     02                       PIC X(98)  VALUE  SPACE.
039800   01  印刷ヘッダ２.
039900     02                       PIC X(05)  VALUE  SPACE.
040000     02                       PIC N(05)  VALUE  NC"従業員番号".
040100     02                       PIC X(04)  VALUE  SPACE.
040200     02                       PIC N(03)  VALUE  NC"氏　名".
040300     02                       PIC X(14)  VALUE  SPACE.
040400     02                       PIC N(03)  VALUE  NC"住　所".
040500     02                       PIC X(80)  VALUE  SPACE.
040600   01  印刷データ.
040700     02                       PIC X(05)  VALUE  SPACE.
040800     02  印刷−従業員番号     PIC 9(04).
040900     02                       PIC X(10)  VALUE  SPACE.
041000     02  印刷−氏名           PIC N(08).
041100     02                       PIC X(04)  VALUE  SPACE.
041200     02  印刷−郵便番号.
041300        03  印刷−郵便番号１  PIC X(03).
041400        03                    PIC X(01)  VALUE  "-".
041500        03  印刷−郵便番号２  PIC X(04).
041600     02                       PIC X(02)  VALUE  SPACE.
041700     02  印刷−住所           PIC N(20).
041800     02                       PIC X(28)  VALUE  SPACE.
041900*
042000   01  従業員−オブジェクト   USAGE  OBJECT REFERENCE  AllMember-class.
042100   01  住所−オブジェクト     USAGE  OBJECT REFERENCE  Address-class.
042200   01  共通−オブジェクト     USAGE  OBJECT REFERENCE.
042300   01  Ｗ−職級               PIC 9(01).
042400   01  Ｗ−郵便番号.
042500     02  Ｗ−郵便番号１       PIC X(03).
042600     02  Ｗ−郵便番号２       PIC X(04).
042700   LINKAGE SECTION.
042800   01  Ｌ−職級選択           PIC 9(01).
042900   01  Ｒ−復帰値             PIC 9(04)  COMP.
043000   PROCEDURE DIVISION
043100     USING  Ｌ−職級選択
043200     RETURNING  Ｒ−復帰値.
043300*
043400         SET  共通−オブジェクト    TO
043500                従業員辞書−オブジェクト :: "FirstElement-Get"
043600         SET  従業員−オブジェクト  TO
043700                共通−オブジェクト AS AllMember-class
043800*
043900         IF   従業員−オブジェクト  NOT =  NULL
044000           OPEN  OUTPUT  印刷ファイル
044100           PERFORM  ヘッダー出力処理
044200           PERFORM  印刷処理
044300                  UNTIL  従業員−オブジェクト  =  NULL
044400           CLOSE  印刷ファイル
044500         END-IF
044600         EXIT METHOD.
044700*=======================================================================
044800*  ヘッダー出力処理
044900*
045000*（１）選択された職級に対する住所録の，ヘッダー部分を印刷する。
045100*=======================================================================
045200 ヘッダー出力処理         SECTION.
045300*
045400     INITIALIZE 印刷ヘッダ１ 印刷ヘッダ２.
045500*
045600     IF  Ｌ−職級選択  =  1
045700     THEN
045800         MOVE  NC"管理者"    TO  印刷−見出し
045900     END-IF.
046000     IF  Ｌ−職級選択  =  2
046100     THEN
046200         MOVE  NC"一般社員"  TO  印刷−見出し
046300     END-IF.
046400     WRITE  出力レコード  FROM  印刷ヘッダ１  AFTER  PAGE.
046500     WRITE  出力レコード  FROM  印刷ヘッダ２  AFTER  2.
046600*
046700 ヘッダー出力処理出口.
046800     EXIT.
046900*
047000*=======================================================================
047100*  印刷処理
047200*
047300*（１）現存する従業員オブジェクトを順次参照し，対象となる職級であれば情
047400*　　報をレコードに設定し，印刷ファイルに書き込む。
047500*=======================================================================
047600 印刷処理         SECTION.
047700     INITIALIZE 印刷データ.
047800*
047900     INVOKE  従業員−オブジェクト  "Get-print-info"
048000      USING  印刷−従業員番号
048100             印刷−氏名
048200             Ｗ−職級
048300             住所−オブジェクト
048400
048500     IF  (Ｌ−職級選択  =  1  AND  Ｗ−職級  =  1)  OR
048600         (Ｌ−職級選択  =  2  AND  Ｗ−職級  =  2)
048700     THEN
048800         MOVE   郵便番号    OF  住所−オブジェクト   TO  Ｗ−郵便番号
048900         MOVE   Ｗ−郵便番号１                       TO  印刷−郵便番号１
049000         MOVE   Ｗ−郵便番号２                       TO  印刷−郵便番号２
049100         MOVE   住所        OF  住所−オブジェクト   TO  印刷−住所
049200*
049300         WRITE  出力レコード    FROM  印刷データ  AFTER  2
049400     END-IF.
049500*
049600     SET  共通−オブジェクト   TO
049700            従業員辞書−オブジェクト :: "NextElement-Get".
049800     SET  従業員−オブジェクト TO  共通−オブジェクト AS AllMember-class.
049900 印刷処理出口.
050000     EXIT.
050100*
050200   END METHOD  Print-address.
050300*
050400  END OBJECT.
050500 END CLASS   Control-member-class.
