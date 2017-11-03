000010*======================================================================
000020*
000030*　ＣＯＭクライアント（アーリバインディング）の例題
000040*　　エクセルをＣＯＭサーバとして，その機能をＣＯＢＯＬプログラムから
000050*　使用します。
000060*
000070*        Copyright 1999-2015 FUJITSU LIMITED
000080*======================================================================
000090 IDENTIFICATION DIVISION.
000100 PROGRAM-ID.    SAMPLE24.
000110 ENVIRONMENT    DIVISION.
000120 CONFIGURATION SECTION.
000130   REPOSITORY.
000140           CLASS COM AS "*COM"
000150           CLASS EXCEL     AS "*COM:EXCEL:APPLICATION"
000160           CLASS WORKBOOKS AS "*COM:EXCEL:WORKBOOKS"
000170           CLASS WORKBOOK  AS "*COM:EXCEL:WORKBOOK"
000180           CLASS SHEETS    AS "*COM:EXCEL:SHEETS"
000190           CLASS SHEET     AS "*COM:EXCEL:WORKSHEET"
000200           CLASS CELLS     AS "*COM:EXCEL:RANGE"
000210           CLASS GRAPHS    AS "*COM:EXCEL:SERIESCOLLECTION"
000220           CLASS GRAPH     AS "*COM:EXCEL:SERIES"
000230           CLASS CHART     AS "*COM:EXCEL:CHART"
000240           CLASS RANGES    AS "*COM:EXCEL:RANGE"
000250           .
000260 DATA           DIVISION.
000270 WORKING-STORAGE SECTION.
000280 01 エクセル            OBJECT REFERENCE EXCEL.
000290 01 ブック              OBJECT REFERENCE WORKBOOK.
000300 01 コレクション        OBJECT REFERENCE SHEETS.
000310 01 シート              OBJECT REFERENCE SHEET.
000320 01 選択セル            OBJECT REFERENCE CELLS.
000330 01 セル                OBJECT REFERENCE CELLS.
000340 01 開始位置            OBJECT REFERENCE CELLS.
000350 01 終了位置            OBJECT REFERENCE CELLS.
000360 01 チャート            OBJECT REFERENCE CHART.
000370 01 グラフ              OBJECT REFERENCE GRAPHS.
000380 01 グラフデータ        OBJECT REFERENCE GRAPH.
000390 01 範囲                OBJECT REFERENCE RANGES.
000400 01 一時オブジェクト域  OBJECT REFERENCE COM.
000410 01 テスト用ファイル    PIC X(256).
000420 01 プリンタ名          PIC X(60).
000430 01 選択シート名  PIC X(20).
000440 01 セル行位置          PIC S9(9) COMP-5.
000450 01 セルカラム位置      PIC S9(9) COMP-5.
000460 01 グラフデータ数      PIC S9(9) COMP-5.
000470 01 グラフＩＤ          PIC S9(9) COMP-5.
000480 01 LOOP-COUNT          PIC S9(9) COMP-5.
000490 01 TYPE-SELECT         PIC 9(1).
000500 01 COM-TRUE            PIC 1(1) BIT VALUE B"1".
000510 01 COM-FALES           PIC 1(1) BIT VALUE B"0".
000520 01 PAGE-FROM           PIC S9(9) COMP-5 VALUE 1.
000530 01 PAGE-TO             PIC S9(9) COMP-5 VALUE 999.
000540 01 COPIES              PIC S9(9) COMP-5 VALUE 1.
000550 01 GRAPH-DATA.
000560   02 POINT-DATA.
000570     03                 PIC S9(9) COMP-5 VALUE 1.
000580     03                 PIC S9(9) COMP-5 VALUE 1.
000590     03                 PIC S9(9) COMP-5 VALUE 9.
000600     03                 PIC S9(9) COMP-5 VALUE 2.
000610     03                 PIC S9(9) COMP-5 VALUE 1.
000620     03                 PIC S9(9) COMP-5 VALUE 2.
000630     03                 PIC S9(9) COMP-5 VALUE 7.
000640     03                 PIC S9(9) COMP-5 VALUE 2.
000650     03                 PIC S9(9) COMP-5 VALUE 1.
000660     03                 PIC S9(9) COMP-5 VALUE 1.
000670   02 REDEFINES   POINT-DATA.
000680     03 PDATA           PIC S9(9) COMP-5 OCCURS 10.
000690   02 TYPE-DATA.
000700     03                 PIC S9(9) COMP-5 VALUE 51.
000710     03                 PIC S9(9) COMP-5 VALUE 57.
000720     03                 PIC S9(9) COMP-5 VALUE 4.
000730     03                 PIC S9(9) COMP-5 VALUE 5.
000740     03                 PIC S9(9) COMP-5 VALUE -4151.
000750   02 REDEFINES   TYPE-DATA.
000760     03 GRAPH-TYPE      PIC S9(9) COMP-5 OCCURS 5.
000770 PROCEDURE      DIVISION.
000780*======================================================================
000790*  エクセルを起動して，表示状態にします。
000800*======================================================================
000810     INVOKE EXCEL "NEW"  RETURNING エクセル.
000820     MOVE   COM-TRUE TO VISIBLE OF エクセル
000830*======================================================================
000840*  テスト用のエクセルシートのファイル名を入力し，これをオープンします。
000850*======================================================================
000860     DISPLAY " テスト用エクセルシートのファイル名をフルパスで指定してください".
000870     DISPLAY " => " WITH NO ADVANCING.
000880     ACCEPT  テスト用ファイル FROM CONSOLE.
000890     INVOKE WORKBOOKS OF エクセル "OPEN"
000900                          USING     テスト用ファイル
000910                          RETURNING ブック.
000920*======================================================================
000930*  SHEETコレクションから，"SHEET1"のオブジェクトを選択します。
000940*======================================================================
000950     MOVE  "SHEET1" TO 選択シート名.
000960     INVOKE WORKSHEETS OF ブック "GET-ITEM"
000970                        USING     選択シート名
000980                        RETURNING 一時オブジェクト域.
000990     SET  シート  TO  一時オブジェクト域  AS  SHEET.
001000*======================================================================
001010*  １行目の１～１０番目のセル（Ａ１～Ｊ１）に値を設定します。
001020*======================================================================
001030     MOVE 1 TO セル行位置.
001040     PERFORM VARYING セルカラム位置 FROM 1 BY 1
001050             UNTIL セルカラム位置 > 10
001060       INVOKE シート "GET-CELLS"  RETURNING 範囲
001070       INVOKE 範囲   "GET-ITEM"
001080                     USING セル行位置 セルカラム位置
001090                     RETURNING セル
001100*      INVOKE セル "SET-VALUE"
001110*                    USING PDATA(セルカラム位置)
001120* Excel2002以降を使用する場合は、こちらを使って下さい。
001130       INVOKE セル "SET-VALUE"
001140                     USING OMITTED PDATA(セルカラム位置)
001150     END-PERFORM.
001160*======================================================================
001170*  １行目の１～１０番目のセル（Ａ１～Ｊ１）を選択します。
001180*======================================================================
001190     MOVE 1 TO セル行位置.
001200     MOVE 1 TO セルカラム位置.      *> 選択開始位置の
001210     INVOKE シート "GET-CELLS"  RETURNING 範囲
001220     INVOKE 範囲   "GET-ITEM"   
001230                      USING セル行位置 セルカラム位置
001240                      RETURNING 開始位置.
001250     MOVE 1  TO セル行位置.
001260     MOVE 10 TO セルカラム位置.     *> 選択終了位置の
001270     INVOKE 範囲   "GET-ITEM"   
001280                      USING セル行位置 セルカラム位置
001290                      RETURNING 終了位置.
001300     INVOKE シート "GET-RANGE" USING 開始位置 終了位置
001310                               RETURNING 選択セル.
001320*======================================================================
001330*  チャートコレクションから，"GRAPH1"のオブジェクトを選択します。
001340*======================================================================
001350     MOVE  "GRAPH1" TO 選択シート名.
001360     INVOKE CHARTS OF ブック "GET-ITEM"
001370                        USING     選択シート名
001380                        RETURNING 一時オブジェクト域.
001390     SET  チャート   TO   一時オブジェクト域   AS  CHART.
001400*======================================================================
001410*  "GRAPH1"に含まれるグラフデータのコレクションオブジェクトを取得し
001420*  既存のグラフデータを削除する。
001430*======================================================================
001440     INVOKE チャート "SeriesCollection"
001450                        RETURNING 一時オブジェクト域.
001460     SET  グラフ  TO  一時オブジェクト域  AS  GRAPHS.
001470     INVOKE グラフ "GET-COUNT"
001480                        RETURNING グラフデータ数.
001490     MOVE 1 TO グラフＩＤ.
001500     PERFORM VARYING LOOP-COUNT FROM 1 BY 1
001510             UNTIL LOOP-COUNT > グラフデータ数
001520       INVOKE グラフ "ITEM"
001530                        USING グラフＩＤ
001540                        RETURNING グラフデータ
001550       INVOKE グラフデータ "DELETE"
001560     END-PERFORM.
001570*======================================================================
001580*  選択したセルのデータをグラフのコレクションに追加します
001590*======================================================================
001600     MOVE 1 TO グラフＩＤ.
001610     INVOKE グラフ "ADD"  USING 選択セル.
001620     INVOKE グラフ "ITEM" USING グラフＩＤ
001630                          RETURNING グラフデータ.
001640*======================================================================
001650*  作成するグラフの種類を選択する。
001660*======================================================================
001670     DISPLAY " 作成するグラフの種類を選択してください。".
001680     DISPLAY " １：棒グラフ（縦）".
001690     DISPLAY " ２：棒グラフ（横）".
001700     DISPLAY " ３：折れ線グラフ".
001710     DISPLAY " ４：円グラフ".
001720     DISPLAY " ５：レーダグラフ".
001730     DISPLAY " => " WITH NO ADVANCING.
001740     ACCEPT TYPE-SELECT FROM CONSOLE
001750*======================================================================
001760*  グラフを作成する。
001770*======================================================================
001780     INVOKE グラフデータ "SET-ChartType"
001790                     USING GRAPH-TYPE(TYPE-SELECT).
001800*======================================================================
001810*  グラフを印刷する。
001820*======================================================================
001830     DISPLAY " 作成したグラフを印刷するならプリンタ名を指定してください。".
001840     DISPLAY " => " WITH NO ADVANCING.
001850     ACCEPT プリンタ名 FROM CONSOLE
001860     IF FUNCTION STORED-CHAR-LENGTH(プリンタ名) NOT = 0 THEN
001870      INVOKE チャート "PrintOut"
001880             USING PAGE-FROM PAGE-TO COPIES COM-FALES プリンタ名
001890     END-IF
001900*======================================================================
001910*  ブックを保存して, 不要なオブジェクトを削除する
001920*======================================================================
001930     INVOKE ブック "SAVE"
001940     INVOKE ブック "CLOSE"
001950     INVOKE エクセル "QUIT".
001960     SET エクセル       TO NULL.
001970     SET ブック         TO NULL.
001980     SET シート         TO NULL.
001990     SET 選択セル       TO NULL.
002000     SET セル           TO NULL.
002010     SET 開始位置       TO NULL.
002020     SET 終了位置       TO NULL.
002030     SET チャート       TO NULL.
002040     SET グラフ         TO NULL.
002050     SET グラフデータ   TO NULL.
002060     STOP RUN.
002070 END PROGRAM SAMPLE24.
