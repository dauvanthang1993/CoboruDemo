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
000130*                - SQL_SYSTEM_ERR
000140*  備考        ： DB_ACCESSクラスはインスタンスに固有のデータ持たない
000150*                 手続きのみクラスであるが、埋込みSQL文はオプジェクト
000160*                 メソッドにしか記述できないため、インスタンスを生成
000170*                 する必要があります。
000180*
000190* Copyright 1999-2015 FUJITSU LIMITED
000200*======================================================================
000210*     このプログラムでは、接続データベースとして
000220*     Microsoft(R) SQL Server(TM)を想定しています。
000230*     接続データベースとしてMicrosoft(R) SQL Server(TM)以外を
000240*     使用する場合、記号定数SQSVCNN-OKの値を"00000"に変更して
000250*     下さい。
000260*======================================================================
000270 CLASS-ID.     DB_ACCESS INHERITS FJBASE.
000280 ENVIRONMENT DIVISION.
000290 CONFIGURATION SECTION.
000300 SPECIAL-NAMES.
000310     SYMBOLIC CONSTANT
000320         正常終了       0
000330         認証失敗       100
000340         在庫不足       200
000350         製品番号未登録 1000
000360         システムエラー 10000
000370         EXECSQL-OK     "00000"
000380         SQSVCNN-OK     "01000"    *> Microsoft SQL server固有の値
000390         .
000400 REPOSITORY.
000410        CLASS FJBASE
000420        CLASS COM-EXP AS "*COM-EXCEPTION"
000430        CLASS CONTEXT AS "*COM"
000440        .
000450 OBJECT.
000460 DATA DIVISION.
000470 WORKING-STORAGE SECTION.
000480 01 EXOBJ        OBJECT REFERENCE COM-EXP.
000490 01 EXCODE       PIC S9(4) COMP-5 VALUE 99.
000500 01 EXMSG        PIC X(115). 
000510 01 EXSRC        PIC N(10).
000520 01 OBJCON       OBJECT REFERENCE CONTEXT.
000530     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
000540 01 SQLSTATE PIC X(5).
000550 01 SQLMSG   PIC X(110).
000560     EXEC SQL END DECLARE SECTION END-EXEC.
000570 PROCEDURE DIVISION.
000580*======================================================================
000590*  ◆メソッド名  ：顧客情報取得
000600*      概要  ：登録ユーザＩＤ／パスワードの組合せを確認します。
000610*                   復帰値と意味は以下のとおりです。
000620*                     0     = 正常終了（登録情報と一致）
000630*                     100   = 認証失敗（登録情報と不一致）
000640*                     10000 = システムエラー（ＤＢアクセス中にエラー発生）
000650*                             ※エラーの詳細はイベントログに出力します。
000660*      パラメタ  ：using    userInfo
000670*                  return   PIC 9(9) COMP-5
000680*      使用  ：userIDとuserPasswordに文字列を設定して呼出す。
000690*======================================================================
000700 METHOD-ID. 顧客情報取得.
000710 DATA DIVISION.
000720 WORKING-STORAGE SECTION.
000730     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
000740 01 W-USERID.
000750  49 ULG     PIC S9(4) COMP-5.
000760  49 UID     PIC X(32).
000770 01 W-PASSWD.
000780  49 PLG     PIC S9(4) COMP-5.
000790  49 PWD     PIC X(32).
000800     EXEC SQL END DECLARE SECTION END-EXEC.
000810 LINKAGE SECTION.
000820 01 userID       PIC X(32).
000830 01 userPassword PIC X(32).
000840 01 RET          PIC S9(6) COMP-5.
000850 PROCEDURE DIVISION USING userID userPassword
000860                    RETURNING RET.
000870     *> パスワードを取得します。
000880     MOVE FUNCTION LENG(userID) TO ULG
000890     MOVE userID TO UID
000900
000910     INVOKE CONTEXT "GetObjectContext" RETURNING OBJCON
000920*================================================================
000930*  ＤＢに接続して、顧客テーブルからユーザＩＤをキーにパスワードを
000940*  取り出します。
000950*================================================================
000960     EXEC SQL CONNECT TO DEFAULT END-EXEC
000970     IF NOT (SQLSTATE = EXECSQL-OK OR SQSVCNN-OK) THEN
000980       MOVE システムエラー TO RET
000990       MOVE N"顧客情報取得" TO EXSRC
001000       INITIALIZE EXMSG
001010       INVOKE SELF "SQL_SYSTEM_ERR"
001020       INVOKE CONTEXT "SetAbort"
001030       EXIT METHOD
001040     END-IF
001050
001060     EXEC SQL
001070          SELECT パスワード INTO :W-PASSWD FROM 顧客
001080                 WHERE ユーザＩＤ = :W-USERID
001090     END-EXEC
001100     MOVE PWD TO userpassword
001110
001120     IF NOT SQLSTATE = EXECSQL-OK THEN
001130       MOVE 認証失敗 TO RET
001140       MOVE N"顧客情報取得" TO EXSRC
001150       INITIALIZE EXMSG
001160       INVOKE SELF "SQL_SYSTEM_ERR"
001170       EXIT METHOD
001180     END-IF
001190*================================================================
001200*  ＤＢを切断します。
001210*================================================================
001220     EXEC SQL DISCONNECT DEFAULT END-EXEC
001230     INVOKE OBJCON "SetComplete"
001240     SET OBJCON TO NULL
001250
001260     EXIT METHOD.
001270 END METHOD  顧客情報取得.
001280/
001290*======================================================================
001300*  ◆メソッド名  ：在庫問合わせ
001310*      概要  ：在庫数を計算する
001320*                   復帰値と意味は以下のとおりです。
001330*                     0     = 正常終了
001340*                     1000  = 製品番号未登録
001350*                     10000 = システムエラー（ＤＢアクセス中にエラー発生）
001360*                             ※エラーの詳細はイベントログに出力します。
001370*      パラメタ  ：using    stockInfo
001380*                  return   PIC 9(9) COMP-5
001390*      使用  ：userID（ユーザＩＤ）とuserPassword（パスワード）に
001400*              文字列を設定して呼出す。
001410*======================================================================
001420 METHOD-ID.  在庫問合わせ.
001430 DATA DIVISION.
001440 WORKING-STORAGE SECTION.
001450      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
001460 01 W-NUM PIC X(10).
001470 01 W-QT  PIC S9(10).
001480      EXEC SQL END DECLARE SECTION END-EXEC.
001490 LINKAGE SECTION.
001500 01 stockProductNumber     PIC X(10).  *> 製品番号
001510 01 stockProductQuantity   PIC 9(10).  *> 在庫数量
001520 01 RET           PIC 9(9) COMP-5.
001530 PROCEDURE DIVISION USING stockProductNumber stockProductQuantity
001540                    RETURNING RET.
001550
001560     MOVE 正常終了 TO RET
001570
001580     INVOKE CONTEXT "GetObjectContext" RETURNING OBJCON
001590*================================================================
001600*  ＤＢに接続します。
001610*================================================================
001620     EXEC SQL CONNECT TO DEFAULT END-EXEC
001630     IF NOT (SQLSTATE = EXECSQL-OK OR SQSVCNN-OK) THEN
001640       MOVE システムエラー TO RET
001650       MOVE N"在庫問合わせ" TO EXSRC
001660       INITIALIZE EXMSG
001670       INVOKE SELF "SQL_SYSTEM_ERR"
001680       INVOKE CONTEXT "SetAbort"
001690       EXIT METHOD
001700     END-IF
001710*================================================================
001720*  在庫データの取得処理を呼出します。
001730*================================================================
001740     MOVE stockproductNumber TO W-NUM
001750     EXEC SQL 
001760          SELECT 在庫数 INTO :W-QT FROM 在庫
001770                 WHERE  製品番号 = :W-NUM
001780     END-EXEC
001790     MOVE W-QT TO stockproductQuantity
001800
001810     IF NOT SQLSTATE = EXECSQL-OK THEN
001820       MOVE 製品番号未登録 TO RET
001830       MOVE N"在庫問合わせ" TO EXSRC
001840       INITIALIZE EXMSG
001850       INVOKE SELF "SQL_SYSTEM_ERR"
001860       EXIT METHOD
001870     END-IF
001880
001890*================================================================
001900*  ＤＢを切断します。
001910*================================================================
001920     EXEC SQL DISCONNECT DEFAULT END-EXEC
001930     INVOKE OBJCON "SetComplete"
001940     SET OBJCON TO NULL
001950
001960     EXIT METHOD.
001970 END METHOD  在庫問合わせ.
001980/
001990*======================================================================
002000*  ◆メソッド名  ：オーダー登録
002010*      概要  ：在庫数を更新する前準備をします。
002020*                   復帰値と意味は以下のとおりです。
002030*                     0     = 正常終了
002040*                     10000 = システムエラー（ＤＢアクセス中にエラー発生）
002050*                             ※エラーの詳細はイベントログに出力します。
002060*      パラメタ  ：using orderInf
002070*                   return   PIC 9(9) COMP-5
002080*      使用  ：orderUserID（発注者ＩＤ），orderDate（発注日），
002090*              orderNumber（オーダー件数），orderProductNumber（オーダー製品番号），
002100*              orderProductQuantity（オーダー数）に値を設定して呼出します。
002110*======================================================================
002120 METHOD-ID.  オーダー登録.
002130 DATA DIVISION.
002140 WORKING-STORAGE SECTION.
002150     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
002160 01 W-num     PIC X(12).
002170 01 W-user    PIC X(32).
002180 01 W-date    PIC X(14).
002190     EXEC SQL END DECLARE SECTION END-EXEC.
002200 LINKAGE SECTION.
002210 01 orderNumber            PIC X(12).
002220 01 orderUserID            PIC X(32).
002230 01 orderDate              PIC X(14).
002240 01 orderProductNumber     PIC X(10).
002250 01 orderProductQuantity   PIC 9(10).
002260 01 RET       PIC 9(9) COMP-5.
002270
002280 PROCEDURE DIVISION USING orderNumber orderUserID orderDate orderProductNumber orderProductQuantity
002290                    RETURNING RET.
002300
002310      MOVE 正常終了 TO RET
002320      INVOKE CONTEXT "GetObjectContext" RETURNING OBJCON
002330*================================================================
002340*  ＤＢに接続して、オーダー情報をオーダーテーブルに追加します。
002350*================================================================
002360      EXEC SQL CONNECT TO DEFAULT END-EXEC
002370      IF NOT (SQLSTATE = EXECSQL-OK OR SQSVCNN-OK) THEN
002380         MOVE システムエラー TO RET
002390         MOVE N"オーダー登録" TO EXSRC
002400         INITIALIZE EXMSG
002410         INVOKE SELF "SQL_SYSTEM_ERR"
002420         EXIT METHOD
002430      END-IF
002440
002450      EXEC SQL WHENEVER SQLERROR GO TO :END-PROC END-EXEC.
002460
002470      *>オーダーテーブルへの登録
002480      MOVE orderNumber TO W-num
002490      MOVE orderUserID TO W-user
002500      MOVE orderDate   TO W-date
002510
002520      EXEC SQL
002530           INSERT INTO  オーダー
002540                  VALUES  (:W-num, :W-user, :W-date)
002550      END-EXEC.
002560
002570*================================================================
002580*  ＤＢを切断します。
002590*================================================================
002600 END-PROC.
002610      IF SQLSTATE = EXECSQL-OK THEN
002620        *>登録したオーダーを確定します。
002630        EXEC SQL DISCONNECT DEFAULT END-EXEC
002640        INVOKE OBJCON "SetComplete"
002650        SET OBJCON TO NULL
002660      ELSE
002670        *>SQLERROR発生時の処理をします。
002680        EXEC SQL WHENEVER SQLERROR CONTINUE END-EXEC
002690        INVOKE OBJCON "SetAbort"
002700        EXEC SQL DISCONNECT DEFAULT END-EXEC
002710
002720        MOVE システムエラー TO RET
002730        MOVE N"オーダー登録" TO EXSRC
002740        INITIALIZE EXMSG
002750        INVOKE SELF "SQL_SYSTEM_ERR"
002760      END-IF
002770
002780      EXIT METHOD.
002790
002800 END METHOD  オーダー登録.
002810/
002820*======================================================================
002830*  ◆メソッド名  ：在庫更新
002840*      概要  ：在庫数を更新してオーダー明細を登録します。
002850*                   在庫数がオーダー数を上回れば，在庫数を更新して
002860*                   オーダー明細を登録します。オーダー番号はメソッド中で
002870*                   採番してorderInfo配列に設定します。
002880*                   復帰値と意味は以下のとおりです。
002890*                     0     = 正常終了
002900*                     10000 = システムエラー（ＤＢアクセス中にエラー発生）
002910*                             ※エラーの詳細はイベントログに出力します。
002920*      パラメタ  ：using orderInf
002930*                   return   PIC 9(9) COMP-5
002940*      使用  ：orderUserID（発注者ＩＤ），orderDate（発注日），
002950*              orderNumber（オーダー件数），orderProductNumber（オーダー製品番号），
002960*              orderProductQuantity（オーダー数）に値を設定して呼出します。
002970*======================================================================
002980 METHOD-ID.  在庫更新.
002990 DATA DIVISION.
003000 WORKING-STORAGE SECTION.
003010     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
003020 01 W-order   PIC X(12).
003030 01 W-prdt    PIC X(10).
003040 01 W-orderQT     PIC S9(10).
003050 01 W-stockQT     PIC S9(10).
003060     EXEC SQL END DECLARE SECTION END-EXEC.
003070 LINKAGE SECTION.
003080 01 orderNumber            PIC X(12).
003090 01 orderUserID            PIC X(32).
003100 01 orderDate              PIC X(14).
003110 01 orderProductNumber     PIC X(10).
003120 01 orderProductQuantity   PIC 9(10).
003130 01 RET       PIC 9(9) COMP-5.
003140
003150 PROCEDURE DIVISION USING orderNumber orderUserID orderDate orderProductNumber orderProductQuantity
003160                    RETURNING RET.
003170
003180      MOVE 正常終了 TO RET
003190      INVOKE CONTEXT "GetObjectContext" RETURNING OBJCON
003200*================================================================
003210*  ＤＢに接続して、オーダー情報をオーダーテーブルに追加します。
003220*================================================================
003230      EXEC SQL CONNECT TO DEFAULT END-EXEC
003240      IF NOT (SQLSTATE = EXECSQL-OK OR SQSVCNN-OK) THEN
003250         MOVE システムエラー TO RET
003260         MOVE N"在庫更新（１）" TO EXSRC
003270         INITIALIZE EXMSG
003280         INVOKE SELF "SQL_SYSTEM_ERR"
003290         EXIT METHOD
003300      END-IF
003310
003320      EXEC SQL WHENEVER SQLERROR GO TO :END-PROC END-EXEC.
003330
003340*================================================================
003350*  在庫数の再計算、在庫テーブルの更新、オーダー明細を作成します。
003360*  ただし、エラーが起きた場合、処理を終了します。
003370*================================================================
003380      *>在庫数から発注数を引いた残量を計算します。
003390      MOVE orderProductNumber  TO W-prdt
003400      EXEC SQL 
003410           SELECT 在庫数 INTO :W-stockQT FROM 在庫
003420                  WHERE  製品番号 = :W-prdt
003430      END-EXEC
003440      *>在庫がなければ変更を破棄して処理を終了します。
003450      IF W-stockQT < orderproductQuantity THEN
003460        MOVE  在庫不足 TO RET
003470        INVOKE OBJCON "SetAbort"
003480        SET OBJCON TO NULL
003490        EXIT METHOD
003500      END-IF
003510
003520      COMPUTE W-stockQT =
003530              W-stockQT - orderproductQuantity
003540
003550      *>在庫数を更新する
003560      EXEC SQL
003570           UPDATE 在庫 
003580                 SET 在庫数 = :W-stockQT
003590                 WHERE  製品番号 = :W-prdt
003600      END-EXEC
003610
003620      *>オーダー明細を登録する
003630      MOVE orderNumber TO W-order
003640      MOVE orderProductQuantity TO W-orderQT
003650      EXEC SQL 
003660           INSERT INTO  オーダー明細 
003670                 VALUES (:W-order, :W-prdt, :W-orderQT)
003680      END-EXEC.
003690
003700*================================================================
003710*  ＤＢを切断します。
003720*================================================================
003730 END-PROC.
003740      IF SQLSTATE = EXECSQL-OK THEN
003750        *>変更した在庫を確定します。
003760        EXEC SQL DISCONNECT DEFAULT END-EXEC
003770        INVOKE OBJCON "SetComplete"
003780        SET OBJCON TO NULL
003790      ELSE
003800        *>SQLERROR発生時の処理をします。
003810        EXEC SQL WHENEVER SQLERROR CONTINUE END-EXEC
003820        INVOKE OBJCON "SetAbort"
003830        EXEC SQL DISCONNECT DEFAULT END-EXEC
003840
003850        MOVE システムエラー TO RET
003860        MOVE N"オーダー登録" TO EXSRC
003870        INITIALIZE EXMSG
003880        INVOKE SELF "SQL_SYSTEM_ERR"
003890      END-IF
003900
003910      EXIT METHOD.
003920
003930 END METHOD  在庫更新.
003940/
003950*======================================================================
003960*  ◇メソッド名   ：SQL_SYSTEM_ERR
003970*      概要       ：エラーログを出力します。
003980*      パラメタ   ：なし
003990*      呼出し契機 ：何らかのエラーが発生した時です。
004000*======================================================================
004010 METHOD-ID. SQL_SYSTEM_ERR.
004020 DATA DIVISION.
004030 WORKING-STORAGE SECTION.
004040 PROCEDURE DIVISION.
004050     INVOKE COM-EXP "NEW" RETURNING EXOBJ
004060     INVOKE EXOBJ "SET-WCODE" USING EXCODE
004070     INVOKE EXOBJ "SET-SOURCE" USING EXSRC
004080     STRING SQLMSG(1:FUNCTION STORED-CHAR-LENGTH(SQLMSG))
004090            "(SQLSTATE=" SQLSTATE  ")" DELIMITED BY SIZE INTO EXMSG
004100     INVOKE EXOBJ "SET-DESCRIPTION" USING EXMSG
004110     SET OBJCON TO NULL
004120 END METHOD SQL_SYSTEM_ERR.
004130*
004140 END OBJECT.
004150*
004160 END CLASS DB_ACCESS.
