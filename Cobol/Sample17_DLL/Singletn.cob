000100*========================================================================
000200*�@�V���O���g���N���X
000300*                                   �|�T���v���v���O�����u��c���\��v�|
000400*
000500*�@�@NEW ���\�b�h��OVERRIDE���āC���������C���X�^���X���B��̂��̂ł���
000600*�@���Ƃ�ۏ؂���
000700*
000800*�@�Z�p���N���X
000900*�@�@�P�jFJBASE
001000*
001100*  ���t�@�N�g���f�[�^
001200*�@�@�P�j�Ǘ��I�u�W�F�N�g�@�@�@�@�|�@OBJECT REFERENCE SELF
001300*
001400*�@�Z�t�@�N�g�����\�b�h
001500*�@�@�P�jNEW
001600*
001700*            Copyright 1999-2015 FUJITSU LIMITED
001800*========================================================================
001900 IDENTIFICATION  DIVISION.
002000 CLASS-ID.   �V���O���g��  INHERITS FJBASE.
002100 ENVIRONMENT     DIVISION.
002200 CONFIGURATION   SECTION.
002300 SPECIAL-NAMES.
002400 REPOSITORY.
002500     CLASS FJBASE.
002600*
002700 FACTORY.
002800 DATA            DIVISION.
002900 WORKING-STORAGE SECTION.
003000  01  �Ǘ��I�u�W�F�N�g                OBJECT REFERENCE  SELF.
003100 PROCEDURE       DIVISION.
003200*========================================================================
003300*�@NEW
003400*
003500*�@�@�Ǘ��I�u�W�F�N�g�́A�P������������Ȃ����Ƃ�ۏ؂���B
003600*
003700*�@�Z���́F�Ȃ�
003800*�@�Z�o�́F�Ǘ��I�u�W�F�N�g(OBJECT REFERENCE SELF)
003900*========================================================================
004000 METHOD-ID.  NEW  OVERRIDE.
004100 DATA            DIVISION.
004200 LINKAGE         SECTION.
004300  01 �k�|�Ǘ��I�u�W�F�N�g            OBJECT REFERENCE SELF.
004400 PROCEDURE       DIVISION
004500                    RETURNING        �k�|�Ǘ��I�u�W�F�N�g.
004600     IF �Ǘ��I�u�W�F�N�g = NULL THEN
004700       SET �Ǘ��I�u�W�F�N�g  �k�|�Ǘ��I�u�W�F�N�g   
004800                                  TO  SUPER :: "NEW"
004900       INVOKE  �Ǘ��I�u�W�F�N�g   "INIT"
005000     ELSE
005100       SET �k�|�Ǘ��I�u�W�F�N�g   TO  �Ǘ��I�u�W�F�N�g
005200     END-IF
005300 END METHOD NEW.
005400 END FACTORY.
005500 END CLASS  �V���O���g��.
