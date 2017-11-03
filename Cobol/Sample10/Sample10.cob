000100* Copyright 1992-2015 FUJITSU LIMITED
000200 IDENTIFICATION DIVISION.
000300  PROGRAM-ID. SAMPLE10.
000400*
000500 ENVIRONMENT DIVISION.
000600  CONFIGURATION SECTION.
000700   SPECIAL-NAMES.
000800     SYSERR IS メッセージ出力先.
000900  INPUT-OUTPUT SECTION.
001000   FILE-CONTROL.
001100     SELECT 帳票の印刷先 ASSIGN TO PRTFILE
001200       FORMAT            IS 定義体の名前
001300       GROUP             IS 項目群の名前
001400       FILE STATUS       IS 帳票の状態
001500                            詳細コード.
001600     SELECT 商品マスタ   ASSIGN TO DATAFILE
001700       FILE STATUS       IS 商品マスタの状態
001800       ORGANIZATION      IS INDEXED
001900       ACCESS MODE       IS SEQUENTIAL
002000       RECORD KEY        IS 商品コード OF 商品マスタレコード
002100       ALTERNATE RECORD KEY IS  商品名  OF  商品マスタレコード.
002200     SELECT 売上ファイル ASSIGN TO SALEFILE
002300       FILE STATUS       IS 売上ファイルの状態
002400       ORGANIZATION      IS INDEXED
002500       ACCESS MODE       IS DYNAMIC
002600       RECORD KEY        IS 商品コード OF 売上レコード
002700                         WITH DUPLICATES
002800       ALTERNATE RECORD KEY IS  売上日 OF 売上レコード
002900                         WITH DUPLICATES.
003000*
003100 DATA DIVISION.
003200  FILE SECTION.
003300   FD  帳票の印刷先.
003400      COPY  SYUUKEI OF XMDLIB.
003500   FD  商品マスタ.
003600   01  商品マスタレコード.
003700      COPY  SYOHINM.
003800   FD  売上ファイル.
003900      COPY  URIAGE.
004000*
004100  WORKING-STORAGE SECTION.
004200   77  Ｗ数量                   PIC 9(08)  VALUE 0.
004300   77  Ｗ小計                   PIC 9(13)  VALUE 0.
004400   77  Ｗ合計                   PIC 9(13)  VALUE 0.
004500   77  ページカウンタ           PIC 9(03)  VALUE 0.
004600   77  行カウンタ               PIC 9(03)  VALUE 0.
004700   77  定義体の名前             PIC X(08)  VALUE "SYUUKEI".
004800   77  項目群の名前             PIC X(08).
004900   77  帳票の状態               PIC XX.
005000       88  帳票の印刷成功                  VALUE "00".
005100   77  詳細コード               PIC X(04).
005200   77  商品マスタの状態         PIC XX.
005300       88  商品マスタのアクセス成功        VALUE "00".
005400   77  売上ファイルの状態       PIC XX.
005500       88  売上ファイルのアクセス成功      VALUE "00".
005600   77  処理の結果               PIC XX.
005700       88  エラー発生                      VALUE "77".
005800       88  正常終了                        VALUE "00".
005900   77  行制御の状態             PIC XX.
006000       88  商品データの切り換え            VALUE "99".
006100       88  売上げデータ継続                VALUE "00".
006200*  メッセージ（ファイルのアクセスに失敗しました）
006300    77  ファイルアクセス失敗    PIC N(20)  VALUE
006400             NC"ファイルのアクセスに失敗しました．".
006500*  メッセージ（帳票の印刷に失敗しました）
006600    77  帳票印刷失敗            PIC N(20)  VALUE
006700             NC"帳票の印刷に失敗しました．".
006800*
006900  CONSTANT SECTION.
007000   77  ページヘッダ             PIC 9      VALUE 6.
007100   77  制御ヘッダ               PIC 9      VALUE 5.
007200   77  詳細部                   PIC 9      VALUE 2.
007300   77  制御フッタ               PIC 9      VALUE 5.
007400   77  集計フッタ               PIC 9      VALUE 4.
007500   77  ページフッタの開始行     PIC 9(02)  VALUE 63.
007600*
007700 PROCEDURE DIVISION.
007800*
007900     SET 正常終了 TO TRUE.
008000*
008100     PERFORM 入力ファイルをオープンする.
008200      IF エラー発生 THEN GO TO 処理を終了する.
008300*
008400     PERFORM 帳票の印刷先をオープンする.
008500      IF エラー発生 THEN
008600        PERFORM  入力ファイルをクローズする
008700        GO TO 処理を終了する
008800      END-IF.
008900*
009000     PERFORM 帳票を印刷する.
009100*
009200     PERFORM 帳票の印刷先をクローズする.
009300     PERFORM 入力ファイルをクローズする.
009400*
009500  処理を終了する.
009600     EXIT PROGRAM.
009700*
009800*===============================================================
009900*
010000  入力ファイルをオープンする  SECTION.
010100      OPEN INPUT 商品マスタ 売上ファイル.
010200      IF NOT 商品マスタのアクセス成功
010300        THEN DISPLAY ファイルアクセス失敗 UPON メッセージ出力先 
010400             SET エラー発生 TO TRUE.
010500      IF NOT 売上ファイルのアクセス成功
010600        THEN PERFORM マスタファイルをクローズする
010700             DISPLAY ファイルアクセス失敗 UPON メッセージ出力先 
010800             SET エラー発生 TO TRUE.
010900*
011000*============================================================
011100*
011200  マスタファイルをクローズする  SECTION.
011300      CLOSE  商品マスタ.
011400      IF NOT 商品マスタのアクセス成功
011500        THEN DISPLAY ファイルアクセス失敗 UPON メッセージ出力先
011600             SET エラー発生 TO TRUE.
011700*
011800*===============================================================
011900*
012000  入力ファイルをクローズする  SECTION.
012100      CLOSE  商品マスタ 売上ファイル.
012200      IF NOT 商品マスタのアクセス成功 OR
012300         NOT 売上ファイルのアクセス成功
012400        THEN DISPLAY ファイルアクセス失敗 UPON メッセージ出力先
012500             SET エラー発生 TO TRUE.
012600*
012700*
012800*============================================================
012900*
013000  帳票の印刷先をオープンする  SECTION.
013100      OPEN OUTPUT 帳票の印刷先.
013200      IF NOT 帳票の印刷成功
013300        THEN DISPLAY 帳票印刷失敗 UPON メッセージ出力先
013400             SET エラー発生 TO TRUE.
013500*
013600*============================================================
013700*
013800  帳票の印刷先をクローズする  SECTION.
013900      CLOSE 帳票の印刷先.
014000      IF NOT 帳票の印刷成功
014100        THEN DISPLAY 帳票印刷失敗 UPON メッセージ出力先
014200             SET エラー発生 TO TRUE.
014300*
014400*============================================================
014500*
014600  帳票を印刷する  SECTION.
014700     MOVE ZERO       TO Ｗ合計.
014800*
014900    ページの先頭.
015000     PERFORM ページヘッダを印刷する.
015100*
015200   商品データを読み込む.
015300     READ 商品マスタ NEXT
015400       AT END
015500         PERFORM 集計を印刷する
015600         PERFORM ページフッタを印刷する
015700         GO TO 帳票印刷終了
015800     END-READ.
015900     START 売上ファイル FIRST RECORD
016000       INVALID KEY GO TO 商品データを読み込む
016100     END-START.
016200     MOVE 商品コード OF 商品マスタレコード
016300       TO 商品コード OF 売上レコード.
016400     START 売上ファイル
016500       KEY IS = 商品コード OF 売上レコード
016600       INVALID KEY GO TO 商品データを読み込む
016700     END-START.
016800*
016900   制御ヘッダを印刷する.
017000     IF 行カウンタ >= ページフッタの開始行 -
017100        (制御ヘッダ + 詳細部 + 制御フッタ) THEN
017200       PERFORM ページフッタを印刷する
017300       PERFORM ページヘッダを印刷する
017400     END-IF.
017500     MOVE  "CH1"     TO 項目群の名前.
017600     MOVE 商品コード OF 商品マスタレコード
017700       TO 商品コード OF SYUUKEI.
017800     MOVE 商品名     OF 商品マスタレコード
017900       TO 商品名     OF SYUUKEI.
018000     MOVE 単価       OF 商品マスタレコード
018100       TO 単価       OF SYUUKEI.
018200     WRITE SYUUKEI.
018300     IF NOT 帳票の印刷成功
018400       THEN GO TO 帳票印刷失敗処理
018500     END-IF.
018600     ADD  制御ヘッダ TO 行カウンタ.
018700     MOVE ZERO       TO Ｗ数量 Ｗ小計.
018800     READ 売上ファイル.
018900     SET 売上げデータ継続 TO TRUE.
019000     PERFORM WITH TEST BEFORE UNTIL
019100       行カウンタ >= ページフッタの開始行 - (制御フッタ + 詳細部)
019200*  詳細部を印刷する
019300       MOVE  "DE"      TO 項目群の名前
019400       MOVE 売上日     OF 売上レコード
019500         TO 受注日     OF SYUUKEI
019600       MOVE 数量       OF 売上レコード
019700         TO 数量       OF SYUUKEI
019800       MOVE 金額       OF 売上レコード
019900         TO 売上げ     OF SYUUKEI
020000       WRITE SYUUKEI
020100       IF NOT 帳票の印刷成功
020200         THEN GO TO 帳票印刷失敗処理
020300       END-IF
020400       ADD 詳細部               TO 行カウンタ
020500       ADD 数量 OF 売上レコード TO Ｗ数量
020600       ADD 金額 OF 売上レコード TO Ｗ小計
020700       READ 売上ファイル NEXT
020800         AT END
020900           SET 商品データの切り換え TO TRUE
021000           EXIT PERFORM
021100       END-READ
021200       IF 商品コード OF 売上レコード NOT =
021300          商品コード OF 商品マスタレコード
021400         SET 商品データの切り換え TO TRUE
021500         EXIT PERFORM
021600       END-IF
021700     END-PERFORM.
021800*
021900   制御フッタを印刷する.
022000     MOVE  "CF1"     TO 項目群の名前
022100     MOVE Ｗ数量     TO 数量小計   OF SYUUKEI
022200     MOVE Ｗ小計     TO 売上げ小計 OF SYUUKEI
022300     WRITE SYUUKEI
022400     IF NOT 帳票の印刷成功
022500       THEN GO TO 帳票印刷失敗処理
022600     END-IF
022700     ADD Ｗ小計      TO Ｗ合計
022800     ADD 制御フッタ  TO 行カウンタ
022900     IF 行カウンタ >= ページフッタの開始行 - 詳細部 THEN
023000       PERFORM ページフッタを印刷する
023100       PERFORM ページヘッダを印刷する
023200       IF 売上げデータ継続 THEN
023300         GO TO 制御ヘッダを印刷する
023400       END-IF
023500     END-IF
023600*
023700     GO TO 商品データを読み込む.
023800*
023900 ページヘッダを印刷する.
024000     INITIALIZE SYUUKEI.
024100     MOVE  "PH"     TO 項目群の名前.
024200     WRITE SYUUKEI AFTER ADVANCING PAGE.
024300     IF NOT 帳票の印刷成功
024400       THEN GO TO 帳票印刷失敗処理.
024500     MOVE ページヘッダ TO 行カウンタ.
024600     ADD  1            TO ページカウンタ.
024700*
024800  ページヘッダを印刷する終了.
024900     EXIT.
025000*
025100  ページフッタを印刷する.
025200     MOVE  "PF"     TO 項目群の名前.
025300     MOVE ページカウンタ TO ページ数 OF SYUUKEI.
025400     WRITE SYUUKEI.
025500     IF NOT 帳票の印刷成功
025600       THEN GO TO 帳票印刷失敗処理
025700     END-IF.
025800*
025900  ページフッタを印刷する終了.
026000     EXIT.
026100*
026200  集計を印刷する.
026300     MOVE  "CF2"    TO 項目群の名前.
026400     MOVE Ｗ合計    TO 合計 OF SYUUKEI.
026500     WRITE SYUUKEI.
026600     IF NOT 帳票の印刷成功
026700       THEN GO TO 帳票印刷失敗処理
026800     END-IF.
026900*
027000  集計を印刷する終了.
027100     EXIT.
027200*
027300  帳票印刷失敗処理.
027400     DISPLAY 帳票印刷失敗 UPON メッセージ出力先.
027500     SET エラー発生 TO TRUE.
027600*
027700  帳票印刷終了.
027800     EXIT.
027900
