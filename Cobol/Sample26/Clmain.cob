000010*======================================================================
000020* 「ＣＯＭ連携－COMクライアント機能」
000030*     ＣＯＢＯＬサーバのCOBOLクライアントからの使用
000040*
000050* Copyright 1999-2015 FUJITSU LIMITED
000060*======================================================================
000070 IDENTIFICATION DIVISION.
000080 PROGRAM-ID.    CLMAIN.
000090 ENVIRONMENT DIVISION.
000100 CONFIGURATION SECTION.
000110 SPECIAL-NAMES.
000120      SYMBOLIC CONSTANT
000130          正常終了       0
000140          認証失敗       100
000150          在庫不足       200
000160          製品番号未登録 1000
000170          システムエラー 10000
000180          .
000190 REPOSITORY.
000200      CLASS ONLINE_STORE AS "*COM:STORESV1:ONLINE_STORE"
000210      CLASS ARRAY AS "*COM-ARRAY"
000220      .
000230
000240 DATA DIVISION.
000250 WORKING-STORAGE SECTION.
000260 01 appname   pic x(30) value "STORESV1.ONLINE_STORE".
000270 01 OLS_SERVICE   OBJECT REFERENCE ONLINE_STORE.
000280 01 ARRAYOBJ      OBJECT REFERENCE ARRAY.
000290 01 ProcCD        PIC 9.
000300  88 メニュー表示 VALUE 0.
000310  88 カタログ表示 VALUE 1.
000320  88 処理終了     VALUE 2.
000330  88 オーダー確認 VALUE 3.
000340  88 オーダー控え VALUE 4.
000350 01 Agree         PIC X.
000360  88 発注承認     VALUE "Y" "y".
000370  88 取り消し     VALUE "N" "n".
000380 01 Quantity     PIC 9(4) COMP-5.
000390 01 IDXCNT       PIC 9(4) COMP-5.
000400 01 CertifyRet   pic s9(6) comp-5.
000410 01 ReferRet     pic 9(3) comp-3.
000420 01 RET PIC 9(9) COMP-5.
000430 01 G-DUMMY      PIC X.
000440 01 WKreceiptNumber  PIC X(12).
000450 01 現在日付時刻.
000460    02 YMD-HMS.
000470       03 currentYear             pic X(04).
000480       03 currentMonth            pic X(02).
000490       03 currentDay              pic X(02).
000500       03 filler                  pic X(06).
000510    02 filler                     pic X(07).
000520 01 DataForArray.
000530  02 ELM-TYPE    PIC S9(9) COMP-5 VALUE 3.
000540  02 DIM         PIC S9(9) COMP-5 VALUE 1.
000550  02 ELM-NO      PIC S9(9) COMP-5.
000560      COPY Product-Table.
000570      COPY OrderSheet-Info.
000580 SCREEN    SECTION.
000590      COPY screens.
000600 PROCEDURE DIVISION.
000610 ProgramSTART.
000620     MOVE 正常終了 TO RET
000630     INVOKE ONLINE_STORE "NEW" RETURNING OLS_SERVICE
000640
000650*======================================================================
000660*  会員認証
000670*======================================================================
000680     DISPLAY 会員認証画面
000690     ACCEPT  会員認証画面
000700
000710     INVOKE OLS_SERVICE "IsUser"
000720                           USING orderer ordererPassword
000730                           RETURNING CertifyRet
000740     IF CertifyRet = 正常終了 THEN
000750       SET メニュー表示 TO TRUE
000760     ELSE
000770       MOVE CertifyRet TO RET
000780       SET 処理終了    TO TRUE
000790     END-IF
000800*======================================================================
000810*  どちらかの原因でProcCDが処理終了次のとなるまで、処理を繰り返す。
000820*   - メニューで終了を選択
000830*   - エラーが発生
000840*======================================================================
000850     PERFORM TEST BEFORE
000860              UNTIL 処理終了
000870       EVALUATE TRUE
000880*======================================================================
000890*  メニュー表示
000900*======================================================================
000910       WHEN メニュー表示
000920         DISPLAY メニュー画面
000930         ACCEPT  メニュー画面
000940*======================================================================
000950*  カタログ（注文画面）表示
000960*======================================================================
000970       WHEN カタログ表示
000980         MOVE 0 TO Quantity
000990         DISPLAY カタログ画面
001000         ACCEPT  カタログ画面
001010         PERFORM オーダー作成
001020*======================================================================
001030*  オーダー確認画面表示
001040*======================================================================
001050       WHEN オーダー確認
001060         DISPLAY オーダー確認画面
001070         ACCEPT  オーダー確認画面
001080         PERFORM オーダー発注
001090*======================================================================
001100*  オーダー控え（発注数量，金額の合計を含む）を表示する．
001110*======================================================================
001120       WHEN オーダー控え
001130         DISPLAY オーダー控え画面
001140         ACCEPT  オーダー控え画面
001150         SET メニュー表示 TO TRUE
001160       END-EVALUATE
001170     END-PERFORM.
001180*======================================================================
001190*  エラー処理
001200*    RETの値に応じて、適切なエラー画面を表示する
001210*======================================================================
001220 ERR-PROC.
001230*  エラー値に応じた画面を出力する．
001240     EVALUATE RET
001250     WHEN 認証失敗
001260       DISPLAY 認証エラー画面
001270     WHEN 在庫不足
001280       DISPLAY 在庫エラー画面
001290     WHEN 製品番号未登録
001300       DISPLAY 登録エラー画面
001310     WHEN NOT 正常終了
001320       DISPLAY その他エラー画面
001330     END-EVALUATE
001340     GO TO ProgramEND.
001350*======================================================================
001360*  オンラインストアのオブジェクトを破棄して終了する
001370*======================================================================
001380 ProgramEND.
001390     SET OLS_SERVICE TO NULL.
001400     SET ARRAYOBJ    TO NULL
001410     EXIT PROGRAM.
001420
001430*======================================================================
001440*    入力されたオーダー数量を確認し、発注があれば在庫を確認した上で
001450*  オーダーを作成する。
001460*======================================================================
001470 オーダー作成.
001480     MOVE SPACE TO receiptRec
001490     PERFORM TEST BEFORE VARYING IDXCNT FROM 1 BY 1
001500                 UNTIL IDXCNT > 20
001510       IF P-QUANT(IDXCNT) NOT = 0 THEN
001520         INVOKE OLS_SERVICE "StockCheck"
001530              USING P-NUM(IDXCNT) R-QUANT(IDXCNT)  RETURNING RET
001540         IF RET NOT = 正常終了 THEN
001550            SET 処理終了 TO TRUE
001560            EXIT PERFORM
001570         ELSE
001580            *> 在庫があるならオーダー情報を作成する。
001590           ADD 1 TO  Quantity
001600           MOVE P-NUM (IDXCNT)  TO  R-NUM (Quantity)
001610           MOVE P-Name(IDXCNT)  TO  R-Name(Quantity)
001620           MOVE P-Model(IDXCNT) TO  R-Model(Quantity)
001630           MOVE P-Price(IDXCNT) TO  R-Price(Quantity)
001640           MOVE P-QUANT(IDXCNT) TO  R-QUANT(Quantity)
001650           COMPUTE SUM-Price(Quantity)
001660                 =  R-Price(Quantity) * R-QUANT(Quantity)
001670         END-IF
001680       END-IF
001690     END-PERFORM
001700     MOVE Quantity    TO receiptQuantity
001710     SET オーダー確認 TO TRUE.
001720*======================================================================
001730*    オーダーが承認されたなら、発注処理を行う。
001740*  オーダーを作成する。
001750*======================================================================
001760 オーダー発注.
001770     IF 発注承認 THEN
001780       MOVE ZERO TO ALLquantity
001790       MOVE receiptQuantity TO  ELM-NO
001800       INVOKE ARRAY "NEW" USING ELM-TYPE DIM ELM-NO
001810                          RETURNING ARRAYOBJ
001820       MOVE FUNCTION CURRENT-DATE TO 現在日付時刻
001830       MOVE YMD-HMS  TO receiptDate
001840       PERFORM TEST BEFORE VARYING IDXCNT FROM 1 BY 1
001850                            UNTIL IDXCNT > receiptQuantity OR
001860                                  処理終了
001870         INVOKE OLS_SERVICE "OrderRegist"
001880             USING receiptDate orderer R-NUM(IDXCNT) R-QUANT(IDXCNT)
001890             RETURNING receiptNumber
001900*
001910         *> receiptNumberには，発行したオーダー番号が返却される．
001920         *> 登録処理に失敗した場合は"ERR"が返される．
001930         IF receiptNumber NOT = "ERR" THEN
001940           *> 発注数の累計
001950           COMPUTE ALLquantity = ALLquantity + R-QUANT(IDXCNT)
001960           *> １製品あたりの価格を配列要素に設定しておく
001970           MOVE IDXCNT TO ELM-NO
001980           INVOKE ARRAYOBJ "SET-DATA" USING SUM-Price(IDXCNT) ELM-NO
001990         ELSE
002000           MOVE システムエラー TO RET
002010           SET 処理終了        TO TRUE
002020         END-IF
002030       END-PERFORM
002040       IF RET = 正常終了 THEN
002050         INVOKE OLS_SERVICE "OrderSum"  USING ARRAYOBJ ED-Bill
002060                                        RETURNING ReferRet
002070         MOVE ALLquantity TO ED-ALLquantity
002080         SET オーダー控え TO TRUE
002090       END-IF
002100     ELSE
002110       SET メニュー表示 TO TRUE
002120     END-IF
