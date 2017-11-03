000010*======================================================================
000020*  クラス名    ：DB_ACCESS
000030*
000040*  概要        ：データベース連携を行なう手続きを実装したクラスです。
000050*  継承クラス  ：FJBASE
000060*  参照クラス  ：なし
000070*  メソッド    ：ファクトリメソッド
000080*                  なし
000090*                オブジェクトメソッド
000100*                - 顧客情報取得
000110*                - 在庫問合わせ
000120*                - 在庫更新オーダー登録
000130*                - WRITE-ERR-LOG
000140*  備考        ： DB_ACCESSクラスはインスタンスに固有のデータ持たない
000150*                 手続きのみクラスであるが、埋込みSQL文はオプジェクト
000160*                 メソッドにしか記述できないため、インスタンスを生成
000170*                 する必要があります。
000180* Copyright 1999-2015 FUJITSU LIMITED
000190*======================================================================
000200*     このプログラムでは、接続データベースとして
000210*     Microsoft(R) SQL Server(TM)を想定しています。
000220*     接続データベースとしてMicrosoft(R) SQL Server(TM)以外を
000230*     使用する場合、記号定数SQSVCNN-OKの値を"00000"に変更して
000240*     下さい。
000250*======================================================================
000260 CLASS-ID.     DB_ACCESS INHERITS FJBASE.
000270 ENVIRONMENT DIVISION.
000280 CONFIGURATION SECTION.
000290 SPECIAL-NAMES.
000300     SYMBOLIC CONSTANT
000310         正常終了       0
000320         認証失敗       100
000330         在庫不足       200
000340         製品番号未登録 1000
000350         システムエラー 10000
000360         EXECSQL-OK     "00000"
000370         SQSVCNN-OK     "01000"    *> Microsoft SQL server固有の値
000380         .
000390 REPOSITORY.
000400        CLASS FJBASE
000410        .
000420 OBJECT.
000430 DATA DIVISION.
000440 WORKING-STORAGE SECTION.
000450     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
000460 01 SQLSTATE PIC X(5).
000470 01 SQLMSG   PIC X(110).
000480     EXEC SQL END DECLARE SECTION END-EXEC.
000490 PROCEDURE DIVISION.
000500*======================================================================
000510*  ◆メソッド名  ：顧客情報取得
000520*      概要  ：登録ユーザＩＤ／パスワードの組合せを確認します。
000530*                   復帰値と意味は以下のとおりです。
000540*                     0     = 正常終了（登録情報と一致）
000550*                     100   = 認証失敗（登録情報と不一致）
000560*                     10000 = システムエラー（ＤＢアクセス中にエラー発生）
000570*                             ※エラーの詳細はイベントログに出力します。
000580*      パラメタ  ：using    userInfo
000590*                  return   PIC 9(9) COMP-5
000600*      使用  ：userIDとuserPasswordに文字列を設定して呼出す。
000610*======================================================================
000620 METHOD-ID. 顧客情報取得.
000630 DATA DIVISION.
000640 WORKING-STORAGE SECTION.
000650     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
000660 01 W-USERID.
000670  49 ULG     PIC S9(4) COMP-5.
000680  49 UID     PIC X(32).
000690 01 W-PASSWD.
000700  49 PLG     PIC S9(4) COMP-5.
000710  49 PWD     PIC X(32).
000720     EXEC SQL END DECLARE SECTION END-EXEC.
000730 LINKAGE SECTION.
000740 01 userID       PIC X(32).
000750 01 userPassword PIC X(32).
000760 01 RET      PIC S9(6) COMP-5.
000770 PROCEDURE DIVISION USING userID
000780                          userPassword
000790                    RETURNING RET.
000800     *> パスワードを取得します。
000810     COMPUTE ULG = FUNCTION STORED-CHAR-LENGTH(userID)
000820     MOVE userID TO UID
000830*================================================================
000840*  ＤＢに接続して、顧客テーブルからユーザＩＤをキーにパスワードを
000850*  取り出します。
000860*================================================================
000870     EXEC SQL CONNECT TO DEFAULT END-EXEC
000880     IF NOT (SQLSTATE = EXECSQL-OK OR SQSVCNN-OK) THEN
000890       MOVE システムエラー TO RET
000900       INVOKE SELF "WRITE-ERR-LOG"
000910       GO TO METHOD-EXIT
000920     END-IF
000930
000940     EXEC SQL
000950          SELECT パスワード INTO :W-PASSWD FROM 顧客
000960                 WHERE ユーザＩＤ = :W-USERID
000970     END-EXEC
000980     MOVE PWD TO userpassword
000990
001000     IF NOT SQLSTATE = EXECSQL-OK THEN
001010       MOVE 認証失敗 TO RET
001020     END-IF
001030*================================================================
001040*  ＤＢを切断します。
001050*================================================================
001060     EXEC SQL ROLLBACK WORK END-EXEC
001070     EXEC SQL DISCONNECT DEFAULT END-EXEC.
001080 METHOD-EXIT.
001090     EXIT METHOD.
001100 END METHOD  顧客情報取得.
001110/
001120*======================================================================
001130*  ◆メソッド名  ：在庫問合わせ
001140*      概要  ：在庫数を計算する
001150*                   復帰値と意味は以下のとおりです。
001160*                     0     = 正常終了
001170*                     1000  = 製品番号未登録
001180*                     10000 = システムエラー（ＤＢアクセス中にエラー発生）
001190*                             ※エラーの詳細はイベントログに出力します。
001200*      パラメタ  ：using    stockInfo
001210*                  return   PIC 9(9) COMP-5
001220*      使用  ：userID（ユーザＩＤ）とuserPassword（パスワード）に
001230*              文字列を設定して呼出す。
001240*======================================================================
001250 METHOD-ID.  在庫問合わせ.
001260 DATA DIVISION.
001270 WORKING-STORAGE SECTION.
001280      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
001290 01 W-NUM PIC X(10).
001300 01 W-QT  PIC S9(10).
001310      EXEC SQL END DECLARE SECTION END-EXEC.
001320 LINKAGE SECTION.
001330 01 stockProductNumber     PIC X(10).  *> 製品番号
001340 01 stockProductQuantity   PIC 9(10).  *> 在庫数量
001350 01 RET           PIC 9(9) COMP-5.
001360 PROCEDURE DIVISION USING stockProductNumber
001370                          stockProductQuantity
001380                    RETURNING RET.
001390
001400     MOVE 正常終了 TO RET
001410*================================================================
001420*  ＤＢに接続します。
001430*================================================================
001440     EXEC SQL CONNECT TO DEFAULT END-EXEC
001450     IF NOT (SQLSTATE = EXECSQL-OK OR SQSVCNN-OK) THEN
001460       MOVE システムエラー TO RET
001470       INVOKE SELF "WRITE-ERR-LOG"
001480       GO TO METHOD-EXIT
001490     END-IF
001500*================================================================
001510*  在庫データの取得処理を呼出します。
001520*================================================================
001530     MOVE stockproductNumber TO W-NUM
001540     EXEC SQL
001550          SELECT 在庫数 INTO :W-QT FROM 在庫
001560                 WHERE  製品番号 = :W-NUM
001570     END-EXEC
001580     MOVE W-QT TO stockproductQuantity
001590
001600     IF NOT SQLSTATE = EXECSQL-OK THEN
001610       MOVE 製品番号未登録 TO RET
001620       INVOKE SELF "WRITE-ERR-LOG"
001630     END-IF
001640*================================================================
001650*  ＤＢを切断します。
001660*================================================================
001670     EXEC SQL ROLLBACK WORK END-EXEC
001680     EXEC SQL DISCONNECT DEFAULT END-EXEC.
001690 METHOD-EXIT.
001700     EXIT METHOD.
001710 END METHOD  在庫問合わせ.
001720/
001730*======================================================================
001740*  ◆メソッド名  ：オーダー登録
001750*      概要  ：在庫数を更新する前準備をします。
001760*                   復帰値と意味は以下のとおりです。
001770*                     0     = 正常終了
001780*                     10000 = システムエラー（ＤＢアクセス中にエラー発生）
001790*                             ※エラーの詳細はイベントログに出力します。
001800*      パラメタ  ：using orderInf
001810*                   return   PIC 9(9) COMP-5
001820*      使用  ：orderUserID（発注者ＩＤ），orderDate（発注日），
001830*              orderNumber（オーダー件数），orderProductNumber（オーダー製品番号），
001840*              orderProductQuantity（オーダー数）に値を設定して呼出します。
001850*======================================================================
001860 METHOD-ID.  オーダー登録.
001870 DATA DIVISION.
001880 WORKING-STORAGE SECTION.
001890     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
001900 01 W-num     PIC X(12).
001910 01 W-user    PIC X(32).
001920 01 W-date    PIC X(14).
001930     EXEC SQL END DECLARE SECTION END-EXEC.
001940 LINKAGE SECTION.
001950 01 orderNumber            PIC X(12).
001960 01 orderUserID            PIC X(32).
001970 01 orderDate              PIC X(14).
001980 01 orderProductNumber     PIC X(10).
001990 01 orderProductQuantity   PIC 9(10).
002000 01 RET       PIC 9(9) COMP-5.
002010
002020 PROCEDURE DIVISION USING orderNumber
002030                          orderUserID
002040                          orderDate
002050                          orderProductNumber
002060                          orderProductQuantity
002070                    RETURNING RET.
002080
002090      MOVE 正常終了 TO RET
002100*================================================================
002110*  ＤＢに接続して、オーダー情報をオーダーテーブルに追加します。
002120*================================================================
002130
002140      EXEC SQL CONNECT TO DEFAULT END-EXEC
002150      IF NOT (SQLSTATE = EXECSQL-OK OR SQSVCNN-OK) THEN
002160         MOVE システムエラー TO RET
002170         INVOKE SELF "WRITE-ERR-LOG"
002180         EXIT METHOD
002190      END-IF
002200
002210      EXEC SQL WHENEVER SQLERROR GO TO :END-PROC END-EXEC.
002220
002230      *>オーダーテーブルへの登録
002240      MOVE orderNumber TO W-num
002250      MOVE orderUserID TO W-user
002260      MOVE orderDate   TO W-date
002270
002280      EXEC SQL
002290           INSERT INTO  オーダー
002300                  VALUES  (:W-num, :W-user, :W-date)
002310      END-EXEC.
002320
002330*================================================================
002340*  ＤＢを切断します。
002350*================================================================
002360 END-PROC.
002370      IF SQLSTATE = EXECSQL-OK THEN
002380        *>登録したオーダーを確定します。
002390        EXEC SQL COMMIT WORK END-EXEC
002400      ELSE
002410        *>SQLERROR発生時の処理をします。
002420        MOVE システムエラー TO RET
002430        INVOKE SELF "WRITE-ERR-LOG"
002440        EXEC SQL WHENEVER SQLERROR CONTINUE END-EXEC
002450        EXEC SQL ROLLBACK WORK END-EXEC
002460      END-IF
002470      EXEC SQL DISCONNECT DEFAULT END-EXEC
002480
002490      EXIT METHOD.
002500
002510 END METHOD  オーダー登録.
002520/
002530*======================================================================
002540*  ◆メソッド名  ：在庫更新
002550*      概要  ：在庫数を更新してオーダー明細を登録します。
002560*                   在庫数がオーダー数を上回れば，在庫数を更新して
002570*                   オーダー明細を登録します。オーダー番号はメソッド中で
002580*                   採番してorderInfo配列に設定します。
002590*                   復帰値と意味は以下のとおりです。
002600*                     0     = 正常終了
002610*                     10000 = システムエラー（ＤＢアクセス中にエラー発生）
002620*                             ※エラーの詳細はイベントログに出力します。
002630*      パラメタ  ：using orderInf
002640*                   return   PIC 9(9) COMP-5
002650*      使用  ：orderUserID（発注者ＩＤ），orderDate（発注日），
002660*              orderNumber（オーダー件数），orderProductNumber（オーダー製品番号），
002670*              orderProductQuantity（オーダー数）に値を設定して呼出します。
002680*======================================================================
002690 METHOD-ID.  在庫更新.
002700 DATA DIVISION.
002710 WORKING-STORAGE SECTION.
002720     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
002730 01 W-order   PIC X(12).
002740 01 W-prdt    PIC X(10).
002750 01 W-orderQT     PIC S9(10).
002760 01 W-stockQT     PIC S9(10).
002770     EXEC SQL END DECLARE SECTION END-EXEC.
002780 LINKAGE SECTION.
002790 01 orderNumber            PIC X(12).
002800 01 orderUserID            PIC X(32).
002810 01 orderDate              PIC X(14).
002820 01 orderProductNumber     PIC X(10).
002830 01 orderProductQuantity   PIC 9(10).
002840 01 RET       PIC 9(9) COMP-5.
002850
002860 PROCEDURE DIVISION USING orderNumber
002870                          orderUserID
002880                          orderDate
002890                          orderProductNumber
002900                          orderProductQuantity
002910                    RETURNING RET.
002920
002930      MOVE 正常終了 TO RET
002940*================================================================
002950*  ＤＢに接続して、オーダー情報をオーダーテーブルに追加します。
002960*================================================================
002970      EXEC SQL CONNECT TO DEFAULT END-EXEC
002980      IF NOT (SQLSTATE = EXECSQL-OK OR SQSVCNN-OK) THEN
002990         MOVE システムエラー TO RET
003000         INVOKE SELF "WRITE-ERR-LOG"
003010         EXIT METHOD
003020      END-IF
003030
003040      EXEC SQL WHENEVER SQLERROR GO TO :END-PROC END-EXEC.
003050
003060*================================================================
003070*  在庫数の再計算、在庫テーブルの更新、オーダー明細を作成します。
003080*  ただし、エラーが起きた場合、処理を終了します。
003090*================================================================
003100      *>在庫数から発注数を引いた残量を計算します。
003110      MOVE orderProductNumber  TO W-prdt
003120      EXEC SQL
003130           SELECT 在庫数 INTO :W-stockQT FROM 在庫
003140                  WHERE  製品番号 = :W-prdt
003150      END-EXEC
003160      *>在庫がなければ変更を破棄して処理を終了します。
003170      IF W-stockQT < orderproductQuantity THEN
003180        MOVE  在庫不足 TO RET
003190        EXEC SQL ROLLBACK WORK END-EXEC
003200        EXEC SQL DISCONNECT DEFAULT END-EXEC
003210        EXIT METHOD
003220      END-IF
003230
003240      COMPUTE W-stockQT  = W-stockQT - orderproductQuantity
003250
003260      *>在庫数を更新します。
003270      EXEC SQL
003280           UPDATE 在庫
003290                  SET 在庫数 = :W-stockQT
003300                  WHERE  製品番号 = :W-prdt
003310      END-EXEC
003320
003330      *>オーダー明細を登録します。
003340      MOVE orderNumber TO W-order
003350      MOVE orderProductQuantity TO W-orderQT
003360      EXEC SQL
003370           INSERT INTO  オーダー明細
003380                  VALUES (:W-order, :W-prdt, :W-orderQT)
003390      END-EXEC.
003400
003410*================================================================
003420*  ＤＢを切断します。
003430*================================================================
003440 END-PROC.
003450      IF SQLSTATE = EXECSQL-OK THEN
003460        *>変更した在庫を確定します。
003470        EXEC SQL COMMIT WORK END-EXEC
003480      ELSE
003490        *>SQLERROR発生時の処理をします。
003500        MOVE システムエラー TO RET
003510        INVOKE SELF "WRITE-ERR-LOG"
003520        EXEC SQL WHENEVER SQLERROR CONTINUE END-EXEC
003530        EXEC SQL ROLLBACK WORK END-EXEC
003540      END-IF
003550      EXEC SQL DISCONNECT DEFAULT END-EXEC
003560
003570      EXIT METHOD.
003580
003590 END METHOD  在庫更新.
003600/
003610*======================================================================
003620*  ◇メソッド名   ：WRITE-ERR-LOG
003630*      概要       ：エラーログを出力します。
003640*      パラメタ   ：なし
003650*      呼出し契機 ：何らかのエラーが発生した時です。
003660*======================================================================
003670 METHOD-ID. WRITE-ERR-LOG.
003680 DATA DIVISION.
003690 WORKING-STORAGE SECTION.
003700 01  userLog.
003710  02   イベント番号       PIC  9(9)  COMP-5.
003720  02   種類               PIC  9(4)  COMP-5.
003730    88  エラー            VALUE 2.
003740  02                      PIC  9(4)  COMP-5.
003750  02   データ.
003760    03    データ長        PIC  9(9)  COMP-5.
003770    03    データアドレス  POINTER.
003780  02   エラー詳細情報     PIC  9(9)  COMP-5.
003790  02                      PIC  9(9)  COMP-5.
003800  02   ソース名           PIC  X(256).
003810  02   説明               PIC  X(1024).
003820* RETURNING句に指定するデータ項目
003830 01  復帰コード           PIC S9(9)  COMP-5.
003840 PROCEDURE DIVISION.
003850     INITIALIZE userLog
003860     SET エラー OF 種類 TO TRUE
003870     MOVE SPACE    TO ソース名
003880     MOVE SQLSTATE TO 説明(1:5)
003890     MOVE SQLMSG   TO 説明(6:FUNCTION LENG(SQLMSG))
003900     CALL "COB_REPORT_EVENT" USING userLog
003910                             RETURNING 復帰コード
003920     EXIT METHOD
003930 END METHOD WRITE-ERR-LOG.
003940*
003950 END OBJECT.
003960*
003970 END CLASS DB_ACCESS.
