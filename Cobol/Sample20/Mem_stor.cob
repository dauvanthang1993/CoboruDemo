000010*========================================================================
000020*�@��ʕۑ����\�b�h�@�@�@�@�|�T���v���v���O�����u�]�ƈ��Ǘ��i�i�����j�v�|
000030*
000040*�@�@�@SELF�I�u�W�F�N�g���ێ������ʏ]�ƈ��ɌŗL�ȃf�[�^���C�]�ƈ��}�X
000050*�@�@�^�N���X�̃t�@�N�g���f�[�^�ɐݒ肷��D
000060*�@�@�@SUPER �N���X�̃f�[�^�ۑ����\�b�h���Ăт����B
000070*
000080*�@�Z�Q�ƃN���X
000090*�@�@�P�j�]�ƈ��}�X�^�N���X  �iMemberMaster-class�j
000100*    �Q�j��ʃN���X�@�@�@�@�@�iMember-class�j�@�@�@�@�@�������N���X
000110*
000120*                              Copyright 1998-2015 FUJITSU LIMITED
000130*========================================================================
000140 METHOD-ID.  Store-method  OF Member-class.
000150 ENVIRONMENT         DIVISION.
000160 CONFIGURATION       SECTION.
000170  REPOSITORY.
000180       CLASS  MemberMaster-class
000190       CLASS  Member-class.
000200 DATA DIVISION.
000210 WORKING-STORAGE SECTION.
000220 LINKAGE SECTION.
000230 PROCEDURE DIVISION.
000240*
000250     MOVE   ���ԊO�蓖  TO  ���ԊO�蓖  OF  MemberMaster-class.
000260     MOVE   �c�Ǝ���    TO  �c�Ǝ���    OF  MemberMaster-class.
000270     INVOKE   SUPER  "Store-method".
000280*
000290 END METHOD Store-method.
