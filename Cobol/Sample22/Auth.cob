000100*=================================================================
000200* 「マルチスレッドプログラミング」
000300*     スレッド間でファイル・データを共用してオンラインショッピング
000400*   のアプリケーションを構築します。
000500*
000600*=================================================================
000700*
000800*  ファイル名： Auth.cob
000900*  動作概要  ： 認証処理を行います
001000*
001100* Copyright 1999-2015 FUJITSU LIMITED
001200*=================================================================
001300 identification division.
001400 program-id. "HttpExtensionProc".
001500 environment division.
001600 data division.
001700 working-storage section.
001800     copy COBW3.
001900     copy User-Info.
002000*
002100 01 authDataFlag                  pic 9(01).
002200 01 inputedPassword               pic X(32).
002300 01 returnValue                   pic 9(09) comp-5.
002400 01 HTMLFilename                  pic X(40).
002500 01 copyStartPos                  pic 9(05).
002600 01 leftLength                    pic 9(05).
002700*----------------------------------------------------------------*
002800* SAFアプリへの移行について                                      *
002900*                                                                *
003000*    SAFアプリに移行する際は、連絡節と手続き部を修正する必要が   *
003100*  あります。インタフェース領域をSAFサブルーチンで使用するため、 *
003200*  SAFサブルーチンとのインタフェースであるCOBW3にそのアドレス    *
003300*  を設定する必要があります。                                    *
003400*                                                                *
003500*  [補足]                                                        *
003600*    SAFアプリの場合は、NSAPI開始から終了までのコメントを外し、  *
003700*  ISAPI開始から終了までをコメント化してください。               *
003800*    SAFアプリのリンク～実行の詳細については"COBOL Webサブルー   *
003900*  チン使用手引書" を参照してください                            *
004000*                                                                *
004100*----------------------------------------------------------------*
004200*
004300*---------------------   ＩＳＡＰＩ 開始  -----------------------*
004400 linkage section.
004500     copy IsapiCtx.
004600*
004700 procedure division with stdcall linkage using ISAPI-CTX-CNT.
004800*
004900 Auth-Start.
005000*
005100*  ＩＳＡＰＩサブルーチンパラメタ域の初期化
005200     move low-value to COBW3.
005300     move function addr(ISAPI-CTX-CNT) to COBW3-CONTEXT.
005400*---------------------   ＩＳＡＰＩ 終了  -----------------------*
005500*
005600*---------------------   ＮＳＡＰＩ 開始  -----------------------*
005700*linkage section.
005800*01 safpt                         pointer.
005900**
006000* procedure division using safpt.
006100**
006200*Auth-Start.
006300**
006400**  ＮＳＡＰＩサブルーチンパラメタ域の初期化
006500*    move low-value to COBW3.
006600*    move safpt     to COBW3-CONTEXT.
006700*---------------------   ＮＳＡＰＩ 終了  -----------------------*
006800*
006900*=================================================================
007000*  Ｗｅｂサブルーチン作業環境の設定し、Ｗｅｂパラメタを獲得する
007100*=================================================================
007200     call "COBW3_INIT" using COBW3.
007300*=================================================================
007400*  ＷｅｂパラメタからユーザIDを取得する
007500*=================================================================
007600     move "ユーザID" to COBW3-SEARCH-DATA.
007700     call "COBW3_GET_VALUE_XX" using COBW3.
007800     if COBW3-SEARCH-FLAG-EXIST then
007900       move 1 to authDataFlag
008000       move COBW3-GET-DATA to userID
008100     else
008200       move zero to authDataFlag
008300     end-if.
008400*=================================================================
008500*  Ｗｅｂパラメタからパスワードを取得し、ユーザIDとの組合せを
008600*  チェックする。
008700*=================================================================
008800     move NC"パスワード" to COBW3-SEARCH-DATA-N.
008900     call "COBW3_GET_VALUE_NX" using COBW3.
009000     if COBW3-SEARCH-FLAG-EXIST then
009100       move 1 to authDataFlag
009200       move COBW3-GET-DATA to userPassword
009300       call "顧客情報取得" using userInfo
009400                           returning returnValue
009500     else
009600       move zero to authDataFlag
009700     end-if.
009800*
009900*=================================================================
010000*  結果出力用ページの選択します。認証成功時はＣｏｏｋｉｅに
010100*  userIDを出力します。
010200*=================================================================
010300     evaluate authDataFlag also returnValue
010400       when   not zero     also zero
010500         move "Online Store User-ID" to COBW3-COOKIE-NAME
010600         move userID                 to COBW3-COOKIE-VALUE
010700         call "COBW3_SET_COOKIE" using COBW3
010800         move "Catalog.html" to HTMLFilename
010900       when   any          also 2 thru 3
011000         move "AuthFail.html" to HTMLFilename
011100       when other
011200         move "SystemError.html" to HTMLFilename
011300     end-evaluate.
011400*=================================================================
011500* 画面出力処理
011600*   アプリケーションが配置されている物理パスの取得して、出力する
011700*  HTML文書名を完成させる
011800*=================================================================
011900     set COBW3-PHYSICALPATH to true.
012000     call "COBW3_GET_REQUEST_INFO" using COBW3.
012100     if COBW3-STATUS = zero then
012200       move space to COBW3-HTML-FILENAME
012300       string COBW3-REQUEST-INFO(1:COBW3-REQUEST-INFO-LENGTH)
012400              "\"                    delimited by size
012500              HTMLFilename           delimited by space
012600          into COBW3-HTML-FILENAME
012700     end-if.
012800*  HTML文書の出力
012900     call "COBW3_PUT_HTML" using COBW3.
013000*=================================================================
013100*  Ｗｅｂサブルーチン作業領域の解放
013200*=================================================================
013300     call "COBW3_FREE" using COBW3.
013400*
013500 Auth-End.
013600*
013700     move 1 to program-status.
013800     exit program.
013900*
014000 画面出力処理終了.
014100     exit.
