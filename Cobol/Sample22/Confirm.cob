000100*=================================================================
000200* 「マルチスレッドプログラミング」
000300*     スレッド間でファイル・データを共用してオンラインショッピング
000400*   のアプリケーションを構築します。
000500*
000600*=================================================================
000700*
000800*  ファイル名： Confirm.cob
000900*  動作概要  ： オーダー確認表を作成・出力します
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
002200*
002300 01 succededUserID                pic X(32).
002400 01 pathName                      pic X(256).
002500 01 pathSize                      pic 9(05).
002600 01 HTMLFilename                  pic X(40).
002700 01 copyStartPos                  pic 9(05).
002800 01 counter                       pic 9(04).
002900 01 quantity                      pic 9(04).
003000 01 returnValue                   pic 9(09) comp-5.
003100 01 leftLength                    pic 9(05).
003200 01 数量                          pic 9(10).
003300 01 順序                          pic 9(02).
003400 01 総額                          pic 9(10).
003500 01 総量                          pic 9(10).
003600 01 金額                          pic 9(10).
003700 01 編集金額                      pic Z(9)9.
003800 01 編集総額                      pic Z(9)9.
003900 01 編集総量                      pic Z(9)9.
004000 01 編集数量                      pic Z(9)9.
004100*
004200 01 ProductNumberLabel.
004300    02 filler                     pic X(13) value "ProductNumber".
004400    02 ProductNumberLabelNumber   pic 9(02).
004500 01 numLabel.
004600    02 filler                     pic X(03) value "num".
004700    02 numLabelNumber             pic 9(02).
004800*----------------------------------------------------------------*
004900* SAFアプリへの移行について                                      *
005000*                                                                *
005100*    SAFアプリに移行する際は、連絡節と手続き部を修正する必要が   *
005200*  あります。インタフェース領域をSAFサブルーチンで使用するため、 *
005300*  SAFサブルーチンとのインタフェースであるCOBW3にそのアドレス    *
005400*  を設定する必要があります。                                    *
005500*                                                                *
005600*  [補足]                                                        *
005700*    SAFアプリの場合は、NSAPI開始から終了までのコメントを外し、  *
005800*  ISAPI開始から終了までをコメント化してください。               *
005900*                                                                *
006000*----------------------------------------------------------------*
006100*
006200*---------------------   ＩＳＡＰＩ 開始  -----------------------*
006300 linkage section.
006400     copy IsapiCtx.
006500*
006600 procedure division with stdcall linkage using ISAPI-CTX-CNT.
006700*
006800 Auth-Start.
006900*
007000*  ＩＳＡＰＩサブルーチンパラメタ域の初期化
007100     move low-value to COBW3.
007200     move function addr(ISAPI-CTX-CNT) to COBW3-CONTEXT.
007300*---------------------   ＩＳＡＰＩ 終了  -----------------------*
007400*
007500*---------------------   ＮＳＡＰＩ 開始  -----------------------*
007600*linkage section.
007700*01 safpt                         pointer.
007800**
007900* procedure division using safpt.
008000**
008100*Auth-Start.
008200**
008300**  ＮＳＡＰＩサブルーチンパラメタ域の初期化
008400*    move low-value to COBW3.
008500*    move safpt     to COBW3-CONTEXT.
008600*---------------------   ＮＳＡＰＩ 終了  -----------------------*
008700*
008800*=================================================================
008900*  ＩＳＡＰＩサブルーチン作業環境を初期化し、Ｗｅｂパラメタを
009000*  獲得する
009100*=================================================================
009200     call "COBW3_INIT" using COBW3.
009300*
009400*=================================================================
009500*  １つのページを複数回に分けて出力するので、物理パスを取得して
009600*  おく。なお、結果出力用ページは、アプリを起動した呼出し用ページ
009700*  と同じフォルダにあるものと見なす。
009800*=================================================================
009900     move space to pathName.
010000     set COBW3-PHYSICALPATH to true.
010100     call "COBW3_GET_REQUEST_INFO" using COBW3.
010200     if COBW3-STATUS = zero then
010300       move COBW3-REQUEST-INFO to pathName
010400       move COBW3-REQUEST-INFO-LENGTH to pathSize
010500     end-if.
010600*
010700*  ユーザIDの取得
010800*=================================================================
010900*  Ｃｏｏｋｉｅによって、認証処理からUser-IDを引き継ぐ
011000*=================================================================
011100     move "Online Store User-ID" to COBW3-COOKIE-NAME.
011200     call "COBW3_GET_COOKIE_XX" using COBW3.
011300     if COBW3-SEARCH-FLAG-NON then
011400         move "IlligalAccess.html" to HTMLFilename
011500         go to 終了位置
011600     end-if.
011700*=================================================================
011800*  次の処理用にUser-IDをＣｏｏｋｉｅに出力する
011900*=================================================================
012000     call "COBW3_SET_COOKIE_XX" using COBW3.
012100     if program-status not = zero then
012200         move "SystemError.html" to HTMLFilename
012300         go to 終了位置
012400     end-if.
012500*=================================================================
012600*  Ｗｅｂパラメタを検索し、オーダー数量が０でないものの製品番号
012700*  とオーダー数量を取得する
012800*=================================================================
012900     move zero to quantity.
013000     perform test before
013100             varying counter
013200             from 1 by 1 until counter > 20
013300*
013400       *> numXX(XX=1～20)をキーにオーダー数量を検索する
013500       move counter to numLabelNumber
013600       move numLabel to COBW3-SEARCH-DATA
013700       call "COBW3_GET_VALUE_XX" using COBW3
013800       if program-status not = zero then
013900         move  "SystemError.html" to HTMLFilename
014000         go to 終了位置
014100       end-if
014200*
014300       *> オーダー数量が０でないなら、製品番号を得る
014400       if COBW3-SEARCH-FLAG-EXIST then
014500         compute 数量 = function NUMVAL(COBW3-GET-DATA)
014600         if 数量 not = zero then
014700           move counter to ProductNumberLabelNumber
014800           move ProductNumberLabel to COBW3-SEARCH-DATA
014900           call "COBW3_GET_VALUE_XX" using COBW3
015000           if program-status not = zero then
015100             move "SystemError.html" to HTMLFilename
015200             go to 終了位置
015300           end-if
015400*
015500           *> 製品番号を在庫・オーダー・製品情報に退避する
015600           if COBW3-SEARCH-FLAG-EXIST then
015700             add 1 to  quantity
015800             move COBW3-GET-DATA to stockProductNumber(quantity)
015900                                    orderProductNumber(quantity)
016000                                    productNumber(quantity)
016100             move 数量 to orderProductQuantity(quantity)
016200           end-if
016300         end-if
016400       else            *> Ｗｅｂパラメタに該当する名前がないなら、
016500         exit perform  *> データの終わりに達したのでループを脱出
016600       end-if
016700     end-perform.
016800*
016900     *> オーダー品数を在庫・オーダー・製品情報に退避する
017000     move quantity to stockQuantity
017100                      orderQuantity
017200                      productQuantity.
017300*
017400*=================================================================
017500*  製品番号をキーにオーダーされた製品の在庫を問い合わせる
017600*=================================================================
017700     call "在庫問合わせ" using stockInfo
017800                         returning returnValue.
017900*
018000*=================================================================
018100*  在庫問い合わせに成功したら、在庫量の確認を行う。
018200*=================================================================
018300     if returnValue = 0 then
018400       perform test before
018500          varying counter from 1 by 1
018600                  until counter > orderQuantity
018700         if stockProductQuantity(counter) <
018800            orderProductQuantity(counter) then
018900           move "ShortageStock.html" to HTMLFilename
019000           go to 終了位置
019100         end-if
019200       end-perform
019300     else
019400       move "SystemError.hmtl" to HTMLFilename
019500       go to 終了位置
019600     end-if
019700*
019800*=================================================================
019900*  製品番号をキーにオーダーされた製品データを問い合わせる
020000*=================================================================
020100     call "製品データ取得" using productInfo
020200                           returning returnValue.
020300     if returnValue not = zero then
020400       move "SystemError.html" to HTMLFilename
020500       go to 終了位置
020600     end-if.
020700*
020800*=================================================================
020900*  オーダー表の作成
021000*=================================================================
021100*
021200     *> オーダー表のヘッダ部を出力する
021300     move "ConfirmHead.html" to HTMLFilename.
021400     perform 画面出力処理.
021500*
021600     *> オーダー表のボディ部を１行ずつ作成・出力する
021700     move zero to 総額 総量.
021800     perform varying counter
021900           from 1 by 1 until counter > orderQuantity
022000       if orderProductNumber(counter) not = stockProductNumber(counter) or
022100          orderProductNumber(counter) not = productNumber(counter)      then
022200         move "IlligalSystem.html" to HTMLFilename
022300         go to 終了位置
022400       end-if
022500*
022600       *>  変換データのクリア
022700       call "COBW3_INIT_CNV" using COBW3
022800*
022900       *>  順序番号の登録
023000       move counter to 順序
023100       move "Sequence" to COBW3-CNV-NAME
023200       move 順序       to COBW3-CNV-VALUE
023300       perform 変換データ登録
023400*
023500       *>  製品番号の登録
023600       move "ProductNumber"             to COBW3-CNV-NAME
023700       move orderProductNumber(counter) to COBW3-CNV-VALUE
023800       perform 変換データ登録
023900*
024000       *>  製品名の登録
024100       move "ProductName"        to COBW3-CNV-NAME
024200       move productName(counter) to COBW3-CNV-VALUE
024300       perform 変換データ登録
024400*
024500       *>  製品モデル名の登録
024600       move "ProductModel"        to COBW3-CNV-NAME
024700       move productModel(counter) to COBW3-CNV-VALUE
024800       perform 変換データ登録
024900*
025000       *>  オーダー数量の登録
025100       move orderProductQuantity(counter) to 編集数量
025200       move "ProductQuantity" to COBW3-CNV-NAME
025300       move 編集数量          to COBW3-CNV-VALUE
025400       perform 変換データ登録
025500*
025600       *>  オーダー金額の登録
025700       compute 金額 = orderProductQuantity(counter) *
025800                      productPrice(counter) / 1000
025900       move 金額 to 編集金額
026000       move "ProductTotal" to COBW3-CNV-NAME
026100       move  編集金額      to COBW3-CNV-VALUE
026200       perform 変換データ登録
026300*
026400       *>  総額・総量の計算
026500       compute 総額 = 総額 + 金額
026600       compute 総量 = 総量 + orderProductQuantity(counter)
026700*
026800       *>  オーダー表ボディ部１行の出力
026900       move "ConfirmDetailParts.html" to HTMLFilename
027000       perform 画面出力処理
027100     end-perform.
027200*
027300*  総量の登録
027400     move 総量              to 編集総量
027500     move "SummaryQuantity" to COBW3-CNV-NAME.
027600     move 編集総量          to COBW3-CNV-VALUE.
027700     perform 変換データ登録.
027800*
027900*  総額の登録
028000     move 総額           to 編集総額
028100     move "SummaryTotal" to COBW3-CNV-NAME.
028200     move 編集総額       to COBW3-CNV-VALUE.
028300     perform 変換データ登録.
028400*
028500     *>  オーダー表テールの出力（実際の出力は終了処理で）
028600     move "ConfirmTail.html" to HTMLFilename.
028700*
028800*=================================================================
028900*  エラーページまたはオーダー表のテールを出力し、ＩＳＡＰＩサブ
029000*  ルーチン作業領域を開放して、プログラムを終了する。
029100*=================================================================
029200 終了位置.
029300     perform 画面出力処理.
029400*  ＩＳＡＰＩサブルーチン作業領域の解放
029500     call "COBW3_FREE" using COBW3.
029600*
029700 Confirm-End.
029800*
029900     move 1 to program-status.
030000     exit program.
030100*
030200*=================================================================
030300*
030400*  内部処理の定義
030500*
030600*=================================================================
030700*
030800*=================================================================
030900*  変換データ登録処理
031000*=================================================================
031100 変換データ登録 section.
031200     call "COBW3_SET_CNV_XX" using COBW3.
031300     if program-status not = zero then
031400         move "SystemError.html" to HTMLFilename
031500         go to 終了位置
031600     end-if.
031700 変換データ登録終了.
031800     exit.
031900*=================================================================
032000*  画面出力処理
032100*    結果出力用ページは、アプリケーションを起動した呼出し用ページ
032200*    と同じフォルダにあるものと見なす。
032300*=================================================================
032400 画面出力処理 section.
032500     *>  フルパスファイル名の完成
032600     move space to COBW3-HTML-FILENAME.
032700     string pathName(1:pathSize) "\" delimited by size
032800            HTMLFilename             delimited by space
032900        into COBW3-HTML-FILENAME
033000     *>  HTML文書の出力
033100     call "COBW3_PUT_HTML" using COBW3.
033200*
033300 画面出力処理終了.
033400     exit.
