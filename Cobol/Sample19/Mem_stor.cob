000100*========================================================================
000200*�@��ʕۑ����\�b�h�@�@�@�@�|�T���v���v���O�����u�]�ƈ��Ǘ��i�i�����j�v�|
000300*
000400*�@�@�@SELF�I�u�W�F�N�g���ێ������ʏ]�ƈ��ɌŗL�ȃf�[�^���C�]�ƈ��}�X
000500*�@�@�^�N���X�̃t�@�N�g���I�u�W�F�N�g�ɐݒ肷��D
000600*�@�@�@SUPER �N���X�̃f�[�^�ۑ����\�b�h���Ăт����B
000700*
000800*�@�Z�Q�ƃN���X
000900*�@�@�P�j�]�ƈ��}�X�^�N���X  �iMemberMaster-class�j
001000*    �Q�j��ʃN���X�@�@�@�@�@�iMember-class�j�@�@�@�@�@�������N���X
001100*
001200*                              Copyright 1997-2015 FUJITSU LIMITED
001300*========================================================================
001400 METHOD-ID.  Store-method  OF Member-class.
001500 ENVIRONMENT         DIVISION.
001600 CONFIGURATION       SECTION.
001700  REPOSITORY.
001800       CLASS  MemberMaster-class
001900       CLASS  Member-class.
002000 DATA DIVISION.
002100 WORKING-STORAGE SECTION.
002200 LINKAGE SECTION.
002300 PROCEDURE DIVISION.
002400*
002500     MOVE   ���ԊO�蓖  TO  ���ԊO�蓖  OF  MemberMaster-class.
002600     MOVE   �c�Ǝ���    TO  �c�Ǝ���    OF  MemberMaster-class.
002700     INVOKE   SUPER  "Store-method".
002800*
002900 END METHOD Store-method.
