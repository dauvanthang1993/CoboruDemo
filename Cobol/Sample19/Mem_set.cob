000100*========================================================================
000200*�@��ʃf�[�^�ݒ胁�\�b�h  �|�T���v���v���O�����u�]�ƈ��Ǘ��i�i�����j�v�|
000300*
000400*�@�@�@SUPER �N���X�̃f�[�^�ݒ胁�\�b�h���ĂсC�S�]�ƈ��ɋ��ʂȃf�[�^��
000500*�@�@SELF�I�u�W�F�N�g�ɐݒ肷��D
000600*�@�@�@�����t�@�C������ǂݍ��񂾏]�ƈ��f�[�^�̂����́C��ʏ]�ƈ��ɌŗL
000700*�@�@�ȃf�[�^���CSELF�̃I�u�W�F�N�g�ɐݒ肷��D
000800*
000900*�@�Z�Q�ƃN���X
001000*�@�@�P�j�]�ƈ��}�X�^�N���X  �iMemberMaster-class�j
001100*    �Q�j��ʃN���X�@�@�@�@�@�iMember-class�j�@�@�@�@�@�������N���X
001200*
001300*                              Copyright 1997-2015 FUJITSU LIMITED
001400*========================================================================
001500 METHOD-ID.  DataSet-method  OF Member-class.
001600 ENVIRONMENT         DIVISION.
001700 CONFIGURATION       SECTION.
001800  REPOSITORY.
001900       CLASS  MemberMaster-class
002000       CLASS  Member-class.
002100 DATA DIVISION.
002200 WORKING-STORAGE SECTION.
002300 LINKAGE SECTION.
002400 PROCEDURE DIVISION.
002500*
002600     INVOKE   SUPER  "DataSet-method".
002700     MOVE   ���ԊO�蓖  OF  MemberMaster-class  TO  ���ԊO�蓖.
002800     MOVE   �c�Ǝ���    OF  MemberMaster-class  TO  �c�Ǝ���.
002900*
003000 END METHOD DataSet-method.
