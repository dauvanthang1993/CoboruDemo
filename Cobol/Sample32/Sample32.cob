000100 @OPTIONS ALPHAL(WORD)
000200*=================================================================
000300*「他のプログラム・バッチファイルの起動」
000400*
000500*
000600*     Copyright 2000-2015 FUJITSU LIMITED
000700*=================================================================
000800 IDENTIFICATION DIVISION.
000900 PROGRAM-ID.    SAMPLE32.
001000 DATA           DIVISION.
001100 WORKING-STORAGE SECTION.
001200 01 ProcessInfo.
001300   02 prcinf01   PIC 9(9) COMP-5.
001400   02 prcinf02   PIC 9(9) COMP-5.
001500   02 prcinf03   PIC 9(9) COMP-5.
001600   02 prcinf04   PIC 9(9) COMP-5.
001700 01 StartupInfo.
001800   02 stainf01   PIC 9(9) COMP-5.
001900*
002000   02 stainf02   PIC 9(9) COMP-5.
002100   02 stainf03   PIC 9(9) COMP-5.
002200   02 stainf04   PIC 9(9) COMP-5.
002300*
002400   02 stainf05   PIC 9(9) COMP-5.
002500   02 stainf06   PIC 9(9) COMP-5.
002600   02 stainf07   PIC 9(9) COMP-5.
002700   02 stainf08   PIC 9(9) COMP-5.
002800   02 stainf09   PIC 9(9) COMP-5.
002900   02 stainf10   PIC 9(9) COMP-5.
003000   02 stainf11   PIC 9(9) COMP-5.
003100   02 stainf12   PIC 9(9) COMP-5.
003200   02 stainf13   PIC 9(4) COMP-5.
003300   02 stainf14   PIC 9(4) COMP-5.
003400   02 stainf15   PIC 9(9) COMP-5.
003500*
003600   02 stainf16   PIC 9(9) COMP-5.
003700   02 stainf17   PIC 9(9) COMP-5.
003800   02 stainf18   PIC 9(9) COMP-5.
003900 01 appPath      PIC X(256) VALUE SPACE.
004000 01 pathLeng     PIC S9(9) COMP-5.
004100 01 cmdline      PIC X(256) VALUE SPACE.
004200 01 cmdlinLeng   PIC S9(9) COMP-5.
004300 01 rtncd        PIC 9(9)  COMP-5.
004400 CONSTANT        SECTION.
004500 01 ZDEFAULT    PIC X(22) VALUE "..\SAMPLE31\MSGBOX.EXE".
004600 PROCEDURE      DIVISION.
004700*=================================================================
004800*    起動するプログラムのパスを指定します。
004900*=================================================================
005000     DISPLAY " 起動したいプログラムのパスを指定してください。".
005100     DISPLAY " (空Enterの場合は例題31のMsgBox.EXEを実行します)".
005200     DISPLAY " => " WITH NO ADVANCING.
005300     ACCEPT  appPath FROM CONSOLE.
005400     COMPUTE pathLeng = FUNCTION STORED-CHAR-LENGTH(appPath)
005500*=================================================================
005600*    パスが指定されなかったら、例題31のMsgBox.EXEを設定します
005700*=================================================================
005800     IF pathLeng = 0 THEN
005900       COMPUTE pathLeng = FUNCTION LENGTH (ZDEFAULT)
006000       MOVE ZDEFAULT TO appPath
006100       MOVE 0        TO cmdlinLeng
006200     ELSE
006300*=================================================================
006400*    パスが指定されたら、コマンドライン引数を指定します
006500*=================================================================
006600       DISPLAY " コマンドライン引数が必要なら指定して下さい。"
006700       DISPLAY " => " WITH NO ADVANCING
006800       ACCEPT  cmdline FROM CONSOLE
006900       COMPUTE cmdlinLeng = FUNCTION STORED-CHAR-LENGTH(cmdline)
007000       MOVE LOW-VALUE TO cmdline(cmdlinLeng + 1:1)
007100     END-IF
007200     MOVE LOW-VALUE TO appPath(pathLeng + 1:1)
007300*=================================================================
007400*    CreateProcessA関数を使ってプログラムを起動します。
007500*=================================================================
007600     DISPLAY appPath(1:pathLeng) "を起動します。"
007700     IF cmdlinLeng =  0 THEN
007800       *> コマンドライン引数を必要としない場合
007900       CALL "CreateProcessA" WITH STDCALL LINKAGE
008000            USING BY REFERENCE appPath
008100                  BY VALUE 0
008200                  BY VALUE 0
008300                  BY VALUE 0
008400                  BY VALUE 0
008500                  BY VALUE 0
008600                  BY VALUE 0
008700                  BY VALUE 0
008800                  BY REFERENCE StartupInfo
008900                  BY REFERENCE ProcessInfo
009000            RETURNING rtncd
009100     ELSE
009200       *> コマンドライン引数を必要とする場合
009300       CALL "CreateProcessA" WITH STDCALL LINKAGE
009400            USING BY REFERENCE appPath
009500                  BY REFERENCE cmdline
009600                  BY VALUE 0
009700                  BY VALUE 0
009800                  BY VALUE 0
009900                  BY VALUE 0
010000                  BY VALUE 0
010100                  BY VALUE 0
010200                  BY REFERENCE StartupInfo
010300                  BY REFERENCE ProcessInfo
010400            RETURNING rtncd
010500     END-IF
010600*=================================================================
010700*  プログラムの起動に成功したかどうかはrtncdで判定します。
010800*=================================================================
010900     IF rtncd = 1 THEN
011000       DISPLAY appPath(1:pathLeng) "の起動に成功しました。"
011100*=================================================================
011200*  起動したプログラムの終了を待ち、終了コードを取得します。
011300*=================================================================
011400       CALL "WaitForSingleObject" WITH STDCALL LINKAGE
011500                                  USING BY VALUE prcinf01 -1
011600       CALL "GetExitCodeProcess" WITH STDCALL LINKAGE
011700                    USING BY VALUE prcinf01
011800                          BY REFERENCE rtncd
011900*=================================================================
012000*  プログラムの起動に使用した資源を開放します。
012100*=================================================================
012200       CALL "CloseHandle" WITH STDCALL LINKAGE
012300                          USING BY VALUE prcinf01
012400       CALL "CloseHandle" WITH STDCALL LINKAGE
012500                          USING BY VALUE prcinf02
012600       DISPLAY appPath(1:pathLeng) "の終了コードは'" RTNCD "'です。"
012700     ELSE
012800*=================================================================
012900*  プログラムの起動に失敗した場合、GetLastError関数で原因を調べます。
013000*=================================================================
013100       CALL "GetLastError" WITH STDCALL LINKAGE
013200                           RETURNING rtncd
013300       DISPLAY appPath(1:pathLeng) "の起動に失敗しました。"
013400       DISPLAY "原因コードは'" RTNCD "'です。"
013500     END-IF
013600     STOP RUN.
