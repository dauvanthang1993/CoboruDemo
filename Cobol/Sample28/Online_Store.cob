000010*======================================================================
000020* 「ＣＯＭ連携－COMサーバ機能」
000030*     ＭＴＳ配下のＣＯＢＯＬサーバの例題
000040*
000050*======================================================================
000060*
000070*  クラス名    ：ONLINE_STORE
000080*
000090*  概要        ：クライアントからのリクエストを受け，DB_ACCESSクラスの
000100*                メソッドの呼出し制御を行います。
000110*  継承クラス  ：FJBASE
000120*  参照クラス  ：*COM、*COM-ARRAY、*COM-EXCEPTION
000130*  メソッド    ：ファクトリメソッド
000140*                 なし
000150*              ：オブジェクトメソッド
000160*                - 認証処理
000170*                - オーダー作成
000180*                - オーダー登録
000190*                - オーダー清算
000200*
000210* Copyright 1999-2015 FUJITSU LIMITED
000220*======================================================================
000230 IDENTIFICATION DIVISION.
000240 CLASS-ID.      ONLINE_STORE INHERITS FJBASE.
000250 ENVIRONMENT DIVISION.
000260 CONFIGURATION SECTION.
000270 SPECIAL-NAMES.
000280      SYMBOLIC CONSTANT
000290          正常終了       0
000300          認証失敗       100
000310          在庫不足       200
000320          製品番号未登録 1000
000330          システムエラー 10000
000340          .
000350 REPOSITORY.
000360      CLASS FJBASE
000370      CLASS DB_ACCESS AS "*COM"
000380      CLASS ARRAY AS "*COM-ARRAY"
000390      CLASS COM-EXP AS "*COM-EXCEPTION"
000400      CLASS DB_USERINF AS "*COM"
000410      .
000420
000430 OBJECT.
000440 DATA DIVISION.
000450 WORKING-STORAGE SECTION.
000460 01 OBJ          USAGE OBJECT REFERENCE DB_USERINF.
000470 01 EXOBJ        USAGE OBJECT REFERENCE COM-EXP.
000480
000490 01 ORDER_NUMBER   PIC X(12).       *> オーダー番号
000500
000510 01 APPNAME        PIC X(30) VALUE "STORESV2.DB_ACCESS".
000520 PROCEDURE DIVISION.
000530*======================================================================
000540*  ◆メソッド名  ：IsUser（認証処理）.
000550*      概要      ：登録ユーザＩＤ／パスワードの組合せを確認します。
000560*                   復帰値と意味は以下のとおりです。
000570*                     0     = 正常終了（登録情報と一致）
000580*                     100   = 認証失敗（登録情報と不一致）
000590*                     10000 = システムエラー（ＤＢアクセス中にエラー発生）
000600*                             ※エラーの詳細はイベントログに出力します。
000610*      パラメタ  ：using    UID PIC X(32)
000620*                           PWD PIC X(32)
000630*                  return   PIC 9(9) COMP-5
000640*======================================================================
000650 METHOD-ID.      認証処理 AS "IsUser".
000660 DATA            DIVISION.
000670 WORKING-STORAGE SECTION.
000680 01 OBJ          USAGE OBJECT REFERENCE DB_ACCESS.
000690 01 userID       PIC X(32).
000700 01 userPassword PIC X(32).
000710 LINKAGE         SECTION.
000720 01 UID          PIC X(32).
000730 01 PWD          PIC X(32).
000740 01 RET          PIC S9(6) COMP-5.
000750 PROCEDURE       DIVISION
000760                 USING UID PWD  RETURNING RET.
000770*
000780 DECLARATIVES.
000790 DBexception SECTION.
000800     USE AFTER EXCEPTION COM-EXP.
000810         SET EXOBJ TO EXCEPTION-OBJECT
000820         SET OBJ TO NULL
000830         EXIT METHOD. 
000840 END DECLARATIVES.
000850     *> DB_ACCESSクラスのオブジェクトを生成します。
000860     INVOKE DB_ACCESS "CREATE-OBJECT" USING APPNAME
000870                                      RETURNING OBJ
000880     *> UIDに対応するパスワードを求めます。
000890     MOVE UID TO userID
000900     INVOKE OBJ "顧客情報取得" USING userID userPassword
000910                               RETURNING RET
000920
000930     *> パスワードの取得に成功したら、パスワードが一致UID
000940     *> チェックします。
000950     IF RET = 正常終了 AND
000960        PWD NOT = userPassword THEN
000970         MOVE 認証失敗 TO RET
000980     END-IF
000990
001000     *> DB_ACCESSクラスのオブジェクトを削除します。
001010     SET OBJ TO NULL
001020
001030     EXIT METHOD.
001040 END METHOD      認証処理.
001050/
001060*======================================================================
001070*  ◆メソッド名  ：StockCheck（在庫確認）
001080*      概要      ：製品番号と個数を受け取って、オーダーが可能かどうか
001090*                  在庫のチェックを行います。
001100*                   復帰値と意味は以下のとおりです。
001110*                     0     = 正常終了
001120*                     1000  = 製品番号未登録
001130*                     10000 = システムエラー（ＤＢアクセス中にエラー発生）
001140*                             ※エラーの詳細はイベントログに出力します。
001150*      パラメタ  ：using    L_NUMIC X(10)
001160*                           L_QUANT PIC 9(10)
001170*                  return   PIC 9(9) COMP-5
001180*======================================================================
001190 METHOD-ID.      オーダー確認 AS "StockCheck".
001200 DATA            DIVISION.
001210 WORKING-STORAGE SECTION.
001220 01 OBJ          USAGE OBJECT REFERENCE DB_ACCESS.
001230 01 stockProductNumber        PIC X(10).  *> 製品番号
001240 01 stockProductQuantity      PIC 9(10).  *> 在庫数量
001250 01  productInfo.
001260    02 productNumber          PIC X(12).  *> 製品番号
001270    02 productName            PIC X(32).  *> 製品名
001280    02 productModel           PIC X(32).  *> モデル
001290    02 productPrice           PIC 9(09).  *> 単価
001300 LINKAGE         SECTION.
001310 01 L_NUM        PIC X(10).
001320 01 L_QUANT      PIC 9(10).
001330 01 RET          PIC 9(9) COMP-5.
001340 PROCEDURE       DIVISION
001350                 USING  L_NUM L_QUANT
001360                 RETURNING RET.
001370*
001380 DECLARATIVES.
001390 DBexception SECTION.
001400     USE AFTER EXCEPTION COM-EXP.
001410         SET EXOBJ TO EXCEPTION-OBJECT
001420         SET OBJ TO NULL
001430         EXIT METHOD. 
001440 END DECLARATIVES.
001450*
001460     *> DB_ACCESSクラスのオブジェクトを生成します。
001470     INVOKE DB_ACCESS "CREATE-OBJECT" USING APPNAME
001480                                      RETURNING OBJ
001490
001500     INITIALIZE stockProductNumber stockProductQuantity
001510     INITIALIZE productInfo
001520     *> stockInfoおよびproductInfoに情報を設定します。
001530     MOVE L_NUM TO  stockProductNumber  productNumber
001540
001550     *> 在庫問合わせメソッドを呼び出してオーダーされた製品の在庫を
001560     *> 取得し，注文数と比較してオーダー可能かどうか判定します。
001570     INVOKE OBJ "在庫問合わせ" USING stockProductNumber stockProductQuantity RETURNING RET
001580     IF RET = 正常終了 AND stockProductQuantity < L_QUANT THEN
001590       MOVE 在庫不足 TO RET
001600     END-IF
001610
001620     *> DB_ACCESSクラスのオブジェクトを削除します。
001630     SET OBJ TO NULL
001640
001650     EXIT METHOD.
001660 END METHOD      オーダー確認.
001670/
001680*======================================================================
001690*  ◆メソッド名  ：OrderRegist（オーダー登録）
001700*      概要      ：登録ユーザＩＤ／パスワードの組合せを確認します。
001710*                   復帰値と意味は以下のとおりです。
001720*                     0     = 正常終了（登録情報と一致）
001730*                     100   = 認証失敗（登録情報と不一致）
001740*                     10000 = システムエラー（ＤＢアクセス中にエラー発生）
001750*                             ※エラーの詳細はイベントログに出力します。
001760*      パラメタ  ：using    UID PIC X(32)
001770*                           PWD PIC X(32)
001780*                  return   PIC 9(9) COMP-5
001790*======================================================================
001800 METHOD-ID.      オーダー登録 AS "OrderRegist".
001810 DATA            DIVISION.
001820 WORKING-STORAGE SECTION.
001830 01 repNUMBER.
001840  02           PIC X(4) VALUE  "ONUM".
001850  02  TIMEDATA PIC 9(8).
001860 01 OBJ          USAGE OBJECT REFERENCE DB_ACCESS.
001870 01 RET          PIC 9(9) COMP-5.
001880 01 orderNumber            PIC X(12).
001890 01 orderUserID            PIC X(32).
001900 01 orderDate              PIC X(14).
001910 01 orderProductNumber     PIC X(10).
001920 01 orderProductQuantity   PIC 9(10).
001930 LINKAGE         SECTION.
001940 01 L_DATE       PIC X(14).
001950 01 L_USER       PIC X(32).
001960 01 L_NUM        PIC X(10).
001970 01 L_QUANT      PIC 9(10).
001980 01 RET_NUMBER   PIC X(12).
001990 PROCEDURE       DIVISION
002000                 USING  L_DATE L_USER L_NUM L_QUANT
002010                 RETURNING RET_NUMBER.
002020*
002030 DECLARATIVES.
002040 DBexception SECTION.
002050     USE AFTER EXCEPTION COM-EXP.
002060         SET EXOBJ TO EXCEPTION-OBJECT
002070         SET OBJ TO NULL
002080         EXIT METHOD. 
002090 END DECLARATIVES.
002100*
002110     *> DB_ACCESSクラスのオブジェクトを生成します。
002120     INVOKE DB_ACCESS "CREATE-OBJECT" USING APPNAME
002130                                      RETURNING OBJ
002140*
002150     *> オーダー情報を設定します。
002160     INITIALIZE orderNumber orderUserID orderDate orderProductNumber orderProductQuantity
002170     MOVE L_DATE  TO orderDate
002180     MOVE L_USER  TO orderUserID
002190     MOVE L_NUM   TO orderProductNumber
002200     MOVE L_QUANT TO orderProductQuantity
002210*
002220     *> 現時刻を元にオーダー番号を採番します。既にオーダー番号を採番してる
002230     *> 場合は、既に採番したオーダー番号を設定します。
002240     IF ORDER_NUMBER = SPACE THEN
002250       ACCEPT TIMEDATA FROM TIME
002260       MOVE repNUMBER    TO orderNumber RET_NUMBER ORDER_NUMBER
002270       *> オーダー登録メソッドを呼出します。
002280       INVOKE OBJ "オーダー登録" USING orderNumber orderUserID orderDate orderProductNumber orderProductQuantity
002290                                 RETURNING RET
002300     ELSE
002310       MOVE ORDER_NUMBER TO orderNumber RET_NUMBER
002320     END-IF
002330     *> 在庫更新メソッドを呼出します。
002340     INVOKE OBJ "在庫更新" USING orderNumber orderUserID orderDate orderProductNumber orderProductQuantity
002350                           RETURNING RET
002360*
002370     *> DB_ACCESSクラスのオブジェクトを削除します。
002380     SET OBJ TO NULL
002390
002400     *> エラーを検出した場合、オーダー番号にERRを設定しくます。
002410     IF RET NOT = 正常終了 THEN
002420       MOVE "ERR" TO RET_NUMBER
002430     END-IF
002440
002450     EXIT METHOD.
002460 END METHOD     オーダー登録.
002470/
002480*======================================================================
002490*  ◆メソッド名  ：OrderSum（オーダー清算）
002500*      概要      ：配列要素に格納されたオーダー情報から、合計を計算
002510*                  します。
002520*                   復帰値と意味は以下のとおりです。
002530*                     0     = 正常終了（登録情報と一致）
002540*      パラメタ  ：using    ARRAYOBJ OBJECT REFERENCE ARRAY
002550*                           ED_SUM PIC Z(9)9
002560*                  return   PIC 9(3) PACKED-DECIMAL
002570*======================================================================
002580 METHOD-ID.      オーダー清算 AS "OrderSum".
002590 DATA            DIVISION.
002600 WORKING-STORAGE SECTION.
002610 01 billSUM      PIC 9(10).
002620 01 BILL         PIC S9(9) COMP-5.
002630 01 ARRAYSIZE    PIC S9(9) COMP-5.
002640 01 DIM          PIC S9(9) COMP-5 VALUE 1.
002650 01 CNT          PIC S9(9) COMP-5.
002660 LINKAGE         SECTION.
002670 01 ARRAYOBJ     OBJECT REFERENCE ARRAY.
002680 01 ED_SUM       PIC Z(9)9.
002690 01 RET          PIC 9(3) PACKED-DECIMAL.
002700 PROCEDURE       DIVISION
002710                 USING ARRAYOBJ ED_SUM RETURNING RET.
002720*
002730 DECLARATIVES.
002740 DBexception SECTION.
002750     USE AFTER EXCEPTION COM-EXP.
002760         SET EXOBJ TO EXCEPTION-OBJECT
002770         SET OBJ TO NULL
002780         EXIT METHOD. 
002790 END DECLARATIVES.
002800*
002810     MOVE 正常終了 TO RET
002820     MOVE 0        TO billSUM
002830
002840     INVOKE ARRAYOBJ "GET-SIZE" USING DIM RETURNING ARRAYSIZE
002850     PERFORM TEST BEFORE VARYING CNT FROM 1 BY 1
002860                  UNTIL CNT > ARRAYSIZE
002870         INVOKE ARRAYOBJ "GET-DATA" USING CNT RETURNING BILL
002880         COMPUTE billSUM     = billSUM  +  BILL
002890     END-PERFORM
002900     MOVE billSUM     TO ED_SUM
002910
002920     *> オーダー番号を初期化します。
002930     MOVE SPACE TO ORDER_NUMBER
002940
002950     EXIT METHOD.
002960 END METHOD      オーダー清算.
002970/
002980*======================================================================
002990*  ◆メソッド名  ：INIT
003000*      概要      ：初期化メソッド
003010*      パラメタ  ：なし
003020*      備考      ：FJBASEのINITメソッドをOVERRIDEする
003030*======================================================================
003040 METHOD-ID.      INIT OVERRIDE.
003050 DATA            DIVISION.
003060 WORKING-STORAGE SECTION.
003070 PROCEDURE       DIVISION.
003080     *> FJBASEクラスのINITを呼び出す
003090     INVOKE SUPER "INIT"
003100     *> ORDER_NUMBERを初期化する
003110     MOVE SPACE TO ORDER_NUMBER
003120 END METHOD      INIT.
003130
003140 END OBJECT.
003150 END CLASS      ONLINE_STORE.
003160
