000100*========================================================================
000200*�@��ʃN���X�iMember-class�j
000300*�@�@�@�@�@�@�@�@�@�@�@�@�|�T���v���v���O�����u�]�ƈ��Ǘ��i�i�����j�v�|
000400*
000500*�@�@�@��ʏ]�ƈ��ɂ��ČŗL�ȃf�[�^�y�у��\�b�h�����B
000600*
000700*�@�Z�p���N���X
000800*�@�@�P�j�]�ƈ��N���X�iAllMember-class�j
000900*
001000*�@�Z�I�u�W�F�N�g�f�[�^
001100*�@�@�P�j���ԊO�蓖�@�|�@PIC 9(5)
001200*�@�@�Q�j�c�Ǝ���  �@�|�@PIC 9(5)
001300*
001400*�@�Z�I�u�W�F�N�g���\�b�h
001500*�@�@�P�j�I�u�W�F�N�g�f�[�^�ɑ΂���CGET�y��SET�̃v���p�e�B���\�b�h
001600*�@�@�Q�j���^�v�Z   �iSalary-method�j
001700*�@�@�R�j�ܗ^�v�Z   �iBonus-method�j
001800*�@�@�S�j�f�[�^�ݒ� �iDataSet-method�j
001900*�@�@�T�j�ۑ��@�@�@ �iStore-method�j
002000*
002100*                              Copyright 1997-2015 FUJITSU LIMITED
002200*========================================================================
002300 CLASS-ID.   Member-class INHERITS  AllMember-class.
002400 ENVIRONMENT    DIVISION.
002500 CONFIGURATION    SECTION.
002600 REPOSITORY.
002700      CLASS AllMember-class.
002800*
002900   OBJECT.
003000   DATA DIVISION.
003100   WORKING-STORAGE SECTION.
003200   01  ���ԊO�蓖            PIC   9(5)        PROPERTY.
003300   01  �c�Ǝ���              PIC   9(5)V9(1)   PROPERTY.
003400   PROCEDURE DIVISION.
003500*========================================================================
003600*�@���^�v�Z���\�b�h�iOVERRIDE�CPROTOTYPE�j
003700*
003800*�@�@�@��ʏ]�ƈ��ɑ΂��鋋�^�v�Z���s���B
003900*
004000*�@�Z�o�́F�@���x��   PIC 9(8)
004100*�@�Z���́F�@Sala_Mem.cob
004200*========================================================================
004300   METHOD-ID.  Salary-method  PROTOTYPE  OVERRIDE.
004400   DATA DIVISION.
004500   LINKAGE SECTION.
004600    01  �k�|���x��          PIC   9(8).
004700   PROCEDURE   DIVISION
004800                RETURNING   �k�|���x��.
004900   END METHOD Salary-method.
005000*
005100*========================================================================
005200*�@�ܗ^�v�Z���\�b�h�iOVERRIDE�CPROTOTYPE�j
005300*
005400*�@�@�@��ʏ]�ƈ��ɑ΂���ܗ^�v�Z���s���B
005500*
005600*�@�Z�o�́F�@���x��    PIC 9(8)
005700*�@�Z���́F�@Bonu_Mem.cob
005800*========================================================================
005900   METHOD-ID.  Bonus-method  PROTOTYPE  OVERRIDE.
006000   DATA DIVISION.
006100   LINKAGE SECTION.
006200    01  �k�|���x��          PIC   9(8).
006300   PROCEDURE   DIVISION
006400                RETURNING   �k�|���x��.
006500   END METHOD Bonus-method.
006600*
006700*========================================================================
006800*�@�f�[�^�ݒ胁�\�b�h�iOVERRIDE,PROTOTYPE�j
006900*
007000*�@�@�@�]�ƈ��f�[�^���]�ƈ��}�X�^���ǂݍ��݁C���̏���SELF�̃I�u�W�F
007100*�@�@�N�g�ɔ��f����B
007200*
007300*�@�Z���́F�@Mem_Set.cob
007400*========================================================================
007500   METHOD-ID.  DataSet-method  OVERRIDE  PROTOTYPE.
007600   DATA DIVISION.
007700   LINKAGE SECTION.
007800   PROCEDURE DIVISION.
007900   END METHOD DataSet-method.
008000*
008100*========================================================================
008200*�@�ۑ����\�b�h�iOVERRIDE,PROTOTYPE�j
008300*
008400*�@  �@SELF�̃I�u�W�F�N�g���ێ�����]�ƈ��f�[�^���C�]�ƈ��}�X�^�ɕۑ���
008500*�@�@��B
008600*
008700*�@�Z���́F�@Mem_Stor.cob
008800*========================================================================
008900   METHOD-ID.  Store-method  OVERRIDE  PROTOTYPE.
009000   DATA DIVISION.
009100   LINKAGE SECTION.
009200   PROCEDURE DIVISION.
009300   END METHOD Store-method.
009400*
009500   END OBJECT.
009600  END CLASS Member-class.
