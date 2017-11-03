000100* Copyright 1992-2015 FUJITSU LIMITED
000200 IDENTIFICATION DIVISION.
000300  PROGRAM-ID. SAMPLE3.
000400*
000500 ENVIRONMENT DIVISION.
000600  CONFIGURATION SECTION.
000700   SPECIAL-NAMES.
000800     SYSERR IS メッセージ出力先.
000900  INPUT-OUTPUT SECTION.
001000   FILE-CONTROL.
001100     SELECT 画面の表示先 ASSIGN TO GS-DSPFILE
001200       SYMBOLIC DESTINATION IS "DSP"
001300       FORMAT            IS 画面の名前
001400       GROUP             IS 項目群の名前
001500       SELECTED FUNCTION IS アテンションの種類
001600       PROCESSING MODE   IS 処理種別
001700       FILE STATUS       IS 画面の状態.
001800     SELECT 商品マスタ   ASSIGN TO DATAFILE
001900       FILE STATUS       IS 商品マスタの状態
002000       ORGANIZATION      IS INDEXED
002100       ACCESS MODE       IS RANDOM
002200       RECORD KEY        IS 商品コード OF 商品マスタレコード
002300       ALTERNATE RECORD KEY IS  商品名  OF  商品マスタレコード.
002400     SELECT OPTIONAL 売上ファイル ASSIGN TO "SALES"
002500       FILE STATUS       IS 売上ファイルの状態
002600       ORGANIZATION      IS INDEXED
002700       ACCESS MODE       IS RANDOM
002800       RECORD KEY        IS 商品コード OF 売上レコード
002900                         WITH DUPLICATES
003000       ALTERNATE RECORD KEY IS  売上日 OF 売上レコード
003100                         WITH DUPLICATES.
003200*
003300 DATA DIVISION.
003400  FILE SECTION.
003500   FD  画面の表示先.
003600      COPY  DENPYO01 OF XMDLIB.
003700   FD  商品マスタ.
003800   01  商品マスタレコード.
003900      COPY  SYOHINM.
004000   FD  売上ファイル.
004100      COPY  URIAGE.
004200*
004300  WORKING-STORAGE SECTION.
004400   77  商品の数Ｗ               PIC 9(04)  VALUE 0.
004500   77  商品の数                 PIC 9(04)  VALUE 1.
004600   77  画面の名前               PIC X(08)  VALUE "DENPYO01".
004700   77  項目群の名前             PIC X(08).
004800   77  アテンションの種類       PIC X(04).
004900       88  ＰＦ１キー                      VALUE "F001".
005000       88  ＰＦ２キー                      VALUE "F002".
005100       88  ＰＦ３キー                      VALUE "F003".
005200       88  ＰＦ４キー                      VALUE "F004".
005300   77  処理種別                 PIC XX.
005400   77  画面の状態               PIC XX.
005500       88  画面のアクセス成功              VALUE "00" THRU "04".
005600   77  商品マスタの状態         PIC XX.
005700       88  商品マスタのアクセス成功        VALUE "00".
005800       88  商品コードがない                VALUE "23".
005900   77  売上ファイルの状態       PIC XX.
006000       88  売上ファイルのアクセス成功      VALUE "00".
006100       88  売上ファイルの新規作成          VALUE "05".
006200   77  処理の結果               PIC XX.
006300       88  伝票入力を終了する              VALUE "99".
006400       88  エラー発生                      VALUE "77".
006500       88  修正する                        VALUE "55".
006600       88  正常終了                        VALUE "00".
006700   01  日付.
006800       03  年月日.
006900           05  年                   PIC 9(04).
007000           05  月                   PIC 9(02).
007100           05  日                   PIC 9(02).
007200           05                       PIC 9(13).
007300       03  曜日                     PIC 9.
007400*  制御コード
007500    77  カーソル表示            PIC X      VALUE "C".
007600*  色
007700    77  青                      PIC X      VALUE "B".
007800*  メッセージ（ファイルのアクセスに失敗しました）
007900    77  ファイルアクセス失敗    PIC N(20)  VALUE
008000             NC"ファイルのアクセスに失敗しました．".
008100*  メッセージ（画面のアクセスに失敗しました）
008200    77  画面表示失敗            PIC N(20)  VALUE
008300             NC"画面のアクセスに失敗しました．".
008400*  メッセージ（商品コードに誤りがあります）
008500    77  商品コード誤り          PIC N(15)  VALUE
008600 		   NC"商品コードに誤りがあります．". 
008700*  メッセージ（商品コードを入力してください）
008800    77  商品コードなし          PIC N(15)  VALUE
008900             NC"商品コードを入力してください．".
009000*  メッセージ（内容を確認してください）
009100    77  内容確認                PIC N(15)  VALUE
009200             NC"内容を確認してください".
009300*  メッセージ（数量を入力してください)
009400    77  数量なし                PIC N(15)  VALUE
009500             NC"数量を入力してください．".
009600*
009700 PROCEDURE DIVISION.
009800*
009900     SET 正常終了 TO TRUE.
010000*
010100     PERFORM マスタファイルをオープンする.
010200      IF エラー発生 THEN GO TO 処理を終了する.
010300*
010400     PERFORM 売上ファイルをオープンする.
010500      IF エラー発生 THEN
010600        PERFORM  マスタファイルをクローズする
010700        GO TO 処理を終了する
010800      END-IF.
010900*
011000     PERFORM UNTIL 伝票入力を終了する
011100*
011200      PERFORM 画面の表示先をオープンする
011300        IF エラー発生 THEN
011400          PERFORM  マスタファイルをクローズする
011500          PERFORM  売上ファイルをクローズする
011600          GO TO 処理を終了する
011700         END-IF
011800*
011900      PERFORM 伝票を入力する
012000        IF エラー発生 THEN
012100          EXIT PERFORM
012200         END-IF
012300*
012400     END-PERFORM.
012500*
012600     PERFORM 画面の表示先をクローズする.
012700     PERFORM マスタファイルをクローズする.
012800     PERFORM 売上ファイルをクローズする.
012900*
013000  処理を終了する.
013100     EXIT PROGRAM.
013200*
013300*===============================================================
013400*
013500  マスタファイルをオープンする  SECTION.
013600      OPEN INPUT 商品マスタ.
013700      IF NOT 商品マスタのアクセス成功
013800        THEN DISPLAY ファイルアクセス失敗 UPON メッセージ出力先 
013900             SET エラー発生 TO TRUE.
014000*
014100*============================================================
014200*
014300  マスタファイルをクローズする  SECTION.
014400      CLOSE  商品マスタ.
014500      IF NOT 商品マスタのアクセス成功
014600        THEN DISPLAY ファイルアクセス失敗 UPON メッセージ出力先
014700             SET エラー発生 TO TRUE.
014800*
014900*===============================================================
015000*
015100  売上ファイルをオープンする  SECTION.
015200      OPEN I-O 売上ファイル.
015300      IF NOT 売上ファイルのアクセス成功 AND
015400         NOT 売上ファイルの新規作成
015500        THEN DISPLAY ファイルアクセス失敗 UPON メッセージ出力先 
015600             SET エラー発生 TO TRUE.
015700*
015800*============================================================
015900*
016000  売上ファイルをクローズする  SECTION.
016100      CLOSE  売上ファイル.
016200      IF NOT 売上ファイルのアクセス成功
016300        THEN DISPLAY ファイルアクセス失敗 UPON メッセージ出力先
016400             SET エラー発生 TO TRUE.
016500*
016600*
016700*============================================================
016800*
016900  画面の表示先をオープンする  SECTION.
017000      OPEN I-O 画面の表示先.
017100      IF NOT 画面のアクセス成功
017200        THEN DISPLAY 画面表示失敗 UPON メッセージ出力先
017300             SET エラー発生 TO TRUE.
017400*
017500*============================================================
017600*
017700  画面の表示先をクローズする  SECTION.
017800      CLOSE 画面の表示先.
017900      IF NOT 画面のアクセス成功
018000        THEN DISPLAY 画面表示失敗 UPON メッセージ出力先
018100             SET エラー発生 TO TRUE.
018200*
018300*============================================================
018400*
018500  伝票を入力する  SECTION.
018600*
018700    画面を表示する準備.
018800      MOVE SPACE      TO DENPYO01.
018900      MOVE FUNCTION CURRENT-DATE TO 年月日.
019000      MOVE 年   OF 年月日 TO 年 OF DENPYO01.
019100      MOVE 月   OF 年月日 TO 月 OF DENPYO01.
019200      MOVE 日   OF 年月日 TO 日 OF DENPYO01.
019300      ACCEPT 曜日  OF  日付   FROM  DAY-OF-WEEK.
019400      EVALUATE    曜日 OF 日付
019500        WHEN  1
019600          MOVE NC"月" TO 曜日 OF DENPYO01
019700        WHEN  2
019800          MOVE NC"火" TO 曜日 OF DENPYO01
019900        WHEN  3
020000          MOVE NC"水" TO 曜日 OF DENPYO01
020100        WHEN  4
020200          MOVE NC"木" TO 曜日 OF DENPYO01
020300        WHEN  5
020400          MOVE NC"金" TO 曜日 OF DENPYO01
020500        WHEN  6
020600          MOVE NC"土" TO 曜日 OF DENPYO01
020700        WHEN  7
020800          MOVE NC"日" TO 曜日 OF DENPYO01
020900      END-EVALUATE.
021000      MOVE SPACE      TO アテンションの種類.
021100      MOVE SPACE      TO 処理種別.
021200      MOVE SPACE      TO 画面の状態.
021300      MOVE SPACE      TO 項目群の名前.
021400*
021500    画面を表示する１.
021600      MOVE  "GRP001" TO 項目群の名前.
021700      MOVE  "  "     TO 処理種別.
021800      WRITE DENPYO01.
021900      IF NOT 画面のアクセス成功
022000        THEN GO TO 画面表示失敗処理.
022100*
022200    画面からデータを読み込む１.
022300      READ  画面の表示先.
022400      IF ＰＦ３キー
022500        THEN SET   伝票入力を終了する TO TRUE
022600             GO TO 伝票入力終了.
022700      IF ＰＦ２キー
022800        THEN GO TO 画面を表示する準備.
022900      IF NOT 画面のアクセス成功
023000        THEN GO TO 画面表示失敗処理.
023100*
023200    商品コードの入力をチェックする.
023300     MOVE 1 TO 商品の数.
023400     IF 商品コード OF DENPYO01(商品の数) NOT = SPACE
023500       THEN GO TO 商品コードのチェックを行う.
023600      MOVE 商品コードなし TO メッセージ   OF DENPYO01.
023700      MOVE カーソル表示
023800               TO EDIT-CURSOR OF 商品コード OF DENPYO01(商品の数).
023900*
024000    画面を表示する２.
024100      MOVE  "GRP001" TO 項目群の名前.
024200      MOVE  "CL"     TO 処理種別.
024300      WRITE DENPYO01.
024400      IF NOT 画面のアクセス成功
024500        THEN GO TO 画面表示失敗処理.
024600*
024700    画面からデータを読み込む２.
024800      MOVE "NE"       TO 処理種別.
024900      READ  画面の表示先.
025000      IF ＰＦ３キー
025100        THEN SET   伝票入力を終了する TO TRUE
025200             GO TO 伝票入力終了.
025300      IF ＰＦ２キー
025400        THEN GO TO 画面を表示する準備.
025500      IF NOT 画面のアクセス成功
025600        THEN GO TO 画面表示失敗処理.
025700*
025800    データが入力されたか調べる.
025900      IF 商品コード OF DENPYO01(商品の数) NOT = SPACE
026000        THEN GO TO 商品コードのチェックを行う.
026100      MOVE 商品コードなし TO メッセージ   OF DENPYO01.
026200      MOVE カーソル表示
026300               TO EDIT-CURSOR OF 商品コード OF DENPYO01(商品の数).
026400      GO TO 画面を表示する２.
026500*
026600    商品コードのチェックを行う.
026700     PERFORM WITH TEST BEFORE UNTIL 商品の数 > 5
026800       IF 商品コード OF DENPYO01(商品の数) = SPACE
026900         THEN SUBTRACT 1 FROM 商品の数
027000              EXIT PERFORM
027100         END-IF
027200       MOVE 商品コード OF DENPYO01(商品の数)
027300         TO 商品コード OF 商品マスタレコード
027400       READ 商品マスタ
027500       IF 商品コードがない
027600         THEN MOVE 商品コード誤り TO メッセージ   OF DENPYO01
027700              MOVE カーソル表示
027800               TO EDIT-CURSOR OF 商品コード OF DENPYO01(商品の数)
027900              GO TO 画面を表示する２
028000         END-IF
028100       MOVE 商品名 OF 商品マスタレコード
028200         TO 商品名 OF DENPYO01(商品の数)
028300       MOVE 単価   OF 商品マスタレコード
028400         TO 単価   OF DENPYO01(商品の数)
028500       IF 数量 OF DENPYO01(商品の数) = SPACE
028600         THEN MOVE 数量なし  TO メッセージ   OF DENPYO01
028700              MOVE カーソル表示
028800                TO EDIT-CURSOR OF 数量 OF DENPYO01(商品の数)
028900              GO TO 画面を表示する２
029000         END-IF
029100       COMPUTE 金額 OF DENPYO01(商品の数) =
029200            数量 OF DENPYO01(商品の数) *
029300            単価 OF 商品マスタレコード
029400*  売上を書き出す
029500       MOVE 商品コード OF DENPYO01(商品の数)
029600         TO 商品コード OF 売上レコード
029700       MOVE 数量       OF DENPYO01(商品の数)
029800         TO 数量       OF 売上レコード
029900       MOVE 金額       OF DENPYO01(商品の数)
030000         TO 金額       OF 売上レコード
030100       MOVE 年   OF 年月日 TO 年 OF 売上レコード
030200       MOVE 月   OF 年月日 TO 月 OF 売上レコード
030300       MOVE 日   OF 年月日 TO 日 OF 売上レコード
030400       WRITE 売上レコード
030500*
030600       ADD  1        TO 商品の数
030700      END-PERFORM.
030800*
030900    金額を合計する.
031000     MOVE 0 TO 金額合計 OF DENPYO01.
031100     PERFORM WITH TEST AFTER VARYING 商品の数Ｗ FROM 1 BY 1
031200             UNTIL 商品の数Ｗ = 商品の数
031300       ADD  金額 OF DENPYO01(商品の数Ｗ)
031400                         TO 金額合計 OF DENPYO01
031500       END-PERFORM.
031600     MOVE 内容確認       TO メッセージ   OF DENPYO01.
031700     MOVE 青 TO EDIT-COLOR OF メッセージ OF DENPYO01.
031800*
031900    画面を表示する３.
032000      MOVE  "SCREEN" TO 項目群の名前.
032100      MOVE  "  "     TO 処理種別.
032200      WRITE DENPYO01.
032300      IF NOT 画面のアクセス成功
032400        THEN GO TO 画面表示失敗処理.
032500*
032600    画面からデータを読み込む３.
032700      MOVE "NE"       TO 処理種別.
032800      READ  画面の表示先.
032900      IF ＰＦ３キー
033000        THEN SET   伝票入力を終了する TO TRUE
033100             GO TO 伝票入力終了.
033200      IF ＰＦ２キー
033300        THEN GO TO 画面を表示する準備.
033400      IF ＰＦ４キー
033500        THEN CALL "DENPYOU" USING DENPYO01
033600             MOVE SPACE TO メッセージ OF DENPYO01
033700             GO TO 画面を表示する２.
033800      IF NOT 画面のアクセス成功
033900        THEN GO TO 画面表示失敗処理.
034000*
034100  画面表示失敗処理.
034200     DISPLAY 画面表示失敗 UPON メッセージ出力先.
034300     SET エラー発生 TO TRUE.
034400*
034500  伝票入力終了.
034600     EXIT.
034700
