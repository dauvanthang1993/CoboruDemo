000100*=================================================================
000200* 「マルチスレッドプログラミング」
000300*     スレッド間でファイル・データを共用してオンラインショッピング
000400*   のアプリケーションを構築します。
000500*
000600*=================================================================
000700*
000800*  ファイル名： Entry.cob
000900*  動作概要  ：   オーダーの発行と確認表の再作成を行います
001000*
001100* Copyright 1999-2015 FUJITSU LIMITED
001200*=================================================================
001300 identification division.
001400 program-id. "HttpExtensionProc".
001500 environment division.
001600 data division.
001700 working-storage section.
001800     copy COBW3.
001900     copy Stock-Info.
002000     copy Product-Info.
002100     copy Order-Info.
002200     copy User-Log.
002300*
002400 01 pathName                      pic X(256) value space.
002500 01 pathSize                      pic 9(05) value 0.
002600 01 HTMLFilename                  pic X(40) value space.
002700 01 counter                       pic 9(04) value 0.
002800 01 quantity                      pic 9(04) value 0.
002900 01 returnValue                   pic 9(09) comp-5 value 0.
003000 01 stockFlag                     pic 9(01) value 0.
003100 01 copyStartPos                  pic 9(05) value 0.
003200 01 leftLength                    pic 9(05) value 0.
003300 01 数量                          pic 9(10) value 0.
003400 01 金額                          pic 9(10) value 0.
003500 01 総額                          pic 9(10) value 0.
003600 01 総量                          pic 9(10) value 0.
003700 01 編集数量                      pic Z(9)9 value space.
003800 01 編集金額                      pic Z(9)9 value space.
003900 01 編集総額                      pic Z(9)9 value space.
004000 01 編集総量                      pic Z(9)9 value space.
004100 01 順序                          pic 9(02) value 0.
004200*
004300 01 ProductNumberLabel.
004400    02 filler                     pic X(13) value "ProductNumber".
004500    02 ProductNumberLabelNumber   pic 9(02) value 0.
004600 01 numLabel.
004700    02 filler                     pic X(15) value "ProductQuantity".
004800    02 numLabelNumber             pic 9(02) value 0.
004900 01 現在日付時刻.
005000    02 YMD-HMS.
005100       03 オーダー年             pic X(04) value space.
005200       03 オーダー月              pic X(02) value space.
005300       03 オーダー日              pic X(02) value space.
005400       03 filler                  pic X(06) value space.
005500    02 filler                     pic X(07) value space.
005600 01 オーダー日付.
005700    02 オーダー年                 pic X(04) value space.
005800    02 filler                     pic X(01) value "/".
005900    02 オーダー月                 pic X(02) value space.
006000    02 filler                     pic X(01) value "/".
006100    02 オーダー日                 pic X(02) value space.
006200*----------------------------------------------------------------*
006300* SAFアプリへの移行について                                      *
006400*                                                                *
006500*    SAFアプリに移行する際は、連絡節と手続き部を修正する必要が   *
006600*  あります。インタフェース領域をSAFサブルーチンで使用するため、 *
006700*  SAFサブルーチンとのインタフェースであるCOBW3にそのアドレス    *
006800*  を設定する必要があります。                                    *
006900*                                                                *
007000*  [補足]                                                        *
007100*    SAFアプリの場合は、NSAPI開始から終了までのコメントを外し、  *
007200*  ISAPI開始から終了までをコメント化してください。               *
007300*                                                                *
007400*----------------------------------------------------------------*
007500*
007600*---------------------   ＩＳＡＰＩ 開始  -----------------------*
007700 linkage section.
007800     copy IsapiCtx.
007900*
008000 procedure division with stdcall linkage using ISAPI-CTX-CNT.
008100*
008200 Auth-Start.
008300*
008400*  ＩＳＡＰＩサブルーチンパラメタ域の初期化
008500     move low-value to COBW3.
008600     move function addr(ISAPI-CTX-CNT) to COBW3-CONTEXT.
008700*---------------------   ＩＳＡＰＩ 終了  -----------------------*
008800*
008900*---------------------   ＮＳＡＰＩ 開始  -----------------------*
009000*linkage section.
009100*01 safpt                         pointer.
009200**
009300* procedure division using safpt.
009400**
009500*Auth-Start.
009600**
009700**  ＮＳＡＰＩサブルーチンパラメタ域の初期化
009800*    move low-value to COBW3.
009900*    move safpt     to COBW3-CONTEXT.
010000*---------------------   ＮＳＡＰＩ 終了  -----------------------*
010100*
010200*=================================================================
010300*  ＩＳＡＰＩサブルーチン作業環境を初期化し、Ｗｅｂパラメタを
010400*  獲得する
010500*=================================================================
010600     call "COBW3_INIT" using COBW3.
010700*
010800*=================================================================
010900*  １つのページを複数回に分けて出力するので、物理パスを取得して
011000*  おく。なお、結果出力用ページは、アプリを起動した呼出し用ページ
011100*  と同じフォルダにあるものと見なす。
011200*=================================================================
011300     move space to pathName.
011400     set COBW3-PHYSICALPATH to true.
011500     call "COBW3_GET_REQUEST_INFO" using COBW3.
011600     if COBW3-STATUS = zero then
011700       move COBW3-REQUEST-INFO to pathName
011800       move COBW3-REQUEST-INFO-LENGTH to pathSize
011900     end-if.
012000*
012100*=================================================================
012200*  Ｃｏｏｋｉｅによって、オーダー確認処理からUser-IDを引き継ぐ
012300*=================================================================
012400     move "Online Store User-ID" to COBW3-COOKIE-NAME.
012500     call "COBW3_GET_COOKIE_XX" using COBW3.
012600     if COBW3-SEARCH-FLAG-EXIST then
012700         move COBW3-COOKIE-VALUE to orderUserID
012800     else
012900         move "IlligalAccess.html" to HTMLFilename
013000         perform 画面出力処理
013100         go to 終了位置
013200     end-if.
013300*
013400*=================================================================
013500*  Ｗｅｂパラメタを検索し、オーダー数量が０でないものの製品番号
013600*  とオーダー数量を取得する
013700*=================================================================
013800     move zero to quantity.
013900     perform test before
014000         varying counter
014100         from 1 by 1 until counter > 20
014200*
014300       *> ProductQuantityXX(XX=1～20)をキーにオーダー数量を検索する
014400       move counter to numLabelNumber
014500       move numLabel to COBW3-SEARCH-DATA
014600       call "COBW3_GET_VALUE_XX" using COBW3
014700       if program-status not = zero then
014800         move "SystemError.html" to HTMLFilename
014900         go to 終了位置
015000       end-if
015100       *> オーダー数量が０でないなら、製品番号を得る
015200       if COBW3-SEARCH-FLAG-EXIST then
015300         compute 数量 = function NUMVAL(COBW3-GET-DATA)
015400         if 数量 not = zero then
015500           move counter to ProductNumberLabelNumber
015600           move ProductNumberLabel to COBW3-SEARCH-DATA
015700           call "COBW3_GET_VALUE_XX" using COBW3
015800           if program-status not = zero then
015900             move "SystemError.html" to HTMLFilename
016000             go to 終了位置
016100           end-if
016200*
016300           *> 製品番号を在庫・オーダー・製品情報に退避する
016400           if COBW3-SEARCH-FLAG-EXIST then
016500             add 1 to  quantity
016600             move COBW3-GET-DATA to stockProductNumber(quantity)
016700                                    orderProductNumber(quantity)
016800                                    productNumber(quantity)
016900             move 数量 to orderProductQuantity(quantity)
017000           end-if
017100         end-if
017200       else            *> Ｗｅｂパラメタに該当する名前がないなら、
017300         exit perform  *> データの終わりに達したのでループを脱出
017400       end-if
017500     end-perform.
017600*
017700     *> オーダー品数をオーダー情報・製品情報に退避する
017800     move quantity to orderQuantity productQuantity.
017900*=================================================================
018000*  現日付の取得とオーダー日付の設定
018100*=================================================================
018200     move function current-date to 現在日付時刻.
018300     move YMD-HMS to orderDate.
018400*
018500*=================================================================
018600*  製品番号をキーにオーダーされた製品の在庫を更新し、オーダーを
018700*  登録する処理を呼び出す。
018800*=================================================================
018900     call "在庫更新オーダー登録" using orderInfo
019000                                 returning returnValue.
019100     if returnValue not = zero then
019200       move "SystemError.html" to HTMLFilename
019300       go to 終了位置
019400     end-if.
019500*=================================================================
019600*  製品番号をキーにオーダーされた製品データを問い合わせる
019700*=================================================================
019800     call "製品データ取得" using productInfo
019900                           returning returnValue.
020000     if returnValue not = zero then
020100       move "SystemError.html" to HTMLFilename
020200       go to 終了位置
020300     end-if.
020400*
020500*=================================================================
020600*  オーダー表の作成
020700*=================================================================
020800*
020900     *> オーダー番号の登録
021000     move "OrderNumber" to COBW3-CNV-NAME.
021100     move orderNumber to COBW3-CNV-VALUE.
021200     perform 変換データ登録.
021300*
021400     *> 日付の登録
021500     move corresponding YMD-HMS to オーダー日付
021600     move "OrderYMD"   to COBW3-CNV-NAME.
021700     move オーダー日付 to COBW3-CNV-VALUE.
021800     perform 変換データ登録.
021900*
022000     *> オーダー表ヘッダの出力
022100     move "OrderResultHead.html" to HTMLFilename.
022200     perform 画面出力処理.
022300*
022400*  各明細の作成
022500     move zero to 編集総額 編集総量.
022600     perform test before
022700        varying counter  from 1 by 1
022800         until counter > orderQuantity
022900       if orderProductNumber(counter) not = stockProductNumber(counter) or
023000          orderProductNumber(counter) not = productNumber(counter) then
023100         move "IlligalSystem.html" to HTMLFilename
023200         go to 終了位置
023300       end-if
023400*
023500       *> 変換データのクリア
023600       call "COBW3_INIT_CNV" using COBW3
023700*
023800       *> 順序番号の登録
023900       move counter to 順序
024000       move "Sequence" to COBW3-CNV-NAME
024100       move 順序       to COBW3-CNV-VALUE
024200       perform 変換データ登録
024300*
024400       *> 製品番号の登録
024500       move "ProductNumber"             to COBW3-CNV-NAME
024600       move orderProductNumber(counter) to COBW3-CNV-VALUE
024700       perform 変換データ登録
024800*
024900       *> 製品名の登録
025000       move "ProductName"        to COBW3-CNV-NAME
025100       move productName(counter) to COBW3-CNV-VALUE
025200       perform 変換データ登録
025300*
025400       *> 製品モデル名の登録
025500       move "ProductModel"        to COBW3-CNV-NAME
025600       move productModel(counter) to COBW3-CNV-VALUE
025700       perform 変換データ登録
025800*
025900       *> オーダー数量の登録
026000       move orderProductQuantity(counter) to 編集数量
026100       move "ProductQuantity" to COBW3-CNV-NAME
026200       move 編集数量          to COBW3-CNV-VALUE
026300       perform 変換データ登録
026400*
026500       *> オーダー金額の登録
026600       compute 金額 = orderProductQuantity(counter) *
026700                      productPrice(counter) / 1000
026800       move 金額 to 編集金額
026900       move "ProductTotal" to COBW3-CNV-NAME
027000       move 編集金額       to COBW3-CNV-VALUE
027100       perform 変換データ登録
027200*
027300       *> 総額・総量の計算
027400       compute 総額 = 総額 + 金額
027500       compute 総量 = 総量 + orderProductQuantity(counter)
027600*  明細の出力
027700       move "OrderDetailParts.html" to HTMLFilename
027800       perform 画面出力処理
027900     end-perform.
028000*
028100     *> 総量の登録
028200     move 総量 to 編集総量.
028300     move "SummaryQuantity" to COBW3-CNV-NAME.
028400     move 編集総量          to COBW3-CNV-VALUE.
028500     perform 変換データ登録.
028600*
028700     *> 総額の登録
028800     move 総額 to 編集総額.
028900     move "SummaryTotal" to COBW3-CNV-NAME.
029000     move 編集総額       to COBW3-CNV-VALUE.
029100     perform 変換データ登録.
029200*
029300     *>  オーダー表テールの出力（実際の出力は終了処理で）
029400     move "OrderResultTail.html" to HTMLFilename.
029500*
029600*=================================================================
029700*  エラーページまたはオーダー表のテールを出力し、ＩＳＡＰＩサブ
029800*  ルーチン作業領域を開放して、プログラムを終了する。
029900*=================================================================
030000 終了位置.
030100*
030200     perform 画面出力処理.
030300*  ＩＳＡＰＩサブルーチン作業領域の解放
030400     call "COBW3_FREE" using COBW3.
030500*
030600 Entry-End.
030700*
030800     move 1 to program-status.
030900     exit program.
031000*=================================================================
031100*
031200*  内部処理の定義
031300*
031400*=================================================================
031500*
031600*=================================================================
031700*  変換データ登録処理
031800*=================================================================
031900 変換データ登録 section.
032000     call "COBW3_SET_CNV_XX" using COBW3.
032100     if program-status not = zero then
032200         move "SystemError.html" to HTMLFilename
032300         perform 画面出力処理
032400         go to 終了位置
032500     end-if.
032600 変換データ登録終了.
032700     exit.
032800*=================================================================
032900*  画面出力処理
033000*    結果出力用ページは、アプリケーションを起動した呼出し用ページ
033100*    と同じフォルダにあるものと見なす。
033200*=================================================================
033300 画面出力処理 section.
033400     *>  フルパスファイル名の完成
033500     move space to COBW3-HTML-FILENAME.
033600     string pathName(1:pathSize) "\" delimited by size
033700            HTMLFilename             delimited by space
033800        into COBW3-HTML-FILENAME
033900     *>  HTML文書の出力
034000     call "COBW3_PUT_HTML" using COBW3.
034100*
034200 画面出力処理終了.
034300     exit.
