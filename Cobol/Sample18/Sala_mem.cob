000100*========================================================================
000200*�@���^�v�Z���\�b�h�@�@�@�@�@�@�@�@�|�T���v���v���O�����u�]�ƈ��Ǘ��v�|
000300*
000400*�@�@�@��ʏ]�ƈ��ɑ΂��鋋�^�v�Z���s���B
000500*
000600*�@�Z�����N���X�F�@��ʃN���X
000700*�@�ZOVERRIDE���\�b�h�i�]�ƈ��N���X�j
000800*�@�Z�o�́F      �@���x���iPIC 9(8)�j
000900*
001000*                              Copyright 1997-2015 FUJITSU LIMITED
001100*========================================================================
001200 METHOD-ID.   Salary-method  OF  Member-class.
001300 ENVIRONMENT        DIVISION.
001400 CONFIGURATION      SECTION.
001500  REPOSITORY.
001600      CLASS  Member-class.
001700 DATA DIVISION.
001800 WORKING-STORAGE    SECTION.
001900  01  �v�|��{��      PIC   9(8).
002000 LINKAGE SECTION.
002100  01  �k�|���x��          PIC   9(8).
002200 PROCEDURE   DIVISION    RETURNING   �k�|���x��.
002300*
002400     INVOKE  SUPER  "Salary-method"  RETURNING  �v�|��{��.
002500     COMPUTE  �k�|���x��  =
002600              �v�|��{��  +  (�c�Ǝ���  *  ���ԊO�蓖).
002700*
002800 END METHOD Salary-method.
