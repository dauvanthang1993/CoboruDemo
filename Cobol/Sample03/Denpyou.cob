000100* Copyright 1992-2015 FUJITSU LIMITED
000200 IDENTIFICATION DIVISION.
000300  PROGRAM-ID. DENPYOU.
000400*
000500 ENVIRONMENT DIVISION.
000600  CONFIGURATION SECTION.
000700   SPECIAL-NAMES.
000800     SYSERR IS メッセージ出力先.
000900  INPUT-OUTPUT SECTION.
001000   FILE-CONTROL.
001100     SELECT 帳票の印刷先 ASSIGN TO GS-PRTFILE
001200       SYMBOLIC DESTINATION IS "PRT"
001300       FORMAT            IS 帳票の名前
001400       GROUP             IS 項目群の名前
001500       PROCESSING MODE   IS 処理種別
001600       UNIT CONTROL      IS 詳細情報
001700       FILE STATUS       IS 印刷の状態.
001800*
001900 DATA DIVISION.
002000  FILE SECTION.
002100   FD  帳票の印刷先.
002200      COPY  DENPYO02 OF XMDLIB.
002300*
002400  WORKING-STORAGE SECTION.
002500   77  商品の数                 PIC 9(4)   VALUE 1.
002600   77  帳票の名前               PIC X(8)   VALUE "DENPYO02".
002700   77  項目群の名前             PIC X(8)   VALUE "GRP001  ".
002800   77  処理種別                 PIC XX.
002900   77  詳細情報                 PIC X(4).
003000   77  印刷の状態               PIC XX.
003100       88  印刷の成功                      VALUE "00".
003200   77  処理の結果               PIC XX.
003300       88  エラー発生                      VALUE "77".
003400       88  正常終了                        VALUE "00".
003500*  メッセージ（帳票の印刷に失敗しました）
003600    77  帳票印刷失敗            PIC N(20)  VALUE
003700             NC"帳票の印刷に失敗しました．".
003800*
003900  LINKAGE SECTION.
004000      COPY  DENPYO01 OF XMDLIB.
004100*
004200 PROCEDURE DIVISION USING DENPYO01.
004300*
004400     SET 正常終了 TO TRUE.
004500*
004600     PERFORM 帳票の印刷先をオープンする.
004700*
004800     PERFORM 帳票を出力する.
004900*
005000     PERFORM 帳票の印刷先をクローズする.
005100*
005200  処理を終了する.
005300     EXIT PROGRAM.
005400*
005500*============================================================
005600*
005700  帳票の印刷先をオープンする  SECTION.
005800      OPEN OUTPUT 帳票の印刷先.
005900      IF NOT 印刷の成功
006000        THEN DISPLAY 帳票印刷失敗 UPON メッセージ出力先
006100             SET エラー発生 TO TRUE.
006200*
006300*============================================================
006400*
006500  帳票の印刷先をクローズする  SECTION.
006600      CLOSE 帳票の印刷先.
006700      IF NOT 印刷の成功
006800        THEN DISPLAY 帳票印刷失敗 UPON メッセージ出力先
006900             SET エラー発生 TO TRUE.
007000*
007100*============================================================
007200*
007300  帳票を出力する  SECTION.
007400*
007500    帳票を印刷する準備.
007600      MOVE SPACE      TO DENPYO02.
007700      MOVE SPACE      TO 印刷の状態.
007800    印刷データを書き込む.
007900      MOVE 年   OF DENPYO01 TO 年 OF DENPYO02.
008000      MOVE 月   OF DENPYO01 TO 月 OF DENPYO02.
008100      MOVE 日   OF DENPYO01 TO 日 OF DENPYO02.
008200      MOVE 曜日 OF DENPYO01 TO 曜日 OF DENPYO02.
008300      MOVE 1 TO 商品の数.
008400      PERFORM WITH TEST BEFORE UNTIL 商品の数 > 5
008500       IF 商品コード OF DENPYO01(商品の数) = SPACE
008600         THEN EXIT PERFORM
008700       END-IF
008800       MOVE 商品コード OF DENPYO01(商品の数) TO 商品コード OF DENPYO02(商品の数)
008900       MOVE 商品名     OF DENPYO01(商品の数) TO 商品名     OF DENPYO02(商品の数)
009000       MOVE 数量       OF DENPYO01(商品の数) TO 数量       OF DENPYO02(商品の数)
009100       MOVE 単価       OF DENPYO01(商品の数) TO 単価       OF DENPYO02(商品の数)
009200       MOVE 金額       OF DENPYO01(商品の数) TO 金額       OF DENPYO02(商品の数)
009300       ADD  1        TO 商品の数
009400      END-PERFORM.
009500      MOVE 金額合計 OF DENPYO01 TO 金額合計 OF DENPYO02.
009600*
009700    帳票を印刷する.
009800      MOVE "PW"       TO 処理種別.
009900      MOVE "P001"     TO 詳細情報.
010000      WRITE DENPYO02.
010100      IF 印刷の成功
010200        THEN GO TO 帳票出力終了
010300        ELSE GO TO 帳票印刷失敗処理.
010400*
010500  帳票印刷失敗処理.
010600     DISPLAY 帳票印刷失敗 印刷の状態 UPON メッセージ出力先.
010700     SET エラー発生 TO TRUE.
010800*
010900  帳票出力終了.
011000     EXIT.
