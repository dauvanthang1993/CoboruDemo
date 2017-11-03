000010*======================================================================
000020* 「ＣＯＭ連携－COMサーバ機能」
000030*     ＣＯＢＯＬサーバの例題
000040*
000050* Copyright 1999-2015 FUJITSU LIMITED
000060*======================================================================
000070*
000080*  クラス名    ：ONLINE_STORE
000090*
000100*  概要        ：クライアントからのリクエストを受け，DB_ACCESSクラスの
000110*                メソッドの呼出し制御を行います。
000120*  継承クラス  ：FJBASE
000130*  参照クラス  ：DB_ACCESS, *COM-ARRAY
000140*  メソッド    ：ファクトリメソッド
000150*                 なし
000160*              ：オブジェクトメソッド
000170*                - 認証処理
000180*                - 在庫確認
000190*                - オーダー登録
000200*                - オーダー清算
000210*  Copyright 1999-2015 FUJITSU LIMITED
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
000370      CLASS DB_ACCESS
000380      CLASS ARRAY AS "*COM-ARRAY"
000390      .
000400
000410 OBJECT.
000420 DATA DIVISION.
000430 WORKING-STORAGE SECTION.
000440 01 ORDER_NUMBER   PIC X(12).       *> オーダー番号
000450 PROCEDURE DIVISION.
000460*======================================================================
000470*  ◆メソッド名  ：IsUser（認証処理）.
000480*      概要      ：登録ユーザＩＤ／パスワードの組合せを確認します。
000490*                   復帰値と意味は以下のとおりです。
000500*                     0     = 正常終了（登録情報と一致）
000510*                     100   = 認証失敗（登録情報と不一致）
000520*                     10000 = システムエラー（ＤＢアクセス中にエラー発生）
000530*                             ※エラーの詳細はイベントログに出力します。
000540*      パラメタ  ：using    UID PIC X(32)
000550*                           PWD PIC X(32)
000560*                  return   PIC 9(9) COMP-5
000570*======================================================================
000580 METHOD-ID.      認証処理 AS "IsUser".
000590 DATA            DIVISION.
000600 WORKING-STORAGE SECTION.
000610 01 OBJ          USAGE OBJECT REFERENCE DB_ACCESS.
000620 01 userID       PIC X(32).
000630 01 userPassword PIC X(32).
000640 LINKAGE         SECTION.
000650 01 UID          PIC X(32).
000660 01 PWD          PIC X(32).
000670 01 RET          PIC S9(6) COMP-5.
000680 PROCEDURE       DIVISION
000690                 USING UID PWD  RETURNING RET.
000700     *> DB_ACCESSクラスのオブジェクトを生成します。
000710     INVOKE DB_ACCESS "NEW" RETURNING OBJ
000720
000730     *> UIDに対応するパスワードを求めます。
000740     MOVE UID TO userID
000750     INVOKE OBJ "顧客情報取得" USING userID userPassword
000760                               RETURNING RET
000770
000780     *> パスワードの取得に成功したら、パスワードが一致UID
000790     *> チェックします。
000800     IF RET = 正常終了 AND
000810        PWD NOT = userPassword THEN
000820         MOVE 認証失敗 TO RET
000830     END-IF
000840
000850     *> DB_ACCESSクラスのオブジェクトを削除します。
000860     SET OBJ TO NULL
000870
000880     EXIT METHOD.
000890 END METHOD      認証処理.
000900/
000910*======================================================================
000920*  ◆メソッド名  ：StockCheck（在庫確認）
000930*      概要      ：製品番号と個数を受け取って、オーダーが可能かどうか
000940*                  在庫のチェックを行います。
000950*                   復帰値と意味は以下のとおりです。
000960*                     0     = 正常終了
000970*                     1000  = 製品番号未登録
000980*                     10000 = システムエラー（ＤＢアクセス中にエラー発生）
000990*                             ※エラーの詳細はイベントログに出力します。
001000*      パラメタ  ：using    L_NUMIC X(10)
001010*                           L_QUANT PIC 9(10)
001020*                  return   PIC 9(9) COMP-5
001030*======================================================================
001040 METHOD-ID.      オーダー確認 AS "StockCheck".
001050 DATA            DIVISION.
001060 WORKING-STORAGE SECTION.
001070 01 OBJ          USAGE OBJECT REFERENCE DB_ACCESS.
001080 01 stockProductNumber        pic X(10).  *> 製品番号
001090 01 stockProductQuantity      pic 9(10).  *> 在庫数量
001100*01  productInfo.
001110*   02 productNumber          pic X(12).  *> 製品番号
001120*   02 productName            pic X(32).  *> 製品名
001130*   02 productModel           pic X(32).  *> モデル
001140*   02 productPrice           pic 9(09).  *> 単価
001150 LINKAGE         SECTION.
001160 01 L_NUM        PIC X(10).
001170 01 L_QUANT      PIC 9(10).
001180 01 RET          PIC 9(9) COMP-5.
001190 PROCEDURE       DIVISION
001200                 USING  L_NUM L_QUANT
001210                 RETURNING RET.
001220
001230     *> DB_ACCESSクラスのオブジェクトを生成します。
001240     INVOKE DB_ACCESS "NEW" RETURNING OBJ
001250
001260*    INITIALIZE stockProductNumber stockProductQuantity
001270*    INITIALIZE productInfo
001280     *> stockInfoおよびproductInfoに情報を設定します。
001290     MOVE L_NUM TO  stockProductNumber  *> productNumber
001300
001310     *> 在庫問合わせメソッドを呼び出してオーダーされた製品の在庫を
001320     *> 取得し，注文数と比較してオーダー可能かどうか判定します。
001330     INVOKE OBJ "在庫問合わせ" USING stockProductNumber
001340                                     stockProductQuantity
001350                               RETURNING RET
001360     IF RET = 正常終了 AND stockProductQuantity < L_QUANT THEN
001370       MOVE 在庫不足 TO RET
001380     END-IF
001390
001400     *> DB_ACCESSクラスのオブジェクトを削除します。
001410     SET OBJ TO NULL
001420
001430     EXIT METHOD.
001440 END METHOD      オーダー確認.
001450/
001460*======================================================================
001470*  ◆メソッド名  ：OrderRegist（オーダー登録）
001480*      概要  ：在庫数を更新してオーダー明細を登録します。
001490*                   復帰値と意味は以下のとおりです。
001500*                     オーダー番号 = 登録成功
001510*                     "ERR"        = 登録失敗
001520*                             ※エラーの詳細はイベントログに出力します。
001530*      パラメタ  ：using    L_DATE PIC X(14)
001540*                           L_USER PIC X(32)
001550*  			  L_NUM  PIC X(10)
001560*				  L_QUANT PIC 9(10)
001570*                  return   PIC X(12)
001580*======================================================================
001590 METHOD-ID.      オーダー登録 AS "OrderRegist".
001600 DATA            DIVISION.
001610 WORKING-STORAGE SECTION.
001620 01 repNUMBER.
001630  02           PIC X(4) VALUE  "ONUM".
001640  02  TIMEDATA PIC 9(8).
001650 01 OBJ          USAGE OBJECT REFERENCE DB_ACCESS.
001660 01 RET          PIC 9(9) COMP-5.
001670 01 orderNumber            PIC X(12).
001680 01 orderUserID            PIC X(32).
001690 01 orderDate              PIC X(14).
001700 01 orderProductNumber     PIC X(10).
001710 01 orderProductQuantity   PIC 9(10).
001720 LINKAGE         SECTION.
001730 01 L_DATE       PIC X(14).
001740 01 L_USER       PIC X(32).
001750 01 L_NUM        PIC X(10).
001760 01 L_QUANT      PIC 9(10).
001770 01 RET_NUMBER   PIC X(12).
001780 PROCEDURE       DIVISION
001790                 USING  L_DATE L_USER L_NUM L_QUANT
001800                 RETURNING RET_NUMBER.
001810*
001820     *> DB_ACCESSクラスのオブジェクトを生成します。
001830     INVOKE DB_ACCESS "NEW" RETURNING OBJ
001840*
001850     *> オーダー情報を設定します。
001860     MOVE L_DATE  TO orderDate
001870     MOVE L_USER  TO orderUserID
001880     MOVE L_NUM   TO orderProductNumber
001890     MOVE L_QUANT TO orderProductQuantity
001900*
001910     *> 現時刻を元にオーダー番号を採番します。既にオーダー番号を採番してる
001920     *> 場合は、既に採番したオーダー番号を設定します。
001930     IF ORDER_NUMBER = SPACE THEN
001940       ACCEPT TIMEDATA FROM TIME
001950       MOVE repNUMBER    TO orderNumber RET_NUMBER ORDER_NUMBER
001960       *> オーダー登録メソッドを呼出します。
001970       INVOKE OBJ "オーダー登録" USING orderNumber orderUserID
001980                                       orderDate   orderProductNumber
001990                                       orderProductQuantity
002000                                 RETURNING RET
002010     ELSE
002020       MOVE ORDER_NUMBER TO orderNumber RET_NUMBER
002030     END-IF
002040     *> 在庫更新メソッドを呼出します。
002050     INVOKE OBJ "在庫更新" USING orderNumber orderUserID
002060                                 orderDate   orderProductNumber
002070                                 orderProductQuantity
002080                           RETURNING RET
002090*
002100     *> DB_ACCESSクラスのオブジェクトを削除します。
002110     SET OBJ TO NULL
002120
002130     *> エラーを検出した場合、オーダー番号にERRを設定しくます。
002140     IF RET NOT = 正常終了 THEN
002150       MOVE "ERR" TO RET_NUMBER
002160     END-IF
002170
002180     EXIT METHOD.
002190 END METHOD     オーダー登録.
002200/
002210*======================================================================
002220*  ◆メソッド名  ：OrderSum（オーダー清算）
002230*      概要      ：配列要素に格納されたオーダー情報から、合計を計算
002240*                  します。
002250*                   復帰値と意味は以下のとおりです。
002260*                     0     = 正常終了（登録情報と一致）
002270*      パラメタ  ：using    ARRAYOBJ OBJECT REFERENCE ARRAY
002280*                           ED_SUM PIC Z(9)9
002290*                  return   PIC 9(3) PACKED-DECIMAL
002300*======================================================================
002310 METHOD-ID.      オーダー清算 AS "OrderSum".
002320 DATA            DIVISION.
002330 WORKING-STORAGE SECTION.
002340 01 billSUM      PIC 9(10).
002350 01 BILL         PIC S9(9) COMP-5.
002360 01 ARRAYSIZE    PIC S9(9) COMP-5.
002370 01 DIM          PIC S9(9) COMP-5 VALUE 1.
002380 01 CNT          PIC S9(9) COMP-5.
002390 LINKAGE         SECTION.
002400 01 ARRAYOBJ     OBJECT REFERENCE ARRAY.
002410 01 ED_SUM       PIC Z(9)9.
002420 01 RET          PIC 9(3) PACKED-DECIMAL.
002430 PROCEDURE       DIVISION
002440                 USING ARRAYOBJ
002450                       ED_SUM
002460                 RETURNING RET.
002470     MOVE 正常終了 TO RET
002480     MOVE 0        TO billSUM
002490
002500     INVOKE ARRAYOBJ "GET-SIZE" USING DIM
002510                                RETURNING ARRAYSIZE
002520     PERFORM TEST BEFORE VARYING CNT FROM 1 BY 1
002530                  UNTIL CNT > ARRAYSIZE
002540         INVOKE ARRAYOBJ "GET-DATA" USING CNT
002550                                    RETURNING BILL
002560         COMPUTE billSUM     = billSUM  +  BILL
002570     END-PERFORM
002580     MOVE billSUM     TO ED_SUM
002590
002600     *> オーダー番号を初期化します。
002610     MOVE SPACE TO ORDER_NUMBER
002620
002630     EXIT METHOD.
002640 END METHOD      オーダー清算.
002650/
002660*======================================================================
002670*  ◆メソッド名  ：INIT
002680*      概要      ：初期化メソッド
002690*      パラメタ  ：なし
002700*      備考      ：FJBASEのINITメソッドをOVERRIDEする
002710*======================================================================
002720 METHOD-ID.      INIT OVERRIDE.
002730 DATA            DIVISION.
002740 WORKING-STORAGE SECTION.
002750 PROCEDURE       DIVISION.
002760      *> FJBASEクラスのINITを呼び出す
002770     INVOKE SUPER "INIT"
002780     *> ORDER_NUMBERを初期化する
002790     MOVE SPACE TO ORDER_NUMBER
002800 END METHOD      INIT.
002810
002820 END OBJECT.
002830 END CLASS      ONLINE_STORE.
002840
