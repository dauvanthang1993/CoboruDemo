000100*========================================================================
000200*�@�ܗ^�v�Z���\�b�h�@�@�@�@�|�T���v���v���O�����u�]�ƈ��Ǘ��i�i�����j�v�|
000300*
000400*�@�@�@�Ǘ��҂ɑ΂���ܗ^�v�Z���s���B
000500*
000600*�@�Z�����N���X�F�@��ʃN���X
000700*�@�ZOVERRIDE���\�b�h�i�]�ƈ��N���X�j
000800*�@�Z�o�́@�@�@�F�@���x���iPIC 9(8)�j
000900*
001000*                              Copyright 1997-2015 FUJITSU LIMITED
001100*========================================================================
001200  METHOD-ID.  Bonus-method OF Manager-class.
001300  ENVIRONMENT         DIVISION.
001400  CONFIGURATION       SECTION.
001500    REPOSITORY.
001600        CLASS  Manager-class.
001700  DATA DIVISION.
001800  WORKING-STORAGE     SECTION.
001900   01  �v�|��{��          PIC   9(008).
002000  LINKAGE SECTION.
002100   01  �k�|���x��          PIC   9(008).
002200  PROCEDURE   DIVISION     RETURNING  �k�|���x��.
002300*
002400      MOVE   ��{��  OF  SELF      TO    �v�|��{��.
002500      COMPUTE  �k�|���x��   =  (�v�|��{�� +  ���ʎ蓖)  *  2.5.
002600*
002700  END METHOD Bonus-method.
