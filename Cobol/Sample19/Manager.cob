000100*========================================================================
000200*�@�Ǘ��҃N���X�iManager-class�j�@�@�|�T���v���v���O����
000300*�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�u�]�ƈ��Ǘ��i�i�����j�v�|
000400*
000500*�@�@�@�Ǘ��҂ɂ��ČŗL�ȃf�[�^�y�у��\�b�h�����B
000600*
000700*�@�Z�p���N���X
000800*�@�@�P�j�]�ƈ��N���X�iAllMember-class�j
000900*
001000*�@�Z�I�u�W�F�N�g�f�[�^
001100*�@�@�P�j���ʎ蓖�@�|�@PIC 9(6)
001200*
001300*�@�Z�I�u�W�F�N�g���\�b�h
001400*�@�@�P�j�I�u�W�F�N�g�f�[�^�ɑ΂���CGET�y��SET�̃v���p�e�B���\�b�h
001500*�@�@�Q�j���^�v�Z���\�b�h�iSalary-method�j
001600*�@�@�R�j�ܗ^�v�Z���\�b�h�iBonus-method�j
001700*�@�@�S�j�f�[�^�ݒ�      �iDataSet-method�j
001800*�@�@�T�j�ۑ� �@�@�@     �iStore-method�j
001900*
002000*                              Copyright 1997-2015 FUJITSU LIMITED
002100*========================================================================
002200 CLASS-ID.   Manager-class INHERITS  AllMember-class.
002300 ENVIRONMENT    DIVISION.
002400 CONFIGURATION   SECTION.
002500 REPOSITORY.
002600     CLASS AllMember-class.
002700*
002800   OBJECT.
002900   DATA DIVISION.
003000   WORKING-STORAGE  SECTION.
003100   01  ���ʎ蓖            PIC   9(006) PROPERTY.
003200   PROCEDURE DIVISION.
003300*========================================================================
003400*�@���^�v�Z���\�b�h�iOVERRIDE�CPROTOTYPE�j
003500*
003600*�@�@�@�Ǘ��҂ɑ΂��鋋�^�v�Z���s���B
003700*
003800*�@�Z�o�́F�@���x��     PIC 9(8)
003900*�@�Z���́F�@Sala_Man.cob
004000*========================================================================
004100   METHOD-ID.     Salary-method  PROTOTYPE  OVERRIDE.
004200   DATA DIVISION.
004300   LINKAGE SECTION.
004400    01  �k�|���x��          PIC   9(008).
004500   PROCEDURE   DIVISION
004600                  RETURNING   �k�|���x��.
004700   END METHOD  Salary-method.
004800*
004900*========================================================================
005000*�@�ܗ^�v�Z���\�b�h�iOVERRIDE�CPROTOTYPE�j
005100*
005200*�@�@�@�Ǘ��҂ɑ΂���ܗ^�v�Z���s���B
005300*
005400*�@�Z�o�́F�@���x��    PIC 9(8)
005500*�@�Z���́F�@Bonu_Man.cob
005600*========================================================================
005700   METHOD-ID.  Bonus-method PROTOTYPE OVERRIDE.
005800   DATA DIVISION.
005900   LINKAGE SECTION.
006000    01  �k�|���x��          PIC   9(008).
006100   PROCEDURE   DIVISION
006200                RETURNING   �k�|���x��.
006300   END METHOD Bonus-method.
006400*
006500*========================================================================
006600*�@�f�[�^�ݒ胁�\�b�h�iOVERRIDE,PROTOTYPE�j
006700*
006800*�@�@�@�]�ƈ��f�[�^���]�ƈ��}�X�^���ǂݍ��݁C���̏���SELF�̃I�u�W�F
006900*�@�@�N�g�ɔ��f����B
007000*
007100*�@�Z���́F�@Man_Set.cob
007200*========================================================================
007300   METHOD-ID.  DataSet-method  OVERRIDE  PROTOTYPE.
007400   DATA DIVISION.
007500   LINKAGE SECTION.
007600   PROCEDURE DIVISION.
007700   END METHOD DataSet-method.
007800*
007900*========================================================================
008000*�@�ۑ����\�b�h�iOVERRIDE,PROTOTYPE�j
008100*
008200*�@  �@SELF�̃I�u�W�F�N�g���ێ�����]�ƈ��f�[�^���C�]�ƈ��}�X�^�ɕۑ���
008300*�@�@��B
008400*
008500*�@�Z���́F�@Man_Stor.cob
008600*========================================================================
008700   METHOD-ID.  Store-method  OVERRIDE  PROTOTYPE.
008800   DATA DIVISION.
008900   LINKAGE SECTION.
009000   PROCEDURE DIVISION.
009100   END METHOD Store-method.
009200*
009300   END OBJECT.
009400  END CLASS Manager-class.
