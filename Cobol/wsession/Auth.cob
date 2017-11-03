000010*=================================================================
000020* 「セション管理機能を使用したWebアプリケーション」
000030*     セション管理機能を使用して、特定のクライアントから複数回の
000040*   リクエストにまたがった業務を行うアプリケーションを構築します。
000050*
000060*=================================================================
000070*
000080*  ファイル名： AUTH.COB
000090*  動作概要  ： 認証処理を行い、セションを開始します
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
000220     COPY USER-INFO.
000230*
000240 01 セションＯＢＪ                OBJECT REFERENCE.
000250 01 AUTHDATAFLAG                  PIC 9(01).
000260 01 INPUTEDPASSWORD               PIC X(32).
000270 01 RETURNVALUE                   PIC 9(09) COMP-5.
000280 01 HTMLFILENAME                  PIC X(40).
000290 01 PATHSIZE                      PIC 9(05).
000300 01 PATHLAST                      PIC 9(05).
000310 01 DSP-MONEY                     PIC \\,\\\,\\\,\\\,\\\,\\9.
000320 01 残高                          PIC 9(16).
000330*----------------------------------------------------------------*
000340* SAFアプリへの移行について                                      *
000350*                                                                *
000360*    SAFアプリに移行する際は、連絡節と手続き部を修正する必要が   *
000370*  あります。インタフェース領域をSAFサブルーチンで使用するため、 *
000380*  SAFサブルーチンとのインタフェースであるCOBW3にそのアドレス    *
000390*  を設定する必要があります。                                    *
000400*                                                                *
000410*  [補足]                                                        *
000420*    SAFアプリの場合は、NSAPI開始から終了までのコメントを外し、  *
000430*  ISAPI開始から終了までをコメント化してください。               *
000440*    SAFアプリのリンク～実行の詳細については、                   *
000450*    "NetCOBOL Webサブルーチン 使用手引書" を参照してください。  *
000460*                                                                *
000470*----------------------------------------------------------------*
000480*
000490*---------------------   ＩＳＡＰＩ 開始  -----------------------*
000500 LINKAGE SECTION.
000510     COPY ISAPICTX.
000520*
000530 PROCEDURE DIVISION WITH STDCALL LINKAGE USING ISAPI-CTX-CNT.
000540*
000550 AUTH-START.
000560*
000570*  ＩＳＡＰＩサブルーチンパラメタ域の初期化
000580     MOVE LOW-VALUE TO COBW3.
000590     MOVE FUNCTION ADDR(ISAPI-CTX-CNT) TO COBW3-CONTEXT.
000600*---------------------   ＩＳＡＰＩ 終了  -----------------------*
000610*
000620*---------------------   ＮＳＡＰＩ 開始  -----------------------*
000630*LINKAGE SECTION.
000640*01 SAFPT                         POINTER.
000650**
000660* PROCEDURE DIVISION USING SAFPT.
000670**
000680*AUTH-START.
000690**
000700**  ＮＳＡＰＩサブルーチンパラメタ域の初期化
000710*    MOVE LOW-VALUE TO COBW3.
000720*    MOVE SAFPT     TO COBW3-CONTEXT.
000730*---------------------   ＮＳＡＰＩ 終了  -----------------------*
000740*
000750*=================================================================
000760*  ＷＥＢサブルーチン作業環境を初期化し、ＷＥＢパラメタを獲得する
000770*=================================================================
000780     CALL "COBW3_INIT" USING COBW3.
000790*=================================================================
000800*  ＷＥＢパラメタからユーザIDを取得する
000810*=================================================================
000820     MOVE "ユーザID" TO COBW3-SEARCH-DATA.
000830     CALL "COBW3_GET_VALUE_XX" USING COBW3.
000840     IF COBW3-SEARCH-FLAG-EXIST THEN
000850       MOVE 1 TO AUTHDATAFLAG
000860       MOVE COBW3-GET-DATA TO USERID
000870     ELSE
000880       MOVE ZERO TO AUTHDATAFLAG
000890     END-IF.
000900*=================================================================
000910*  ＷＥＢパラメタからパスワードを取得し、ユーザIDとの組合せを
000920*  チェックする。
000930*=================================================================
000940     MOVE NC"パスワード" TO COBW3-SEARCH-DATA-N.
000950     CALL "COBW3_GET_VALUE_NX" USING COBW3.
000960     IF COBW3-SEARCH-FLAG-EXIST THEN
000970       MOVE 1 TO AUTHDATAFLAG
000980       MOVE COBW3-GET-DATA TO USERPASSWORD
000990       CALL "顧客情報取得" USING USERINFO
001000                           RETURNING RETURNVALUE
001010     ELSE
001020       MOVE ZERO TO AUTHDATAFLAG
001030     END-IF.
001040*
001050*=================================================================
001060*  結果出力用ページの選択をする。処理を継続する場合、セションを
001070*  開始し、セションデータを登録する。
001080*=================================================================
001090     EVALUATE AUTHDATAFLAG ALSO RETURNVALUE
001100       *> ID/パスワードが正しい場合
001110       WHEN   NOT ZERO     ALSO ZERO
001120*
001130         *> セションを開始する。
001140         SET COBW3-SESSION-DATA-OBJECT TO TRUE
001150         MOVE 180 TO COBW3-SESSION-TIMEOUT
001160         CALL "COBW3_START_SESSION" USING COBW3
001170         IF COBW3-STATUS NOT = 0 THEN
001180           MOVE "SystemError.html" TO HTMLFILENAME
001190           PERFORM 画面出力処理
001200           GO TO 終了位置
001210         END-IF
001220*
001230         *> セションオブジェクト(データ)を生成する。
001240         INVOKE セションオブジェクト "NEW" RETURNING セションＯＢＪ
001250         IF セションＯＢＪ = NULL THEN
001260           CALL "COBW3_END_SESSION" USING COBW3
001270           MOVE "SystemError.html" TO HTMLFILENAME
001280           PERFORM 画面出力処理
001290           GO TO 終了位置
001300         END-IF
001310*
001320         *> セションデータの初期化を行う
001330         INVOKE セションＯＢＪ "初期化処理" USING USERID 残高 RETURNING RETURNVALUE
001340         IF RETURNVALUE NOT = 0 THEN
001350           CALL "COBW3_END_SESSION" USING COBW3
001360           IF RETURNVALUE = 3 THEN
001370               MOVE "UsedError.html" TO HTMLFILENAME
001380           ELSE
001390               MOVE "SystemError.html" TO HTMLFILENAME
001400           END-IF
001410           PERFORM 画面出力処理
001420           GO TO 終了位置
001430         END-IF
001440*
001450         *> セションデータを登録する
001460         CALL "COBW3_SET_SESSION_DATA" USING COBW3 セションＯＢＪ
001470         IF COBW3-STATUS NOT = 0 THEN
001480             INVOKE セションＯＢＪ "終了処理"
001490             CALL "COBW3_END_SESSION" USING COBW3
001500             MOVE "SystemError.html" TO HTMLFILENAME
001510         ELSE
001520             *> 結果出力用ページのデータ登録
001530             MOVE "BALANCE" TO COBW3-CNV-NAME
001540             MOVE 残高 TO DSP-MONEY
001550             MOVE DSP-MONEY TO COBW3-CNV-VALUE
001560             CALL "COBW3_SET_CNV_XX" USING COBW3
001570             MOVE "Trade.html" TO HTMLFILENAME
001580         END-IF
001590       *> ID/パスワードが正しくない場合
001600       WHEN   ANY          ALSO 2 THRU 3
001610         MOVE "AuthFail.html" TO HTMLFILENAME
001620       *> エラーの場合
001630       WHEN OTHER
001640         MOVE "SystemError.html" TO HTMLFILENAME
001650     END-EVALUATE.
001660     PERFORM 画面出力処理.
001670*=================================================================
001680*  ＷＥＢサブルーチン作業領域の解放
001690*=================================================================
001700 終了位置.
001710*
001720     *> オブジェクト参照項目にNULLを設定する
001730     SET セションＯＢＪ TO NULL.
001740*
001750     *> ＷＥＢサブルーチン作業領域の解放
001760     CALL "COBW3_FREE" USING COBW3.
001770*
001780 AUTH-END.
001790*
001800     MOVE 1 TO PROGRAM-STATUS.
001810     EXIT PROGRAM.
001820*
001830*=================================================================
001840*
001850*  内部処理の定義
001860*
001870*=================================================================
001880*
001890*=================================================================
001900* 画面出力処理
001910*    結果出力用ページは、アプリケーションを起動した呼出し用ページ
001920*    と同じフォルダにあるものと見なす。
001930*=================================================================
001940 画面出力処理 SECTION.
001950     MOVE SPACE TO COBW3-HTML-FILENAME.
001960     *>  物理パスの取得
001970     SET COBW3-PHYSICALPATH TO TRUE.
001980     CALL "COBW3_GET_REQUEST_INFO" USING COBW3.
001990     IF COBW3-STATUS = ZERO THEN
002000         MOVE COBW3-REQUEST-INFO-LENGTH TO PATHSIZE
002010         MOVE COBW3-REQUEST-INFO(1:PATHSIZE) TO COBW3-HTML-FILENAME
002020     END-IF.
002030     *>  フルパスファイル名の完成
002040     ADD 1 TO PATHSIZE.
002050     MOVE "\" TO COBW3-HTML-FILENAME(PATHSIZE:1).
002060     MOVE 256 TO PATHLAST.
002070     SUBTRACT PATHSIZE FROM PATHLAST.
002080     ADD 1 TO PATHSIZE.
002090     MOVE HTMLFILENAME TO COBW3-HTML-FILENAME(PATHSIZE:PATHLAST).
002100     *> HTML文書の出力
002110     CALL "COBW3_PUT_HTML" USING COBW3.
002120*
002130 画面出力処理終了.
002140     EXIT.
