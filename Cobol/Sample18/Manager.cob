000100*========================================================================
000200*�@�Ǘ��҃N���X�iManager-class�j�@�@�|�T���v���v���O�����u�]�ƈ��Ǘ��v�|
000300*
000400*�@�@�@�Ǘ��҂ɂ��ČŗL�ȃf�[�^�y�у��\�b�h�����B
000500*
000600*�@�Z�p���N���X
000700*�@�@�P�j�]�ƈ��N���X�iAllMember-class�j
000800*
000900*�@�Z�I�u�W�F�N�g�f�[�^
001000*�@�@�P�j���ʎ蓖�@�|�@PIC 9(6)
001100*
001200*�@�Z�I�u�W�F�N�g���\�b�h
001300*�@�@�P�j�I�u�W�F�N�g�f�[�^�ɑ΂���CGET�y��SET�̃v���p�e�B���\�b�h
001400*�@�@�Q�j���^�v�Z���\�b�h�iSalary-method�j
001500*�@�@�R�j�ܗ^�v�Z���\�b�h�iBonus-method�j
001600*
001700*                              Copyright 1997-2015 FUJITSU LIMITED
001800*========================================================================
001900 CLASS-ID.   Manager-class INHERITS  AllMember-class.
002000 ENVIRONMENT    DIVISION.
002100 CONFIGURATION  SECTION.
002200 REPOSITORY.
002300     CLASS AllMember-class.
002400*
002500  OBJECT.
002600  DATA DIVISION.
002700  WORKING-STORAGE SECTION.
002800  01  ���ʎ蓖            PIC   9(006) PROPERTY.
002900  PROCEDURE DIVISION.
003000*========================================================================
003100*�@���^�v�Z���\�b�h�iOVERRIDE�CPROTOTYPE�j
003200*
003300*�@�@�@�Ǘ��҂ɑ΂��鋋�^�v�Z���s���B
003400*
003500*�@�Z�o�́F�@���x���iPIC 9(8)�j
003600*�@�Z���́F�@Sala_man.cob
003700*========================================================================
003800  METHOD-ID.     Salary-method  PROTOTYPE OVERRIDE.
003900  DATA DIVISION.
004000  LINKAGE SECTION.
004100   01  �k�|���x��          PIC   9(008).
004200  PROCEDURE   DIVISION
004300                 RETURNING   �k�|���x��.
004400  END METHOD  Salary-method.
004500*
004600*========================================================================
004700*�@�ܗ^�v�Z���\�b�h�iOVERRIDE�CPROTOTYPE�j
004800*
004900*�@�@�@�Ǘ��҂ɑ΂���ܗ^�v�Z���s���B
005000*
005100*�@�Z�o�́F�@���x���iPIC 9(8)�j
005200*�@�Z���́F�@Bonu_man.cob
005300*========================================================================
005400  METHOD-ID.  Bonus-method PROTOTYPE OVERRIDE.
005500  DATA DIVISION.
005600  LINKAGE SECTION.
005700   01  �k�|���x��          PIC   9(008).
005800  PROCEDURE   DIVISION
005900               RETURNING   �k�|���x��.
006000  END METHOD Bonus-method.
006100*
006200  END OBJECT.
006300 END CLASS Manager-class.
