000100*======================================================================
000200*
000300*　ＣＯＭクライアント（レイトバインディング）の例題
000400*　　エクセルをＣＯＭサーバとして，その機能をＣＯＢＯＬプログラムから
000500*　使用します。
000600*
000700*        Copyright 1999-2015 FUJITSU LIMITED
000800*======================================================================
000900 IDENTIFICATION DIVISION.
001000 PROGRAM-ID.    SAMPLE23.
001100 ENVIRONMENT    DIVISION.
001200 CONFIGURATION SECTION.
001300   REPOSITORY.
001400           CLASS COM AS "*COM".
001500 DATA           DIVISION.
001600 WORKING-STORAGE SECTION.
001700 01 エクセル            OBJECT REFERENCE COM.
001800 01 ブック              OBJECT REFERENCE COM.
001900 01 コレクション        OBJECT REFERENCE COM.
002000 01 シート              OBJECT REFERENCE COM.
002100 01 選択セル            OBJECT REFERENCE COM.
002200 01 セル                OBJECT REFERENCE COM.
002300 01 開始位置            OBJECT REFERENCE COM.
002400 01 終了位置            OBJECT REFERENCE COM.
002500 01 チャート            OBJECT REFERENCE COM.
002600 01 グラフ              OBJECT REFERENCE COM.
002700 01 グラフデータ        OBJECT REFERENCE COM.
002800 01 アプリケーション名  PIC X(20).
002900 01 テスト用ファイル    PIC X(256).
003000 01 プリンタ名          PIC X(60).
003100 01 選択シート名  PIC X(20).
003200 01 セル行位置          PIC S9(9) COMP-5.
003300 01 セルカラム位置      PIC S9(9) COMP-5.
003400 01 グラフデータ数      PIC S9(9) COMP-5.
003500 01 グラフＩＤ          PIC S9(9) COMP-5.
003600 01 LOOP-COUNT          PIC S9(9) COMP-5.
003700 01 TYPE-SELECT         PIC 9(1).
003800 01 COM-TRUE            PIC 1(1) BIT VALUE B"1".
003900 01 COM-FALSE           PIC 1(1) BIT VALUE B"0".
004000 01 PAGE-FROM           PIC S9(9) COMP-5 VALUE 1.
004100 01 PAGE-TO             PIC S9(9) COMP-5 VALUE 999.
004200 01 COPIES              PIC S9(9) COMP-5 VALUE 1.
004300 01 GRAPH-DATA.
004400   02 POINT-DATA.
004500     03                 PIC S9(9) COMP-5 VALUE 1.
004600     03                 PIC S9(9) COMP-5 VALUE 1.
004700     03                 PIC S9(9) COMP-5 VALUE 9.
004800     03                 PIC S9(9) COMP-5 VALUE 2.
004900     03                 PIC S9(9) COMP-5 VALUE 1.
005000     03                 PIC S9(9) COMP-5 VALUE 2.
005100     03                 PIC S9(9) COMP-5 VALUE 7.
005200     03                 PIC S9(9) COMP-5 VALUE 2.
005300     03                 PIC S9(9) COMP-5 VALUE 1.
005400     03                 PIC S9(9) COMP-5 VALUE 1.
005500   02 REDEFINES   POINT-DATA.
005600     03 PDATA           PIC S9(9) COMP-5 OCCURS 10.
005700   02 TYPE-DATA.
005800     03                 PIC S9(9) COMP-5 VALUE 51.
005900     03                 PIC S9(9) COMP-5 VALUE 57.
006000     03                 PIC S9(9) COMP-5 VALUE 4.
006100     03                 PIC S9(9) COMP-5 VALUE 5.
006200     03                 PIC S9(9) COMP-5 VALUE -4151.
006300   02 REDEFINES   TYPE-DATA.
006400     03 GRAPH-TYPE      PIC S9(9) COMP-5 OCCURS 5.
006500 PROCEDURE      DIVISION.
006600*======================================================================
006700*  エクセルを起動して，表示状態にします。
006800*======================================================================
006900     MOVE "EXCEL.APPLICATION" TO アプリケーション名.
007000     INVOKE COM "CREATE-OBJECT"
007100                         USING     アプリケーション名
007200                         RETURNING エクセル.
007300     INVOKE エクセル "SET-VISIBLE"
007400                         USING COM-TRUE.
007500*======================================================================
007600*  テスト用のエクセルシートのファイル名を入力し，これをオープンします。
007700*======================================================================
007800     DISPLAY " テスト用Excelファイルのファイル名をフルパスで指定してください".
007900     DISPLAY " => " WITH NO ADVANCING.
008000     ACCEPT  テスト用ファイル FROM CONSOLE.
008100*
008200     INVOKE エクセル "GET-WORKBOOKS"             *> WORKBOOKオブジェクト
008300                          RETURNING ブック.      *> を取得する
008400     INVOKE ブック "OPEN" USING     テスト用ファイル
008500                          RETURNING ブック.
008600*======================================================================
008700*  SHEETコレクションから，"SHEET1"のオブジェクトを選択します。
008800*======================================================================
008900     MOVE  "SHEET1" TO 選択シート名.
009000     INVOKE ブック "GET-WORKSHEETS"
009100                        RETURNING コレクション.
009200     INVOKE コレクション "GET-ITEM"
009300                        USING     選択シート名
009400                        RETURNING シート.
009500*======================================================================
009600*  １行目の１～１０番目のセル（Ａ１～Ｊ１）に値を設定します。
009700*======================================================================
009800     MOVE 1 TO セル行位置.
009900     PERFORM VARYING セルカラム位置 FROM 1 BY 1
010000             UNTIL セルカラム位置 > 10
010100       INVOKE シート "GET-CELLS"
010200                     USING セル行位置 セルカラム位置
010300                     RETURNING セル
010400       INVOKE セル "SET-VALUE"
010500                     USING PDATA(セルカラム位置)
010600     END-PERFORM.
010700*======================================================================
010800*  １行目の１～１０番目のセル（Ａ１～Ｊ１）を選択します。
010900*======================================================================
011000     MOVE 1 TO セル行位置.
011100     MOVE 1 TO セルカラム位置.      *> 選択開始位置の
011200     INVOKE シート "GET-CELLS"      *> CELLオブジェクトを取得
011300                      USING セル行位置 セルカラム位置
011400                      RETURNING 開始位置.
011500     MOVE 1  TO セル行位置.
011600     MOVE 10 TO セルカラム位置.     *> 選択終了位置の
011700     INVOKE シート "GET-CELLS"      *> CELLオブジェクトを取得
011800                      USING セル行位置 セルカラム位置
011900                      RETURNING 終了位置.
012000     INVOKE シート "GET-RANGE" USING 開始位置 終了位置
012100                               RETURNING 選択セル.
012200*======================================================================
012300*  チャートコレクションから，"GRAPH1"のオブジェクトを選択します。
012400*======================================================================
012500     MOVE  "GRAPH1" TO 選択シート名.
012600     INVOKE ブック "GET-CHARTS"
012700                        RETURNING コレクション.
012800     INVOKE コレクション "GET-ITEM"
012900                        USING     選択シート名
013000                        RETURNING チャート.
013100*======================================================================
013200*  "GRAPH1"に含まれるグラフデータのコレクションオブジェクトを取得し
013300*  既存のグラフデータを削除します。
013400*======================================================================
013500     INVOKE チャート "SeriesCollection"
013600                        RETURNING グラフ.
013700     INVOKE グラフ "GET-COUNT"
013800                        RETURNING グラフデータ数.
013900     MOVE 1 TO グラフＩＤ.
014000     PERFORM VARYING LOOP-COUNT FROM 1 BY 1
014100             UNTIL LOOP-COUNT > グラフデータ数
014200       INVOKE グラフ "ITEM"
014300                        USING グラフＩＤ
014400                        RETURNING グラフデータ
014500       INVOKE グラフデータ "DELETE"
014600     END-PERFORM.
014700*======================================================================
014800*  選択したセルのデータをグラフデータとして追加します
014900*======================================================================
015000     MOVE 1 TO グラフＩＤ.
015100     INVOKE グラフ "ADD"  USING 選択セル.
015200     INVOKE グラフ "ITEM" USING グラフＩＤ
015300                          RETURNING グラフデータ.
015400*======================================================================
015500*  作成するグラフの種類を選択する。
015600*======================================================================
015700     DISPLAY " 作成するグラフの種類を選択してください。".
015800     DISPLAY " １：棒グラフ（縦）".
015900     DISPLAY " ２：棒グラフ（横）".
016000     DISPLAY " ３：折れ線グラフ".
016100     DISPLAY " ４：円グラフ".
016200     DISPLAY " ５：レーダグラフ".
016300     DISPLAY " => " WITH NO ADVANCING.
016400     ACCEPT TYPE-SELECT FROM CONSOLE
016500*======================================================================
016600*  グラフを作成する。
016700*======================================================================
016800     INVOKE グラフデータ "SET-ChartType"
016900                     USING GRAPH-TYPE(TYPE-SELECT).
017000*======================================================================
017100*  グラフを印刷する。
017200*======================================================================
017300     DISPLAY " 作成したグラフを印刷するならプリンタ名を指定してください。".
017400     DISPLAY " => " WITH NO ADVANCING.
017500     ACCEPT プリンタ名 FROM CONSOLE
017600     IF FUNCTION STORED-CHAR-LENGTH(プリンタ名) NOT = 0 THEN
017700       INVOKE チャート "PrintOut"
017800             USING PAGE-FROM PAGE-TO COPIES COM-FALSE プリンタ名
017900     END-IF
018000*======================================================================
018100*  ブックを保存して, 不要なオブジェクトを削除する
018200*======================================================================
018300     INVOKE ブック "SAVE"
018400     INVOKE ブック "CLOSE"
018500     INVOKE エクセル "QUIT".
018600     SET エクセル       TO NULL.
018700     SET ブック         TO NULL.
018800     SET シート         TO NULL.
018900     SET 選択セル       TO NULL.
019000     SET セル           TO NULL.
019100     SET 開始位置       TO NULL.
019200     SET 終了位置       TO NULL.
019300     SET チャート       TO NULL.
019400     SET グラフ         TO NULL.
019500     SET グラフデータ   TO NULL.
019600     STOP RUN.
019700 END PROGRAM SAMPLE23.
