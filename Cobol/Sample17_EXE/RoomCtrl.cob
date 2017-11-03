000100*========================================================================
000200*�@��c�����Ǘ��N���X
000300*                                   �|�T���v���v���O�����u��c���\��v�|
000400*
000500*�@�@��c�������Ǘ����邽�߂̃��\�b�h�����B
000600*
000700*�@�Z�p���N���X
000800*�@�@�P�j�V���O���g��
000900*�@�@�Q�j�d�l�Ǘ��N���X
001000*
001100*�@�Z�Q�ƃN���X
001200*�@�@�P�jList
001300*�@�@�Q�j��c�����N���X
001400*�@�@�R�j���X�g�C�e���[�^
001500*�@�@�S�j�G���[�N���X
001600*
001700*�@�Z�I�u�W�F�N�g���\�b�h
001800*�@�@�P�j�������@�iINIT�j
001900*�@�@�Q�j��c�����̈ꗗ�\��
002000*
002100*            Copyright 1999-2015 FUJITSU LIMITED
002200*========================================================================
002300 IDENTIFICATION  DIVISION.
002400 CLASS-ID.   ��c�����Ǘ��N���X  INHERITS �V���O���g�� �d�l�Ǘ��N���X.
002500 ENVIRONMENT     DIVISION.
002600 CONFIGURATION   SECTION.
002700 SPECIAL-NAMES.
002800     SYMBOLIC CONSTANT
002900     COPY R_CONST.
003000     .
003100 REPOSITORY.
003200     CLASS List
003300     CLASS �V���O���g��
003400     CLASS �d�l�Ǘ��N���X
003500     CLASS ��c�����N���X
003600     CLASS �G���[�N���X
003700     CLASS ���X�g�C�e���[�^
003800     .
003900*
004000 FACTORY.
004100 DATA            DIVISION.
004200 WORKING-STORAGE SECTION.
004300 PROCEDURE       DIVISION.
004400 END FACTORY.
004500*
004600 OBJECT.
004700 DATA DIVISION.
004800 BASED-STORAGE   SECTION.
004900  COPY ROOMINFO.
005000 WORKING-STORAGE SECTION.
005100 PROCEDURE       DIVISION.
005200*========================================================================
005300*�@�������iINIT�j
005400*
005500*�@�@�d�l�N���X�̐ݒ胁�\�b�h���Ăяo���ĉ�c�����N���X��ݒ肷��B
005600*�@�@�܂��A��c����������щ�c����񃊃X�g�I�u�W�F�N�g�̏��������s��
005700*�@�ׂɁAINIT���\�b�h���Ăяo���B 
005800*
005900*�@�Z���́F�Ȃ�
006000*�@�Z�o�́F�Ȃ�
006100*========================================================================
006200 METHOD-ID.  INIT  OVERRIDE.
006300 DATA            DIVISION.
006400 WORKING-STORAGE SECTION.
006500 PROCEDURE       DIVISION.
006600     INVOKE  SELF                     "�d�l�N���X�̐ݒ�"
006700                                      USING BY CONTENT ��c�����N���X
006800     INVOKE  �d�l�Ǘ��N���X OF SUPER  "INIT"
006900 END METHOD INIT.
007000*========================================================================
007100*�@��c�����̈ꗗ�\��
007200*
007300*�@�@��c�����̈ꗗ��\������B
007400*
007500*�@�Z���́F�Ȃ�
007600*�@�Z�o�́F�Ȃ�
007700*========================================================================
007800 METHOD-ID.  ��c�����̈ꗗ�\��.
007900 DATA            DIVISION.
008000 WORKING-STORAGE SECTION.
008100  01 ��c���f�[�^                     TYPE ��c���d�l.
008200  01 �C�e���[�^�I�u�W�F�N�g           OBJECT REFERENCE ���X�g�C�e���[�^.
008300  01 ���ʃI�u�W�F�N�g                 OBJECT REFERENCE.
008400  01 ��c����񃊃X�g�I�u�W�F�N�g     OBJECT REFERENCE List.
008500  01 ��c���f�[�^�|�\���p.
008600    02                                PIC X(1).
008700    02  �v�|��c����                  PIC X(4).
008800    02                                PIC X(7).
008900    02  �v�|���                      PIC X(3).
009000    02                                PIC X(4).
009100    02  �v�|����                      PIC X(9).
009200    02                                PIC X(2).
009300    02  �v�|���                      PIC N(10).
009400 LINKAGE         SECTION.
009500 PROCEDURE       DIVISION.
009600 DECLARATIVES.
009700 ERR SECTION.
009800     USE AFTER EXCEPTION �G���[�N���X
009900     INVOKE EXCEPTION-OBJECT          "��c����񌟍��G���[".
010000 END DECLARATIVES.  
010100*
010200*  ��c����񃊃X�g�I�u�W�F�N�g�̎擾
010300*
010400     SET  ��c����񃊃X�g�I�u�W�F�N�g  
010500                                  TO  �d�l�Ǘ��N���X OF SUPER :: "�d�l���X�g�̎Q��"
010600*
010700*  ��c����񃊃X�g�I�u�W�F�N�g�ɑ΂��ăC�e���[�^�I�u�W�F�N�g�𐶐����A��
010800*�@�c����񃊃X�g�ɓo�^���ꂽ���ɉ�c�����I�u�W�F�N�g���擾����B
010900*
011000 
011100     INVOKE  ���X�g�C�e���[�^         "�C�e���[�^����"
011200                                      USING BY CONTENT ��c����񃊃X�g�I�u�W�F�N�g
011300                                      RETURNING        �C�e���[�^�I�u�W�F�N�g
011400     INVOKE  �C�e���[�^�I�u�W�F�N�g   "�擪�v�f�ݒ�"
011500*
011600*�@��c�����I�u�W�F�N�g���P���Ȃ���΁A�G���[���b�Z�[�W���o�͂���
011700*
011800     IF  �C�e���[�^�I�u�W�F�N�g   ::  "�v�f�m�F" = ZOFF THEN
011900       RAISE �G���[�N���X :: "NEW" 
012000       SET �C�e���[�^�I�u�W�F�N�g TO  NULL
012100       EXIT METHOD
012200     END-IF
012300*
012400*�@��c�����I�u�W�F�N�g������΁A��c������\������
012500*
012600     DISPLAY "=============================================="
012700     DISPLAY "-��c����---���---����-------���------------"
012800     PERFORM TEST BEFORE 
012900      UNTIL �C�e���[�^�I�u�W�F�N�g :: "�v�f�m�F" = ZOFF
013000       INVOKE �C�e���[�^�I�u�W�F�N�g  "���݂̗v�f�擾"
013100                                      RETURNING        ���ʃI�u�W�F�N�g
013200       MOVE  ���ʃI�u�W�F�N�g AS ��c�����N���X :: "�d�l�Q��"  
013300                                  TO  ��c���f�[�^
013400       MOVE  SPACE                TO  ��c���f�[�^�|�\���p
013500       MOVE  ��c����             TO  �v�|��c����
013600       MOVE  ���                 TO  �v�|���
013700       MOVE  ����                 TO  �v�|����
013800       EVALUATE   ��� 
013900       WHEN  "N"
014000         MOVE  NC"��ʉ�c��"     TO  �v�|���
014100       WHEN  "T"
014200         MOVE  NC"�e���r��c��"   TO  �v�|���
014300       END-EVALUATE
014400       DISPLAY ��c���f�[�^�|�\���p
014500       INVOKE �C�e���[�^�I�u�W�F�N�g  "���v�f�ݒ�"
014600     END-PERFORM
014700     DISPLAY "=============================================="
014800*
014900*�@�C�e���[�^�I�u�W�F�N�g�̍폜
015000*
015100     SET �C�e���[�^�I�u�W�F�N�g   TO  NULL
015200 END METHOD ��c�����̈ꗗ�\��.
015300 END OBJECT.
015400 END CLASS  ��c�����Ǘ��N���X.
