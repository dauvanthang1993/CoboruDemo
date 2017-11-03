000100* Copyright 1992-2015 FUJITSU LIMITED
000200 IDENTIFICATION DIVISION.
000300  PROGRAM-ID. SAMPLE3.
000400*
000500 ENVIRONMENT DIVISION.
000600  CONFIGURATION SECTION.
000700   SPECIAL-NAMES.
000800     SYSERR IS ���b�Z�[�W�o�͐�.
000900  INPUT-OUTPUT SECTION.
001000   FILE-CONTROL.
001100     SELECT ��ʂ̕\���� ASSIGN TO GS-DSPFILE
001200       SYMBOLIC DESTINATION IS "DSP"
001300       FORMAT            IS ��ʂ̖��O
001400       GROUP             IS ���ڌQ�̖��O
001500       SELECTED FUNCTION IS �A�e���V�����̎��
001600       PROCESSING MODE   IS �������
001700       FILE STATUS       IS ��ʂ̏��.
001800     SELECT ���i�}�X�^   ASSIGN TO DATAFILE
001900       FILE STATUS       IS ���i�}�X�^�̏��
002000       ORGANIZATION      IS INDEXED
002100       ACCESS MODE       IS RANDOM
002200       RECORD KEY        IS ���i�R�[�h OF ���i�}�X�^���R�[�h
002300       ALTERNATE RECORD KEY IS  ���i��  OF  ���i�}�X�^���R�[�h.
002400     SELECT OPTIONAL ����t�@�C�� ASSIGN TO "SALES"
002500       FILE STATUS       IS ����t�@�C���̏��
002600       ORGANIZATION      IS INDEXED
002700       ACCESS MODE       IS RANDOM
002800       RECORD KEY        IS ���i�R�[�h OF ���ヌ�R�[�h
002900                         WITH DUPLICATES
003000       ALTERNATE RECORD KEY IS  ����� OF ���ヌ�R�[�h
003100                         WITH DUPLICATES.
003200*
003300 DATA DIVISION.
003400  FILE SECTION.
003500   FD  ��ʂ̕\����.
003600      COPY  DENPYO01 OF XMDLIB.
003700   FD  ���i�}�X�^.
003800   01  ���i�}�X�^���R�[�h.
003900      COPY  SYOHINM.
004000   FD  ����t�@�C��.
004100      COPY  URIAGE.
004200*
004300  WORKING-STORAGE SECTION.
004400   77  ���i�̐��v               PIC 9(04)  VALUE 0.
004500   77  ���i�̐�                 PIC 9(04)  VALUE 1.
004600   77  ��ʂ̖��O               PIC X(08)  VALUE "DENPYO01".
004700   77  ���ڌQ�̖��O             PIC X(08).
004800   77  �A�e���V�����̎��       PIC X(04).
004900       88  �o�e�P�L�[                      VALUE "F001".
005000       88  �o�e�Q�L�[                      VALUE "F002".
005100       88  �o�e�R�L�[                      VALUE "F003".
005200       88  �o�e�S�L�[                      VALUE "F004".
005300   77  �������                 PIC XX.
005400   77  ��ʂ̏��               PIC XX.
005500       88  ��ʂ̃A�N�Z�X����              VALUE "00" THRU "04".
005600   77  ���i�}�X�^�̏��         PIC XX.
005700       88  ���i�}�X�^�̃A�N�Z�X����        VALUE "00".
005800       88  ���i�R�[�h���Ȃ�                VALUE "23".
005900   77  ����t�@�C���̏��       PIC XX.
006000       88  ����t�@�C���̃A�N�Z�X����      VALUE "00".
006100       88  ����t�@�C���̐V�K�쐬          VALUE "05".
006200   77  �����̌���               PIC XX.
006300       88  �`�[���͂��I������              VALUE "99".
006400       88  �G���[����                      VALUE "77".
006500       88  �C������                        VALUE "55".
006600       88  ����I��                        VALUE "00".
006700   01  ���t.
006800       03  �N����.
006900           05  �N                   PIC 9(04).
007000           05  ��                   PIC 9(02).
007100           05  ��                   PIC 9(02).
007200           05                       PIC 9(13).
007300       03  �j��                     PIC 9.
007400*  ����R�[�h
007500    77  �J�[�\���\��            PIC X      VALUE "C".
007600*  �F
007700    77  ��                      PIC X      VALUE "B".
007800*  ���b�Z�[�W�i�t�@�C���̃A�N�Z�X�Ɏ��s���܂����j
007900    77  �t�@�C���A�N�Z�X���s    PIC N(20)  VALUE
008000             NC"�t�@�C���̃A�N�Z�X�Ɏ��s���܂����D".
008100*  ���b�Z�[�W�i��ʂ̃A�N�Z�X�Ɏ��s���܂����j
008200    77  ��ʕ\�����s            PIC N(20)  VALUE
008300             NC"��ʂ̃A�N�Z�X�Ɏ��s���܂����D".
008400*  ���b�Z�[�W�i���i�R�[�h�Ɍ�肪����܂��j
008500    77  ���i�R�[�h���          PIC N(15)  VALUE
008600 		   NC"���i�R�[�h�Ɍ�肪����܂��D". 
008700*  ���b�Z�[�W�i���i�R�[�h����͂��Ă��������j
008800    77  ���i�R�[�h�Ȃ�          PIC N(15)  VALUE
008900             NC"���i�R�[�h����͂��Ă��������D".
009000*  ���b�Z�[�W�i���e���m�F���Ă��������j
009100    77  ���e�m�F                PIC N(15)  VALUE
009200             NC"���e���m�F���Ă�������".
009300*  ���b�Z�[�W�i���ʂ���͂��Ă�������)
009400    77  ���ʂȂ�                PIC N(15)  VALUE
009500             NC"���ʂ���͂��Ă��������D".
009600*
009700 PROCEDURE DIVISION.
009800*
009900     SET ����I�� TO TRUE.
010000*
010100     PERFORM �}�X�^�t�@�C�����I�[�v������.
010200      IF �G���[���� THEN GO TO �������I������.
010300*
010400     PERFORM ����t�@�C�����I�[�v������.
010500      IF �G���[���� THEN
010600        PERFORM  �}�X�^�t�@�C�����N���[�Y����
010700        GO TO �������I������
010800      END-IF.
010900*
011000     PERFORM UNTIL �`�[���͂��I������
011100*
011200      PERFORM ��ʂ̕\������I�[�v������
011300        IF �G���[���� THEN
011400          PERFORM  �}�X�^�t�@�C�����N���[�Y����
011500          PERFORM  ����t�@�C�����N���[�Y����
011600          GO TO �������I������
011700         END-IF
011800*
011900      PERFORM �`�[����͂���
012000        IF �G���[���� THEN
012100          EXIT PERFORM
012200         END-IF
012300*
012400     END-PERFORM.
012500*
012600     PERFORM ��ʂ̕\������N���[�Y����.
012700     PERFORM �}�X�^�t�@�C�����N���[�Y����.
012800     PERFORM ����t�@�C�����N���[�Y����.
012900*
013000  �������I������.
013100     EXIT PROGRAM.
013200*
013300*===============================================================
013400*
013500  �}�X�^�t�@�C�����I�[�v������  SECTION.
013600      OPEN INPUT ���i�}�X�^.
013700      IF NOT ���i�}�X�^�̃A�N�Z�X����
013800        THEN DISPLAY �t�@�C���A�N�Z�X���s UPON ���b�Z�[�W�o�͐� 
013900             SET �G���[���� TO TRUE.
014000*
014100*============================================================
014200*
014300  �}�X�^�t�@�C�����N���[�Y����  SECTION.
014400      CLOSE  ���i�}�X�^.
014500      IF NOT ���i�}�X�^�̃A�N�Z�X����
014600        THEN DISPLAY �t�@�C���A�N�Z�X���s UPON ���b�Z�[�W�o�͐�
014700             SET �G���[���� TO TRUE.
014800*
014900*===============================================================
015000*
015100  ����t�@�C�����I�[�v������  SECTION.
015200      OPEN I-O ����t�@�C��.
015300      IF NOT ����t�@�C���̃A�N�Z�X���� AND
015400         NOT ����t�@�C���̐V�K�쐬
015500        THEN DISPLAY �t�@�C���A�N�Z�X���s UPON ���b�Z�[�W�o�͐� 
015600             SET �G���[���� TO TRUE.
015700*
015800*============================================================
015900*
016000  ����t�@�C�����N���[�Y����  SECTION.
016100      CLOSE  ����t�@�C��.
016200      IF NOT ����t�@�C���̃A�N�Z�X����
016300        THEN DISPLAY �t�@�C���A�N�Z�X���s UPON ���b�Z�[�W�o�͐�
016400             SET �G���[���� TO TRUE.
016500*
016600*
016700*============================================================
016800*
016900  ��ʂ̕\������I�[�v������  SECTION.
017000      OPEN I-O ��ʂ̕\����.
017100      IF NOT ��ʂ̃A�N�Z�X����
017200        THEN DISPLAY ��ʕ\�����s UPON ���b�Z�[�W�o�͐�
017300             SET �G���[���� TO TRUE.
017400*
017500*============================================================
017600*
017700  ��ʂ̕\������N���[�Y����  SECTION.
017800      CLOSE ��ʂ̕\����.
017900      IF NOT ��ʂ̃A�N�Z�X����
018000        THEN DISPLAY ��ʕ\�����s UPON ���b�Z�[�W�o�͐�
018100             SET �G���[���� TO TRUE.
018200*
018300*============================================================
018400*
018500  �`�[����͂���  SECTION.
018600*
018700    ��ʂ�\�����鏀��.
018800      MOVE SPACE      TO DENPYO01.
018900      MOVE FUNCTION CURRENT-DATE TO �N����.
019000      MOVE �N   OF �N���� TO �N OF DENPYO01.
019100      MOVE ��   OF �N���� TO �� OF DENPYO01.
019200      MOVE ��   OF �N���� TO �� OF DENPYO01.
019300      ACCEPT �j��  OF  ���t   FROM  DAY-OF-WEEK.
019400      EVALUATE    �j�� OF ���t
019500        WHEN  1
019600          MOVE NC"��" TO �j�� OF DENPYO01
019700        WHEN  2
019800          MOVE NC"��" TO �j�� OF DENPYO01
019900        WHEN  3
020000          MOVE NC"��" TO �j�� OF DENPYO01
020100        WHEN  4
020200          MOVE NC"��" TO �j�� OF DENPYO01
020300        WHEN  5
020400          MOVE NC"��" TO �j�� OF DENPYO01
020500        WHEN  6
020600          MOVE NC"�y" TO �j�� OF DENPYO01
020700        WHEN  7
020800          MOVE NC"��" TO �j�� OF DENPYO01
020900      END-EVALUATE.
021000      MOVE SPACE      TO �A�e���V�����̎��.
021100      MOVE SPACE      TO �������.
021200      MOVE SPACE      TO ��ʂ̏��.
021300      MOVE SPACE      TO ���ڌQ�̖��O.
021400*
021500    ��ʂ�\������P.
021600      MOVE  "GRP001" TO ���ڌQ�̖��O.
021700      MOVE  "  "     TO �������.
021800      WRITE DENPYO01.
021900      IF NOT ��ʂ̃A�N�Z�X����
022000        THEN GO TO ��ʕ\�����s����.
022100*
022200    ��ʂ���f�[�^��ǂݍ��ނP.
022300      READ  ��ʂ̕\����.
022400      IF �o�e�R�L�[
022500        THEN SET   �`�[���͂��I������ TO TRUE
022600             GO TO �`�[���͏I��.
022700      IF �o�e�Q�L�[
022800        THEN GO TO ��ʂ�\�����鏀��.
022900      IF NOT ��ʂ̃A�N�Z�X����
023000        THEN GO TO ��ʕ\�����s����.
023100*
023200    ���i�R�[�h�̓��͂��`�F�b�N����.
023300     MOVE 1 TO ���i�̐�.
023400     IF ���i�R�[�h OF DENPYO01(���i�̐�) NOT = SPACE
023500       THEN GO TO ���i�R�[�h�̃`�F�b�N���s��.
023600      MOVE ���i�R�[�h�Ȃ� TO ���b�Z�[�W   OF DENPYO01.
023700      MOVE �J�[�\���\��
023800               TO EDIT-CURSOR OF ���i�R�[�h OF DENPYO01(���i�̐�).
023900*
024000    ��ʂ�\������Q.
024100      MOVE  "GRP001" TO ���ڌQ�̖��O.
024200      MOVE  "CL"     TO �������.
024300      WRITE DENPYO01.
024400      IF NOT ��ʂ̃A�N�Z�X����
024500        THEN GO TO ��ʕ\�����s����.
024600*
024700    ��ʂ���f�[�^��ǂݍ��ނQ.
024800      MOVE "NE"       TO �������.
024900      READ  ��ʂ̕\����.
025000      IF �o�e�R�L�[
025100        THEN SET   �`�[���͂��I������ TO TRUE
025200             GO TO �`�[���͏I��.
025300      IF �o�e�Q�L�[
025400        THEN GO TO ��ʂ�\�����鏀��.
025500      IF NOT ��ʂ̃A�N�Z�X����
025600        THEN GO TO ��ʕ\�����s����.
025700*
025800    �f�[�^�����͂��ꂽ�����ׂ�.
025900      IF ���i�R�[�h OF DENPYO01(���i�̐�) NOT = SPACE
026000        THEN GO TO ���i�R�[�h�̃`�F�b�N���s��.
026100      MOVE ���i�R�[�h�Ȃ� TO ���b�Z�[�W   OF DENPYO01.
026200      MOVE �J�[�\���\��
026300               TO EDIT-CURSOR OF ���i�R�[�h OF DENPYO01(���i�̐�).
026400      GO TO ��ʂ�\������Q.
026500*
026600    ���i�R�[�h�̃`�F�b�N���s��.
026700     PERFORM WITH TEST BEFORE UNTIL ���i�̐� > 5
026800       IF ���i�R�[�h OF DENPYO01(���i�̐�) = SPACE
026900         THEN SUBTRACT 1 FROM ���i�̐�
027000              EXIT PERFORM
027100         END-IF
027200       MOVE ���i�R�[�h OF DENPYO01(���i�̐�)
027300         TO ���i�R�[�h OF ���i�}�X�^���R�[�h
027400       READ ���i�}�X�^
027500       IF ���i�R�[�h���Ȃ�
027600         THEN MOVE ���i�R�[�h��� TO ���b�Z�[�W   OF DENPYO01
027700              MOVE �J�[�\���\��
027800               TO EDIT-CURSOR OF ���i�R�[�h OF DENPYO01(���i�̐�)
027900              GO TO ��ʂ�\������Q
028000         END-IF
028100       MOVE ���i�� OF ���i�}�X�^���R�[�h
028200         TO ���i�� OF DENPYO01(���i�̐�)
028300       MOVE �P��   OF ���i�}�X�^���R�[�h
028400         TO �P��   OF DENPYO01(���i�̐�)
028500       IF ���� OF DENPYO01(���i�̐�) = SPACE
028600         THEN MOVE ���ʂȂ�  TO ���b�Z�[�W   OF DENPYO01
028700              MOVE �J�[�\���\��
028800                TO EDIT-CURSOR OF ���� OF DENPYO01(���i�̐�)
028900              GO TO ��ʂ�\������Q
029000         END-IF
029100       COMPUTE ���z OF DENPYO01(���i�̐�) =
029200            ���� OF DENPYO01(���i�̐�) *
029300            �P�� OF ���i�}�X�^���R�[�h
029400*  ����������o��
029500       MOVE ���i�R�[�h OF DENPYO01(���i�̐�)
029600         TO ���i�R�[�h OF ���ヌ�R�[�h
029700       MOVE ����       OF DENPYO01(���i�̐�)
029800         TO ����       OF ���ヌ�R�[�h
029900       MOVE ���z       OF DENPYO01(���i�̐�)
030000         TO ���z       OF ���ヌ�R�[�h
030100       MOVE �N   OF �N���� TO �N OF ���ヌ�R�[�h
030200       MOVE ��   OF �N���� TO �� OF ���ヌ�R�[�h
030300       MOVE ��   OF �N���� TO �� OF ���ヌ�R�[�h
030400       WRITE ���ヌ�R�[�h
030500*
030600       ADD  1        TO ���i�̐�
030700      END-PERFORM.
030800*
030900    ���z�����v����.
031000     MOVE 0 TO ���z���v OF DENPYO01.
031100     PERFORM WITH TEST AFTER VARYING ���i�̐��v FROM 1 BY 1
031200             UNTIL ���i�̐��v = ���i�̐�
031300       ADD  ���z OF DENPYO01(���i�̐��v)
031400                         TO ���z���v OF DENPYO01
031500       END-PERFORM.
031600     MOVE ���e�m�F       TO ���b�Z�[�W   OF DENPYO01.
031700     MOVE �� TO EDIT-COLOR OF ���b�Z�[�W OF DENPYO01.
031800*
031900    ��ʂ�\������R.
032000      MOVE  "SCREEN" TO ���ڌQ�̖��O.
032100      MOVE  "  "     TO �������.
032200      WRITE DENPYO01.
032300      IF NOT ��ʂ̃A�N�Z�X����
032400        THEN GO TO ��ʕ\�����s����.
032500*
032600    ��ʂ���f�[�^��ǂݍ��ނR.
032700      MOVE "NE"       TO �������.
032800      READ  ��ʂ̕\����.
032900      IF �o�e�R�L�[
033000        THEN SET   �`�[���͂��I������ TO TRUE
033100             GO TO �`�[���͏I��.
033200      IF �o�e�Q�L�[
033300        THEN GO TO ��ʂ�\�����鏀��.
033400      IF �o�e�S�L�[
033500        THEN CALL "DENPYOU" USING DENPYO01
033600             MOVE SPACE TO ���b�Z�[�W OF DENPYO01
033700             GO TO ��ʂ�\������Q.
033800      IF NOT ��ʂ̃A�N�Z�X����
033900        THEN GO TO ��ʕ\�����s����.
034000*
034100  ��ʕ\�����s����.
034200     DISPLAY ��ʕ\�����s UPON ���b�Z�[�W�o�͐�.
034300     SET �G���[���� TO TRUE.
034400*
034500  �`�[���͏I��.
034600     EXIT.
034700
