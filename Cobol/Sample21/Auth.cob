000100*=================================================================
000200* 「マルチスレッドプログラミング」
000300*     スレッド間でファイル・データを共用して認証処理を実現します
000400*
000500*=================================================================
000600*
000700*  ファイル名： Auth.cob
000800*  動作概要  ： 簡単な認証処理を行います
000900*
001000* Copyright 1999-2015 FUJITSU LIMITED
001100*=================================================================
001200 identification division.
001300 program-id. "HttpExtensionProc".
001400 environment division.
001500 data division.
001600 working-storage section.
001700     copy COBW3.
001800     copy User-Info.
001900*
002000 01 authDataFlag                  pic 9(01).
002100 01 inputedPassword               pic X(32).
002200 01 returnValue                   pic 9(09) comp-5.
002300 01 HTMLFilename                  pic X(40).
002400 01 copyStartPos                  pic 9(05).
002500 01 leftLength                    pic 9(05).
002600*----------------------------------------------------------------*
002700* SAFアプリへの移行について                                      *
002800*                                                                *
002900*    SAFアプリに移行する際は、連絡節と手続き部を修正する必要が   *
003000*  あります。インタフェース領域をSAFサブルーチンで使用するため、 *
003100*  SAFサブルーチンとのインタフェースであるCOBW3にそのアドレス    *
003200*  を設定する必要があります。                                    *
003300*                                                                *
003400*  [補足]                                                        *
003500*    SAFアプリの場合は、NSAPI開始から終了までのコメントを外し、  *
003600*  ISAPI開始から終了までをコメント化してください。               *
003700*    SAFアプリのリンク～実行の詳細については"COBOL Webサブルー   *
003800*  チン使用手引書" を参照してください                            *
003900*                                                                *
004000*----------------------------------------------------------------*
004100*
004200*---------------------   ＩＳＡＰＩ 開始  -----------------------*
004300 linkage section.
004400     copy IsapiCtx.
004500*
004600 procedure division with stdcall linkage using ISAPI-CTX-CNT.
004700*
004800 Auth-Start.
004900*
005000*  ＩＳＡＰＩサブルーチンパラメタ域の初期化
005100     move low-value to COBW3.
005200     move function addr(ISAPI-CTX-CNT) to COBW3-CONTEXT.
005300*---------------------   ＩＳＡＰＩ 終了  -----------------------*
005400*
005500*---------------------   ＮＳＡＰＩ 開始  -----------------------*
005600*linkage section.
005700*01 safpt                         pointer.
005800**
005900* procedure division using safpt.
006000**
006100*Auth-Start.
006200**
006300**  ＮＳＡＰＩサブルーチンパラメタ域の初期化
006400*    move low-value to COBW3.
006500*    move safpt     to COBW3-CONTEXT.
006600*---------------------   ＮＳＡＰＩ 終了  -----------------------*
006700*
006800*=================================================================
006900*  Ｗｅｂサブルーチン作業環境の設定し、Ｗｅｂパラメタを獲得する
007000*=================================================================
007100     call "COBW3_INIT" using COBW3.
007200*=================================================================
007300*  ＷｅｂパラメタからユーザIDを取得する
007400*=================================================================
007500     move "ユーザID" to COBW3-SEARCH-DATA.
007600     call "COBW3_GET_VALUE_XX" using COBW3.
007700     if COBW3-SEARCH-FLAG-EXIST then
007800         move 1 to authDataFlag
007900         move COBW3-GET-DATA to userID
008000     else
008100         move zero to authDataFlag
008200     end-if.
008300*=================================================================
008400*  Ｗｅｂパラメタからパスワードを取得し、ユーザIDとの組合せを
008500*  チェックする。
008600*=================================================================
008700     move NC"パスワード" to COBW3-SEARCH-DATA-N.
008800     call "COBW3_GET_VALUE_NX" using COBW3.
008900     if COBW3-SEARCH-FLAG-EXIST then
009000         move 1 to authDataFlag
009100         move COBW3-GET-DATA to userPassword
009200         call "顧客情報取得" using userInfo
009300                             returning returnValue
009400     else
009500         move zero to authDataFlag
009600     end-if.
009700*
009800*=================================================================
009900*  結果出力用ページの選択
010000*=================================================================
010100     evaluate authDataFlag also returnValue
010200       when   not zero     also zero
010300         move "AuthSuccess.html" to HTMLFilename
010400       when   any          also 2 thru 3
010500         move "AuthFail.html" to HTMLFilename
010600       when other
010700         move "SystemError.html" to HTMLFilename
010800     end-evaluate.
010900*=================================================================
011000* 画面出力処理
011100*   アプリケーションが配置されている物理パスの取得して、出力する
011200*  HTML文書名を完成させる
011300*=================================================================
011400     set COBW3-PHYSICALPATH to true.
011500     call "COBW3_GET_REQUEST_INFO" using COBW3.
011600     if COBW3-STATUS = zero then
011700       move space to COBW3-HTML-FILENAME
011800       string COBW3-REQUEST-INFO(1:COBW3-REQUEST-INFO-LENGTH)
011900              "\"                    delimited by size
012000              HTMLFilename           delimited by space
012100          into COBW3-HTML-FILENAME
012200     end-if.
012300*  HTML文書の出力
012400     call "COBW3_PUT_HTML" using COBW3.
012500*=================================================================
012600*  Ｗｅｂサブルーチン作業領域の解放
012700*=================================================================
012800     call "COBW3_FREE" using COBW3.
012900*
013000 Auth-End.
013100*
013200     move 1 to program-status.
013300     exit program.
013400*
013500 画面出力処理終了.
013600     exit.
