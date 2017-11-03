000010*=================================================================
000020* 「セション管理機能を使用したWebアプリケーション」
000030*     セション管理機能を使用して、特定のクライアントから複数回の
000040*   リクエストにまたがった業務を行うアプリケーションを構築します。
000050*
000060*=================================================================
000070*
000080*  ファイル名： ENTRY.COB
000090*  動作概要  ： ファイルにデータを書き出し、セションを終了します。
000100*
000110* Copyright 2000-2015 FUJITSU LIMITED
000120*=================================================================
000130 IDENTIFICATION DIVISION.
000140 PROGRAM-ID. "HttpExtensionProc".
000150 ENVIRONMENT DIVISION.
000160  CONFIGURATION SECTION.
000170   REPOSITORY.
000180     CLASS セションオブジェクト.
000190 DATA DIVISION.
000200 WORKING-STORAGE SECTION.
000210     COPY COBW3.
000220*
000230     COPY GETDATA.
000240 01 セションＯＢＪ                OBJECT REFERENCE.
000250 01 HTMLFILENAME                  PIC X(40).
000260 01 PATHSIZE                      PIC 9(05).
000270 01 PATHLAST                      PIC 9(05).
000280 01 RETURNVALUE                   PIC 9(09) COMP-5.
000290*----------------------------------------------------------------*
000300* SAFアプリへの移行について                                      *
000310*                                                                *
000320*    SAFアプリに移行する際は、連絡節と手続き部を修正する必要が   *
000330*  あります。インタフェース領域をSAFサブルーチンで使用するため、 *
000340*  SAFサブルーチンとのインタフェースであるCOBW3にそのアドレス    *
000350*  を設定する必要があります。                                    *
000360*                                                                *
000370*  [補足]                                                        *
000380*    SAFアプリの場合は、NSAPI開始から終了までのコメントを外し、  *
000390*  ISAPI開始から終了までをコメント化してください。               *
000400*    SAFアプリのリンク～実行の詳細については、                   *
000410*    "NetCOBOL Webサブルーチン 使用手引書" を参照してください。  *
000420*                                                                *
000430*----------------------------------------------------------------*
000440*
000450*---------------------   ＩＳＡＰＩ 開始  -----------------------*
000460 LINKAGE SECTION.
000470     COPY ISAPICTX.
000480*
000490 PROCEDURE DIVISION WITH STDCALL LINKAGE USING ISAPI-CTX-CNT.
000500*
000510 ENTRY-START.
000520*
000530*  ＩＳＡＰＩサブルーチンパラメタ域の初期化
000540     MOVE LOW-VALUE TO COBW3.
000550     MOVE FUNCTION ADDR(ISAPI-CTX-CNT) TO COBW3-CONTEXT.
000560*---------------------   ＩＳＡＰＩ 終了  -----------------------*
000570*
000580*---------------------   ＮＳＡＰＩ 開始  -----------------------*
000590*LINKAGE SECTION.
000600*01 SAFPT                         POINTER.
000610**
000620* PROCEDURE DIVISION USING SAFPT.
000630**
000640*ENTRY-START.
000650**
000660**  ＮＳＡＰＩサブルーチンパラメタ域の初期化
000670*    MOVE LOW-VALUE TO COBW3.
000680*    MOVE SAFPT     TO COBW3-CONTEXT.
000690*---------------------   ＮＳＡＰＩ 終了  -----------------------*
000700*
000710*=================================================================
000720*  ＷＥＢサブルーチン作業環境の設定し、ＷＥＢパラメタを獲得する
000730*=================================================================
000740     CALL "COBW3_INIT" USING COBW3.
000750*
000760*=================================================================
000770*  現行のセション情報を取得し、セション中か判定する。
000780*=================================================================
000790     CALL "COBW3_GET_SESSION_INFO" USING COBW3.
000800     IF COBW3-SESSION-STATUS-NON THEN
000810         MOVE "IlligalAccess.html" TO HTMLFILENAME
000820         PERFORM 画面出力処理
000830         GO TO 終了位置
000840     END-IF.
000850*
000860*=================================================================
000870*  セションデータを取得する。
000880*=================================================================
000890     CALL "COBW3_GET_SESSION_DATA" USING COBW3 セションＯＢＪ.
000900     IF COBW3-STATUS NOT = ZERO THEN
000910         CALL "COBW3_END_SESSION" USING COBW3
000920         MOVE "SystemError.html" TO HTMLFILENAME
000930         PERFORM 画面出力処理
000940         GO TO 終了位置
000950     END-IF.
000960*
000970     *> セションで引き継いだデータを取得する
000980     INVOKE セションＯＢＪ "セションデータ取得" USING GETDATA.
000990*
001000     *> ＷＥＢパラメタから処理を取得する
001010     MOVE "PROC"  TO COBW3-SEARCH-DATA.
001020     CALL "COBW3_GET_VALUE_XX" USING COBW3.
001030*
001040     IF COBW3-GET-DATA = "CONFIRM" THEN
001050       *> 確認の場合ファイルを更新する
001060       INVOKE セションＯＢＪ "更新" RETURNING RETURNVALUE
001070       *> 変換データの登録
001080       MOVE "TRADE" TO COBW3-CNV-NAME
001090       IF G-DEPOSIT THEN
001100         MOVE NC"預入" TO COBW3-CNV-VALUE-N
001110       ELSE
001120         MOVE NC"払戻" TO COBW3-CNV-VALUE-N
001130       END-IF
001140       PERFORM 変換データ登録Ｎ
001150       MOVE "MONEY" TO COBW3-CNV-NAME
001160       MOVE G-MONEY TO COBW3-CNV-VALUE
001170       PERFORM 変換データ登録
001180       MOVE "BALANCE" TO COBW3-CNV-NAME
001190       MOVE G-NEWBALANCE TO COBW3-CNV-VALUE
001200       PERFORM 変換データ登録
001210
001220     ELSE
001230       *> 取消の場合変換データを登録する
001240       MOVE "TRADE" TO COBW3-CNV-NAME
001250       MOVE "****" TO COBW3-CNV-VALUE
001260       PERFORM 変換データ登録
001270       MOVE "MONEY" TO COBW3-CNV-NAME
001280       MOVE "****************" TO COBW3-CNV-VALUE
001290       PERFORM 変換データ登録
001300       MOVE "BALANCE" TO COBW3-CNV-NAME
001310       MOVE G-OLDBALANCE TO COBW3-CNV-VALUE
001320       PERFORM 変換データ登録
001330     END-IF.
001340*
001350     MOVE "ID" TO COBW3-CNV-NAME.
001360     MOVE G-USERID TO COBW3-CNV-VALUE.
001370     PERFORM 変換データ登録.
001380*
001390*=================================================================
001400*  セション終了。
001410*=================================================================
001420     *> セションデータの終了処理を行う
001430     INVOKE セションＯＢＪ "終了処理".
001440
001450     *> セションを終了する
001460     CALL "COBW3_END_SESSION" USING COBW3.
001470*
001480     MOVE "End.html" TO HTMLFILENAME.
001490     PERFORM 画面出力処理.
001500*
001510 終了位置.
001520*
001530     *> オブジェクト参照項目にNULLを設定する
001540     SET セションＯＢＪ TO NULL.
001550*
001560     *> ＷＥＢサブルーチン作業領域の解放
001570     CALL "COBW3_FREE" USING COBW3.
001580*
001590 ENTRY-END.
001600*
001610     MOVE 1 TO PROGRAM-STATUS.
001620     EXIT PROGRAM.
001630*
001640*=================================================================
001650*
001660*  内部処理の定義
001670*
001680*=================================================================
001690*
001700*=================================================================
001710*  変換データ登録処理
001720*=================================================================
001730 変換データ登録 SECTION.
001740     CALL "COBW3_SET_CNV_XX" USING COBW3.
001750     IF COBW3-STATUS NOT = ZERO THEN
001760         MOVE "SystemError.html" TO HTMLFILENAME
001770         PERFORM 画面出力処理
001780         GO TO 終了位置
001790     END-IF.
001800 変換データ登録終了.
001810     EXIT.
001820*
001830*=================================================================
001840*  変換データ登録処理(VALUEが日本語)
001850*=================================================================
001860 変換データ登録Ｎ SECTION.
001870     CALL "COBW3_SET_CNV_XN" USING COBW3.
001880     IF COBW3-STATUS NOT = ZERO THEN
001890         MOVE "SystemError.html" TO HTMLFILENAME
001900         PERFORM 画面出力処理
001910         GO TO 終了位置
001920     END-IF.
001930 変換データ登録Ｎ終了.
001940     EXIT.
001950*
001960*=================================================================
001970*  画面出力処理
001980*    結果出力用ページは、アプリケーションを起動した呼出し用ページ
001990*    と同じフォルダにあるものと見なす。
002000*=================================================================
002010 画面出力処理 SECTION.
002020     MOVE SPACE TO COBW3-HTML-FILENAME.
002030     *>  物理パスの取得
002040     SET COBW3-PHYSICALPATH TO TRUE.
002050     CALL "COBW3_GET_REQUEST_INFO" USING COBW3.
002060     IF COBW3-STATUS = ZERO THEN
002070         MOVE COBW3-REQUEST-INFO-LENGTH TO PATHSIZE
002080         MOVE COBW3-REQUEST-INFO(1:PATHSIZE) TO COBW3-HTML-FILENAME
002090     END-IF.
002100     *>  フルパスファイル名の完成
002110     ADD 1 TO PATHSIZE.
002120     MOVE "\" TO COBW3-HTML-FILENAME(PATHSIZE:1).
002130     MOVE 256 TO PATHLAST.
002140     SUBTRACT PATHSIZE FROM PATHLAST.
002150     ADD 1 TO PATHSIZE.
002160     MOVE HTMLFILENAME TO COBW3-HTML-FILENAME(PATHSIZE:PATHLAST).
002170     *> HTML文書の出力
002180     CALL "COBW3_PUT_HTML" USING COBW3.
002190*
002200 画面出力処理終了.
002210     EXIT.
