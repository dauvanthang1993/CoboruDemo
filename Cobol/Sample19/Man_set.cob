000100*========================================================================
000200*�@�Ǘ��f�[�^�ݒ胁�\�b�h�@�|�T���v���v���O�����u�]�ƈ��Ǘ��i�i�����j�v�|
000300*
000400*�@�@�@SUPER �N���X�̃f�[�^�ݒ胁�\�b�h���ĂсC�S�]�ƈ��ɋ��ʂȃf�[�^��
000500*�@�@SELF�I�u�W�F�N�g�ɐݒ肷��D
000600*�@�@�@�����t�@�C������ǂݍ��񂾏]�ƈ��f�[�^�̂����́C�Ǘ��ҏ]�ƈ��Ɍ�
000700*�@�@�L�ȃf�|�^���CSELF�̃I�u�W�F�N�g�ɐݒ肷��D
000800*
000900*�@�Z�Q�ƃN���X
001000*�@�@�P�j�]�ƈ��}�X�^�N���X  �iMemberMaster-class�j
001100*    �Q�j�Ǘ��҃N���X�@�@�@�@�iManager-class�j�@�@�@�@�������N���X
001200*
001300*                              Copyright 1997-2015 FUJITSU LIMITED
001400*========================================================================
001500  METHOD-ID.  DataSet-method   OF  Manager-class.
001600  ENVIRONMENT         DIVISION.
001700  CONFIGURATION       SECTION.
001800   REPOSITORY.
001900        CLASS  MemberMaster-class
002000        CLASS  Manager-class.
002100  DATA DIVISION.
002200  WORKING-STORAGE SECTION.
002300  LINKAGE SECTION.
002400  PROCEDURE DIVISION.
002500*
002600      INVOKE   SUPER  "DataSet-method".
002700      MOVE   ���ʎ蓖  OF  MemberMaster-class  TO  ���ʎ蓖.
002800*
002900  END METHOD DataSet-method.
