000100*========================================================================
000200*�@��ʃN���X(Member-class�j�@�@�@�@�|�T���v���v���O�����u�]�ƈ��Ǘ��v�|
000300*
000400*�@�@�@��ʏ]�ƈ��ɂ��ČŗL�ȃf�[�^�y�у��\�b�h�����B
000500*
000600*�@�Z�p���N���X
000700*�@�@�P�j�]�ƈ��N���X�iAllMember-class�j
000800*
000900*�@�Z�I�u�W�F�N�g�f�[�^
001000*�@�@�P�j���ԊO�蓖�@�|�@PIC 9(5)
001100*�@�@�Q�j�c�Ǝ���  �@�|�@PIC 9(5)
001200*
001300*�@�Z�I�u�W�F�N�g���\�b�h
001400*�@�@�P�j�I�u�W�F�N�g�f�[�^�ɑ΂���CGET�y��SET�̃v���p�e�B���\�b�h
001500*�@�@�Q�j���^�v�Z�iSalary-method�j
001600*�@�@�R�j�ܗ^�v�Z�iBonus-method�j
001700*
001800*                              Copyright 1997-2015 FUJITSU LIMITED
001900*========================================================================
002000 CLASS-ID.   Member-class INHERITS  AllMember-class.
002100 ENVIRONMENT    DIVISION.
002200 CONFIGURATION    SECTION.
002300 REPOSITORY.
002400     CLASS AllMember-class.
002500*
002600  OBJECT.
002700  DATA DIVISION.
002800  WORKING-STORAGE SECTION.
002900  01  ���ԊO�蓖            PIC   9(5)        PROPERTY.
003000  01  �c�Ǝ���              PIC   9(5)V9(1)   PROPERTY.
003100  PROCEDURE DIVISION.
003200*========================================================================
003300*�@���^�v�Z���\�b�h�iOVERRIDE�CPROTOTYPE�j
003400*
003500*�@�@�@��ʏ]�ƈ��ɑ΂��鋋�^�v�Z���s���B
003600*
003700*�@�Z�o�́F�@���x���iPIC 9(8)�j
003800*�@�Z���́F�@Sala_mem.cob
003900*========================================================================
004000  METHOD-ID.  Salary-method  PROTOTYPE  OVERRIDE.
004100  DATA DIVISION.
004200  LINKAGE SECTION.
004300   01  �k�|���x��          PIC   9(8).
004400  PROCEDURE   DIVISION
004500               RETURNING   �k�|���x��.
004600  END METHOD Salary-method.
004700*
004800  END OBJECT.
004900 END CLASS Member-class.
