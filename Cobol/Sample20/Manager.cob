000010*========================================================================
000020*�@�Ǘ��҃N���X�iManager-class�j�@�@�|�T���v���v���O����
000030*�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�u�]�ƈ��Ǘ��i�i�����j�v�|
000040*
000050*�@�@�@�Ǘ��҂ɂ��ČŗL�ȃf�[�^�y�у��\�b�h�����B
000060*
000070*�@�Z�p���N���X
000080*�@�@�P�j�]�ƈ��N���X�iAllMember-class�j
000090*
000100*�@�Z�I�u�W�F�N�g�f�[�^
000110*�@�@�P�j���ʎ蓖�@�|�@PIC S9(6)
000120*
000130*�@�Z�I�u�W�F�N�g���\�b�h
000140*�@�@�P�j�I�u�W�F�N�g�f�[�^�ɑ΂���CGET�y��SET�̃v���p�e�B���\�b�h
000150*�@�@�Q�j���^�v�Z���\�b�h�iSalary-method�j
000160*�@�@�R�j�ܗ^�v�Z���\�b�h�iBonus-method�j
000170*�@�@�S�j�f�[�^�ݒ�      �iDataSet-method�j
000180*�@�@�T�j�ۑ� �@�@�@     �iStore-method�j
000190*
000200*                              Copyright 1998-2015 FUJITSU LIMITED
000210*========================================================================
000220 CLASS-ID.   Manager-class INHERITS  AllMember-class.
000230 ENVIRONMENT    DIVISION.
000240 CONFIGURATION   SECTION.
000250 REPOSITORY.
000260     CLASS AllMember-class.
000270*
000280   OBJECT.
000290   DATA DIVISION.
000300   WORKING-STORAGE  SECTION.
000310   01  ���ʎ蓖            PIC   S9(006) PROPERTY.
000320   PROCEDURE DIVISION.
000330*========================================================================
000340*�@���^�v�Z���\�b�h�iOVERRIDE�CPROTOTYPE�j
000350*
000360*�@�@�@�Ǘ��҂ɑ΂��鋋�^�v�Z���s���B
000370*
000380*�@�Z�o�́F�@���x��     PIC S9(8)
000390*�@�Z���́F�@Sala_Man.cob
000400*========================================================================
000410   METHOD-ID.     Salary-method  PROTOTYPE  OVERRIDE.
000420   DATA DIVISION.
000430   LINKAGE SECTION.
000440    01  �k�|���x��          PIC  S9(008).
000450   PROCEDURE   DIVISION
000460                  RETURNING   �k�|���x��.
000470   END METHOD  Salary-method.
000480*
000490*========================================================================
000500*�@�ܗ^�v�Z���\�b�h�iOVERRIDE�CPROTOTYPE�j
000510*
000520*�@�@�@�Ǘ��҂ɑ΂���ܗ^�v�Z���s���B
000530*
000540*�@�Z�o�́F�@���x��    PIC S9(8)
000550*�@�Z���́F�@Boun_Man.cob
000560*========================================================================
000570   METHOD-ID.  Bonus-method PROTOTYPE OVERRIDE.
000580   DATA DIVISION.
000590   LINKAGE SECTION.
000600    01  �k�|���x��          PIC   S9(008).
000610   PROCEDURE   DIVISION
000620                RETURNING   �k�|���x��.
000630   END METHOD Bonus-method.
000640*
000650*========================================================================
000660*�@�f�[�^�ݒ胁�\�b�h�iOVERRIDE,PROTOTYPE�j
000670*
000680*�@�@�@�]�ƈ��f�[�^���]�ƈ��\���ǂݍ��݁C���̏���SELF�̃I�u�W�F�N�g��
000690*�@�@���f����B
000700*
000710*�@�Z���́F�@Man_Set.cob
000720*========================================================================
000730   METHOD-ID.  DataSet-method  OVERRIDE  PROTOTYPE.
000740   DATA DIVISION.
000750   LINKAGE SECTION.
000760   PROCEDURE DIVISION.
000770   END METHOD DataSet-method.
000780*
000790*========================================================================
000800*�@�ۑ����\�b�h�iOVERRIDE,PROTOTYPE�j
000810*
000820*�@  �@SELF�̃I�u�W�F�N�g���ێ�����]�ƈ��f�[�^���C�]�ƈ��\�ɕۑ�����B
000830*
000840*�@�Z���́F�@Man_Stor.cob
000850*========================================================================
000860   METHOD-ID.  Store-method  OVERRIDE  PROTOTYPE.
000870   DATA DIVISION.
000880   LINKAGE SECTION.
000890   PROCEDURE DIVISION.
000900   END METHOD Store-method.
000910*
000920   END OBJECT.
000930  END CLASS Manager-class.
