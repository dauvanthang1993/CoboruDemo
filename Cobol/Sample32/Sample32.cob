000100 @OPTIONS ALPHAL(WORD)
000200*=================================================================
000300*�u���̃v���O�����E�o�b�`�t�@�C���̋N���v
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
004800*    �N������v���O�����̃p�X���w�肵�܂��B
004900*=================================================================
005000     DISPLAY " �N���������v���O�����̃p�X���w�肵�Ă��������B".
005100     DISPLAY " (��Enter�̏ꍇ�͗��31��MsgBox.EXE�����s���܂�)".
005200     DISPLAY " => " WITH NO ADVANCING.
005300     ACCEPT  appPath FROM CONSOLE.
005400     COMPUTE pathLeng = FUNCTION STORED-CHAR-LENGTH(appPath)
005500*=================================================================
005600*    �p�X���w�肳��Ȃ�������A���31��MsgBox.EXE��ݒ肵�܂�
005700*=================================================================
005800     IF pathLeng = 0 THEN
005900       COMPUTE pathLeng = FUNCTION LENGTH (ZDEFAULT)
006000       MOVE ZDEFAULT TO appPath
006100       MOVE 0        TO cmdlinLeng
006200     ELSE
006300*=================================================================
006400*    �p�X���w�肳�ꂽ��A�R�}���h���C���������w�肵�܂�
006500*=================================================================
006600       DISPLAY " �R�}���h���C���������K�v�Ȃ�w�肵�ĉ������B"
006700       DISPLAY " => " WITH NO ADVANCING
006800       ACCEPT  cmdline FROM CONSOLE
006900       COMPUTE cmdlinLeng = FUNCTION STORED-CHAR-LENGTH(cmdline)
007000       MOVE LOW-VALUE TO cmdline(cmdlinLeng + 1:1)
007100     END-IF
007200     MOVE LOW-VALUE TO appPath(pathLeng + 1:1)
007300*=================================================================
007400*    CreateProcessA�֐����g���ăv���O�������N�����܂��B
007500*=================================================================
007600     DISPLAY appPath(1:pathLeng) "���N�����܂��B"
007700     IF cmdlinLeng =  0 THEN
007800       *> �R�}���h���C��������K�v�Ƃ��Ȃ��ꍇ
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
009200       *> �R�}���h���C��������K�v�Ƃ���ꍇ
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
010700*  �v���O�����̋N���ɐ����������ǂ�����rtncd�Ŕ��肵�܂��B
010800*=================================================================
010900     IF rtncd = 1 THEN
011000       DISPLAY appPath(1:pathLeng) "�̋N���ɐ������܂����B"
011100*=================================================================
011200*  �N�������v���O�����̏I����҂��A�I���R�[�h���擾���܂��B
011300*=================================================================
011400       CALL "WaitForSingleObject" WITH STDCALL LINKAGE
011500                                  USING BY VALUE prcinf01 -1
011600       CALL "GetExitCodeProcess" WITH STDCALL LINKAGE
011700                    USING BY VALUE prcinf01
011800                          BY REFERENCE rtncd
011900*=================================================================
012000*  �v���O�����̋N���Ɏg�p�����������J�����܂��B
012100*=================================================================
012200       CALL "CloseHandle" WITH STDCALL LINKAGE
012300                          USING BY VALUE prcinf01
012400       CALL "CloseHandle" WITH STDCALL LINKAGE
012500                          USING BY VALUE prcinf02
012600       DISPLAY appPath(1:pathLeng) "�̏I���R�[�h��'" RTNCD "'�ł��B"
012700     ELSE
012800*=================================================================
012900*  �v���O�����̋N���Ɏ��s�����ꍇ�AGetLastError�֐��Ō����𒲂ׂ܂��B
013000*=================================================================
013100       CALL "GetLastError" WITH STDCALL LINKAGE
013200                           RETURNING rtncd
013300       DISPLAY appPath(1:pathLeng) "�̋N���Ɏ��s���܂����B"
013400       DISPLAY "�����R�[�h��'" RTNCD "'�ł��B"
013500     END-IF
013600     STOP RUN.
