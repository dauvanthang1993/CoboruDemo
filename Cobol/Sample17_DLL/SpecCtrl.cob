000100*========================================================================
000200*�@�d�l�Ǘ��N���X
000300*                                   �|�T���v���v���O�����u��c���\��v�|
000400*
000500*�@�@�e��d�l���Ǘ����邽�߂̃��\�b�h�����B
000600*
000700*�@�Z�p���N���X
000800*�@�@�P�jFJBASE
000900*
001000*�@�Z�Q�ƃN���X
001100*�@�@�P�jList
001200*�@�@�Q�j�d�l�N���X
001300*�@�@�R�j���X�g�C�e���[�^
001400*�@�@�S�j�G���[�N���X
001500*
001600*�@�Z�I�u�W�F�N�g�f�[�^
001700*�@�@�P�j�d�l���@�@�@�@�@�@�@�@�|�@PIC 9(8) BINARY
001800*�@�@�Q�j�d�l���X�g�I�u�W�F�N�g�@�|�@OBJECT REFERENCE List
001900*�@�@�R�j�d�l�N���X�I�u�W�F�N�g  �|  OBJECT REFERENCE FACTORY OF �d�l�N���X
002000*
002100*�@�Z�I�u�W�F�N�g���\�b�h
002200*�@�@�P�j�������@�iINIT�j
002300*�@�@�Q�j�d�l�N���X�̐ݒ�
002400*�@�@�R�j�d�l���̎Q��
002500*�@�@�S�j�d�l���̍X�V
002600*  �@�T�j�d�l���̍폜
002700*�@�@�U�j�d�l���̒ǉ�
002800*�@�@�V�j�d�l���̌���
002900*�@�@�W�j�d�l���̎Q��
003000*�@�@�X�j�d�l���X�g�̎Q��
003100*
003200*            Copyright 1999-2015 FUJITSU LIMITED
003300*========================================================================
003400 IDENTIFICATION  DIVISION.
003500 CLASS-ID.   �d�l�Ǘ��N���X  INHERITS FJBASE.
003600 ENVIRONMENT     DIVISION.
003700 CONFIGURATION   SECTION.
003800 SPECIAL-NAMES.
003900     SYMBOLIC CONSTANT
004000     COPY R_CONST.
004100     .
004200 REPOSITORY.
004300     CLASS FJBASE
004400     CLASS List
004500     CLASS �d�l�N���X
004600     CLASS ���X�g�C�e���[�^
004700     CLASS �G���[�N���X
004800     .
004900*
005000 FACTORY.
005100 DATA            DIVISION.
005200 WORKING-STORAGE SECTION.
005300 PROCEDURE       DIVISION.
005400 END FACTORY.
005500*
005600 OBJECT.
005700 DATA DIVISION.
005800 BASED-STORAGE   SECTION.
005900  COPY SPECINFO.
006000 WORKING-STORAGE SECTION.
006100  01 �d�l��                         PIC 9(8) BINARY.
006200  01 �d�l���X�g�I�u�W�F�N�g           OBJECT REFERENCE List.
006300  01 �d�l�N���X�I�u�W�F�N�g           OBJECT REFERENCE FACTORY OF �d�l�N���X.
006400 PROCEDURE       DIVISION.
006500*========================================================================
006600*�@���������\�b�h�iINIT�j
006700*
006800*�@�@�d�l����0���A�d�l���X�g�I�u�W�F�N�g��NULL��ݒ肷��B
006900*
007000*�@�Z���́F�Ȃ�
007100*�@�Z�o�́F�Ȃ�
007200*========================================================================
007300 METHOD-ID.  INIT  OVERRIDE.
007400 DATA            DIVISION.
007500 WORKING-STORAGE SECTION.
007600 LINKAGE         SECTION.
007700 PROCEDURE       DIVISION.
007800     MOVE  0                      TO  �d�l��
007900     SET   �d�l���X�g�I�u�W�F�N�g TO  NULL
008000 END METHOD INIT.
008100*========================================================================
008200*�@�d�l�N���X�̐ݒ胁�\�b�h
008300*
008400*�@�@�d�l�N���X�I�u�W�F�N�g��ݒ肷��B
008500*
008600*�@�Z���́F�d�l�N���X�I�u�W�F�N�g (OBJECT REFERENCE FACTORY OF �d�l�N���X)
008700*�@�Z�o�́F�Ȃ�
008800*========================================================================
008900 METHOD-ID.  �d�l�N���X�̐ݒ�.
009000 DATA            DIVISION.
009100 WORKING-STORAGE SECTION.
009200 LINKAGE         SECTION.
009300  01  �k�|�d�l�N���X�I�u�W�F�N�g      OBJECT REFERENCE FACTORY OF �d�l�N���X.
009400 PROCEDURE       DIVISION
009500                    USING             �k�|�d�l�N���X�I�u�W�F�N�g.
009600     SET  �d�l�N���X�I�u�W�F�N�g  TO  �k�|�d�l�N���X�I�u�W�F�N�g.
009700 END METHOD �d�l�N���X�̐ݒ�.
009800*========================================================================
009900*�@�d�l���̎Q�ƃ��\�b�h
010000*
010100*�@�@�d�l�����L�[�ɁA�d�l�I�u�W�F�N�g���擾����B�Y�������񂪌������
010200*�@���ꍇ�́A�G���[�R�[�h��ݒ肷��B
010300*
010400*�@�Z���́F�d�l�f�[�^ (TYPE �d�l���X�g)
010500*�@�Z�o�́F�����R�[�h (PIC  S9(8) BINARY)
010600*========================================================================
010700 METHOD-ID.  �d�l���̎Q��.
010800 DATA            DIVISION.
010900 WORKING-STORAGE SECTION.
011000  01 �d�l�I�u�W�F�N�g                 OBJECT REFERENCE �d�l�N���X.
011100 LINKAGE         SECTION.
011200  01 �k�|�d�l�f�[�^                   TYPE �d�l���X�g.
011300  01 �k�|�����R�[�h                   PIC  S9(8) BINARY.
011400 PROCEDURE       DIVISION
011500                    USING             �k�|�d�l�f�[�^
011600                    RETURNING         �k�|�����R�[�h.
011700 DECLARATIVES.
011800 ERR SECTION.
011900     USE AFTER EXCEPTION �G���[�N���X
012000     INVOKE EXCEPTION-OBJECT          "�d�l�����G���[".
012100 END DECLARATIVES.  
012200*
012300*�@�d�l�����L�[�Ɏd�l�I�u�W�F�N�g����������B
012400*
012500     INVOKE  SELF                     "�d�l���̌���"
012600                                      USING BY CONTENT �d�l�� 
012700                                      RETURNING        �d�l�I�u�W�F�N�g
012800*
012900*�@�Y������d�l�I�u�W�F�N�g��������Ȃ������ꍇ�A�G���[��ݒ肷��B
013000*�@�Y������d�l�I�u�W�F�N�g�����������ꍇ�A�d�l�f�[�^���擾����B
013100*
013200     IF �d�l�I�u�W�F�N�g = NULL THEN
013300       MOVE  ERROR-ON             TO  �k�|�����R�[�h
013400       RAISE �G���[�N���X :: "NEW"
013500     ELSE
013600       MOVE  ERROR-OFF            TO  �k�|�����R�[�h
013700       MOVE  �d�l�I�u�W�F�N�g :: "�d�l�Q��"  
013800                                  TO  �k�|�d�l�f�[�^
013900     END-IF
014000 END METHOD �d�l���̎Q��.
014100*========================================================================
014200*�@�d�l���̍X�V���\�b�h
014300*
014400*�@�@�d�l�����L�[�ɁA�d�l�I�u�W�F�N�g���擾�E�X�V����B�Y�������񂪌���
014500*�@����Ȃ��ꍇ�́A�G���[�R�[�h��ݒ肷��B
014600*
014700*�@�Z���́F�d�l�f�[�^ (TYPE �d�l���X�g)
014800*�@�Z�o�́F�����R�[�h (PIC  S9(8) BINARY)
014900*========================================================================
015000 METHOD-ID.  �d�l���̍X�V.
015100 DATA            DIVISION.
015200 WORKING-STORAGE SECTION.
015300  01 �d�l�I�u�W�F�N�g                 OBJECT REFERENCE �d�l�N���X.
015400 LINKAGE         SECTION.
015500  01 �k�|�d�l�f�[�^                   TYPE �d�l���X�g.
015600  01 �k�|�����R�[�h                   PIC S9(8) BINARY.
015700 PROCEDURE       DIVISION
015800                    USING             �k�|�d�l�f�[�^
015900                    RETURNING         �k�|�����R�[�h.
016000 DECLARATIVES.
016100 ERR SECTION.
016200     USE AFTER EXCEPTION �G���[�N���X
016300     INVOKE EXCEPTION-OBJECT          "�d�l�����G���[".
016400 END DECLARATIVES.  
016500*
016600* �d�l�����L�[�Ɏd�l�I�u�W�F�N�g����������B
016700*
016800     INVOKE  SELF                     "�d�l���̌���"
016900                                      USING BY CONTENT �d�l��
017000                                      RETURNING        �d�l�I�u�W�F�N�g
017100*
017200*�@�Y������d�l�I�u�W�F�N�g��������Ȃ������ꍇ�A�G���[��ݒ肷��B
017300*�@�Y������d�l�I�u�W�F�N�g�����������ꍇ�A�d�l�f�[�^��ݒ肷��B
017400*
017500     IF �d�l�I�u�W�F�N�g = NULL   THEN
017600       MOVE   ERROR-ON            TO  �k�|�����R�[�h
017700       RAISE  �G���[�N���X :: "NEW"
017800     ELSE
017900       MOVE   ERROR-OFF           TO  �k�|�����R�[�h
018000       INVOKE �d�l�I�u�W�F�N�g        "�d�l�ݒ�"
018100                                      USING            �k�|�d�l�f�[�^
018200     END-IF
018300 END METHOD �d�l���̍X�V.
018400*========================================================================
018500*�@�d�l���̍폜���\�b�h
018600*
018700*�@�@�d�l�����L�[�ɁA�d�l�I�u�W�F�N�g���폜����B�Y�������񂪌������
018800*�@���ꍇ�́A�G���[�R�[�h��ݒ肷��B
018900*�@�@�܂��A�d�l�����|�P����B
019000*
019100*�@�Z���́F�d�l�f�[�^ (TYPE �d�l���X�g)
019200*�@�Z�o�́F�����R�[�h (PIC  S9(8) BINARY)
019300*========================================================================
019400 METHOD-ID.  �d�l���̍폜.
019500 DATA            DIVISION.
019600 WORKING-STORAGE SECTION.
019700  01 ���ʃI�u�W�F�N�g                 OBJECT REFERENCE.
019800  01 �d�l�I�u�W�F�N�g                 OBJECT REFERENCE �d�l�N���X.
019900  01 �C���f�b�N�X�ԍ�                 PIC 9(8) BINARY.
020000 LINKAGE         SECTION.
020100  01 �k�|�d�l�f�[�^                   TYPE �d�l���X�g.
020200  01 �k�|�����R�[�h                   PIC S9(8) BINARY.
020300 PROCEDURE       DIVISION
020400                    USING             �k�|�d�l�f�[�^
020500                    RETURNING         �k�|�����R�[�h.
020600 DECLARATIVES.
020700 ERR SECTION.
020800     USE AFTER EXCEPTION �G���[�N���X
020900     INVOKE EXCEPTION-OBJECT          "�d�l�����G���[".
021000 END DECLARATIVES.  
021100*
021200*�@�d�l�����L�[�Ɏd�l�I�u�W�F�N�g����������B
021300*
021400     INVOKE SELF                      "�d�l���̌���"
021500                                      USING BY CONTENT �d�l��
021600                                      RETURNING        �d�l�I�u�W�F�N�g
021700*
021800*�@�Y������d�l�I�u�W�F�N�g��������Ȃ������ꍇ�A�G���[��ݒ肷��B
021900*�@�Y������d�l�I�u�W�F�N�g�����������ꍇ�A�폜�������s���B
022000*
022100     IF  �d�l�I�u�W�F�N�g = NULL THEN
022200       MOVE   ERROR-ON            TO  �k�|�����R�[�h
022300       RAISE �G���[�N���X :: "NEW"
022400     ELSE
022500       MOVE   ERROR-OFF           TO  �k�|�����R�[�h
022600       SET     ���ʃI�u�W�F�N�g   TO  �d�l�I�u�W�F�N�g
022700       INVOKE  �d�l���X�g�I�u�W�F�N�g "ElementNo-Get"
022800                                      USING            ���ʃI�u�W�F�N�g
022900                                      RETURNING        �C���f�b�N�X�ԍ�
023000       INVOKE  �d�l���X�g�I�u�W�F�N�g "Remove-At"
023100                                      USING            �C���f�b�N�X�ԍ�
023200       COMPUTE �d�l�� = �d�l�� - 1
023300     END-IF
023400 END METHOD �d�l���̍폜.
023500*========================================================================
023600*�@�d�l���̒ǉ����\�b�h
023700*
023800*�@�@�d�l���X�g�I�u�W�F�N�g��NULL�Ȃ�΁A���X�g�I�u�W�F�N�g�𐶐�����B
023900*�@�@�d�l�f�[�^�ɑ΂��Ďd�l�I�u�W�F�N�g�𐶐����A�d�l���X�g�I�u�W�F�N�g��
024000*�@�o�^����B
024100*�@�@�܂��A�d�l�����{�P����B
024200*
024300*�@�Z���́F�d�l�f�[�^ (TYPE �d�l���X�g)
024400*�@�Z�o�́F�Ȃ�
024500*========================================================================
024600 METHOD-ID.  �d�l���̒ǉ�.
024700 DATA            DIVISION.
024800 WORKING-STORAGE SECTION.
024900  01 �d�l�I�u�W�F�N�g                 OBJECT REFERENCE �d�l�N���X.
025000 LINKAGE         SECTION.
025100  01 �k�|�d�l�f�[�^                   TYPE �d�l���X�g.
025200 PROCEDURE       DIVISION
025300                    USING             �k�|�d�l�f�[�^.
025400     IF   �d�l���X�g�I�u�W�F�N�g = NULL THEN
025500       SET �d�l���X�g�I�u�W�F�N�g TO  List :: "NEW"
025600     END-IF
025700*
025800     INVOKE �d�l�N���X�I�u�W�F�N�g    "NEW"   RETURNING   �d�l�I�u�W�F�N�g
025900     INVOKE �d�l�I�u�W�F�N�g          "�d�l�ݒ�"
026000                                       USING BY CONTENT   �k�|�d�l�f�[�^
026100     INVOKE �d�l���X�g�I�u�W�F�N�g    "Element-PutLast"
026200                                       USING BY CONTENT   �d�l�I�u�W�F�N�g
026300     COMPUTE �d�l�� = �d�l�� + 1
026400 END METHOD �d�l���̒ǉ�.
026500*========================================================================
026600*�@�d�l���̌������\�b�h
026700*
026800*�@�@�d�l�����L�[�ɁA�d�l�I�u�W�F�N�g����������B
026900*
027000*  �����́F�d�l�� (PIC X(4))
027100*�@�Z�o�́F�d�l�I�u�W�F�N�g (OBJECT REFERENCE �d�l�N���X)
027200*========================================================================
027300 METHOD-ID.  �d�l���̌���.
027400 DATA            DIVISION.
027500 WORKING-STORAGE SECTION.
027600  01  �d�l�I�u�W�F�N�g                OBJECT REFERENCE �d�l�N���X.
027700  01  �d�l�f�[�^                      TYPE �d�l���X�g.
027800  01  �C�e���[�^�I�u�W�F�N�g          OBJECT REFERENCE ���X�g�C�e���[�^.
027900  01  ���ʃI�u�W�F�N�g                OBJECT REFERENCE.
028000 LINKAGE         SECTION.
028100  01  �k�|�d�l��                      PIC X(4).
028200  01  �k�|�d�l�I�u�W�F�N�g            OBJECT REFERENCE �d�l�N���X.
028300 PROCEDURE       DIVISION
028400                    USING             �k�|�d�l��
028500                    RETURNING         �k�|�d�l�I�u�W�F�N�g.
028600     INVOKE  ���X�g�C�e���[�^         "�C�e���[�^����"
028700                                      USING BY CONTENT �d�l���X�g�I�u�W�F�N�g
028800                                      RETURNING        �C�e���[�^�I�u�W�F�N�g
028900     INVOKE  �C�e���[�^�I�u�W�F�N�g   "�擪�v�f�ݒ�"
029000     PERFORM TEST BEFORE 
029100      UNTIL �C�e���[�^�I�u�W�F�N�g :: "�v�f�m�F" = ZOFF
029200       INVOKE �C�e���[�^�I�u�W�F�N�g  "���݂̗v�f�擾"
029300                                      RETURNING        ���ʃI�u�W�F�N�g
029400       SET    �d�l�I�u�W�F�N�g    TO  ���ʃI�u�W�F�N�g AS �d�l�N���X
029500       INVOKE �d�l�I�u�W�F�N�g        "�d�l�Q��"
029600                                      RETURNING        �d�l�f�[�^
029700       IF  �d�l�� OF �d�l�f�[�^  = �k�|�d�l�� THEN
029800         SET  �k�|�d�l�I�u�W�F�N�g    TO  �d�l�I�u�W�F�N�g
029900         SET  �C�e���[�^�I�u�W�F�N�g  TO  NULL
030000         EXIT METHOD
030100       END-IF
030200       INVOKE �C�e���[�^�I�u�W�F�N�g "���v�f�ݒ�"
030300     END-PERFORM
030400*
030500*�@��v����d�l�����Ȃ������ꍇ�A�ԋp����d�l�I�u�W�F�N�g��NULL��ݒ肷��B
030600*�@�܂��A�C�e���[�^�I�u�W�F�N�g���폜����B
030700*
030800     SET  �k�|�d�l�I�u�W�F�N�g       TO  NULL
030900     SET  �C�e���[�^�I�u�W�F�N�g     TO  NULL
031000 END METHOD �d�l���̌���.
031100*========================================================================
031200*�@�d�l���̎Q�ƃ��\�b�h
031300*
031400*�@�@�d�l�����擾����B
031500*
031600*  �����́F�Ȃ�
031700*�@�Z�o�́F�d�l���iPIC 9(8) BINARY)
031800*========================================================================
031900 METHOD-ID.  �d�l���̎Q��.
032000 DATA            DIVISION.
032100 LINKAGE         SECTION.
032200  01  �k�|�d�l��                    PIC 9(8) BINARY.
032300 PROCEDURE       DIVISION
032400                    RETURNING         �k�|�d�l��.
032500     MOVE  �d�l��               TO  �k�|�d�l��.
032600 END METHOD �d�l���̎Q��.
032700*========================================================================
032800*�@�d�l���X�g�̎Q�ƃ��\�b�h
032900*
033000*�@�@�d�l���X�g�I�u�W�F�N�g���擾����B
033100*
033200*  �����́F�Ȃ�
033300*�@�Z�o�́F�d�l���X�g�I�u�W�F�N�g�iOBJECT RERERENCE List)
033400*========================================================================
033500 METHOD-ID.  �d�l���X�g�̎Q��.
033600 DATA            DIVISION.
033700 LINKAGE         SECTION.
033800  01  �k�|�d�l���X�g�I�u�W�F�N�g      OBJECT REFERENCE List.
033900 PROCEDURE       DIVISION
034000                    RETURNING         �k�|�d�l���X�g�I�u�W�F�N�g.
034100     SET   �k�|�d�l���X�g�I�u�W�F�N�g TO  �d�l���X�g�I�u�W�F�N�g
034200 END METHOD �d�l���X�g�̎Q��.
034300 END OBJECT.
034400 END CLASS  �d�l�Ǘ��N���X.
