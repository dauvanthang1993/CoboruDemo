000100*========================================================================
000200*�@���^�v�Z���\�b�h�@�@�@�@�@�@�@�@�@�|�T���v���v���O�����u�]�ƈ��Ǘ��v�|
000300*
000400*�@�@�@�Ǘ��҂ɑ΂��鋋�^�v�Z���s���B
000500*
000600*�@�Z�����N���X�F�@�Ǘ��҃N���X
000700*�@�ZOVERRIDE���\�b�h�i�]�ƈ��N���X�j
000800*�@�Z�o�́@�@�@�F�@���x���iPIC 9(8)�j
000900*                              Copyright 1997-2015 FUJITSU LIMITED
001000*========================================================================
001100 METHOD-ID.  Salary-method  OF  Manager-class.
001200 ENVIRONMENT        DIVISION.
001300 CONFIGURATION      SECTION.
001400   REPOSITORY.
001500       CLASS  Manager-class.
001600 DATA DIVISION.
001700 WORKING-STORAGE    SECTION.
001800  01  �v�|��{��      PIC   9(008).
001900 LINKAGE SECTION.
002000  01  �k�|���x��      PIC   9(008).
002100 PROCEDURE   DIVISION    RETURNING   �k�|���x��.
002200*
002300     INVOKE  SUPER  "Salary-method"  RETURNING  �v�|��{��.
002400     COMPUTE  �k�|���x��   =   �v�|��{��  +  ���ʎ蓖.
002500*
002600 END METHOD Salary-method.
