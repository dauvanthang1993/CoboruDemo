000010*========================================================================
000020*�@��ʃN���X�iMember-class�j
000030*�@�@�@�@�@�@�@�@�@�@�@�@�|�T���v���v���O�����u�]�ƈ��Ǘ��i�i�����j�v�|
000040*
000050*�@�@�@��ʏ]�ƈ��ɂ��ČŗL�ȃf�[�^�y�у��\�b�h�����B
000060*
000070*�@�Z�p���N���X
000080*�@�@�P�j�]�ƈ��N���X�iAllMember-class�j
000090*
000100*�@�Z�I�u�W�F�N�g�f�[�^
000110*�@�@�P�j���ԊO�蓖�@�|�@PIC S9(5)
000120*�@�@�Q�j�c�Ǝ���  �@�|�@PIC S9(5)
000130*
000140*�@�Z�I�u�W�F�N�g���\�b�h
000150*�@�@�P�j�I�u�W�F�N�g�f�[�^�ɑ΂���CGET�y��SET�̃v���p�e�B���\�b�h
000160*�@�@�Q�j���^�v�Z   �iSalary-method�j
000170*�@�@�R�j�ܗ^�v�Z   �iBonus-method�j
000180*�@�@�S�j�f�[�^�ݒ� �iDataSet-method�j
000190*�@�@�T�j�ۑ��@�@�@ �iStore-method�j
000200*
000210*                              Copyright 1998-2015 FUJITSU LIMITED
000220*========================================================================
000230 CLASS-ID.   Member-class INHERITS  AllMember-class.
000240 ENVIRONMENT    DIVISION.
000250 CONFIGURATION    SECTION.
000260 REPOSITORY.
000270      CLASS AllMember-class.
000280*
000290   OBJECT.
000300   DATA DIVISION.
000310   WORKING-STORAGE SECTION.
000320   01  ���ԊO�蓖            PIC   S9(5)        PROPERTY.
000330   01  �c�Ǝ���              PIC   S9(5)V9(1)   PROPERTY.
000340   PROCEDURE DIVISION.
000350*========================================================================
000360*�@���^�v�Z���\�b�h�iOVERRIDE�CPROTOTYPE�j
000370*
000380*�@�@�@��ʏ]�ƈ��ɑ΂��鋋�^�v�Z���s���B
000390*
000400*�@�Z�o�́F�@���x��   PIC S9(8)
000410*�@�Z���́F�@Sala_Mem.cob
000420*========================================================================
000430   METHOD-ID.  Salary-method  PROTOTYPE  OVERRIDE.
000440   DATA DIVISION.
000450   LINKAGE SECTION.
000460    01  �k�|���x��          PIC   S9(8).
000470   PROCEDURE   DIVISION
000480                RETURNING   �k�|���x��.
000490   END METHOD Salary-method.
000500*
000510*========================================================================
000520*�@�ܗ^�v�Z���\�b�h�iOVERRIDE�CPROTOTYPE�j
000530*
000540*�@�@�@��ʏ]�ƈ��ɑ΂���ܗ^�v�Z���s���B
000550*
000560*�@�Z�o�́F�@���x��    PIC S9(8)
000570*�@�Z���́F�@Boun_Mem.cob
000580*========================================================================
000590   METHOD-ID.  Bonus-method  PROTOTYPE  OVERRIDE.
000600   DATA DIVISION.
000610   LINKAGE SECTION.
000620    01  �k�|���x��          PIC   S9(8).
000630   PROCEDURE   DIVISION
000640                RETURNING   �k�|���x��.
000650   END METHOD Bonus-method.
000660*
000670*========================================================================
000680*�@�f�[�^�ݒ胁�\�b�h�iOVERRIDE,PROTOTYPE�j
000690*
000700*�@�@�@�]�ƈ��f�[�^���]�ƈ��\���ǂݍ��݁C���̏���SELF�̃I�u�W�F�N�g��
000710*�@�@���f����B
000720*
000730*�@�Z���́F�@Mem_Set.cob
000740*========================================================================
000750   METHOD-ID.  DataSet-method  OVERRIDE  PROTOTYPE.
000760   DATA DIVISION.
000770   LINKAGE SECTION.
000780   PROCEDURE DIVISION.
000790   END METHOD DataSet-method.
000800*
000810*========================================================================
000820*�@�ۑ����\�b�h�iOVERRIDE,PROTOTYPE�j
000830*
000840*�@  �@SELF�̃I�u�W�F�N�g���ێ�����]�ƈ��f�[�^���C�]�ƈ��\�ɕۑ�����B
000850*
000860*�@�Z���́F�@Mem_Stor.cob
000870*========================================================================
000880   METHOD-ID.  Store-method  OVERRIDE  PROTOTYPE.
000890   DATA DIVISION.
000900   LINKAGE SECTION.
000910   PROCEDURE DIVISION.
000920   END METHOD Store-method.
000930*
000940   END OBJECT.
000950  END CLASS Member-class.
