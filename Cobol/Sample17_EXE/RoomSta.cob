000100*========================================================================
000200*   �\���ԁ|��c���N���X
000300*                                   �|�T���v���v���O�����u��c���\��v�|
000400*
000500*�@�@�@��c���P�ʂ̗\���Ԃɂ��ČŗL�ȃf�[�^�y�у��\�b�h�����B
000600*
000700*�@�Z�p���N���X
000800*�@�@�P�jFJBASE
000900*
001000*�@�Z�Q�ƃN���X
001100*�@�@�P�jList
001200*�@�@�Q�j�\���ԁ|���Ԙg�N���X
001300*�@�@�R�j��c�����Ǘ��N���X
001400*�@�@�S�j��c�����N���X
001500*�@�@�T�j���X�g�C�e���[�^
001600*�@�@�U�j�G���[�N���X
001700*
001800*�@�Z�I�u�W�F�N�g�f�[�^
001900*�@�@�P�j�`�l���Ԙg�I�u�W�F�N�g   �|  OBJECT REFERENCE �\���ԁ|���Ԙg�N���X.
002000*�@�@�Q�j�o�l���Ԙg�I�u�W�F�N�g   �|  OBJECT REFERENCE �\���ԁ|���Ԙg�N���X.
002100*�@�@�R�j��c�����I�u�W�F�N�g   �|  OBJECT REFERENCE ��c�����N���X.
002200*
002300*�@�Z�t�@�N�g�����\�b�h
002400*�@�@�P�j��c���I�u�W�F�N�g�̐���
002500*�@�@�Q�j��c���̌���
002600*�@�@�R�j��c���̑S�폜
002700*
002800*�@�Z�I�u�W�F�N�g���\�b�h
002900*�@�@�P�j��c���̏�����
003000*�@�@�Q�j��c���̍폜
003100*�@�@�R�j��c�����̎Q��
003200*�@�@�S�j���Ԙg�̗\��󋵎Q��
003300*�@�@�T�j���Ԙg�̗\��󋵐ݒ�
003400*
003500*            Copyright 1999-2015 FUJITSU LIMITED
003600*========================================================================
003700 IDENTIFICATION  DIVISION.
003800 CLASS-ID.   �\���ԁ|��c���N���X  INHERITS FJBASE.
003900 ENVIRONMENT     DIVISION.
004000 CONFIGURATION   SECTION.
004100 SPECIAL-NAMES.
004200     SYMBOLIC CONSTANT
004300     COPY R_CONST.
004400     .
004500 REPOSITORY.
004600     CLASS FJBASE
004700     CLASS List
004800     CLASS �\���ԁ|���Ԙg�N���X
004900     CLASS ��c�����Ǘ��N���X
005000     CLASS ��c�����N���X
005100     CLASS �G���[�N���X
005200     CLASS ���X�g�C�e���[�^
005300     .
005400 FACTORY.
005500 DATA            DIVISION.
005600 BASED-STORAGE   SECTION.
005700     COPY  ROOMINFO.
005800 PROCEDURE       DIVISION.
005900*========================================================================
006000*�@��c���I�u�W�F�N�g�̐������\�b�h
006100*
006200*�@�@�܂��A��c�����X�g�I�u�W�F�N�g�𐶐����A���ɉ�c���������̉�c��
006300*�@�I�u�W�F�N�g�𐶐����A��c�����X�g�I�u�W�F�N�g�ɓo�^����B
006400*
006500*�@�Z���́F�Ȃ�
006600*�@�Z�o�́F��c�����X�g�I�u�W�F�N�g�iOBJECT REFERENCE List)
006700*========================================================================
006800 METHOD-ID.  ��c���I�u�W�F�N�g�̐���.
006900 DATA            DIVISION.
007000 WORKING-STORAGE SECTION.
007100  01 ��c���Ǘ��I�u�W�F�N�g           OBJECT REFERENCE ��c�����Ǘ��N���X.
007200  01 ��c����񃊃X�g�I�u�W�F�N�g     OBJECT REFERENCE List.
007300  01 ��c�����I�u�W�F�N�g           OBJECT REFERENCE ��c�����N���X.
007400  01 ��c���I�u�W�F�N�g               OBJECT REFERENCE SELF.
007500  01 ���ʃI�u�W�F�N�g                 OBJECT REFERENCE.
007600  01 �C�e���[�^�I�u�W�F�N�g           OBJECT REFERENCE ���X�g�C�e���[�^.
007700 LINKAGE         SECTION.
007800  01 �k�|��c�����X�g�I�u�W�F�N�g     OBJECT REFERENCE List.
007900 PROCEDURE       DIVISION
008000                    RETURNING         �k�|��c�����X�g�I�u�W�F�N�g.
008100*
008200*�@��c�����X�g�I�u�W�F�N�g�𐶐�
008300*
008400     SET �k�|��c�����X�g�I�u�W�F�N�g TO  List :: "NEW"
008500*
008600*�@��c����񃊃X�g�I�u�W�F�g���擾����
008700*
008800     INVOKE  ��c�����Ǘ��N���X ::  "NEW"  "�d�l���X�g�̎Q��"
008900                                      RETURNING        ��c����񃊃X�g�I�u�W�F�N�g
009000*
009100*�@��c����񃊃X�g�ɓo�^���ꂽ��c�����I�u�W�F�N�g�����Ɏ��o���A��c
009200*�@���I�u�W�F�N�g�ɓo�^����B
009300*
009400     INVOKE  ���X�g�C�e���[�^         "�C�e���[�^����"
009500                                      USING BY CONTENT ��c����񃊃X�g�I�u�W�F�N�g
009600                                      RETURNING        �C�e���[�^�I�u�W�F�N�g
009700     INVOKE  �C�e���[�^�I�u�W�F�N�g   "�擪�v�f�ݒ�"
009800     PERFORM TEST BEFORE 
009900      UNTIL �C�e���[�^�I�u�W�F�N�g :: "�v�f�m�F" = ZOFF
010000       INVOKE  �C�e���[�^�I�u�W�F�N�g "���݂̗v�f�擾"
010100                                      RETURNING        ���ʃI�u�W�F�N�g
010200       SET ��c�����I�u�W�F�N�g TO  ���ʃI�u�W�F�N�g AS ��c�����N���X
010300*
010400*�@��c���I�u�W�F�N�g�̐����Ə�����
010500*
010600       INVOKE  SELF  "NEW"            RETURNING        ��c���I�u�W�F�N�g
010700       INVOKE  ��c���I�u�W�F�N�g     "��c���̏�����"
010800                                      USING BY CONTENT ��c�����I�u�W�F�N�g
010900       INVOKE �k�|��c�����X�g�I�u�W�F�N�g  "Element-PutLast"
011000                                      USING BY CONTENT ��c���I�u�W�F�N�g
011100       INVOKE �C�e���[�^�I�u�W�F�N�g  "���v�f�ݒ�"
011200     END-PERFORM
011300     SET  �C�e���[�^�I�u�W�F�N�g  TO  NULL
011400 END METHOD ��c���I�u�W�F�N�g�̐���.
011500*========================================================================
011600*�@��c���̌������\�b�h
011700*                                              
011800*�@�@��c�������L�[�ɁA��c���I�u�W�F�N�g����������B
011900*
012000*�@�Z���́F��c�����iPIC X(4))
012100*�@�@�@�@�@��c�����X�g�I�u�W�F�N�g (OBJECT REFERENCE List)
012200*�@�Z�o�́F��c���I�u�W�F�N�g�iOBJECT REFERENCE �\���ԁ|��c���N���X)
012300*========================================================================
012400 METHOD-ID.  ��c���̌���.
012500 DATA            DIVISION.
012600 WORKING-STORAGE SECTION.
012700  01 ��c���I�u�W�F�N�g           OBJECT REFERENCE �\���ԁ|��c���N���X.
012800  01 ��c���f�[�^                 TYPE ��c���d�l.
012900  01 �C�e���[�^�I�u�W�F�N�g       OBJECT REFERENCE ���X�g�C�e���[�^.
013000  01 ���ʃI�u�W�F�N�g             OBJECT REFERENCE.
013100 LINKAGE         SECTION.
013200  01 �k�|��c����                 PIC X(4).
013300  01 �k�|��c�����X�g�I�u�W�F�N�g OBJECT REFERENCE List.
013400  01 �k�|��c���I�u�W�F�N�g       OBJECT REFERENCE �\���ԁ|��c���N���X.
013500 PROCEDURE       DIVISION
013600                    USING         �k�|��c����
013700                                  �k�|��c�����X�g�I�u�W�F�N�g
013800                    RETURNING     �k�|��c���I�u�W�F�N�g.
013900*
014000*�@��c�����X�g�ɓo�^���ꂽ��c�����I�u�W�F�N�g�����Ɏ��o���A�w�肳��
014100*�@����c�����ƈ�v�����c���I�u�W�F�N�g����������B
014200*
014300     INVOKE  ���X�g�C�e���[�^         "�C�e���[�^����"
014400                                      USING BY CONTENT �k�|��c�����X�g�I�u�W�F�N�g
014500                                      RETURNING        �C�e���[�^�I�u�W�F�N�g
014600     INVOKE  �C�e���[�^�I�u�W�F�N�g   "�擪�v�f�ݒ�"
014700     PERFORM TEST BEFORE
014800      UNTIL �C�e���[�^�I�u�W�F�N�g :: "�v�f�m�F" = ZOFF
014900       INVOKE  �C�e���[�^�I�u�W�F�N�g "���݂̗v�f�擾"
015000                                      RETURNING        ���ʃI�u�W�F�N�g
015100       SET     ��c���I�u�W�F�N�g     TO  ���ʃI�u�W�F�N�g AS �\���ԁ|��c���N���X
015200*
015300*�@��c���I�u�W�F�N�g������c�������擾���A��c�����������ΏۂƔ�r����B
015400*
015500       INVOKE  ��c���I�u�W�F�N�g     "��c�����̎Q��"
015600                                      RETURNING        ��c���f�[�^
015700       IF ��c���� OF ��c���f�[�^ = �k�|��c����  THEN
015800         SET  �k�|��c���I�u�W�F�N�g  TO  ��c���I�u�W�F�N�g
015900         SET  �C�e���[�^�I�u�W�F�N�g  TO  NULL
016000         EXIT METHOD
016100       END-IF
016200       INVOKE �C�e���[�^�I�u�W�F�N�g  "���v�f�ݒ�"
016300     END-PERFORM
016400*
016500*�@�Y�������c���I�u�W�F�N�g��������Ȃ������ꍇ�A�ԋp�����c���I�u�W
016600*�@�F�N�g�ɂ�NULL��ݒ肷��B
016700*
016800     SET  �C�e���[�^�I�u�W�F�N�g      TO  NULL
016900     SET  �k�|��c���I�u�W�F�N�g      TO  NULL
017000 END METHOD ��c���̌���.
017100*========================================================================
017200*�@��c���̑S�폜���\�b�h
017300*                                              
017400*�@�@��c�����X�g�I�u�W�F�N�g�ɓo�^���ꂽ��c���I�u�W�F�N�g��S�č폜����B
017500*
017600*  �����́F��c�����X�g�I�u�W�F�N�g (OBJECT REFERENCE List)
017700*�@�Z�o�́F�Ȃ�
017800*========================================================================
017900 METHOD-ID.  ��c���̑S�폜.
018000 DATA            DIVISION.
018100 WORKING-STORAGE SECTION.
018200  01 ��c���I�u�W�F�N�g               OBJECT REFERENCE �\���ԁ|��c���N���X.
018300  01 �C�e���[�^�I�u�W�F�N�g           OBJECT REFERENCE ���X�g�C�e���[�^.
018400  01 ���ʃI�u�W�F�N�g                 OBJECT REFERENCE.
018500 LINKAGE         SECTION.
018600  01 �k�|��c�����X�g�I�u�W�F�N�g     OBJECT REFERENCE List.
018700 PROCEDURE       DIVISION
018800                    USING             �k�|��c�����X�g�I�u�W�F�N�g.
018900*
019000*�@��c�����X�g�ɓo�^���ꂽ��c���I�u�W�F�N�g�����ɍ폜����B
019100*
019200     INVOKE  ���X�g�C�e���[�^         "�C�e���[�^����"
019300                                      USING BY CONTENT �k�|��c�����X�g�I�u�W�F�N�g
019400                                      RETURNING        �C�e���[�^�I�u�W�F�N�g
019500     INVOKE  �C�e���[�^�I�u�W�F�N�g   "�擪�v�f�ݒ�"
019600     PERFORM TEST BEFORE 
019700      UNTIL �C�e���[�^�I�u�W�F�N�g :: "�v�f�m�F" = ZOFF
019800       INVOKE  �C�e���[�^�I�u�W�F�N�g "���݂̗v�f�擾"
019900                                      RETURNING        ���ʃI�u�W�F�N�g
020000       SET   ��c���I�u�W�F�N�g   TO  ���ʃI�u�W�F�N�g AS �\���ԁ|��c���N���X
020100*
020200*�@��c���I�u�W�F�N�g�̍폜
020300*
020400       INVOKE  ��c���I�u�W�F�N�g     "��c���̍폜"
020500       INVOKE  �C�e���[�^�I�u�W�F�N�g "���v�f�ݒ�"
020600     END-PERFORM
020700*
020800*�@�C�e���[�^�I�u�W�F�N�g�̍폜
020900*
021000     SET  �C�e���[�^�I�u�W�F�N�g  TO  NULL
021100 END METHOD ��c���̑S�폜.
021200 END FACTORY.
021300*
021400 OBJECT.
021500 DATA DIVISION.
021600 BASED-STORAGE   SECTION.
021700  COPY RSVINFO.
021800  COPY ROOMINFO.
021900 WORKING-STORAGE SECTION.
022000  01 ���Ԙg.
022100    02 �`�l���Ԙg�I�u�W�F�N�g         OBJECT REFERENCE �\���ԁ|���Ԙg�N���X.
022200    02 �o�l���Ԙg�I�u�W�F�N�g         OBJECT REFERENCE �\���ԁ|���Ԙg�N���X.
022300  01 ��c�����I�u�W�F�N�g           OBJECT REFERENCE ��c�����N���X.
022400 PROCEDURE       DIVISION.
022500*========================================================================
022600*�@��c���̏��������\�b�h
022700*
022800*�@�@��c���I�u�W�F�N�g�̏�������ݒ肷��B
022900*�@�@��c���I�u�W�F�N�g�����AAM�p�^PM�p�̎��Ԙg�I�u�W�F�N�g�𐶐�����B
023000*�@�܂��A�p�����^�Ƃ��ēn���ꂽ��c�����I�u�W�F�N�g��ݒ肷��B
023100*
023200*  �����́F��c�����I�u�W�F�N�g�@(OBJECT REFRENCE ��c�����N���X)
023300*�@�Z�o�́F�Ȃ�
023400*========================================================================
023500 METHOD-ID.  ��c���̏�����.
023600 DATA            DIVISION.
023700 WORKING-STORAGE SECTION.
023800  01 ���Ԙg                           PIC X(4).
023900 LINKAGE         SECTION.
024000  01 �k�|��c�����I�u�W�F�N�g       OBJECT REFERENCE ��c�����N���X.
024100 PROCEDURE       DIVISION
024200                    USING             �k�|��c�����I�u�W�F�N�g.
024300     MOVE    "AM"                 TO  ���Ԙg
024400     INVOKE  �\���ԁ|���Ԙg�N���X   "���Ԙg�I�u�W�F�N�g�̐���"
024500                                      USING BY CONTENT ���Ԙg
024600                                      RETURNING        �`�l���Ԙg�I�u�W�F�N�g
024700     MOVE    "PM"                 TO  ���Ԙg
024800     INVOKE  �\���ԁ|���Ԙg�N���X  "���Ԙg�I�u�W�F�N�g�̐���"
024900                                      USING BY CONTENT ���Ԙg
025000                                      RETURNING        �o�l���Ԙg�I�u�W�F�N�g
025100     SET  ��c�����I�u�W�F�N�g  TO  �k�|��c�����I�u�W�F�N�g
025200 END METHOD ��c���̏�����.
025300*========================================================================
025400*�@��c���̍폜���\�b�h
025500*
025600*�@�@��c���I�u�W�F�N�g�����AAM�p�^PM�p�̎��Ԙg�I�u�W�F�N�g���폜���Ă�
025700*�@��A��c�����I�u�W�F�N�g���폜����B
025800*
025900*  �����́F�Ȃ�
026000*�@�Z�o�́F�Ȃ�
026100*========================================================================
026200 METHOD-ID.  ��c���̍폜.
026300 DATA            DIVISION.
026400 WORKING-STORAGE SECTION.
026500 LINKAGE         SECTION.
026600 PROCEDURE       DIVISION.
026700     INVOKE �`�l���Ԙg�I�u�W�F�N�g    "���Ԙg�̍폜"
026800     INVOKE �o�l���Ԙg�I�u�W�F�N�g    "���Ԙg�̍폜"
026900     SET   �`�l���Ԙg�I�u�W�F�N�g TO  NULL
027000     SET   �o�l���Ԙg�I�u�W�F�N�g TO  NULL
027100     SET   ��c�����I�u�W�F�N�g TO  NULL
027200 END METHOD ��c���̍폜.
027300*========================================================================
027400*�@��c�����̎Q�ƃ��\�b�h
027500*
027600*�@�@��c���I�u�W�F�N�g������c�����I�u�W�F�N�g�����c���f�[�^���擾
027700*�@����B
027800*
027900*�@�Z���́F�Ȃ�
028000*�@�Z�o�́F��c���f�[�^ (TYPE ��c���d�l)
028100*========================================================================
028200 METHOD-ID.  ��c�����̎Q��.
028300 DATA            DIVISION.
028400 LINKAGE         SECTION.
028500  01 �k�|��c���f�[�^                 TYPE ��c���d�l.
028600 PROCEDURE       DIVISION
028700                    RETURNING         �k�|��c���f�[�^.
028800     INVOKE ��c�����I�u�W�F�N�g    "�d�l�Q��"
028900                                      RETURNING        �k�|��c���f�[�^.
029000 END METHOD ��c�����̎Q��.
029100*========================================================================
029200*�@���Ԙg�̗\��󋵎Q�ƃ��\�b�h
029300*                                                  
029400*�@�@�w�肵�����Ԙg�̗\��󋵂��擾����B���Ԙg�̗\���Ԃ��u�\��v�Ȃ�΁A
029500*�@�\��f�[�^�Ɖ�c���f�[�^���擾����B
029600*
029700*�@�Z���́F�\��f�[�^ (TYPE �\�񃊃X�g)
029800*�@�Z�o�́F�\���   (PIC 9)
029900*========================================================================
030000 METHOD-ID.  ���Ԙg�̗\��󋵎Q��.
030100 DATA            DIVISION.
030200 WORKING-STORAGE SECTION.
030300  01  ���Ԙg�I�u�W�F�N�g              OBJECT REFERENCE �\���ԁ|���Ԙg�N���X.
030400 LINKAGE         SECTION.
030500  01  �k�|�\��f�[�^                  TYPE �\�񃊃X�g.
030600  01  �k�|��c���f�[�^                TYPE ��c���d�l.
030700  01  �k�|�\���                    PIC 9.
030800 PROCEDURE       DIVISION
030900                    USING             �k�|�\��f�[�^
031000                                      �k�|��c���f�[�^
031100                    RETURNING         �k�|�\���.
031200 DECLARATIVES.
031300 ERR SECTION.
031400     USE AFTER EXCEPTION �G���[�N���X
031500     INVOKE EXCEPTION-OBJECT          "���Ԙg�I�u�W�F�N�g�����G���[".
031600 END DECLARATIVES.  
031700*
031800*  ���Ԙg�I�u�W�F�N�g�̎擾
031900*
032000     EVALUATE ���Ԙg
032100     WHEN  "AM"
032200       SET  ���Ԙg�I�u�W�F�N�g    TO  �`�l���Ԙg�I�u�W�F�N�g
032300     WHEN  "PM"
032400       SET  ���Ԙg�I�u�W�F�N�g    TO  �o�l���Ԙg�I�u�W�F�N�g
032500     WHEN  OTHER
032600       RAISE   �G���[�N���X  :: "NEW"
032700       EXIT METHOD
032800     END-EVALUATE
032900*
033000*  �\��󋵂̎擾
033100*
033200     INVOKE  ���Ԙg�I�u�W�F�N�g       "���Ԙg�̗\��󋵎Q��"
033300                                      RETURNING        �k�|�\���
033400*
033500*  �\��󋵂��u�\��v�̏ꍇ�A�\��f�[�^�Ɖ�c���d�l�f�[�^���擾����B
033600*
033700     IF �k�|�\��� = �\�� THEN
033800       INVOKE  ���Ԙg�I�u�W�F�N�g     "���Ԙg�̗\��f�[�^�Q��"
033900                                      RETURNING        �k�|�\��f�[�^
034000       INVOKE  SELF                   "��c�����̎Q��"
034100                                      RETURNING        �k�|��c���f�[�^
034200     END-IF
034300 END METHOD ���Ԙg�̗\��󋵎Q��.
034400*========================================================================
034500*�@���Ԙg�̗\��󋵐ݒ胁�\�b�h
034600*                                                  
034700*�@�@�w�肵�����Ԙg�ɗ\��f�[�^��ݒ肷��B
034800*
034900*�@�Z���́F�\��f�[�^ (TYPE �\�񃊃X�g)
035000*�@�Z�o�́F�Ȃ�
035100*========================================================================
035200 METHOD-ID.  ���Ԙg�̗\��󋵐ݒ�.
035300 DATA            DIVISION.
035400 WORKING-STORAGE SECTION.
035500  01 ���Ԙg�I�u�W�F�N�g               OBJECT REFERENCE �\���ԁ|���Ԙg�N���X.
035600 LINKAGE         SECTION.
035700  01 �k�|�\��f�[�^                   TYPE �\�񃊃X�g.
035800 PROCEDURE       DIVISION
035900                    USING             �k�|�\��f�[�^.
036000 DECLARATIVES.
036100 ERR SECTION.
036200     USE AFTER EXCEPTION �G���[�N���X
036300     INVOKE EXCEPTION-OBJECT          "���Ԙg�I�u�W�F�N�g�����G���[".
036400 END DECLARATIVES.  
036500*
036600*  ���Ԙg�I�u�W�F�N�g�̎擾
036700*
036800     EVALUATE ���Ԙg
036900     WHEN  "AM"
037000       SET  ���Ԙg�I�u�W�F�N�g    TO  �`�l���Ԙg�I�u�W�F�N�g
037100     WHEN  "PM"
037200       SET  ���Ԙg�I�u�W�F�N�g    TO  �o�l���Ԙg�I�u�W�F�N�g
037300     WHEN  OTHER
037400       RAISE  �G���[�N���X  :: "NEW"
037500       EXIT METHOD
037600     END-EVALUATE
037700*
037800*  �\��f�[�^��ݒ肷��B
037900*
038000     INVOKE  ���Ԙg�I�u�W�F�N�g       "���Ԙg�̗\��f�[�^�ݒ�"
038100                                      USING            �k�|�\��f�[�^
038200 END METHOD ���Ԙg�̗\��󋵐ݒ�.
038300 END OBJECT.
038400 END CLASS  �\���ԁ|��c���N���X.
