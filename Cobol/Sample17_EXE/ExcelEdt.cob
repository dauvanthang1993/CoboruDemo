000100*========================================================================
000200*�@�d�w�b�d�k����v���O����
000300*                                   �|�T���v���v���O�����u��c���\��v�|
000400*
000500*�@OLE�A�g�@�\���g�p����Excel�t�@�C���𑀍삷��B
000600*
000700*�@�Z�@�\
000800*�@�@�P�j�f�[�^�̕���
000900*�@�@�Q�j�f�[�^�̕ۑ�
001000*
001100*�@�Z�Q�ƃN���X
001200*�@�@�P�j�\����N���X
001300*�@�@�Q�j�\��Ǘ��N���X
001400*�@�@�R�j��c�����Ǘ��N���X
001500*�@�@�S�jList
001600*�@�@�T�j���X�g�C�e���[�^
001700*
001800*            Copyright 1999-2015 FUJITSU LIMITED
001900*========================================================================
002000 IDENTIFICATION  DIVISION.
002100 PROGRAM-ID.     Excel-edit.
002200 ENVIRONMENT     DIVISION.
002300 CONFIGURATION   SECTION.
002400 SPECIAL-NAMES.
002500     SYMBOLIC CONSTANT
002600     COPY R_CONST.
002700     .
002800 REPOSITORY.
002900     CLASS OLE      AS "*OLE"
003000     CLASS OLE-ERR  AS "*OLE-EXCEPTION"
003100     CLASS �\����N���X
003200     CLASS �\��Ǘ��N���X
003300     CLASS ��c�����Ǘ��N���X
003400     CLASS List
003500     CLASS ���X�g�C�e���[�^
003600     .
003700 DATA DIVISION.
003800 BASED-STORAGE   SECTION.
003900     COPY RSVINFO.
004000     COPY ROOMINFO.
004100 WORKING-STORAGE SECTION.
004200  01 �{���̓��t                   PIC X(8) IS EXTERNAL.
004300  01 �n�k�d��ƈ� IS GLOBAL.
004400    02 �A�v���P�[�V������         PIC X(20)    VALUE "EXCEL.APPLICATION".
004500    02 �t�@�C����                 PIC X(256)   VALUE LOW-VALUE.
004600    02 �V�[�g��                   PIC X(20).
004700    02 EXCEL                      OBJECT REFERENCE OLE.
004800    02 ���[�N�u�b�N               OBJECT REFERENCE OLE.
004900    02 �V�[�g                     OBJECT REFERENCE OLE.
005000    02 ���[�N�V�[�g               OBJECT REFERENCE OLE.
005100    02 .
005200      03 �Z���Q��                 OBJECT REFERENCE OLE OCCURS 7 TIMES .
005300    02 �S�͈�                     OBJECT REFERENCE OLE.
005400    02 �I��͈�                   OBJECT REFERENCE OLE.
005500    02 �s�͈�                     OBJECT REFERENCE OLE.
005600    02 ��͈�                     OBJECT REFERENCE OLE.
005700    02 OLE-TRUE                   PIC 1(1) BIT VALUE B"1".
005800    02                            PIC 1(7) BIT.
005900    02 OLE-FALSE                  PIC 1(1) BIT VALUE B"0".
006000    02 �s��                       PIC S9(9) COMP-5.
006100    02 ��                       PIC S9(9) COMP-5.
006200    02 �s���J�E���^               PIC S9(9) COMP-5.
006300    02 �s�J�E���^                 PIC S9(9) COMP-5.
006400    02 ��J�E���^                 PIC S9(9) COMP-5.
006500*
006600  01 ��c���d�l���R�[�h           TYPE ��c���d�l.
006700  01 �\�񃊃X�g���R�[�h           TYPE �\�񃊃X�g.
006800  01 �_�~�[��c���f�[�^           TYPE ��c���d�l VALUE LOW-VALUE.
006900  01 �����R�[�h                   PIC S9(8) BINARY.
007000*
007100  01 ERROR-TYPE                   PIC X(1).
007200  01 WCODE                        PIC S9(4) COMP-5.
007300	01 SCODE                        PIC S9(9) COMP-5.
007400  01 DESC-LENG                    PIC S9(9) COMP-5.
007500  01 DESC-STR                     PIC X(200).
007600*
007700  01 ��^�C�g��.
007800    02 �^�C�g����                 PIC X(10) OCCURS 10.
007900*
008000  01 �f�[�^��                   PIC 9(8) BINARY.
008100  01 �J�E���^                     PIC 9(8) BINARY.
008200  01 �\��Ǘ��I�u�W�F�N�g         OBJECT REFERENCE �\��Ǘ��N���X.
008300  01 ��c���Ǘ��I�u�W�F�N�g       OBJECT REFERENCE ��c�����Ǘ��N���X.
008400  01 ���X�g�I�u�W�F�N�g           OBJECT REFERENCE List.
008500  01 �C�e���[�^�I�u�W�F�N�g       OBJECT REFERENCE ���X�g�C�e���[�^.
008600 LINKAGE         SECTION.
008700  01 �V�[�g���                   PIC X.
008800 PROCEDURE DIVISION.
008900 DECLARATIVES.
009000 OLE-EXCEPRION   SECTION.
009100     USE AFTER EXCEPTION OLE-ERR
009200*
009300* ��O�����F�G���[�R�[�h���擾�ƕ\��
009400*           ERROR-TYPE : 0  OLE�T�[�o���G���[�����o����
009500*                      : 1  OLE�V�X�e�����G���[�����o����
009600*           WCODE      : OLE �T�[�o����ʒm���ꂽ�G���[�R�[�h
009700*           SCODE      : OLE �̃V�X�e���܂���OLE �T�[�o����ʒm���ꂽ�G��
009800*�@�@�@�@�@�@�@�@�@�@�@�@�[�R�[�h
009900     INVOKE  EXCEPTION-OBJECT         "GET-ERROR-TYPE" 
010000                                      RETURNING        ERROR-TYPE
010100     IF ERROR-TYPE = 0 THEN
010200       INVOKE  EXCEPTION-OBJECT       "GET-WCODE"
010300                                      RETURNING        WCODE
010400       DISPLAY "����N���X�ŗ�O���������܂����BWCODE = " WCODE
010500     ELSE
010600       INVOKE  EXCEPTION-OBJECT       "GET-SCODE"
010700                                      RETURNING        SCODE
010800       DISPLAY "����N���X�ŗ�O���������܂����BSCODE = " SCODE
010900     END-IF
011000*
011100* �G���[�Ɋւ�������̒ʒm
011200* 
011300     INVOKE  EXCEPTION-OBJECT         "GET-DESCRIPTION-LENGTH" 
011400                                      RETURNING        DESC-LENG
011500     IF DESC-LENG NOT = 0 THEN
011600       INVOKE EXCEPTION-OBJECT        "GET-DESCRIPTION"
011700                                      RETURNING        DESC-STR
011800       DISPLAY "�G���[���� : "  DESC-STR
011900     END-IF  
012000     CALL "�t�@�C�����p�I��".
012100
012200 END DECLARATIVES.
012300***
012400*** �f�[�^�̕���
012500***
012600     ENTRY "�f�[�^�̕���"             USING   �V�[�g���.
012700*
012800* EXCEL�V�[�g�̏���
012900* 
013000     EVALUATE  �V�[�g���
013100     WHEN  ��c���V�[�g
013200       MOVE  ��c���t�@�C����     TO  �t�@�C����
013300       MOVE  ��c���V�[�g��       TO  �V�[�g��
013400     WHEN  �\��V�[�g
013500       MOVE  �\��t�@�C����       TO  �t�@�C����
013600       MOVE  �\��V�[�g��         TO  �V�[�g��
013700     END-EVALUATE
013800     CALL  "�t�@�C�����p����"
013900     CALL  "���[�N�V�[�g�T�C�Y�擾"
014000*
014100* �o�^����Ă���f�[�^�������A��������
014200*
014300     PERFORM TEST BEFORE VARYING �s���J�E���^ FROM 1 BY 1 
014400                                  UNTIL  �s���J�E���^  >= �s��
014500       COMPUTE �s�J�E���^ = �s���J�E���^ + 1 
014600       PERFORM  TEST BEFORE VARYING ��J�E���^ FROM 1 BY 1
014700                                  UNTIL  ��J�E���^    > ��
014800         INVOKE  ���[�N�V�[�g         "GET-CELLS" 
014900                                      USING            �s�J�E���^
015000                                                       ��J�E���^
015100                                      RETURNING        �Z���Q��(��J�E���^) 
015200       END-PERFORM
015300*
015400* �f�[�^�擾
015500*
015600       EVALUATE  �V�[�g���
015700       WHEN  ��c���V�[�g
015800         INVOKE  �Z���Q��(1)          "GET-VALUE" 
015900                                      RETURNING        ��c���� OF ��c���d�l���R�[�h 
016000
016100         INVOKE  �Z���Q��(2)          "GET-VALUE"
016200                                      RETURNING        ���     OF ��c���d�l���R�[�h
016300         INVOKE  �Z���Q��(3)          "GET-VALUE" 
016400                                      RETURNING        ����     OF ��c���d�l���R�[�h
016500         INVOKE  �Z���Q��(4)          "GET-VALUE"
016600                                      RETURNING        ���     OF ��c���d�l���R�[�h
016700       WHEN  �\��V�[�g
016800         INVOKE  �Z���Q��(1)          "GET-VALUE" 
016900                                      RETURNING        �\��ԍ� OF �\�񃊃X�g���R�[�h 
017000         INVOKE  �Z���Q��(2)          "GET-VALUE"
017100                                      RETURNING        �\���   OF �\�񃊃X�g���R�[�h
017200         INVOKE  �Z���Q��(3)          "GET-VALUE" 
017300                                      RETURNING        ��c���� OF �\�񃊃X�g���R�[�h
017400         INVOKE  �Z���Q��(4)          "GET-VALUE"
017500                                      RETURNING        ���Ԙg   OF �\�񃊃X�g���R�[�h
017600         INVOKE  �Z���Q��(5)          "GET-VALUE"
017700                                      RETURNING        �\��Җ� OF �\�񃊃X�g���R�[�h
017800         INVOKE  �Z���Q��(6)          "GET-VALUE"
017900                                      RETURNING        ����     OF �\�񃊃X�g���R�[�h
018000         INVOKE  �Z���Q��(7)          "GET-VALUE"
018100                                      RETURNING        ����     OF �\�񃊃X�g���R�[�h
018200       END-EVALUATE
018300*
018400* �f�[�^��o���Ɏg�p�����Z���I�u�W�F�N�g���폜����
018500*
018600       PERFORM TEST BEFORE VARYING ��J�E���^ FROM 1 BY 1 
018700                                  UNTIL ��J�E���^ > ��
018800         SET �Z���Q��(��J�E���^) TO  NULL
018900       END-PERFORM
019000*
019100* �e�I�u�W�F�N�g�𐶐�����B
019200*
019300       EVALUATE  �V�[�g���
019400       WHEN  ��c���V�[�g
019500         INVOKE ��c�����Ǘ��N���X  "NEW"
019600                                      RETURNING        ��c���Ǘ��I�u�W�F�N�g
019700         INVOKE ��c���Ǘ��I�u�W�F�N�g "�d�l���̒ǉ�" 
019800                                      USING BY CONTENT ��c���d�l���R�[�h
019900       WHEN  �\��V�[�g
020000         IF �{���̓��t <= �\��� OF �\�񃊃X�g���R�[�h THEN
020100           INVOKE  �\��Ǘ��N���X     "NEW"
020200                                       RETURNING       �\��Ǘ��I�u�W�F�N�g
020300           INVOKE �\��Ǘ��I�u�W�F�N�g "�\��" 
020400                                      USING BY CONTENT �\�񃊃X�g���R�[�h
020500                                            BY CONTENT �_�~�[��c���f�[�^
020600                                      RETURNING        �����R�[�h
020700         END-IF
020800       END-EVALUATE
020900     END-PERFORM
021000*
021100* EXCEL�V�[�g�̌㏈��
021200     CALL "�t�@�C�����p�I��"
021300     EXIT PROGRAM
021400     .
021500***
021600*** �f�[�^�̕ۑ�
021700***
021800     ENTRY "�f�[�^�̕ۑ�"             USING   �V�[�g���.
021900*
022000* EXCEL�V�[�g�̏���
022100* 
022200     EVALUATE  �V�[�g���
022300     WHEN  ��c���V�[�g
022400       MOVE  ��c���t�@�C����     TO  �t�@�C����
022500       MOVE  ��c���V�[�g��       TO  �V�[�g��
022600     WHEN  �\��V�[�g
022700       MOVE  �\��t�@�C����       TO  �t�@�C����
022800       MOVE  �\��V�[�g��         TO  �V�[�g��
022900     END-EVALUATE
023000     CALL  "�t�@�C�����p����"
023100     CALL  "�O�f�[�^����"
023200*
023300* ��^�C�g���̐ݒ�
023400*
023500     MOVE  LOW-VALUE              TO  ��^�C�g��
023600     EVALUATE  �V�[�g���
023700     WHEN  ��c���V�[�g
023800       MOVE  "��c����"           TO  �^�C�g����(1)
023900       MOVE  "���"               TO  �^�C�g����(2)
024000       MOVE  "����"               TO  �^�C�g����(3)
024100       MOVE  "���"               TO  �^�C�g����(4)
024200       MOVE  4                    TO  ��
024300     WHEN  �\��V�[�g
024400       MOVE  "�\��ԍ�"           TO  �^�C�g����(1)
024500       MOVE  "�\���"             TO  �^�C�g����(2)
024600       MOVE  "��c����"           TO  �^�C�g����(3)
024700       MOVE  "���Ԙg"             TO  �^�C�g����(4)
024800       MOVE  "�\���"             TO  �^�C�g����(5)
024900       MOVE  "����"               TO  �^�C�g����(6)
025000       MOVE  "����"               TO  �^�C�g����(7)
025100       MOVE  7                    TO  ��
025200     END-EVALUATE
025300       MOVE  1                    TO  �s�J�E���^
025400*
025500     PERFORM TEST BEFORE VARYING ��J�E���^ FROM 1 BY 1
025600                                  UNTIL  ��J�E���^ > ��
025700       CALL  "��^�C�g���ݒ�"     USING BY CONTENT  �^�C�g����(��J�E���^)
025800                                        BY CONTENT  ��J�E���^
025900     END-PERFORM
026000*
026100* �e���X�g�ɓo�^���ꂽ���ɁAEXCEL�V�[�g�ɏ����o���B
026200*
026300     EVALUATE  �V�[�g���
026400     WHEN      ��c���V�[�g
026500       INVOKE  ��c�����Ǘ��N���X   "NEW"
026600                                      RETURNING        ��c���Ǘ��I�u�W�F�N�g
026700       INVOKE  ��c���Ǘ��I�u�W�F�N�g "�d�l���X�g�̎Q��"
026800                                      RETURNING        ���X�g�I�u�W�F�N�g
026900     WHEN      �\��V�[�g
027000       INVOKE  �\����N���X         "�\�񃊃X�g�I�u�W�F�N�g�̎Q��"
027100                                      RETURNING        ���X�g�I�u�W�F�N�g
027200     END-EVALUATE
027300*
027400     IF  ���X�g�I�u�W�F�N�g NOT = NULL THEN
027500       INVOKE  ���X�g�C�e���[�^         "�C�e���[�^����"
027600                                        USING BY CONTENT ���X�g�I�u�W�F�N�g
027700                                        RETURNING        �C�e���[�^�I�u�W�F�N�g
027800       INVOKE  �C�e���[�^�I�u�W�F�N�g   "�擪�v�f�ݒ�"
027900       PERFORM TEST BEFORE 
028000        UNTIL �C�e���[�^�I�u�W�F�N�g :: "�v�f�m�F" = ZOFF
028100         EVALUATE �V�[�g���
028200         WHEN     ��c���V�[�g
028300           INVOKE  �C�e���[�^�I�u�W�F�N�g :: "���݂̗v�f�擾"  "�d�l�Q��"
028400                                        RETURNING        ��c���d�l���R�[�h
028500         WHEN     �\��V�[�g
028600           INVOKE  �C�e���[�^�I�u�W�F�N�g :: "���݂̗v�f�擾"  "�\��f�[�^�̎Q��"
028700                                        RETURNING        �\�񃊃X�g���R�[�h
028800         END-EVALUATE
028900*
029000         COMPUTE �s�J�E���^ = �s�J�E���^ + 1
029100         PERFORM TEST BEFORE VARYING ��J�E���^ FROM 1 BY 1
029200                                    UNTIL ��J�E���^ > ��
029300           INVOKE  ���[�N�V�[�g         "GET-CELLS" 
029400                                        USING            �s�J�E���^
029500                                                         ��J�E���^
029600                                        RETURNING        �Z���Q��(��J�E���^) 
029700         END-PERFORM   
029800*
029900* �f�[�^�ݒ�
030000*
030100         EVALUATE  �V�[�g���
030200         WHEN  ��c���V�[�g
030300           INVOKE  �Z���Q��(1)          "SET-VALUE" 
030400                                        USING            ��c���� OF ��c���d�l���R�[�h
030500           INVOKE  �Z���Q��(2)          "SET-VALUE" 
030600                                        USING            ���     OF ��c���d�l���R�[�h
030700           INVOKE  �Z���Q��(3)          "SET-VALUE" 
030800                                        USING            ����     OF ��c���d�l���R�[�h
030900           INVOKE  �Z���Q��(4)          "SET-VALUE" 
031000                                        USING            ���     OF ��c���d�l���R�[�h
031100         WHEN  �\��V�[�g
031200           INVOKE  �Z���Q��(1)          "SET-VALUE" 
031300                                        USING            �\��ԍ� OF �\�񃊃X�g���R�[�h 
031400           INVOKE  �Z���Q��(2)          "SET-VALUE"
031500                                        USING            �\���   OF �\�񃊃X�g���R�[�h
031600           INVOKE  �Z���Q��(3)          "SET-VALUE" 
031700                                        USING            ��c���� OF �\�񃊃X�g���R�[�h
031800           INVOKE  �Z���Q��(4)          "SET-VALUE"
031900                                        USING            ���Ԙg   OF �\�񃊃X�g���R�[�h
032000           INVOKE  �Z���Q��(5)          "SET-VALUE"
032100                                        USING            �\��Җ� OF �\�񃊃X�g���R�[�h
032200           INVOKE  �Z���Q��(6)          "SET-VALUE"
032300                                        USING            ����     OF �\�񃊃X�g���R�[�h
032400           INVOKE  �Z���Q��(7)          "SET-VALUE"
032500                                        USING            ����     OF �\�񃊃X�g���R�[�h
032600         END-EVALUATE
032700         INVOKE  �C�e���[�^�I�u�W�F�N�g "���v�f�ݒ�"
032800       END-PERFORM
032900       SET  �C�e���[�^�I�u�W�F�N�g  TO  NULL
033000     END-IF
033100*
033200* �����o���I������
033300*
033400     INVOKE  ���[�N�u�b�N             "SAVE" 
033500     CALL    "�t�@�C�����p�I��"
033600     .
033700***
033800*** �t�@�C�����p����
033900***
034000 PROGRAM-ID.  �t�@�C�����p����  IS COMMON.
034100 PROCEDURE       DIVISION.
034200*
034300* 1) EXCEL���N������ (CREATE-OBJECT)
034400* 2) �N������EXCEL������Ԃɂ���B(SET-VISIBLE)
034500* 3) ���[�N�u�b�N�̎��o���B(GET-WORKBOOKS)
034600* 4) �t�@�C���̃I�[�v�� (OPEN)
034700* 5) ���[�N�u�b�N����V�[�g�R���N�V���������o�� (GET-WORKSEETS)
034800* 6) �V�[�g�R���N�V�������烏�[�N�V�[�g�����o�� (GET-ITEM)
034900     INVOKE  OLE                      "CREATE-OBJECT"
035000                                      USING            �A�v���P�[�V������
035100                                      RETURNING        EXCEL
035200     INVOKE  EXCEL                    "SET-VISIBLE"
035300                                      USING            OLE-FALSE
035400     INVOKE  EXCEL                    "GET-WORKBOOKS"
035500                                      RETURNING        ���[�N�u�b�N
035600     INVOKE  ���[�N�u�b�N             "OPEN"
035700                                      USING            �t�@�C����
035800                                      RETURNING        ���[�N�u�b�N
035900     INVOKE  ���[�N�u�b�N             "GET-WORKSHEETS"
036000                                      RETURNING        �V�[�g
036100     INVOKE  �V�[�g                   "GET-ITEM"
036200                                      USING BY REFERENCE �V�[�g��
036300                                      RETURNING        ���[�N�V�[�g
036400      EXIT PROGRAM.
036500 END PROGRAM  �t�@�C�����p����.
036600***
036700*** �t�@�C�����p�I��
036800***
036900 PROGRAM-ID.  �t�@�C�����p�I��  IS COMMON.
037000 DATA            DIVISION.
037100 PROCEDURE       DIVISION.
037200     IF ���[�N�u�b�N NOT = NULL THEN
037300       INVOKE ���[�N�u�b�N            "CLOSE" 
037400                                      USING            OLE-FALSE
037500     END-IF
037600     IF EXCEL NOT = NULL THEN
037700       INVOKE EXCEL                   "QUIT"
037800     END-IF
037900     SET  ��͈�                  TO  NULL
038000     SET  �s�͈�                  TO  NULL
038100     SET  �I��͈�                TO  NULL
038200     SET  �S�͈�                  TO  NULL
038300     SET  ���[�N�V�[�g            TO  NULL
038400     SET  �V�[�g                  TO  NULL
038500     SET  ���[�N�u�b�N            TO  NULL
038600     IF EXCEL NOT = NULL THEN
038700       INVOKE  EXCEL                  "SET-VISIBLE"
038800                                      USING            OLE-TRUE
038900     END-IF
039000     SET  EXCEL                   TO  NULL
039100 END PROGRAM �t�@�C�����p�I��.
039200***
039300*** ���[�N�V�[�g�T�C�Y�擾
039400***   �t�@�C���̒��ɉ����̃f�[�^���i�[����Ă���̂����ׂ�B
039500***
039600 PROGRAM-ID.  ���[�N�V�[�g�T�C�Y�擾  IS COMMON.
039700 DATA            DIVISION.
039800 PROCEDURE       DIVISION.
039900     INVOKE  ���[�N�V�[�g             "GET-ROWS"
040000                                      RETURNING        �S�͈�
040100     INVOKE  �S�͈�                   "GET-CURRENTREGION"
040200                                      RETURNING        �I��͈�
040300     INVOKE  �I��͈�                 "GET-ROWS"
040400                                      RETURNING        �s�͈�
040500     INVOKE  �I��͈�                 "GET-COLUMNS" 
040600                                      RETURNING        ��͈�
040700     INVOKE  �s�͈�                   "GET-COUNT"
040800                                      RETURNING        �s��
040900     INVOKE  ��͈�                   "GET-COUNT" 
041000                                      RETURNING        ��
041100 END PROGRAM  ���[�N�V�[�g�T�C�Y�擾.
041200***
041300*** �O�f�[�^����
041400***
041500 PROGRAM-ID.  �O�f�[�^����  IS COMMON.
041600 DATA            DIVISION.
041700 LINKAGE         SECTION.
041800 PROCEDURE       DIVISION.
041900     INVOKE  ���[�N�u�b�N             "SET-SAVED"
042000                                      USING            OLE-TRUE
042100*
042200* �O�f�[�^���폜����
042300*
042400     INVOKE  ���[�N�V�[�g             "GET-ROWS"
042500                                      RETURNING        �S�͈�
042600     INVOKE  �S�͈�                   "CLEARCONTENTS"
042700     .
042800 END PROGRAM  �O�f�[�^����.
042900***
043000***  ��^�C�g���ݒ�
043100***
043200 PROGRAM-ID.  ��^�C�g���ݒ� IS COMMON.
043300 DATA            DIVISION.
043400 LINKAGE         SECTION.
043500  01 �k�|��^�C�g����             PIC X(10).
043600  01 �k�|��J�E���^               PIC S9(9)  COMP-5.
043700 PROCEDURE       DIVISION
043800                    USING         �k�|��^�C�g����
043900                                  �k�|��J�E���^.
044000     MOVE  �k�|��J�E���^         TO  ��J�E���^
044100*
044200     INVOKE  ���[�N�V�[�g             "GET-CELLS"
044300                                      USING            �s�J�E���^
044400                                                       ��J�E���^
044500                                      RETURNING        �Z���Q��(��J�E���^) 
044600     INVOKE �Z���Q��(��J�E���^)      "SET-VALUE" 
044700                                      USING BY REFERENCE �k�|��^�C�g����
044800     SET    �Z���Q��(�s�J�E���^)  TO  NULL
044900 END PROGRAM  ��^�C�g���ݒ�.
045000 END PROGRAM  EXCEL-EDIT.
