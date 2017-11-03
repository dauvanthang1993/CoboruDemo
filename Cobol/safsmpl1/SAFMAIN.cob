000010*----------------------------------------------------------------*
000020* Copyright 2000-2015 FUJITSU LIMITED                            *
000030*                                                                *
000040*  ファイル名： SAFMAIN.COB                                      *
000050*  概要：       SAFサブルーチンの例題                            *
000060*----------------------------------------------------------------*
000070 IDENTIFICATION DIVISION.
000080 PROGRAM-ID. SAF-MAIN.
000090 ENVIRONMENT DIVISION.
000100 DATA DIVISION.
000110 WORKING-STORAGE SECTION.
000120     COPY COBW3.
000130*
000140 01 HTMLFILENAME                  PIC X(64).
000150 01 PATHNAME                      PIC X(256).
000160 01 PATHSIZE                      PIC 9(05).
000170 01 COPYSTARTPOS                  PIC 9(05).
000180 01 LEFTLENGTH                    PIC 9(05).
000190 01 アクセス回数                  PIC 9(05).
000200 01  WORK-CNTR1                   PIC 9(4)  COMP-5.
000210 01  WORK-CNTR2                   PIC 9(4)  COMP-5.
000220 01 CONVERT-VALUE                 PIC X(1024).
000230 01 CONVERT-LENGTH                PIC S9(4) COMP-5.
000240 01 SANITIZED-DATA                PIC X(1024).
000250 01 SANITIZED-LENGTH              PIC S9(4) COMP-5.
000260*
000270 LINKAGE SECTION.
000280 01 SAFCTX                        POINTER.
000290*
000300 PROCEDURE DIVISION USING SAFCTX.
000310*
000320 SAFSAMPLE1-START.
000330*
000340*  ＳＡＦサブルーチンパラメタ域の初期化
000350     MOVE LOW-VALUE TO COBW3.
000360     SET COBW3-CONTEXT TO SAFCTX.
000370*
000380*  ＳＡＦサブルーチン作業環境の設定及び
000390*  ＷＥＢパラメタの獲得
000400     CALL "COBW3_INIT" USING COBW3.
000410*
000420     MOVE SPACE TO PATHNAME.
000430*
000440     MOVE "Your Access Counter" TO COBW3-COOKIE-NAME.
000450     CALL "COBW3_GET_COOKIE_XX" USING COBW3.
000460     IF COBW3-STATUS NOT = ZERO AND COBW3-STATUS NOT = 8820 THEN
000470         MOVE "SAFERROR.htm" TO HTMLFILENAME
000480         PERFORM 画面出力処理
000490     ELSE IF COBW3-SEARCH-FLAG-NON THEN
000500         MOVE 1 TO COBW3-COOKIE-VALUE
000510         PERFORM アクセスカウンタ登録処理
000520         MOVE "SAFRPLY1.htm" TO HTMLFILENAME
000530         PERFORM 画面出力処理
000540     ELSE
000550         PERFORM 継続画面出力処理
000560     END-IF.
000570*
000580 終了位置.
000590*
000600*  ＳＡＦサブルーチン作業領域の解放
000610     CALL "COBW3_FREE" USING COBW3.
000620*
000630 SAFSAMPLE1-END.
000640*
000650     EXIT PROGRAM.
000660*
000670 継続画面出力処理 SECTION.
000680*  各種変換データの登録
000690*  アクセス回数の取得と登録
000700     COMPUTE アクセス回数 = FUNCTION NUMVAL(COBW3-COOKIE-VALUE).
000710     ADD 1 TO アクセス回数.
000720     MOVE アクセス回数 TO COBW3-COOKIE-VALUE.
000730     MOVE ZERO TO COBW3-COOKIE-VALUE-LENGTH.
000740*
000750*  アクセスカウンタの登録
000760     PERFORM アクセスカウンタ登録処理.
000770     MOVE NC"アクセス回数" TO COBW3-CNV-NAME-N.
000780     MOVE アクセス回数 TO COBW3-CNV-VALUE.
000790     PERFORM 変換データ登録.
000800*
000810*  リモートホスト名の取得と登録
000820     SET COBW3-REMOTE-HOST TO TRUE.
000830     CALL "COBW3_GET_REQUEST_INFO" USING COBW3.
000840     IF COBW3-STATUS NOT = ZERO THEN
000850         MOVE "SAFERROR.htm" TO HTMLFILENAME
000860         PERFORM 画面出力処理
000870         GO TO 終了位置
000880     END-IF.
000890     MOVE NC"ホスト名" TO COBW3-CNV-NAME-N.
000900*
000910*  クロスサイトスクリプティング脆弱性対策
000920     MOVE COBW3-REQUEST-INFO TO CONVERT-VALUE.
000930     MOVE COBW3-REQUEST-INFO-LENGTH TO CONVERT-LENGTH.
000940     PERFORM サニタイズ処理.
000950     MOVE SANITIZED-DATA     TO COBW3-CNV-VALUE.
000960     PERFORM 変換データ登録.
000970*
000980*  ブラウザ名の取得と登録
000990     MOVE "USER-AGENT" TO COBW3-HEADER-NAME.
001000     CALL "COBW3_RECEIVE_HEADER" USING COBW3.
001010     IF COBW3-STATUS NOT = ZERO THEN
001020         MOVE "SAFERROR.htm" TO HTMLFILENAME
001030         PERFORM 画面出力処理
001040         GO TO 終了位置
001050     END-IF.
001060     MOVE NC"ブラウザ名" TO COBW3-CNV-NAME-N.
001070*
001080*  クロスサイトスクリプティング脆弱性対策
001090     MOVE COBW3-HEADER-VALUE TO CONVERT-VALUE.
001100     MOVE COBW3-HEADER-VALUE-LENGTH TO CONVERT-LENGTH.
001110     PERFORM サニタイズ処理.
001120     MOVE SANITIZED-DATA     TO COBW3-CNV-VALUE.
001130     PERFORM 変換データ登録.
001140*
001150*  HTMLファイルの出力
001160     MOVE "SAFRPLY2.htm" TO HTMLFILENAME.
001170     PERFORM 画面出力処理.
001180*
001190 継続画面出力処理終了.
001200     EXIT.
001210*
001220*
001230 アクセスカウンタ登録処理 SECTION.
001240*  有効期限を設定すると、ブラウザ終了後もアクセスカウンタの
001250*  内容が残せます。ただし、ブラウザが異なると意味がありません。
001260     CALL "COBW3_SET_COOKIE_XX" USING COBW3.
001270     IF COBW3-STATUS NOT = ZERO THEN
001280         MOVE "SAFERROR.htm" TO HTMLFILENAME
001290         PERFORM 画面出力処理
001300         GO TO 終了位置
001310     END-IF.
001320 アクセスカウンタ登録処理終了.
001330     EXIT.
001340*
001350 変換データ登録 SECTION.
001360     CALL "COBW3_SET_CNV_NX" USING COBW3.
001370     IF COBW3-STATUS NOT = ZERO THEN
001380         MOVE "SAFERROR.htm" TO HTMLFILENAME
001390         PERFORM 画面出力処理
001400         GO TO 終了位置
001410     END-IF.
001420 変換データ登録終了.
001430     EXIT.
001440*
001450 画面出力処理 SECTION.
001460*  アプリケーションが配置されている物理パスの取得と
001470*  HTML文書名の編集
001480     IF PATHNAME = SPACE THEN
001490         PERFORM 物理パス名取得
001500     END-IF.
001510     MOVE SPACE TO COBW3-HTML-FILENAME.
001520     MOVE PATHNAME(1:PATHSIZE) TO COBW3-HTML-FILENAME.
001530     COMPUTE COPYSTARTPOS = PATHSIZE + 1.
001540     MOVE "\" TO COBW3-HTML-FILENAME(COPYSTARTPOS:1).
001550     COMPUTE COPYSTARTPOS = COPYSTARTPOS + 1.
001560     COMPUTE LEFTLENGTH = 256 - COPYSTARTPOS.
001570     MOVE HTMLFILENAME TO COBW3-HTML-FILENAME(COPYSTARTPOS:256).
001580*
001590*  HTML文書の出力
001600     CALL "COBW3_PUT_HTML" USING COBW3.
001610*
001620 画面出力処理終了.
001630     EXIT.
001640*
001650 物理パス名取得 SECTION.
001660     MOVE SPACE TO PATHNAME.
001670     SET COBW3-PHYSICALPATH TO TRUE.
001680     CALL "COBW3_GET_REQUEST_INFO" USING COBW3.
001690     IF COBW3-STATUS = ZERO THEN
001700         MOVE COBW3-REQUEST-INFO TO PATHNAME
001710         MOVE COBW3-REQUEST-INFO-LENGTH TO PATHSIZE
001720     END-IF.
001730*
001740 物理パス名取得終了.
001750     EXIT.
001760
001770 サニタイズ処理 SECTION.
001780     MOVE  0                    TO     WORK-CNTR1 .
001790     MOVE  1                    TO     WORK-CNTR2 .
001800     MOVE  SPACE                TO     SANITIZED-DATA .
001810     PERFORM WITH TEST BEFORE
001820             VARYING WORK-CNTR1 FROM 1 BY 1
001830               UNTIL WORK-CNTR1 > CONVERT-LENGTH
001840         EVALUATE CONVERT-VALUE(WORK-CNTR1:1)
001850           WHEN "<"
001860             MOVE "&lt;"        TO     SANITIZED-DATA(WORK-CNTR2:4)
001870             ADD  4             TO     WORK-CNTR2
001880           WHEN ">"
001890             MOVE "&gt;"        TO     SANITIZED-DATA(WORK-CNTR2:4)
001900             ADD  4             TO     WORK-CNTR2
001910           WHEN "&"
001920             MOVE "&amp;"       TO     SANITIZED-DATA(WORK-CNTR2:5)
001930             ADD  5             TO     WORK-CNTR2
001940           WHEN OTHER
001950             MOVE CONVERT-VALUE(WORK-CNTR1:1)
001960                                TO     SANITIZED-DATA(WORK-CNTR2:1)
001970             ADD  1             TO     WORK-CNTR2
001980         END-EVALUATE
001990     END-PERFORM.
002000     MOVE  WORK-CNTR2           TO     SANITIZED-LENGTH.
002010 サニタイズ処理終了.
002020     EXIT.
