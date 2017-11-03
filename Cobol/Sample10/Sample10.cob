000100* Copyright 1992-2015 FUJITSU LIMITED
000200 IDENTIFICATION DIVISION.
000300  PROGRAM-ID. SAMPLE10.
000400*
000500 ENVIRONMENT DIVISION.
000600  CONFIGURATION SECTION.
000700   SPECIAL-NAMES.
000800     SYSERR IS ���b�Z�[�W�o�͐�.
000900  INPUT-OUTPUT SECTION.
001000   FILE-CONTROL.
001100     SELECT ���[�̈���� ASSIGN TO PRTFILE
001200       FORMAT            IS ��`�̖̂��O
001300       GROUP             IS ���ڌQ�̖��O
001400       FILE STATUS       IS ���[�̏��
001500                            �ڍ׃R�[�h.
001600     SELECT ���i�}�X�^   ASSIGN TO DATAFILE
001700       FILE STATUS       IS ���i�}�X�^�̏��
001800       ORGANIZATION      IS INDEXED
001900       ACCESS MODE       IS SEQUENTIAL
002000       RECORD KEY        IS ���i�R�[�h OF ���i�}�X�^���R�[�h
002100       ALTERNATE RECORD KEY IS  ���i��  OF  ���i�}�X�^���R�[�h.
002200     SELECT ����t�@�C�� ASSIGN TO SALEFILE
002300       FILE STATUS       IS ����t�@�C���̏��
002400       ORGANIZATION      IS INDEXED
002500       ACCESS MODE       IS DYNAMIC
002600       RECORD KEY        IS ���i�R�[�h OF ���ヌ�R�[�h
002700                         WITH DUPLICATES
002800       ALTERNATE RECORD KEY IS  ����� OF ���ヌ�R�[�h
002900                         WITH DUPLICATES.
003000*
003100 DATA DIVISION.
003200  FILE SECTION.
003300   FD  ���[�̈����.
003400      COPY  SYUUKEI OF XMDLIB.
003500   FD  ���i�}�X�^.
003600   01  ���i�}�X�^���R�[�h.
003700      COPY  SYOHINM.
003800   FD  ����t�@�C��.
003900      COPY  URIAGE.
004000*
004100  WORKING-STORAGE SECTION.
004200   77  �v����                   PIC 9(08)  VALUE 0.
004300   77  �v���v                   PIC 9(13)  VALUE 0.
004400   77  �v���v                   PIC 9(13)  VALUE 0.
004500   77  �y�[�W�J�E���^           PIC 9(03)  VALUE 0.
004600   77  �s�J�E���^               PIC 9(03)  VALUE 0.
004700   77  ��`�̖̂��O             PIC X(08)  VALUE "SYUUKEI".
004800   77  ���ڌQ�̖��O             PIC X(08).
004900   77  ���[�̏��               PIC XX.
005000       88  ���[�̈������                  VALUE "00".
005100   77  �ڍ׃R�[�h               PIC X(04).
005200   77  ���i�}�X�^�̏��         PIC XX.
005300       88  ���i�}�X�^�̃A�N�Z�X����        VALUE "00".
005400   77  ����t�@�C���̏��       PIC XX.
005500       88  ����t�@�C���̃A�N�Z�X����      VALUE "00".
005600   77  �����̌���               PIC XX.
005700       88  �G���[����                      VALUE "77".
005800       88  ����I��                        VALUE "00".
005900   77  �s����̏��             PIC XX.
006000       88  ���i�f�[�^�̐؂芷��            VALUE "99".
006100       88  ���グ�f�[�^�p��                VALUE "00".
006200*  ���b�Z�[�W�i�t�@�C���̃A�N�Z�X�Ɏ��s���܂����j
006300    77  �t�@�C���A�N�Z�X���s    PIC N(20)  VALUE
006400             NC"�t�@�C���̃A�N�Z�X�Ɏ��s���܂����D".
006500*  ���b�Z�[�W�i���[�̈���Ɏ��s���܂����j
006600    77  ���[������s            PIC N(20)  VALUE
006700             NC"���[�̈���Ɏ��s���܂����D".
006800*
006900  CONSTANT SECTION.
007000   77  �y�[�W�w�b�_             PIC 9      VALUE 6.
007100   77  ����w�b�_               PIC 9      VALUE 5.
007200   77  �ڍו�                   PIC 9      VALUE 2.
007300   77  ����t�b�^               PIC 9      VALUE 5.
007400   77  �W�v�t�b�^               PIC 9      VALUE 4.
007500   77  �y�[�W�t�b�^�̊J�n�s     PIC 9(02)  VALUE 63.
007600*
007700 PROCEDURE DIVISION.
007800*
007900     SET ����I�� TO TRUE.
008000*
008100     PERFORM ���̓t�@�C�����I�[�v������.
008200      IF �G���[���� THEN GO TO �������I������.
008300*
008400     PERFORM ���[�̈������I�[�v������.
008500      IF �G���[���� THEN
008600        PERFORM  ���̓t�@�C�����N���[�Y����
008700        GO TO �������I������
008800      END-IF.
008900*
009000     PERFORM ���[���������.
009100*
009200     PERFORM ���[�̈������N���[�Y����.
009300     PERFORM ���̓t�@�C�����N���[�Y����.
009400*
009500  �������I������.
009600     EXIT PROGRAM.
009700*
009800*===============================================================
009900*
010000  ���̓t�@�C�����I�[�v������  SECTION.
010100      OPEN INPUT ���i�}�X�^ ����t�@�C��.
010200      IF NOT ���i�}�X�^�̃A�N�Z�X����
010300        THEN DISPLAY �t�@�C���A�N�Z�X���s UPON ���b�Z�[�W�o�͐� 
010400             SET �G���[���� TO TRUE.
010500      IF NOT ����t�@�C���̃A�N�Z�X����
010600        THEN PERFORM �}�X�^�t�@�C�����N���[�Y����
010700             DISPLAY �t�@�C���A�N�Z�X���s UPON ���b�Z�[�W�o�͐� 
010800             SET �G���[���� TO TRUE.
010900*
011000*============================================================
011100*
011200  �}�X�^�t�@�C�����N���[�Y����  SECTION.
011300      CLOSE  ���i�}�X�^.
011400      IF NOT ���i�}�X�^�̃A�N�Z�X����
011500        THEN DISPLAY �t�@�C���A�N�Z�X���s UPON ���b�Z�[�W�o�͐�
011600             SET �G���[���� TO TRUE.
011700*
011800*===============================================================
011900*
012000  ���̓t�@�C�����N���[�Y����  SECTION.
012100      CLOSE  ���i�}�X�^ ����t�@�C��.
012200      IF NOT ���i�}�X�^�̃A�N�Z�X���� OR
012300         NOT ����t�@�C���̃A�N�Z�X����
012400        THEN DISPLAY �t�@�C���A�N�Z�X���s UPON ���b�Z�[�W�o�͐�
012500             SET �G���[���� TO TRUE.
012600*
012700*
012800*============================================================
012900*
013000  ���[�̈������I�[�v������  SECTION.
013100      OPEN OUTPUT ���[�̈����.
013200      IF NOT ���[�̈������
013300        THEN DISPLAY ���[������s UPON ���b�Z�[�W�o�͐�
013400             SET �G���[���� TO TRUE.
013500*
013600*============================================================
013700*
013800  ���[�̈������N���[�Y����  SECTION.
013900      CLOSE ���[�̈����.
014000      IF NOT ���[�̈������
014100        THEN DISPLAY ���[������s UPON ���b�Z�[�W�o�͐�
014200             SET �G���[���� TO TRUE.
014300*
014400*============================================================
014500*
014600  ���[���������  SECTION.
014700     MOVE ZERO       TO �v���v.
014800*
014900    �y�[�W�̐擪.
015000     PERFORM �y�[�W�w�b�_���������.
015100*
015200   ���i�f�[�^��ǂݍ���.
015300     READ ���i�}�X�^ NEXT
015400       AT END
015500         PERFORM �W�v���������
015600         PERFORM �y�[�W�t�b�^���������
015700         GO TO ���[����I��
015800     END-READ.
015900     START ����t�@�C�� FIRST RECORD
016000       INVALID KEY GO TO ���i�f�[�^��ǂݍ���
016100     END-START.
016200     MOVE ���i�R�[�h OF ���i�}�X�^���R�[�h
016300       TO ���i�R�[�h OF ���ヌ�R�[�h.
016400     START ����t�@�C��
016500       KEY IS = ���i�R�[�h OF ���ヌ�R�[�h
016600       INVALID KEY GO TO ���i�f�[�^��ǂݍ���
016700     END-START.
016800*
016900   ����w�b�_���������.
017000     IF �s�J�E���^ >= �y�[�W�t�b�^�̊J�n�s -
017100        (����w�b�_ + �ڍו� + ����t�b�^) THEN
017200       PERFORM �y�[�W�t�b�^���������
017300       PERFORM �y�[�W�w�b�_���������
017400     END-IF.
017500     MOVE  "CH1"     TO ���ڌQ�̖��O.
017600     MOVE ���i�R�[�h OF ���i�}�X�^���R�[�h
017700       TO ���i�R�[�h OF SYUUKEI.
017800     MOVE ���i��     OF ���i�}�X�^���R�[�h
017900       TO ���i��     OF SYUUKEI.
018000     MOVE �P��       OF ���i�}�X�^���R�[�h
018100       TO �P��       OF SYUUKEI.
018200     WRITE SYUUKEI.
018300     IF NOT ���[�̈������
018400       THEN GO TO ���[������s����
018500     END-IF.
018600     ADD  ����w�b�_ TO �s�J�E���^.
018700     MOVE ZERO       TO �v���� �v���v.
018800     READ ����t�@�C��.
018900     SET ���グ�f�[�^�p�� TO TRUE.
019000     PERFORM WITH TEST BEFORE UNTIL
019100       �s�J�E���^ >= �y�[�W�t�b�^�̊J�n�s - (����t�b�^ + �ڍו�)
019200*  �ڍו����������
019300       MOVE  "DE"      TO ���ڌQ�̖��O
019400       MOVE �����     OF ���ヌ�R�[�h
019500         TO �󒍓�     OF SYUUKEI
019600       MOVE ����       OF ���ヌ�R�[�h
019700         TO ����       OF SYUUKEI
019800       MOVE ���z       OF ���ヌ�R�[�h
019900         TO ���グ     OF SYUUKEI
020000       WRITE SYUUKEI
020100       IF NOT ���[�̈������
020200         THEN GO TO ���[������s����
020300       END-IF
020400       ADD �ڍו�               TO �s�J�E���^
020500       ADD ���� OF ���ヌ�R�[�h TO �v����
020600       ADD ���z OF ���ヌ�R�[�h TO �v���v
020700       READ ����t�@�C�� NEXT
020800         AT END
020900           SET ���i�f�[�^�̐؂芷�� TO TRUE
021000           EXIT PERFORM
021100       END-READ
021200       IF ���i�R�[�h OF ���ヌ�R�[�h NOT =
021300          ���i�R�[�h OF ���i�}�X�^���R�[�h
021400         SET ���i�f�[�^�̐؂芷�� TO TRUE
021500         EXIT PERFORM
021600       END-IF
021700     END-PERFORM.
021800*
021900   ����t�b�^���������.
022000     MOVE  "CF1"     TO ���ڌQ�̖��O
022100     MOVE �v����     TO ���ʏ��v   OF SYUUKEI
022200     MOVE �v���v     TO ���グ���v OF SYUUKEI
022300     WRITE SYUUKEI
022400     IF NOT ���[�̈������
022500       THEN GO TO ���[������s����
022600     END-IF
022700     ADD �v���v      TO �v���v
022800     ADD ����t�b�^  TO �s�J�E���^
022900     IF �s�J�E���^ >= �y�[�W�t�b�^�̊J�n�s - �ڍו� THEN
023000       PERFORM �y�[�W�t�b�^���������
023100       PERFORM �y�[�W�w�b�_���������
023200       IF ���グ�f�[�^�p�� THEN
023300         GO TO ����w�b�_���������
023400       END-IF
023500     END-IF
023600*
023700     GO TO ���i�f�[�^��ǂݍ���.
023800*
023900 �y�[�W�w�b�_���������.
024000     INITIALIZE SYUUKEI.
024100     MOVE  "PH"     TO ���ڌQ�̖��O.
024200     WRITE SYUUKEI AFTER ADVANCING PAGE.
024300     IF NOT ���[�̈������
024400       THEN GO TO ���[������s����.
024500     MOVE �y�[�W�w�b�_ TO �s�J�E���^.
024600     ADD  1            TO �y�[�W�J�E���^.
024700*
024800  �y�[�W�w�b�_���������I��.
024900     EXIT.
025000*
025100  �y�[�W�t�b�^���������.
025200     MOVE  "PF"     TO ���ڌQ�̖��O.
025300     MOVE �y�[�W�J�E���^ TO �y�[�W�� OF SYUUKEI.
025400     WRITE SYUUKEI.
025500     IF NOT ���[�̈������
025600       THEN GO TO ���[������s����
025700     END-IF.
025800*
025900  �y�[�W�t�b�^���������I��.
026000     EXIT.
026100*
026200  �W�v���������.
026300     MOVE  "CF2"    TO ���ڌQ�̖��O.
026400     MOVE �v���v    TO ���v OF SYUUKEI.
026500     WRITE SYUUKEI.
026600     IF NOT ���[�̈������
026700       THEN GO TO ���[������s����
026800     END-IF.
026900*
027000  �W�v���������I��.
027100     EXIT.
027200*
027300  ���[������s����.
027400     DISPLAY ���[������s UPON ���b�Z�[�W�o�͐�.
027500     SET �G���[���� TO TRUE.
027600*
027700  ���[����I��.
027800     EXIT.
027900
