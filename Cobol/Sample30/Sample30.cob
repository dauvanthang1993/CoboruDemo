000100*=================================================================
000200*「Ｕｎｉｃｏｄｅを使用するプログラム」
000300*
000400*    Unicodeデータ(UCS-2)をファイルから入力し、画面表示および
000500*  印刷します。
000600*
000700*     Copyright 2000-2015 FUJITSU LIMITED
000800*=================================================================
000900 IDENTIFICATION              DIVISION.
001000  PROGRAM-ID.                SAMPLE30.
001100*
001200 ENVIRONMENT                 DIVISION.
001300  CONFIGURATION              SECTION.
001400   SPECIAL-NAMES.
001500     SYMBOLIC CONSTANT
001600     オン         IS B"1"
001700     オフ         IS B"0"
001800     POSITIONING UNIT 印刷位置 IS 5.00 CPI
001900*---------------------------------------------------------------*
002000* 印字の属性を定義します。                                      *
002100*---------------------------------------------------------------*
002200     PRINTING MODE  印字モード１ IS FOR MOCS
002300                    IN   SIZE  12.0 POINT
002400                    AT   PITCH 5.00 CPI
002500                    WITH FONT  GOTHIC
002600                    BY   FORM  F0102
002700     PRINTING MODE  印字モード２ IS FOR SOCS
002800                    IN   SIZE  8.0 POINT
002900                    AT   PITCH 10.00 CPI
003000                    WITH FONT  GOTHIC
003100                    BY   FORM  F0102.
003200 INPUT-OUTPUT               SECTION.
003300 FILE-CONTROL.
003400     SELECT 行順ファイル
003500         ASSIGN       TO  INFILE
003600         ORGANIZATION IS  LINE SEQUENTIAL.
003700     SELECT 印刷ファイル
003800         ASSIGN       TO  PRINTER.
003900*
004000 DATA                        DIVISION.
004100 FILE                       SECTION.
004200 FD  行順ファイル IS GLOBAL.
004300 01  行順ファイルファイル.
004400   02 キーデータ            PIC N(10).
004500   02                       PIC N(01).
004600   02 表示データ            PIC N(12).
004700 FD  印刷ファイル IS GLOBAL.
004800 01  印刷レコード  PRINTING POSITION IS 2 BY 印刷位置
004900                   CHARACTER TYPE IS 印字モード１ OR
005000                                     印字モード２.
005100   02 レコードカウンタ      PIC 9(4).
005200   02                       PIC X(5).
005300   02 表示データ            PIC N(12).
005400   02                       PIC X(5).
005500   02 キーデータ            PIC X(20).
005600 WORKING-STORAGE             SECTION.
005700 01  出力選択               IS GLOBAL PIC X(01).
005800 01  KEY_OF_UT8             IS GLOBAL PIC X(20).
005900 01  残レコードカウンタ     PIC 9(02) VALUE 10.
006000 01  終了フラグ             IS GLOBAL PIC 1(1) BIT.
006100 PROCEDURE                   DIVISION.
006200*---------------------------------------------------------------*
006300* 印刷ファイルをオープンします。                                *
006400*---------------------------------------------------------------*
006500     OPEN OUTPUT 印刷ファイル.
006600*---------------------------------------------------------------*
006700* 作業域を初期化する                                            *
006800*---------------------------------------------------------------*
006900     MOVE SPACE TO 印刷レコード
007000     MOVE 0     TO レコードカウンタ
007100     MOVE オフ  TO  終了フラグ.
007200*---------------------------------------------------------------*
007300* 終了が選択されるか、エラーの起きるまで処理を繰り返します。    *
007400*---------------------------------------------------------------*
007500     DISPLAY " "
007600     DISPLAY "<< Unicode ならではの文字の表示・印刷を行います。>>"
007700     PERFORM TEST BEFORE
007800            UNTIL  終了フラグ = オン
007900       OPEN INPUT  行順ファイル
008000       DISPLAY " "
008100       DISPLAY "1.さかな編"
008200       DISPLAY "2.発音記号編"
008300       DISPLAY "X.終了"
008400       DISPLAY " "
008500       DISPLAY "以上から番号で選んでください。>> " WITH NO ADVANCING
008600       ACCEPT   出力選択
008700*
008800       EVALUATE 出力選択
008900         WHEN "1"
009000            CALL "選択"
009100         WHEN "2"
009200            CALL "選択"
009300         WHEN "X"
009400           MOVE オン TO 終了フラグ
009500         WHEN OTHER
009600           DISPLAY "指定された番号はありません。"
009700           MOVE オン TO 終了フラグ
009800       END-EVALUATE
009900       IF 終了フラグ NOT = オン THEN
010000          CALL "出力"
010100       END-IF
010200*---------------------------------------------------------------*
010300* 再度ファイルの先頭から読み込むため、リセットします。          *
010400*---------------------------------------------------------------*
010500       CLOSE 行順ファイル
010600     END-PERFORM.
010700*
010800 終了処理.
010900*---------------------------------------------------------------*
011000* 使用したファイルをクローズし、処理を終えます。                *
011100*---------------------------------------------------------------*
011200     CLOSE  印刷ファイル
011300     STOP RUN.
011400/
011500*===============================================================*
011600* 選択処理を行います。                                          *
011700*===============================================================*
011800 IDENTIFICATION              DIVISION.
011900  PROGRAM-ID.                選択.
012000 ENVIRONMENT                 DIVISION.
012100 DATA                        DIVISION.
012200 PROCEDURE                   DIVISION.
012300     DISPLAY " "
012400     EVALUATE 出力選択
012500       WHEN "1"
012600         DISPLAY "●さかな編"
012700         DISPLAY "たちうお  かれい  ふぐ    ちょうざめ  いわな"
012800         DISPLAY "わかさぎ  えい    かます  しゃちほこ  終了"
012900       WHEN "2"
013000         DISPLAY "●発音記号編"
013100         DISPLAY "ACCEPT  COPY     DISPLAY     MANUAL    NULL"
013200         DISPLAY "OBJECT  PROGRAM  SEQUENTIAL  TABLE     終了"
013300     END-EVALUATE
013400     DISPLAY " "
013500     DISPLAY "以上から選んでください。>> " WITH NO ADVANCING
013600     ACCEPT KEY_OF_UT8 FROM CONSOLE
013700*
013800        *> UTF-8での比較
013900     IF KEY_OF_UT8 = "終了" THEN
014000       MOVE オン TO 終了フラグ
014100     END-IF.
014200 END PROGRAM 選択.
014300/
014400*===============================================================*
014500* 出力処理を行います。                                          *
014600*===============================================================*
014700 IDENTIFICATION              DIVISION.
014800  PROGRAM-ID.                出力.
014900 ENVIRONMENT                 DIVISION.
015000 DATA                        DIVISION.
015100  WORKING-STORAGE            SECTION.
015200  01 KEY_OF_UC2              PIC N(10).
015300 PROCEDURE                   DIVISION.
015400*---------------------------------------------------------------*
015500* コンソールから受け取ったＵＴＦ−８のデータをＵＣＳ−２に変換  *
015600* し、入力ファイル（ＵＣＳ−２）のデータと比較可能なコード・字  *
015700* 類にします。                                                  *
015800*---------------------------------------------------------------*
015900       MOVE FUNCTION UCS2-OF(KEY_OF_UT8) TO KEY_OF_UC2
016000       DISPLAY " "
016100*---------------------------------------------------------------*
016200* レコードの中から、表示・印刷するデータを取り出します。        *
016300*---------------------------------------------------------------*
016400                                 *> UCS-2での比較
016500       PERFORM TEST BEFORE
016600                    UNTIL KEY_OF_UC2 =  キーデータ OF 行順ファイル
016700         READ 行順ファイル
016800           AT END
016900             DISPLAY "指定された文字列はありません。"
017000             EXIT PROGRAM
017100           NOT AT END
017200             CONTINUE
017300         END-READ
017400       END-PERFORM
017500*---------------------------------------------------------------*
017600* コンソール出力をします。                                      *
017700*---------------------------------------------------------------*
017800       DISPLAY "Ｕｎｉｃｏｄｅ固有の文字を使用した文字列→"
017900               表示データ OF 行順ファイル
018000*---------------------------------------------------------------*
018100* 印刷用のレコードを出力します。                                *
018200*---------------------------------------------------------------*
018300       COMPUTE レコードカウンタ = レコードカウンタ + 1
018400       MOVE KEY_OF_UT8 TO キーデータ OF 印刷レコード
018500       MOVE 表示データ OF 行順ファイル
018600                       TO 表示データ OF 印刷レコード
018700       WRITE   印刷レコード  AFTER ADVANCING 2 LINE
018800 END PROGRAM 出力.
018900 END PROGRAM SAMPLE30.
