000100*=================================================================
000200* 「マルチスレッドプログラミング」
000300*     スレッド間でファイル・データを共用して認証処理を実現します
000400*
000500*=================================================================
000600*
000700*  ファイル名： Startup.cob
000800*  動作概要  ： 認証サービスの開始処理を行います
000900*
001000* Copyright 1999-2015 FUJITSU LIMITED
001100*=================================================================
001200 identification division.
001300 program-id. "HttpExtensionProc".
001400 environment division.
001500 data division.
001600 working-storage section.
001700     copy COBW3.
001800*
001900 01 returnValue                    pic 9(09) comp-5.
002000 01 HTMLFilename                   pic X(40).
002100 01 copyStartPos                   pic 9(05).
002200 01 leftLength                     pic 9(05).
002300 01 認証サービス起動情報 pic 9(1) is external.
002400*----------------------------------------------------------------*
002500* SAFアプリへの移行について                                      *
002600*                                                                *
002700*    SAFアプリに移行する際は、連絡節と手続き部を修正する必要が   *
002800*  あります。インタフェース領域をSAFサブルーチンで使用するため、 *
002900*  SAFサブルーチンとのインタフェースであるCOBW3にそのアドレス    *
003000*  を設定する必要があります。                                    *
003100*                                                                *
003200*  [補足]                                                        *
003300*    SAFアプリの場合は、NSAPI開始から終了までのコメントを外し、  *
003400*  ISAPI開始から終了までをコメント化してください。               *
003500*    SAFアプリのリンク～実行の詳細については"COBOL Webサブルー   *
003600*  チン使用手引書" を参照してください                            *
003700*                                                                *
003800*----------------------------------------------------------------*
003900*
004000*---------------------   ＩＳＡＰＩ 開始  -----------------------*
004100 linkage section.
004200     copy IsapiCtx.
004300*
004400 procedure division with stdcall linkage using ISAPI-CTX-CNT.
004500*
004600 Auth-Start.
004700*
004800*  ＩＳＡＰＩサブルーチンパラメタ域の初期化
004900     move low-value to COBW3.
005000     move function addr(ISAPI-CTX-CNT) to COBW3-CONTEXT.
005100*---------------------   ＩＳＡＰＩ 終了  -----------------------*
005200*
005300*---------------------   ＮＳＡＰＩ 開始  -----------------------*
005400*linkage section.
005500*01 safpt                         pointer.
005600**
005700* procedure division using safpt.
005800**
005900*Auth-Start.
006000**
006100**  ＮＳＡＰＩサブルーチンパラメタ域の初期化
006200*    move low-value to COBW3.
006300*    move safpt     to COBW3-CONTEXT.
006400*---------------------   ＮＳＡＰＩ 終了  -----------------------*
006500*
006600*=================================================================
006700*  Ｗｅｂサブルーチン作業環境の設定し、Ｗｅｂパラメタを獲得する
006800*=================================================================
006900     call "COBW3_INIT" using COBW3.
007000*=================================================================
007100*  認証サービスの起動
007200*=================================================================
007300     call "認証サービス起動"
007400          returning returnValue
007500*=================================================================
007600*  結果出力用ページの選択
007700*=================================================================
007800     evaluate returnValue
007900       when   zero
008000         move "Startup.html" to HTMLFilename
008100       when   1
008200         move "SysError.html" to HTMLFilename
008300       when   2
008400         move "Opened.html" to HTMLFilename
008500     end-evaluate.
008600*=================================================================
008700* 画面出力処理
008800*   アプリケーションが配置されている物理パスの取得して、出力する
008900*  HTML文書名を完成させる
009000*=================================================================
009100     set COBW3-PHYSICALPATH to true.
009200     call "COBW3_GET_REQUEST_INFO" using COBW3.
009300     if COBW3-STATUS = zero then
009400       move COBW3-REQUEST-INFO(1:COBW3-REQUEST-INFO-LENGTH)
009500            to COBW3-HTML-FILENAME
009600       compute copyStartPos = COBW3-REQUEST-INFO-LENGTH + 1
009700       move "\" to COBW3-HTML-FILENAME(copyStartPos:1)
009800       compute copyStartPos = copyStartPos + 1
009900       compute leftLength = 256 - copyStartPos + 1
010000       move HTMLFilename to COBW3-HTML-FILENAME(copyStartPos:leftLength)
010100     end-if.
010200*  HTML文書の出力
010300     call "COBW3_PUT_HTML" using COBW3.
010400*=================================================================
010500*  Ｗｅｂサブルーチン作業領域の解放
010600*=================================================================
010700     call "COBW3_FREE" using COBW3.
010800*
010900 StartOnline-End.
011000*
011100     move 1 to program-status.
011200     exit program.
