000100*========================================================================
000200*�@�\���ԁ|���t�N���X
000300*                                   �|�T���v���v���O�����u��c���\��v�|
000400*
000500*�@�@���t�P�ʂ̗\���Ԃɂ��ČŗL�ȃf�[�^�y�у��\�b�h�����B
000600*
000700*�@�Z�p���N���X
000800*�@�@�P�jFJBASE
000900*
001000*�@�Z�p���N���X
001100*�@�@�P�jDict
001200*�@�@�Q�jList
001300*�@�@�R�j�\���ԁ|��c���N���X
001400*�@�@�S�j�G���[�N���X
001500*
001600*�@�Z�t�@�N�g���f�[�^
001700*�@�@�P�j�\��������I�u�W�F�N�g�@�|�@OBJECT REFERENCE Dict
001800*
001900*�@���I�u�W�F�N�g�f�[�^
002000*�@�@�P�j�\����@�@�@�@�@�@�@�@�@�|�@PIC 9(8)
002100*�@�@�Q�j��c�����X�g�I�u�W�F�N�g�|�@OBJECT REFERENCE List
002200*
002300*�@�Z�t�@�N�g�����\�b�h
002400*�@�@�P�j�\����̎Q��
002500*�@�@�Q�j�\����̑S�폜
002600*
002700*�@�Z�I�u�W�F�N�g���\�b�h
002800*�@�@�P�j�\����̏�����
002900*�@�@�Q�j�\����̍폜
003000*�@�@�R�j��c���̗\��󋵎Q��
003100*�@�@�S�j��c���̗\��󋵐ݒ�
003200*�@�@�T�j��c�����X�g�I�u�W�F�N�g�̎Q��
003300*
003400*            Copyright 1999-2015 FUJITSU LIMITED
003500*========================================================================
003600 IDENTIFICATION  DIVISION.
003700 CLASS-ID.   �\���ԁ|���t�N���X  INHERITS FJBASE.
003800 ENVIRONMENT     DIVISION.
003900 CONFIGURATION   SECTION.
004000 SPECIAL-NAMES.
004100     SYMBOLIC CONSTANT
004200     COPY R_CONST.
004300     .
004400 REPOSITORY.
004500     CLASS FJBASE
004600     CLASS Dict
004700     CLASS List
004800     CLASS �\���ԁ|��c���N���X
004900     CLASS �G���[�N���X
005000     .
005100 FACTORY.
005200 DATA            DIVISION.
005300 WORKING-STORAGE SECTION.
005400  01 �\��������I�u�W�F�N�g           OBJECT REFERENCE Dict.
005500 PROCEDURE       DIVISION.
005600*========================================================================
005700*�@�\����̎Q�ƃ��\�b�h
005800*
005900*�@�@�\��������I�u�W�F�N�g��NULL�̎��A�\��������I�u�W�F�N�g�𐶐�����B
006000*�@�@�\������L�[�ɁA�\��������I�u�W�F�N�g�ɂ��̗\����ƈ�v����\����I
006100*�@�u�W�F�N�g�����邩�ۂ�����������B�Y������\����I�u�W�F�N�g���Ȃ��ꍇ
006200*�@�V���ɐ�������B
006300*
006400*�@�Z���́F�\��� (PIC 9(8))
006500*�@�Z�o�́F�\����I�u�W�F�N�g�iOBJECT REFERENCE �\���ԁ|���t�N���X)
006600*========================================================================
006700 METHOD-ID.  �\����̎Q��.
006800 DATA            DIVISION.
006900 WORKING-STORAGE SECTION.
007000  01 ���ʃI�u�W�F�N�g                 OBJECT REFERENCE.
007100  01 ��c�����X�g�I�u�W�F�N�g         OBJECT REFERENCE List.
007200 LINKAGE         SECTION.
007300  01 �k�|�\���                       PIC 9(8).
007400  01 �w�|�\���                       REDEFINES �k�|�\��� PIC X(8).
007500  01 �k�|�\����I�u�W�F�N�g           OBJECT REFERENCE �\���ԁ|���t�N���X.
007600 PROCEDURE       DIVISION
007700                    USING             �k�|�\���
007800                    RETURNING         �k�|�\����I�u�W�F�N�g.
007900*
008000*�@�\��������I�u�W�F�N�g��NULL�Ȃ�V�K�ɗ\����I�u�W�F�N�g�𐶐�����B
008100*�@�\��������I�u�W�F�N�g��NULL�łȂ���΁A�\������L�[�ɂ��āA�\����ɑ�
008200*�@����\��I�u�W�F�N�g���擾����B
008300*
008400     IF  �\��������I�u�W�F�N�g = NULL THEN
008500       SET �\��������I�u�W�F�N�g TO  Dict :: "NEW"
008600     ELSE
008700       INVOKE  �\��������I�u�W�F�N�g "Element-Get"
008800                                      USING            �w�|�\���
008900                                      RETURNING        ���ʃI�u�W�F�N�g
009000       IF ���ʃI�u�W�F�N�g NOT = NULL THEN
009100         SET   �k�|�\����I�u�W�F�N�g TO ���ʃI�u�W�F�N�g AS �\���ԁ|���t�N���X
009200         EXIT  METHOD
009300       END-IF
009400     END-IF
009500*
009600*�@�\��������o�^�̏ꍇ�A�\����I�u�W�F�N�g�𐶐����\��������I�u�W�F�N�g
009700*�@�ǉ�����B
009800*
009900     SET �k�|�\����I�u�W�F�N�g   TO  SELF :: "NEW"
010000     INVOKE  �\��������I�u�W�F�N�g   "Element-PutAt"
010100                                      USING            �w�|�\���
010200                                            BY CONTENT �k�|�\����I�u�W�F�N�g
010300*
010400*�@�\����I�u�W�F�N�g�����A��c�����X�g���쐬���ݒ肷��B
010500*
010600     INVOKE  �\���ԁ|��c���N���X   "��c���I�u�W�F�N�g�̐���"
010700                                      RETURNING        ��c�����X�g�I�u�W�F�N�g
010800	   INVOKE  �k�|�\����I�u�W�F�N�g   "�\����̏�����"
010900                                      USING BY CONTENT �k�|�\���
011000                                            BY CONTENT ��c�����X�g�I�u�W�F�N�g
011100 END METHOD �\����̎Q��.
011200*========================================================================
011300*�@�\����̑S�폜���\�b�h
011400*
011500*�@�@�\��������I�u�W�F�N�g�ɓo�^���ꂽ�\����I�u�W�F�N�g��S�č폜����B
011600*
011700*  �����́F�Ȃ�
011800*�@�Z�o�́F�Ȃ�
011900*========================================================================
012000 METHOD-ID.  �\����̑S�폜.
012100 DATA            DIVISION.
012200 WORKING-STORAGE SECTION.
012300  01  ���ʃI�u�W�F�N�g                OBJECT REFERENCE.
012400 LINKAGE         SECTION.
012500 PROCEDURE       DIVISION.
012600     INVOKE  �\��������I�u�W�F�N�g   "FirstElement-Get"
012700                                      RETURNING        ���ʃI�u�W�F�N�g
012800     PERFORM TEST BEFORE UNTIL ���ʃI�u�W�F�N�g = NULL
012900       INVOKE  ���ʃI�u�W�F�N�g       "�\����̍폜"
013000       INVOKE  �\��������I�u�W�F�N�g "NextElement-Get"
013100                                      RETURNING        ���ʃI�u�W�F�N�g
013200     END-PERFORM
013300     INVOKE �\��������I�u�W�F�N�g    "Remove-all"
013400     SET   �\��������I�u�W�F�N�g TO  NULL
013500 END METHOD �\����̑S�폜.
013600 END FACTORY.
013700*
013800 OBJECT.
013900 DATA DIVISION.
014000 BASED-STORAGE   SECTION.
014100  COPY ROOMINFO.
014200 WORKING-STORAGE SECTION.
014300  01  �\���                          PIC 9(8).
014400  01  ��c�����X�g�I�u�W�F�N�g        OBJECT REFERENCE List.
014500 PROCEDURE       DIVISION.
014600*========================================================================
014700*�@�\����̏��������\�b�h
014800*
014900*�@�@�\����̏�������ݒ肷��B�p�����^�œn���ꂽ�\����Ɖ�c�����X�g�I
015000*�@�u�W�F�N�g��ݒ肷��B
015100*
015200*�@�Z���́F�\���  (PIC 9(8))
015300*�@�@�@�@�@��c�����X�g�I�u�W�F�N�g (OBJECT REFERENCE List)
015400*�@�Z�o�́F�Ȃ�
015500*========================================================================
015600 METHOD-ID.  �\����̏�����.
015700 DATA            DIVISION.
015800 LINKAGE         SECTION.
015900  01 �k�|�\���                       PIC 9(8).
016000  01 �k�|��c�����X�g�I�u�W�F�N�g     OBJECT REFERENCE List.
016100 PROCEDURE       DIVISION
016200                    USING             �k�|�\���
016300                                      �k�|��c�����X�g�I�u�W�F�N�g.
016400     MOVE �k�|�\���              TO  �\���
016500     SET ��c�����X�g�I�u�W�F�N�g TO  �k�|��c�����X�g�I�u�W�F�N�g
016600 END METHOD �\����̏�����.
016700*========================================================================
016800*�@�\����̍폜���\�b�h
016900*
017000*�@�@�\����I�u�W�F�N�g�����A��c�����X�g�I�u�W�F�N�g���폜����B
017100*
017200*  �����́F�Ȃ�
017300*�@�Z�o�́F�Ȃ�
017400*========================================================================
017500 METHOD-ID.  �\����̍폜.
017600 DATA            DIVISION.
017700 WORKING-STORAGE SECTION.
017800 LINKAGE         SECTION.
017900 PROCEDURE       DIVISION.
018000     INVOKE  �\���ԁ|��c���N���X   "��c���̑S�폜"
018100                                      USING BY CONTENT ��c�����X�g�I�u�W�F�N�g
018200     INVOKE  ��c�����X�g�I�u�W�F�N�g "Remove-all"
018300     SET ��c�����X�g�I�u�W�F�N�g TO  NULL
018400 END METHOD �\����̍폜.
018500**========================================================================
018600*�@��c���̗\��󋵎Q�ƃ��\�b�h
018700*
018800*�@�@�w�肳�ꂽ��c���̗\��󋵂��擾����B
018900*
019000*�@�Z���́F�\��f�[�^ (TYPE �\�񃊃X�g)
019100*�@�@�@�@�@��c���f�[�^�iTYPE ��c���d�l)
019200*�@�Z�o�́F�\��󋵁iPIC 9)
019300*========================================================================
019400 METHOD-ID.  ��c���̗\��󋵎Q��.
019500 DATA            DIVISION.
019600 BASED-STORAGE   SECTION.
019700     COPY RSVINFO.
019800 WORKING-STORAGE SECTION.
019900  01  ��c���I�u�W�F�N�g              OBJECT REFERENCE  �\���ԁ|��c���N���X.
020000 LINKAGE         SECTION.
020100  01  �k�|�\��f�[�^                  TYPE �\�񃊃X�g.
020200  01  �k�|��c���f�[�^                TYPE ��c���d�l.
020300  01  �k�|�\���                    PIC  9.
020400 PROCEDURE       DIVISION
020500                   USING              �k�|�\��f�[�^
020600                                      �k�|��c���f�[�^
020700                   RETURNING          �k�|�\���.
020800 DECLARATIVES.
020900 ERR SECTION.
021000     USE AFTER EXCEPTION �G���[�N���X
021100     INVOKE EXCEPTION-OBJECT          "��c���I�u�W�F�N�g�����G���[".
021200 END DECLARATIVES.  
021300     INVOKE  �\���ԁ|��c���N���X   "��c���̌���"
021400                                      USING BY CONTENT ��c���� OF �k�|�\��f�[�^
021500                                            BY CONTENT ��c�����X�g�I�u�W�F�N�g
021600                                      RETURNING        ��c���I�u�W�F�N�g
021700*
021800*�@�Y�������c�I�u�W�F�N�g��������Ȃ��ꍇ�A�G���[�N���X�Ń��b�Z�[�W��
021900*�@�o�͂���B�Y�������c���I�u�W�F�N�g�����������ꍇ�A�\������擾����B
022000* 
022100     IF  ��c���I�u�W�F�N�g = NULL THEN
022200       RAISE  �G���[�N���X  :: "NEW"
022300     ELSE
022400       INVOKE  ��c���I�u�W�F�N�g     "���Ԙg�̗\��󋵎Q��"
022500                                      USING BY REFERENCE �k�|�\��f�[�^
022600                                            BY REFERENCE �k�|��c���f�[�^
022700                                      RETURNING          �k�|�\���
022800     END-IF
022900 END METHOD ��c���̗\��󋵎Q��.
023000*========================================================================
023100*�@��c���̗\��󋵐ݒ胁�\�b�h
023200*
023300*�@�@�w�肳�ꂽ��c���̗\�����ݒ肷��B
023400*
023500*�@�Z���́F�\��f�[�^ (TYPE �\�񃊃X�g)
023600*�@�Z�o�́F�Ȃ�
023700*========================================================================
023800 METHOD-ID.  ��c���̗\��󋵐ݒ�.
023900 DATA            DIVISION.              
024000 BASED-STORAGE   SECTION.
024100     COPY RSVINFO.
024200 WORKING-STORAGE SECTION.
024300  01  ��c���I�u�W�F�N�g              OBJECT REFERENCE  �\���ԁ|��c���N���X.
024400 LINKAGE         SECTION.
024500  01  �k�|�\��f�[�^                  TYPE �\�񃊃X�g.
024600 PROCEDURE       DIVISION
024700                   USING              �k�|�\��f�[�^.
024800 DECLARATIVES.
024900 ERR SECTION.
025000     USE AFTER EXCEPTION �G���[�N���X
025100     INVOKE EXCEPTION-OBJECT          "��c���I�u�W�F�N�g�����G���[".
025200 END DECLARATIVES.  
025300     INVOKE  �\���ԁ|��c���N���X   "��c���̌���"
025400                                      USING BY CONTENT ��c���� OF �k�|�\��f�[�^
025500                                            BY CONTENT ��c�����X�g�I�u�W�F�N�g
025600                                      RETURNING        ��c���I�u�W�F�N�g
025700*
025800*�@�Y�������c�I�u�W�F�N�g��������Ȃ��ꍇ�A�G���[�N���X�Ń��b�Z�[�W��
025900*�@�o�͂���B�Y�������c���I�u�W�F�N�g�����������ꍇ�A�\�����ݒ肷��B
026000* 
026100     IF  ��c���I�u�W�F�N�g = NULL THEN
026200       RAISE   �G���[�N���X  :: "NEW"
026300     ELSE
026400       INVOKE  ��c���I�u�W�F�N�g     "���Ԙg�̗\��󋵐ݒ�"
026500                                      USING            �k�|�\��f�[�^
026600     END-IF
026700 END METHOD ��c���̗\��󋵐ݒ�.
026800*========================================================================
026900*�@��c�����X�g�I�u�W�F�N�g�̎Q�ƃ��\�b�h
027000*
027100*�@�@��c�����X�g�I�u�W�F�N�g���擾����B
027200*
027300*�@�Z���́F�Ȃ�
027400*�@�Z�o�́F��c�����X�g�I�u�W�F�N�g (OBJECT REFERENCE List)
027500*========================================================================
027600 METHOD-ID.  ��c�����X�g�I�u�W�F�N�g�̎Q��.
027700 DATA            DIVISION.
027800 LINKAGE         SECTION.
027900  01 �k�|��c�����X�g�I�u�W�F�N�g     OBJECT REFERENCE List.
028000 PROCEDURE       DIVISION
028100                    RETURNING         �k�|��c�����X�g�I�u�W�F�N�g.
028200     SET �k�|��c�����X�g�I�u�W�F�N�g TO  ��c�����X�g�I�u�W�F�N�g
028300 END METHOD ��c�����X�g�I�u�W�F�N�g�̎Q��.
028400 END OBJECT.
028500 END CLASS  �\���ԁ|���t�N���X.
