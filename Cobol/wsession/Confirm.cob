000010*=================================================================
000020* 「セション管理機能を使用したWebアプリケーション」
000030*     セション管理機能を使用して、特定のクライアントから複数回の
000040*   リクエストにまたがった業務を行うアプリケーションを構築します。
000050*
000060*=================================================================
000070*
000080*  ファイル名： CONFIRM.COB
000090*  動作概要  ： 確認表を作成・出力します
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
000230 01 セションＯＢＪ                OBJECT REFERENCE.
000240 01 HTMLFILENAME                  PIC X(40).
000250 01 PATHSIZE                      PIC 9(05).
000260 01 PATHLAST                      PIC 9(05).
000270 01 RETURNVALUE                   PIC 9(09) COMP-5.
000280 01 金額                          PIC 9(16).
000290 01 残高                          PIC 9(16).
000300 01 DSP-MONEY                     PIC \\,\\\,\\\,\\\,\\\,\\9.
000310*----------------------------------------------------------------*
000320* SAFアプリへの移行について                                      *
000330*                                                                *
000340*    SAFアプリに移行する際は、連絡節と手続き部を修正する必要が   *
000350*  あります。インタフェース領域をSAFサブルーチンで使用するため、 *
000360*  SAFサブルーチンとのインタフェースであるCOBW3にそのアドレス    *
000370*  を設定する必要があります。                                    *
000380*                                                                *
000390*  [補足]                                                        *
000400*    SAFアプリの場合は、NSAPI開始から終了までのコメントを外し、  *
000410*  ISAPI開始から終了までをコメント化してください。               *
000420*                                                                *
000430*----------------------------------------------------------------*
000440*
000450*---------------------   ＩＳＡＰＩ 開始  -----------------------*
000460 LINKAGE SECTION.
000470     COPY ISAPICTX.
000480*
000490 PROCEDURE DIVISION WITH STDCALL LINKAGE USING ISAPI-CTX-CNT.
000500*
000510 CONFIRM-START.
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
000640*CONFIRM-START.
000650**
000660**  ＮＳＡＰＩサブルーチンパラメタ域の初期化
000670*    MOVE LOW-VALUE TO COBW3.
000680*    MOVE SAFPT     TO COBW3-CONTEXT.
000690*---------------------   ＮＳＡＰＩ 終了  -----------------------*
000700*
000710*=================================================================
000720*  ＷＥＢサブルーチン作業環境を初期化し、ＷＥＢパラメタを獲得する
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
000970*=================================================================
000980*  確認表を作成する。
000990*=================================================================
001000     *> 入力された金額を取得する
001010     MOVE "MONEY"  TO COBW3-SEARCH-DATA.
001020     CALL "COBW3_GET_VALUE_XX" USING COBW3.
001030     COMPUTE 金額 = FUNCTION NUMVAL(COBW3-GET-DATA).
001040*
001050     *> 入力された処理を取得する
001060     MOVE "PROC"  TO COBW3-SEARCH-DATA.
001070     CALL "COBW3_GET_VALUE_XX" USING COBW3.
001080*
001090     IF COBW3-GET-DATA = "DEPOSIT" THEN
001100       *> 預入の場合
001110       INVOKE セションＯＢＪ "預入" USING 金額 残高 RETURNING RETURNVALUE
001120       IF RETURNVALUE NOT = 0 THEN
001130         PERFORM 入力エラー処理
001140         GO TO 終了位置
001150       END-IF
001160       MOVE "預入金額:" TO COBW3-CNV-VALUE
001170     ELSE
001180       *> 払戻の場合
001190       INVOKE セションＯＢＪ "払戻" USING 金額 残高 RETURNING RETURNVALUE
001200       IF RETURNVALUE NOT = 0 THEN
001210         PERFORM 入力エラー処理
001220         GO TO 終了位置
001230       END-IF
001240       MOVE "払戻金額:" TO COBW3-CNV-VALUE
001250     END-IF.
001260*
001270     *> 確認表のデータ登録
001280     MOVE "PROCMONEY-NAME" TO COBW3-CNV-NAME
001290     PERFORM 変換データ登録.
001300     MOVE "MONEY" TO COBW3-CNV-NAME.
001310     MOVE 金額 TO DSP-MONEY.
001320     MOVE DSP-MONEY TO COBW3-CNV-VALUE.
001330     PERFORM 変換データ登録.
001340     MOVE "BALANCE" TO COBW3-CNV-NAME.
001350     MOVE 残高 TO DSP-MONEY.
001360     MOVE DSP-MONEY TO COBW3-CNV-VALUE.
001370     PERFORM 変換データ登録.
001380*
001390     MOVE "Confirm.html" TO HTMLFILENAME.
001400     PERFORM 画面出力処理.
001410*
001420*=================================================================
001430*  エラーページまたは確認表を出力し、ＷＥＢサブルーチン
001440*  作業領域を開放して、プログラムを終了する。
001450*=================================================================
001460 終了位置.
001470*
001480     *> オブジェクト参照項目にNULLを設定する
001490     SET セションＯＢＪ TO NULL.
001500*
001510     *> ＷＥＢサブルーチン作業領域の解放
001520     CALL "COBW3_FREE" USING COBW3.
001530*
001540 CONFIRM-END.
001550*
001560     MOVE 1 TO PROGRAM-STATUS.
001570     EXIT PROGRAM.
001580*
001590*=================================================================
001600*
001610*  内部処理の定義
001620*
001630*=================================================================
001640*
001650*=================================================================
001660*  変換データ登録処理
001670*=================================================================
001680 変換データ登録 SECTION.
001690     CALL "COBW3_SET_CNV_XX" USING COBW3.
001700     IF COBW3-STATUS NOT = ZERO THEN
001710         MOVE "SystemError.html" TO HTMLFILENAME
001720         PERFORM 画面出力処理
001730         GO TO 終了位置
001740     END-IF.
001750 変換データ登録終了.
001760     EXIT.
001770*
001780*=================================================================
001790*  画面出力処理
001800*    結果出力用ページは、アプリケーションを起動した呼出し用ページ
001810*    と同じフォルダにあるものと見なす。
001820*=================================================================
001830 画面出力処理 SECTION.
001840     MOVE SPACE TO COBW3-HTML-FILENAME.
001850     *>  物理パスの取得
001860     SET COBW3-PHYSICALPATH TO TRUE.
001870     CALL "COBW3_GET_REQUEST_INFO" USING COBW3.
001880     IF COBW3-STATUS = ZERO THEN
001890         MOVE COBW3-REQUEST-INFO-LENGTH TO PATHSIZE
001900         MOVE COBW3-REQUEST-INFO(1:PATHSIZE) TO COBW3-HTML-FILENAME
001910     END-IF.
001920     *>  フルパスファイル名の完成
001930     ADD 1 TO PATHSIZE.
001940     MOVE "\" TO COBW3-HTML-FILENAME(PATHSIZE:1).
001950     MOVE 256 TO PATHLAST.
001960     SUBTRACT PATHSIZE FROM PATHLAST.
001970     ADD 1 TO PATHSIZE.
001980     MOVE HTMLFILENAME TO COBW3-HTML-FILENAME(PATHSIZE:PATHLAST).
001990     *> HTML文書の出力
002000     CALL "COBW3_PUT_HTML" USING COBW3.
002010*
002020 画面出力処理終了.
002030     EXIT.
002040*
002050*=================================================================
002060*  入力エラー処理
002070*=================================================================
002080 入力エラー処理 SECTION.
002090     INVOKE セションＯＢＪ "終了処理".
002100     CALL "COBW3_END_SESSION" USING COBW3.
002110     MOVE "InputError.html" TO HTMLFILENAME.
002120     PERFORM 画面出力処理.
002130 入力エラー処理終了.
002140     EXIT.
