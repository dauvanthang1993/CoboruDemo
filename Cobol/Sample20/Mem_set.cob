000010*========================================================================
000020*�@��ʃf�[�^�ݒ胁�\�b�h  �|�T���v���v���O�����u�]�ƈ��Ǘ��i�i�����j�v�|
000030*
000040*�@�@�@SUPER �N���X�̃f�[�^�ݒ胁�\�b�h���ĂсC�S�]�ƈ��ɋ��ʂȃf�[�^��
000050*�@�@SELF�I�u�W�F�N�g�ɐݒ肷��D
000060*�@�@�@�f�[�^�x�[�X�\����ǂݍ��񂾏]�ƈ��f�[�^�̂����́C��ʏ]�ƈ��ɌŗL
000070*�@�@�ȃf�[�^���CSELF�̃I�u�W�F�N�g�ɐݒ肷��D
000080*
000090*�@�Z�Q�ƃN���X
000100*�@�@�P�j�]�ƈ��}�X�^�N���X  �iMemberMaster-class�j
000110*    �Q�j��ʃN���X�@�@�@�@�@�iMember-class�j�@�@�@�@�@�������N���X
000120*
000130*                              Copyright 1998-2015 FUJITSU LIMITED
000140*========================================================================
000150 METHOD-ID.  DataSet-method  OF Member-class.
000160 ENVIRONMENT         DIVISION.
000170 CONFIGURATION       SECTION.
000180  REPOSITORY.
000190       CLASS  MemberMaster-class
000200       CLASS  Member-class.
000210 DATA DIVISION.
000220 WORKING-STORAGE SECTION.
000230 LINKAGE SECTION.
000240 PROCEDURE DIVISION.
000250*
000260     INVOKE   SUPER  "DataSet-method".
000270     MOVE   ���ԊO�蓖  OF  MemberMaster-class  TO  ���ԊO�蓖.
000280     MOVE   �c�Ǝ���    OF  MemberMaster-class  TO  �c�Ǝ���.
000290*
000300 END METHOD DataSet-method.
