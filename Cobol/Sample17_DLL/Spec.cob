000100*========================================================================
000200*�@�d�l�N���X
000300*                                   �|�T���v���v���O�����u��c���\��v�|
000400*
000500*�@�@�d�l�P�ʂ̏��ɂ��āA�ŗL�ȃf�[�^�y�у��\�b�h�����B
000600*
000700*�@�Z�p���N���X
000800*�@�@�P�jFJBASE
000900*
001000*�@�Z�I�u�W�F�N�g�f�[�^
001100*�@�@�P�j�d�l�f�[�^�@�@�@�@�@�@�@�|�@TYPE �d�l���X�g
001200*
001300*�@�Z�I�u�W�F�N�g���\�b�h
001400*�@�@�P�j�d�l�ݒ�
001500*�@�@�Q�j�d�l�Q��
001600*
001700*            Copyright 1999-2015 FUJITSU LIMITED
001800*========================================================================
001900 IDENTIFICATION  DIVISION.
002000 CLASS-ID.   �d�l�N���X  INHERITS FJBASE.
002100 ENVIRONMENT     DIVISION.
002200 CONFIGURATION   SECTION.
002300 REPOSITORY.
002400     CLASS FJBASE
002500     .
002600 FACTORY.
002700 END FACTORY.
002800*
002900 OBJECT.
003000 DATA DIVISION.
003100 BASED-STORAGE   SECTION.
003200  COPY SPECINFO.
003300 WORKING-STORAGE SECTION.
003400  01  �d�l�f�[�^                  TYPE �d�l���X�g.
003500 PROCEDURE       DIVISION.
003600*========================================================================
003700*�@�d�l�ݒ胁�\�b�h
003800*
003900*�@�@�d�l����ݒ肷��B
004000*
004100*�@�Z���́F�d�l�f�[�^ (TYPE �d�l���X�g)
004200*�@�Z�o�́F�Ȃ�
004300*========================================================================
004400 METHOD-ID.  �d�l�ݒ�.
004500 DATA            DIVISION.
004600 LINKAGE         SECTION.
004700  01 �k�|�d�l�f�[�^               TYPE �d�l���X�g.
004800 PROCEDURE       DIVISION
004900                    USING         �k�|�d�l�f�[�^.
005000     MOVE  �k�|�d�l�f�[�^         TO  �d�l�f�[�^
005100 END METHOD �d�l�ݒ�.
005200*========================================================================
005300*�@�d�l�Q�ƃ��\�b�h
005400*
005500*�@�@�d�l�����擾����B
005600*
005700*�@�Z���́F�Ȃ�
005800*�@�Z�o�́F�d�l�f�[�^ (TYPE �d�l���X�g)
005900*========================================================================
006000 METHOD-ID.    �d�l�Q��.
006100 DATA            DIVISION.
006200 LINKAGE         SECTION.
006300  01 �k�|�d�l�f�[�^               TYPE �d�l���X�g.
006400 PROCEDURE       DIVISION
006500                    RETURNING     �k�|�d�l�f�[�^.
006600     MOVE  �d�l�f�[�^             TO  �k�|�d�l�f�[�^
006700 END METHOD �d�l�Q��.
006800 END OBJECT.
006900 END CLASS  �d�l�N���X.
