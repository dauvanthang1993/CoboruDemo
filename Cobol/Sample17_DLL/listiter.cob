000100*========================================================================
000200*�@���X�g�C�e���[�^
000300*                                   �|�T���v���v���O�����u��c���\��v�|
000400*
000500*�@�@���X�g�I�u�W�F�N�g�̓����\�����ӎ������ɁA�v�f�֏��A�N�Z�X����B
000600*
000700*�@�Z�p���N���X
000800*�@�@�P�jFJBASE
000900*
001000*�@�Z�Q�ƃN���X
001100*�@�@�P�jList
001200*
001300*�@�Z�I�u�W�F�N�g�f�[�^
001400*�@�@�P�j���݂̗v�f    �@�@�@�@�@�|�@PIC 9(8) BINARY  (PROPERTY)
001500*�@�@�Q�j���X�g�I�u�W�F�N�g�@�@�@�|  OBJECT REFERENCE List  (PROPERTY)
001600*
001700*�@�Z�t�@�N�g�����\�b�h
001800*�@�@�P�j�C�e���[�^����
001900*
002000*�@�Z�I�u�W�F�N�g���\�b�h
002100*�@�@�P�j�擪�v�f�ݒ�
002200*�@�@�Q�j���v�f�ݒ�
002300*�@�@�R�j�v�f�m�F
002400*�@�@�S�j���݂̗v�f�擾
002500*
002600*            Copyright 1999-2015 FUJITSU LIMITED
002700*========================================================================
002800 IDENTIFICATION  DIVISION.
002900 CLASS-ID.   ���X�g�C�e���[�^ INHERITS FJBASE.
003000 ENVIRONMENT     DIVISION.
003100 CONFIGURATION   SECTION.
003200 SPECIAL-NAMES.
003300     SYMBOLIC CONSTANT
003400     COPY R_CONST.
003500     .
003600 REPOSITORY.
003700     CLASS FJBASE
003800     CLASS List.
003900 FACTORY.
004000 PROCEDURE       DIVISION.
004100**========================================================================
004200*�@�C�e���[�^�������\�b�h
004300*
004400*�@�@���̓p�����^�ł��郊�X�g�I�u�W�F�N�g�ɑ΂��āA�C�e���[�^�I�u�W�F�N�g
004500*�@�𐶐����A�ԋp����B
004600*
004700*�@�Z���́F���X�g�I�u�W�F�N�g (OBJECT REFERENCE List)
004800*�@�Z�o�́F�C�e���[�^�I�u�W�F�N�g (OBJECT REFERENCE SELF)
004900*========================================================================
005000 METHOD-ID.  �C�e���[�^����.
005100 DATA            DIVISION.
005200 LINKAGE         SECTION.
005300  01  �k�|���X�g�I�u�W�F�N�g          OBJECT REFERENCE List.
005400  01  �k�|�C�e���[�^�I�u�W�F�N�g      OBJECT REFERENCE SELF.
005500 PROCEDURE       DIVISION
005600                    USING             �k�|���X�g�I�u�W�F�N�g
005700                    RETURNING         �k�|�C�e���[�^�I�u�W�F�N�g.
005800     INVOKE SELF    "NEW"             RETURNING        �k�|�C�e���[�^�I�u�W�F�N�g.
005900     SET  ���X�g�I�u�W�F�N�g  OF  �k�|�C�e���[�^�I�u�W�F�N�g
006000                                  TO  �k�|���X�g�I�u�W�F�N�g
006100     MOVE   0                     TO  ���݂̗v�f  OF �k�|�C�e���[�^�I�u�W�F�N�g
006200 END METHOD �C�e���[�^����.
006300 END FACTORY.
006400*
006500 OBJECT.
006600 DATA DIVISION.
006700 WORKING-STORAGE SECTION.
006800  01  ���݂̗v�f                      PIC 9(8) BINARY       PROPERTY.
006900  01  ���X�g�I�u�W�F�N�g              OBJECT REFERENCE List PROPERTY.
007000 PROCEDURE       DIVISION.
007100*========================================================================
007200*�@�擪�v�f�ݒ胁�\�b�h
007300*
007400*  ���X�g�I�u�W�F�N�g�̐擪�v�f��ݒ肷��B
007500*
007600*�@�Z���́F�Ȃ�
007700*�@�Z�o�́F�Ȃ�
007800*========================================================================
007900 METHOD-ID.  �擪�v�f�ݒ�.
008000 DATA            DIVISION.
008100 LINKAGE         SECTION.
008200 PROCEDURE       DIVISION.
008300     MOVE  1                      TO  ���݂̗v�f.
008400 END METHOD �擪�v�f�ݒ�.
008500*========================================================================
008600*�@���v�f�ݒ胁�\�b�h
008700*
008800*  ���X�g�I�u�W�F�N�g���̎��̗v�f��ݒ肷��B
008900*
009000*�@�Z���́F�Ȃ�
009100*�@�Z�o�́F�Ȃ�
009200*========================================================================
009300 METHOD-ID.  ���v�f�ݒ�.
009400 DATA            DIVISION.
009500 WORKING-STORAGE SECTION.
009600 LINKAGE         SECTION.
009700 PROCEDURE       DIVISION.
009800     COMPUTE ���݂̗v�f  = ���݂̗v�f  + 1
009900 END METHOD ���v�f�ݒ�.
010000*========================================================================
010100*�@�v�f�m�F���\�b�h
010200*
010300*  ���X�g�I�u�W�F�N�g���̗v�f���w���Ă��邩�ǂ������m�F����B
010400*�@�v�f�����X�g�I�u�W�F�N�g���ɂ����ZON���A�Ȃ����ZOFF��ԋp����B
010500*
010600*�@�Z���́F�Ȃ�
010700*�@�Z�o�́F�v�f�m�F�t���O (PIC 1(1) BIT)
010800*========================================================================
010900 METHOD-ID.  �v�f�m�F.
011000 DATA            DIVISION.
011100 WORKING-STORAGE SECTION.
011200  01  �S�v�f��                        PIC 9(8) BINARY.
011300 LINKAGE         SECTION.
011400  01  �k�|�v�f�m�F�t���O              PIC 1(1) BIT.
011500 PROCEDURE       DIVISION
011600                    RETURNING         �k�|�v�f�m�F�t���O.
011700     INVOKE ���X�g�I�u�W�F�N�g        "CollectionSize-Get"
011800                                      RETURNING        �S�v�f��
011900     IF �S�v�f�� >= ���݂̗v�f THEN
012000       MOVE  ZON                  TO  �k�|�v�f�m�F�t���O
012100     ELSE
012200       MOVE  ZOFF                 TO  �k�|�v�f�m�F�t���O
012300     END-IF
012400 END METHOD �v�f�m�F.
012500*========================================================================
012600*�@���݂̗v�f�擾���\�b�h
012700*
012800*  ���X�g�I�u�W�F�N�g���̌��݂̗v�f��ԋp����B
012900*
013000*�@�Z���́F�Ȃ�
013100*�@�Z�o�́F���ʃI�u�W�F�N�g (OBJECT REFERENCE)
013200*========================================================================
013300 METHOD-ID.  ���݂̗v�f�擾.
013400 DATA            DIVISION.
013500 WORKING-STORAGE SECTION.
013600 LINKAGE         SECTION.
013700  01  �k�|���ʃI�u�W�F�N�g            OBJECT REFERENCE.
013800 PROCEDURE       DIVISION
013900                    RETURNING         �k�|���ʃI�u�W�F�N�g.
014000     INVOKE ���X�g�I�u�W�F�N�g        "Element-Get"
014100                                      USING            ���݂̗v�f
014200                                      RETURNING        �k�|���ʃI�u�W�F�N�g
014300 END METHOD ���݂̗v�f�擾.
014400 END OBJECT.
014500 END CLASS  ���X�g�C�e���[�^.
