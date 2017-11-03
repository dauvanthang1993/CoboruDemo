000100* Copyright 1992-2015 FUJITSU LIMITED
000200 IDENTIFICATION DIVISION.
000300  PROGRAM-ID. DENPYOU.
000400*
000500 ENVIRONMENT DIVISION.
000600  CONFIGURATION SECTION.
000700   SPECIAL-NAMES.
000800     SYSERR IS ���b�Z�[�W�o�͐�.
000900  INPUT-OUTPUT SECTION.
001000   FILE-CONTROL.
001100     SELECT ���[�̈���� ASSIGN TO GS-PRTFILE
001200       SYMBOLIC DESTINATION IS "PRT"
001300       FORMAT            IS ���[�̖��O
001400       GROUP             IS ���ڌQ�̖��O
001500       PROCESSING MODE   IS �������
001600       UNIT CONTROL      IS �ڍ׏��
001700       FILE STATUS       IS ����̏��.
001800*
001900 DATA DIVISION.
002000  FILE SECTION.
002100   FD  ���[�̈����.
002200      COPY  DENPYO02 OF XMDLIB.
002300*
002400  WORKING-STORAGE SECTION.
002500   77  ���i�̐�                 PIC 9(4)   VALUE 1.
002600   77  ���[�̖��O               PIC X(8)   VALUE "DENPYO02".
002700   77  ���ڌQ�̖��O             PIC X(8)   VALUE "GRP001  ".
002800   77  �������                 PIC XX.
002900   77  �ڍ׏��                 PIC X(4).
003000   77  ����̏��               PIC XX.
003100       88  ����̐���                      VALUE "00".
003200   77  �����̌���               PIC XX.
003300       88  �G���[����                      VALUE "77".
003400       88  ����I��                        VALUE "00".
003500*  ���b�Z�[�W�i���[�̈���Ɏ��s���܂����j
003600    77  ���[������s            PIC N(20)  VALUE
003700             NC"���[�̈���Ɏ��s���܂����D".
003800*
003900  LINKAGE SECTION.
004000      COPY  DENPYO01 OF XMDLIB.
004100*
004200 PROCEDURE DIVISION USING DENPYO01.
004300*
004400     SET ����I�� TO TRUE.
004500*
004600     PERFORM ���[�̈������I�[�v������.
004700*
004800     PERFORM ���[���o�͂���.
004900*
005000     PERFORM ���[�̈������N���[�Y����.
005100*
005200  �������I������.
005300     EXIT PROGRAM.
005400*
005500*============================================================
005600*
005700  ���[�̈������I�[�v������  SECTION.
005800      OPEN OUTPUT ���[�̈����.
005900      IF NOT ����̐���
006000        THEN DISPLAY ���[������s UPON ���b�Z�[�W�o�͐�
006100             SET �G���[���� TO TRUE.
006200*
006300*============================================================
006400*
006500  ���[�̈������N���[�Y����  SECTION.
006600      CLOSE ���[�̈����.
006700      IF NOT ����̐���
006800        THEN DISPLAY ���[������s UPON ���b�Z�[�W�o�͐�
006900             SET �G���[���� TO TRUE.
007000*
007100*============================================================
007200*
007300  ���[���o�͂���  SECTION.
007400*
007500    ���[��������鏀��.
007600      MOVE SPACE      TO DENPYO02.
007700      MOVE SPACE      TO ����̏��.
007800    ����f�[�^����������.
007900      MOVE �N   OF DENPYO01 TO �N OF DENPYO02.
008000      MOVE ��   OF DENPYO01 TO �� OF DENPYO02.
008100      MOVE ��   OF DENPYO01 TO �� OF DENPYO02.
008200      MOVE �j�� OF DENPYO01 TO �j�� OF DENPYO02.
008300      MOVE 1 TO ���i�̐�.
008400      PERFORM WITH TEST BEFORE UNTIL ���i�̐� > 5
008500       IF ���i�R�[�h OF DENPYO01(���i�̐�) = SPACE
008600         THEN EXIT PERFORM
008700       END-IF
008800       MOVE ���i�R�[�h OF DENPYO01(���i�̐�) TO ���i�R�[�h OF DENPYO02(���i�̐�)
008900       MOVE ���i��     OF DENPYO01(���i�̐�) TO ���i��     OF DENPYO02(���i�̐�)
009000       MOVE ����       OF DENPYO01(���i�̐�) TO ����       OF DENPYO02(���i�̐�)
009100       MOVE �P��       OF DENPYO01(���i�̐�) TO �P��       OF DENPYO02(���i�̐�)
009200       MOVE ���z       OF DENPYO01(���i�̐�) TO ���z       OF DENPYO02(���i�̐�)
009300       ADD  1        TO ���i�̐�
009400      END-PERFORM.
009500      MOVE ���z���v OF DENPYO01 TO ���z���v OF DENPYO02.
009600*
009700    ���[���������.
009800      MOVE "PW"       TO �������.
009900      MOVE "P001"     TO �ڍ׏��.
010000      WRITE DENPYO02.
010100      IF ����̐���
010200        THEN GO TO ���[�o�͏I��
010300        ELSE GO TO ���[������s����.
010400*
010500  ���[������s����.
010600     DISPLAY ���[������s ����̏�� UPON ���b�Z�[�W�o�͐�.
010700     SET �G���[���� TO TRUE.
010800*
010900  ���[�o�͏I��.
011000     EXIT.
