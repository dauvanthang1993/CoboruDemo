000100*========================================================================
000200*�@�\����N���X
000300*                                   �|�T���v���v���O�����u��c���\��v�|
000400*
000500*�@�@�\����ɂ��ČŗL�ȃf�[�^�y�у��\�b�h�����B
000600*
000700*�@�Z�p���N���X
000800*�@�@�P�jFJBASE
000900*
001000*�@�Z�Q�ƃN���X
001100*�@�@�P�jList
001200*�@�@�Q�j���X�g�C�e���[�^
001300*�@�@�R�j�G���[�N���X
001400*
001500*  ���t�@�N�g���f�[�^
001600*�@�@�P�j�\�񃊃X�g�I�u�W�F�N�g�@�|�@OBJECT REFERENCE List
001700*�@�@�Q�j�\��ԍ��ő�l�@�@�@�@�@�|�@PIC S9(4) COMP-5
001800*�@�@�R�j�\��f�[�^���@�@�@�@�@�|�@PIC 9(8)  BINARY
001900*
002000*�@�Z�I�u�W�F�N�g�f�[�^
002100*�@�@�P�j�\��f�[�^�@�@�@�@�@�@�@�|�@TYPE �\�񃊃X�g
002200*
002300*�@�Z�t�@�N�g�����\�b�h
002400*�@�@�P�j�\��f�[�^�̐���
002500*�@�@�Q�j�\��f�[�^�̍폜
002600*�@�@�R�j�\��f�[�^�̌���
002700*�@�@�S�j�\��f�[�^���̎Q��
002800*�@�@�T�j�\�񃊃X�g�I�u�W�F�N�g�̎Q��
002900*
003000*�@�Z�I�u�W�F�N�g���\�b�h
003100*�@�@�P�j�\��f�[�^�̐ݒ�
003200*�@�@�Q�j�\��f�[�^�̎Q��
003300*
003400*            Copyright 1999-2015 FUJITSU LIMITED
003500*========================================================================
003600 IDENTIFICATION  DIVISION.
003700 CLASS-ID.   �\����N���X  INHERITS FJBASE.
003800 ENVIRONMENT     DIVISION.
003900 CONFIGURATION   SECTION.
004000  SPECIAL-NAMES.
004100     SYMBOLIC CONSTANT
004200     COPY R_CONST.
004300     .
004400 REPOSITORY.
004500     CLASS FJBASE
004600     CLASS List
004700     CLASS ���X�g�C�e���[�^
004800     CLASS �G���[�N���X
004900     .
005000 FACTORY.
005100 DATA            DIVISION.
005200 BASED-STORAGE   SECTION.
005300  COPY RSVINFO.
005400 WORKING-STORAGE SECTION.
005500  01 �\�񃊃X�g�I�u�W�F�N�g           OBJECT REFERENCE List.
005600  01 �\��ԍ��ő�l                   PIC S9(4) COMP-5.
005700  01 �\��f�[�^��                   PIC  9(8) BINARY.
005800 PROCEDURE       DIVISION.
005900*========================================================================
006000*�@�\��f�[�^�̐������\�b�h
006100*
006200*�@�@�\�񃊃X�g�I�u�W�F�N�g��NULL�Ȃ�΁A�\�񃊃X�g�I�u�W�F�N�g�𐶐�����B
006300*�@�@�p�����^�œn���ꂽ�\��f�[�^�����\��I�u�W�F�N�g�𐶐����A�\�񃊃X
006400*�@�g�ɓo�^����B
006500*�@�@�\��f�[�^�����{�P����B
006600*
006700*�@�Z���́F�\��f�[�^ (TYPE �\�񃊃X�g)
006800*�@�Z�o�́F�\��I�u�W�F�N�g�iOBJECT REFERENCE SELF)
006900*========================================================================
007000 METHOD-ID.  �\��f�[�^�̐���.
007100 DATA            DIVISION.
007200 WORKING-STORAGE SECTION.
007300 LINKAGE         SECTION.
007400  01 �k�|�\��f�[�^                   TYPE �\�񃊃X�g. 
007500  01 �k�|�\��I�u�W�F�N�g             OBJECT REFERENCE SELF.
007600 PROCEDURE       DIVISION
007700                    USING             �k�|�\��f�[�^
007800                    RETURNING         �k�|�\��I�u�W�F�N�g.
007900*
008000*�@�\�񃊃X�g�I�u�W�F�N�g��NULL�̎��A�\�񃊃X�g�I�u�W�F�N�g�𐶐����A�\��
008100*�@�f�[�^������ї\��ԍ��ő�l�� 0��ݒ肷��B
008200*
008300     IF �\�񃊃X�g�I�u�W�F�N�g = NULL THEN
008400       MOVE  0                    TO  �\��ԍ��ő�l
008500       MOVE  0                    TO  �\��f�[�^��
008600       SET �\�񃊃X�g�I�u�W�F�N�g TO  List :: "NEW"
008700     END-IF
008800*
008900*�@�\��ԍ����ݒ肳��Ă���ꍇ�i�d�w�b�d�k�V�[�g���畜���������j�A���ݕ�
009000*�@�����Ă���\��ԍ��ő�l�Ɣ�r���A�傫������\��ԍ��ő�l�Ƃ��Ēu����
009100*  ����B�\��ԍ����ݒ肳��Ă��Ȃ��ꍇ�i�V�K�\��̏ꍇ�j�A�\��ԍ��ő�l
009200*  �ɂP�𑫂�������\��ԍ��Ƃ���B
009300*
009400     IF �\��ԍ� > 0 THEN
009500       COMPUTE �\��ԍ��ő�l = FUNCTION MAX (�\��ԍ��ő�l �\��ԍ�)
009600     ELSE
009700       COMPUTE �\��ԍ��ő�l = �\��ԍ��ő�l + 1
009800       MOVE    �\��ԍ��ő�l     TO  �\��ԍ�
009900     END-IF
010000*
010100*�@�\��I�u�W�F�N�g�𐶐����A�\��f�[�^�����{�P����B
010200*
010300     COMPUTE �\��f�[�^��   = �\��f�[�^�� + 1
010400     SET  �k�|�\��I�u�W�F�N�g    TO  SELF :: "NEW"
010500*
010600*�@�\��f�[�^��ݒ肷��B
010700*
010800     INVOKE  �k�|�\��I�u�W�F�N�g     "�\��f�[�^�̐ݒ�" 
010900	                                    USING BY CONTENT �k�|�\��f�[�^
011000     INVOKE  �\�񃊃X�g�I�u�W�F�N�g   "Element-PutLast"
011100                                      USING BY CONTENT �k�|�\��I�u�W�F�N�g
011200 END METHOD �\��f�[�^�̐���.
011300*========================================================================
011400*�@�\��f�[�^�̍폜���\�b�h
011500*
011600*�@�@�w�肳�ꂽ�\��f�[�^���폜����B���̎��A�\��f�[�^�����|�P����B
011700*
011800*�@�Z���́F�\��I�u�W�F�N�g (OBJECT REFERENCE �\����N���X)
011900*�@�Z�o�́F�Ȃ�
012000*========================================================================
012100 METHOD-ID.  �\��f�[�^�̍폜.
012200 DATA            DIVISION.
012300 WORKING-STORAGE SECTION.
012400  01  ���ʃI�u�W�F�N�g                OBJECT REFERENCE.
012500  01  �C���f�b�N�X�ԍ�                PIC 9(8) BINARY.
012600  01  ���A�l                          PIC 9(4) BINARY.
012700 LINKAGE         SECTION.
012800  01  �k�|�\��I�u�W�F�N�g            OBJECT REFERENCE �\����N���X.
012900 PROCEDURE       DIVISION
013000                    USING             �k�|�\��I�u�W�F�N�g.
013100 DECLARATIVES.
013200 ERR SECTION.
013300     USE AFTER EXCEPTION �G���[�N���X
013400     INVOKE EXCEPTION-OBJECT          "�\��I�u�W�F�N�g�폜�G���[".
013500 END DECLARATIVES. 
013600*
013700*�@�w�肳�ꂽ�\��I�u�W�F�N�g�̈ʒu�i�C���f�b�N�X�ԍ��j���擾
013800*
013900     SET    ���ʃI�u�W�F�N�g          TO  �k�|�\��I�u�W�F�N�g
014000     INVOKE �\�񃊃X�g�I�u�W�F�N�g    "ElementNo-Get"
014100                                      USING            ���ʃI�u�W�F�N�g
014200                                      RETURNING        �C���f�b�N�X�ԍ�
014300*
014400*�@�w�肳�ꂽ�\��I�u�W�F�N�g��������Ȃ�������A�G���[���o�͂���B
014500*�@�w�肳�ꂽ�\��I�u�W�F�N�g������������A�\�񃊃X�g����\��I�u�W�F�N
014600*�@�g���폜����B�폜�Ɏ��s������G���[���o�͂���B
014700*
014800     IF �C���f�b�N�X�ԍ� NOT = 0 THEN
014900       INVOKE �\�񃊃X�g�I�u�W�F�N�g  "Remove-At"
015000                                      USING            �C���f�b�N�X�ԍ�
015100                                      RETURNING        ���A�l
015200       IF ���A�l NOT = 0 THEN
015300         COMPUTE �\��f�[�^�� = �\��f�[�^�� - 1
015400       ELSE
015500         RAISE  �G���[�N���X :: "NEW"
015600       END-IF
015700     ELSE
015800       RAISE    �G���[�N���X :: "NEW"
015900     END-IF
016000 END METHOD �\��f�[�^�̍폜.
016100*========================================================================
016200*�@�\��f�[�^�̌������\�b�h
016300*
016400*�@�@�\��Җ����L�[�ɁA�\��f�[�^����������B
016500*    ���j�f�t�H���g�ł́A�����������ʂ��T�܂ł����i�[�ł��Ȃ��B�i�[�ł�
016600*�@�鐔�𑝂₵�����ꍇ�́AR_CONST.CBL�ɒ�`����Ă���RSV-MAX�̒l���C����
016700*�@���邱�ƁB
016800*
016900*�@�Z���́F�\��Җ� (PIC X(20))
017000*�@�Z�o�́F�\���� (�W�c����)
017100*========================================================================
017200 METHOD-ID.  �\��f�[�^�̌���.
017300 DATA            DIVISION.
017400 WORKING-STORAGE SECTION.
017500  01  �C�e���[�^�I�u�W�F�N�g          OBJECT REFERENCE ���X�g�C�e���[�^.
017600  01  ���ʃI�u�W�F�N�g                OBJECT REFERENCE.
017700  01  �\��I�u�W�F�N�g                OBJECT REFERENCE �\����N���X.
017800  01  �\��f�[�^                      TYPE �\�񃊃X�g.
017900 LINKAGE         SECTION.
018000  01  �k�|�\��Җ�                    PIC X(20).
018100  01  �k�|�\����.
018200    02 �k�|������                   PIC 9(8) BINARY.
018300    02 �k�|�\��f�[�^                 TYPE �\�񃊃X�g OCCURS RSV-MAX.
018400 PROCEDURE       DIVISION
018500                    USING             �k�|�\��Җ�
018600                    RETURNING         �k�|�\����.
018700 DECLARATIVES.
018800 ERR SECTION.
018900     USE AFTER EXCEPTION �G���[�N���X
019000     INVOKE EXCEPTION-OBJECT          "�\���񌟍��G���[".
019100 END DECLARATIVES. 
019200*
019300*�@�������̏�����
019400*
019500     MOVE    0                    TO  �k�|������
019600*
019700*�@�\�񃊃X�g�ɓo�^���ꂽ�\��I�u�W�F�N�g�����Ɏ��o���A�\��Җ�����v��
019800*�@��\��I�u�W�F�N�g����������B
019900*
020000     INVOKE  ���X�g�C�e���[�^         "�C�e���[�^����"
020100                                      USING BY CONTENT �\�񃊃X�g�I�u�W�F�N�g
020200                                      RETURNING        �C�e���[�^�I�u�W�F�N�g
020300     INVOKE  �C�e���[�^�I�u�W�F�N�g   "�擪�v�f�ݒ�"
020400     PERFORM TEST BEFORE 
020500      UNTIL �C�e���[�^�I�u�W�F�N�g :: "�v�f�m�F" = ZOFF
020600       INVOKE  �C�e���[�^�I�u�W�F�N�g "���݂̗v�f�擾"
020700                                      RETURNING        ���ʃI�u�W�F�N�g
020800       SET    �\��I�u�W�F�N�g    TO  ���ʃI�u�W�F�N�g AS �\����N���X
020900       INVOKE �\��I�u�W�F�N�g        "�\��f�[�^�̎Q��"
021000                                      RETURNING        �\��f�[�^
021100       IF  �\��Җ� OF �\��f�[�^ =   �k�|�\��Җ� THEN
021200         COMPUTE  �k�|������    =   �k�|������ + 1
021300         MOVE  �\��f�[�^         TO  �k�|�\��f�[�^(�k�|������)
021400         IF  �k�|������ >= RSV-MAX  THEN
021500           SET  �C�e���[�^�I�u�W�F�N�g  TO  NULL
021600           EXIT METHOD
021700         END-IF
021800       END-IF
021900       INVOKE �C�e���[�^�I�u�W�F�N�g  "���v�f�ݒ�"
022000     END-PERFORM
022100     SET  �C�e���[�^�I�u�W�F�N�g  TO  NULL
022200*
022300*�@��v�����񂪂P���Ȃ������ꍇ�ɂ́A�G���[���b�Z�[�W���o�͂���B
022400*
022500     IF �k�|������ <= 0 THEN
022600       RAISE  �G���[�N���X  :: "NEW"
022700     END-IF
022800 END METHOD �\��f�[�^�̌���.
022900*========================================================================
023000*�@�\��f�[�^���̎Q�ƃ��\�b�h
023100*
023200*�@�@�\��f�[�^�����擾����B
023300*
023400*  �����́F�Ȃ�
023500*�@�Z�o�́F�\��f�[�^�� (PIC 9(8) BINARY)
023600*========================================================================
023700 METHOD-ID.  �\��f�[�^���̎Q��.
023800 DATA            DIVISION.
023900 WORKING-STORAGE SECTION.
024000 LINKAGE         SECTION.
024100  01  �k�|�\��f�[�^��              PIC 9(8) BINARY.
024200 PROCEDURE       DIVISION
024300                    RETURNING         �k�|�\��f�[�^��.
024400     MOVE  �\��f�[�^��         TO  �k�|�\��f�[�^��
024500 END METHOD �\��f�[�^���̎Q��.
024600*========================================================================
024700*�@�\�񃊃X�g�I�u�W�F�N�g�̎Q�ƃ��\�b�h
024800*
024900*�@�@�\�񃊃X�g�I�u�W�F�N�g���擾����B
025000*
025100*  �����́F�Ȃ�
025200*�@�Z�o�́F�\�񃊃X�g�I�u�W�F�N�g (OBJECT REFRENCE List)
025300*========================================================================
025400 METHOD-ID.  �\�񃊃X�g�I�u�W�F�N�g�̎Q��.
025500 DATA            DIVISION.
025600 WORKING-STORAGE SECTION.
025700 LINKAGE         SECTION.
025800  01  �k�|�\�񃊃X�g�I�u�W�F�N�g      OBJECT REFERENCE List.
025900 PROCEDURE       DIVISION        	
026000                    RETURNING         �k�|�\�񃊃X�g�I�u�W�F�N�g.
026100     SET   �k�|�\�񃊃X�g�I�u�W�F�N�g TO  �\�񃊃X�g�I�u�W�F�N�g
026200 END METHOD �\�񃊃X�g�I�u�W�F�N�g�̎Q��.
026300 END FACTORY.
026400*
026500 OBJECT.
026600 DATA DIVISION.
026700 BASED-STORAGE   SECTION.
026800  COPY RSVINFO.
026900 WORKING-STORAGE SECTION.
027000  01  �\��f�[�^                  TYPE �\�񃊃X�g.
027100 PROCEDURE       DIVISION.
027200*========================================================================
027300*�@�\��f�[�^�̐ݒ胁�\�b�h
027400*
027500*�@�@�\��f�[�^��ݒ肷��B
027600*
027700*�@�Z���́F�\��f�[�^ (TYPE �\�񃊃X�g)
027800*�@�Z�o�́F�Ȃ�
027900*========================================================================
028000 METHOD-ID.  �\��f�[�^�̐ݒ�.
028100 DATA            DIVISION.
028200 LINKAGE         SECTION.
028300  01 �k�|�\��f�[�^                   TYPE  �\�񃊃X�g.
028400 PROCEDURE       DIVISION
028500                    USING             �k�|�\��f�[�^.
028600     MOVE  �k�|�\��f�[�^         TO  �\��f�[�^
028700 END METHOD �\��f�[�^�̐ݒ�.
028800*========================================================================
028900*�@�\��f�[�^�̎Q�ƃ��\�b�h
029000*
029100*�@�@�\��f�[�^���擾����B
029200*
029300*�@�Z���́F�Ȃ�
029400*�@�Z�o�́F�\��f�[�^ (TYPE �\�񃊃X�g)
029500*========================================================================
029600 METHOD-ID.  �\��f�[�^�̎Q��.
029700 DATA            DIVISION.
029800 LINKAGE         SECTION.
029900  01 �k�|�\��f�[�^                   TYPE �\�񃊃X�g.
030000 PROCEDURE       DIVISION
030100                    RETURNING         �k�|�\��f�[�^.
030200     MOVE   �\��f�[�^            TO  �k�|�\��f�[�^
030300 END METHOD �\��f�[�^�̎Q��.
030400 END OBJECT.
030500 END CLASS  �\����N���X.
