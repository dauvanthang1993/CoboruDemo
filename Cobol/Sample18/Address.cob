000100*========================================================================
000200*�@�Z���N���X�iAddress-class�j�@�@�@�|�T���v���v���O�����u�]�ƈ��Ǘ��v�|
000300*
000400*�@�@�@�]�ƈ��ЂƂ�ɑ΂���Z���f�[�^�ƁC������Q�ƁE�X�V���邽�߂̃��\
000500*�@�@�b�h�����B
000600*
000700*�@�Z�p���N���X
000800*�@�@�@�e����������
000900*
001000*�@�Z�I�u�W�F�N�g�f�[�^
001100*�@�@�@�X�֔ԍ�
001200*�@�@�@�Z��
001300*
001400*�@�Z�I�u�W�F�N�g���\�b�h
001500*�@�@�@�I�u�W�F�N�g�f�[�^�ɑ΂���CGET�y��SET�̃v���p�e�B���\�b�h
001600*
001700*                              Copyright 1997-2015 FUJITSU LIMITED
001800*========================================================================
001900 CLASS-ID.   Address-class INHERITS FJBASE.
002000 ENVIRONMENT    DIVISION.
002100 CONFIGURATION  SECTION.
002200 REPOSITORY.
002300     CLASS FJBASE.
002400*
002500   OBJECT.
002600   DATA DIVISION.
002700   WORKING-STORAGE SECTION.
002800   01  �X�֔ԍ�             PIC   X(007) PROPERTY.
002900   01  �Z��                 PIC   N(020) PROPERTY.
003000   PROCEDURE DIVISION.
003100*
003200   END OBJECT.
003300  END CLASS Address-class.
