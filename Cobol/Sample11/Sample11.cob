000100*=================================================================
000200*「データベース機能を使ったプログラム」
000300*    データベースのある表からカーソルを使って全データを取り出して
000400*  表示します。
000500*
000600*=================================================================
000700****  注意事項  ****
000800*=================================================================
000900*     このプログラムでは、接続データベースとして
001000*     Microsoft(R) SQL Server(TM)を想定しています。
001100*     接続データベースとしてMicrosoft(R) SQL Server(TM)以外を
001200*     使用する場合、接続確認の処理を次のように変更してください。
001300*
001400*      000570 接続確認.
001500*      000580     IF SQLSTATE = "00000" THEN
001600*      000590*       SQLSTATE = "01000" THEN
001700*      000600       DISPLAY "接続に成功しました"
001800*      000610       DISPLAY " "
001900*      000620     ELSE
002000*      000630       GO TO P-END
002100*      000640     END-IF
002200*
002300*     Copyright 2000-2015 FUJITSU LIMITED
002400*=================================================================
002500 IDENTIFICATION DIVISION.
002600 PROGRAM-ID.    SAMPLE11.
002700 ENVIRONMENT    DIVISION.
002800 DATA           DIVISION.
002900 WORKING-STORAGE SECTION.
003000*=================================================================
003100*  ホスト変数宣言
003200*=================================================================
003300     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
003400 01 在庫表.
003500   02 製品番号   PIC S9(4) COMP-5.
003600   02 製品名     PIC X(20).
003700   02 在庫数量   PIC S9(9) COMP-5.
003800   02 倉庫番号   PIC S9(4) COMP-5.
003900 01 SQLSTATE     PIC X(5).
004000 01 SQLMSG       PIC X(128).
004100     EXEC SQL END DECLARE SECTION END-EXEC.
004200 01 データ件数   PIC 9(2).
004300 01 カーソル状態 PIC 1(1) BIT.
004400 88 カーソルオープン VALUE B"1".
004500 PROCEDURE DIVISION.
004600*=================================================================
004700*  カーソルを宣言します
004800*=================================================================
004900     EXEC SQL
005000       DECLARE CUR1 CURSOR FOR SELECT * FROM STOCK
005100     END-EXEC.
005200*=================================================================
005300*  データベースに接続 (DEFAULTサーバに接続)します
005400*=================================================================
005500 P-START.
005600     EXEC SQL CONNECT TO DEFAULT END-EXEC.
005700* 接続確認
005800     IF SQLSTATE = "00000" OR
005900        SQLSTATE = "01000" THEN
006000       DISPLAY "接続に成功しました"
006100       DISPLAY " "
006200     ELSE
006300       GO TO P-END
006400     END-IF
006500*=================================================================
006600*  例外事象が発生した場合の動作を指定します
006700*=================================================================
006800     EXEC SQL WHENEVER NOT FOUND CONTINUE END-EXEC.
006900     EXEC SQL WHENEVER SQLERROR GO TO :P-END END-EXEC.
007000*=================================================================
007100*  カーソルをＯＰＥＮします
007200*=================================================================
007300     EXEC SQL OPEN CUR1 END-EXEC.
007400     SET カーソルオープン TO TRUE.
007500*=================================================================
007600*  カーソルを用いて順にデータ取り出します。
007700*=================================================================
007800 P-FETCH.
007900     MOVE 0 TO データ件数
008000*
008100     EXEC SQL FETCH CUR1 INTO :在庫表  END-EXEC
008200     PERFORM TEST BEFORE
008300               UNTIL SQLSTATE = "02000"
008400       COMPUTE データ件数 = データ件数 + 1
008500       DISPLAY データ件数 NC"件目のデータ："
008600       DISPLAY NC"　　　製品番号　＝　"  製品番号
008700       DISPLAY NC"　　　製品名　　＝　"  製品名
008800       DISPLAY NC"　　　在庫数量　＝　"  在庫数量
008900       DISPLAY NC"　　　倉庫番号　＝　"  倉庫番号
009000       EXEC SQL FETCH CUR1 INTO :在庫表  END-EXEC
009100     END-PERFORM
009200*
009300     DISPLAY " "
009400     DISPLAY  データ件数 NC"件のデータの取り出しに成功しました。"
009500     MOVE "00000" TO SQLSTATE.
009600*=================================================================
009700*  例外事象が発生した場合の動作を無効化します。
009800*=================================================================
009900 P-END.
010000     EXEC SQL WHENEVER SQLERROR CONTINUE END-EXEC.
010100*=================================================================
010200*  カーソルをＣＬＯＳＥします
010300*=================================================================
010400     IF カーソルオープン THEN
010500       EXEC SQL CLOSE CUR1 END-EXEC
010600     END-IF.
010700*=================================================================
010800*  トランザクションを終了し、接続を解除します。
010900*=================================================================
011000     IF SQLSTATE = "00000" THEN
011100       EXEC SQL COMMIT WORK END-EXEC
011200     ELSE
011300       DISPLAY NC"ＳＱＬ文の実行でエラーが発生しました。"
011400       DISPLAY "       SQLSTATE : " SQLSTATE
011500       DISPLAY "       SQLMSG   : " SQLMSG
011600       EXEC SQL ROLLBACK WORK END-EXEC
011700     END-IF.
011800     EXEC SQL DISCONNECT DEFAULT END-EXEC.
011900 END-PROC.
012000     DISPLAY NC"終了します".
012100     STOP RUN.
012200
012300*-----------------------------------------------------------------
012400* Microsoftは、米国Microsoft Corporation の米国及びその他の国に
012500* おける登録商標です。
012600* SQL Serverは、米国Microsoft Corporationの登録商標です。
012700*-----------------------------------------------------------------
