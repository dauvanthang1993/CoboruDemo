000100*========================================================================
000201*�@�]�ƈ��ۑ����\�b�h�@�@�|�T���v���v���O�����u�]�ƈ��Ǘ��i�i�����j�v�|
000302*
000403*�@�@�@SELF�I�u�W�F�N�g���ێ�����]�ƈ��f�[�^�̂����́C�S�]�ƈ��ɋ��ʂ�
000504*�@�@�f�[�^���C�]�ƈ��}�X�^�N���X�̃t�@�N�g���I�u�W�F�N�g�ɐݒ肵�C�ۑ�
000605*�@�@���\�b�h���ĂԁB
000706*�@�@�@SELF�I�u�W�F�N�g���ێ�����Z���I�u�W�F�N�g�̃I�u�W�F�N�g�Q�Ƃ���
000807*�@�@�C���̏Z���I�u�W�F�N�g���ێ�����Z���f�[�^���C�Z���}�X�^�N���X�̃t
000908*�@�@�N�g���I�u
001009*�@�@�W�F�N�g�ɐݒ肷��B
001110*
001211*�@�Z�Q�ƃN���X
001312*�@�@�P�j�]�ƈ��}�X�^�N���X�@�iMemberMaster-class�j
001413*    �Q�j�]�ƈ��N���X�@�@�@�@�iAllMember-class�j�@�@�@�������N���X
001514*
001615*                              Copyright 1997-2015 FUJITSU LIMITED
001716*=======================================================================
001817 METHOD-ID.  Store-method  OF AllMember-class.
001918 ENVIRONMENT         DIVISION.
002019 CONFIGURATION       SECTION.
002120  REPOSITORY.
002221       CLASS  MemberMaster-class
002322       CLASS  Address-class
002423       CLASS  AllMember-class.
002524 DATA DIVISION.
002625 WORKING-STORAGE SECTION.
002726 LINKAGE SECTION.
002827 PROCEDURE DIVISION.
002928*
003029     MOVE    �]�ƈ��ԍ�           TO  �]�ƈ��ԍ�  OF  MemberMaster-class.
003130     MOVE    ����                 TO  ����        OF  MemberMaster-class.
003231     MOVE    ���ДN����           TO  ���ДN����  OF  MemberMaster-class.
003332     MOVE    �ގДN����           TO  �ގДN����  OF  MemberMaster-class.
003433     MOVE    �E��                 TO  �E��        OF  MemberMaster-class.
003534     MOVE    ��{��               TO  ��{��      OF  MemberMaster-class.
003635     MOVE    ���x��               TO  ���x��      OF  MemberMaster-class.
003736     INVOKE  MemberMaster-class   "Store-method".
003837*
003938     INVOKE  �Z���Q��  "Store-method"  USING  �]�ƈ��ԍ�.
004039*
004140 END METHOD Store-method.
