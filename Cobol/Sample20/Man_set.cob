000010*========================================================================
000020*�@�Ǘ��f�[�^�ݒ胁�\�b�h�@�|�T���v���v���O�����u�]�ƈ��Ǘ��i�i�����j�v�|
000030*
000040*�@�@�@SUPER �N���X�̃f�[�^�ݒ胁�\�b�h���ĂсC�S�]�ƈ��ɋ��ʂȃf�[�^��
000050*�@�@SELF�I�u�W�F�N�g�ɐݒ肷��D
000060*�@�@�@�����t�@�C������ǂݍ��񂾏]�ƈ��f�[�^�̂����́C�Ǘ��ҏ]�ƈ��Ɍ�
000070*�@�@�L�ȃf�|�^���CSELF�̃I�u�W�F�N�g�ɐݒ肷��D
000080*
000090*�@�Z�Q�ƃN���X
000100*�@�@�P�j�]�ƈ��}�X�^�N���X  �iMemberMaster-class�j
000110*    �Q�j�Ǘ��҃N���X�@�@�@�@�iManager-class�j�@�@�@�@�������N���X
000120*
000130*                              Copyright 1998-2015 FUJITSU LIMITED
000140*========================================================================
000150  METHOD-ID.  DataSet-method   OF  Manager-class.
000160  ENVIRONMENT         DIVISION.
000170  CONFIGURATION       SECTION.
000180   REPOSITORY.
000190        CLASS  MemberMaster-class
000200        CLASS  Manager-class.
000210  DATA DIVISION.
000220  WORKING-STORAGE SECTION.
000230  LINKAGE SECTION.
000240  PROCEDURE DIVISION.
000250*
000260      INVOKE   SUPER  "DataSet-method".
000270      MOVE   ���ʎ蓖  OF  MemberMaster-class  TO  ���ʎ蓖.
000280*
000290  END METHOD DataSet-method.
