000100*========================================================================
000200*�@�]�ƈ��f�[�^�ݒ胁�\�b�h
000300*�@�@�@�@�@�@�@�@�@�@�@�@�|�T���v���v���O�����u�]�ƈ��Ǘ��i�i�����j�v�|
000400*
000500*�@�@�@�����t�@�C������ǂݍ��񂾏]�ƈ��f�[�^�̂����́C�S�]�ƈ��ɋ��ʂ�
000600*�@�@�f�[�^���CSELF�̃I�u�W�F�N�g�ɐݒ肷��B
000700*�@�@�@�Z���I�u�W�F�N�g�𐶐����C���̎Q�Ƃ�SELF�̃I�u�W�F�N�g�ɐݒ肷��B
000800*
000900*�@�Z�Q�ƃN���X
001000*�@�@�P�j�]�ƈ��}�X�^�N���X�@�iMemberMaster-class�j
001100*    �Q�j�]�ƈ��N���X�@�@�@�@�iAllMember-class�j�@�@�@�������N���X
001200*
001300*                              Copyright 1997-2015 FUJITSU LIMITED
001400*========================================================================
001500 METHOD-ID.  DataSet-method  OF AllMember-class.
001600 ENVIRONMENT         DIVISION.
001700 CONFIGURATION       SECTION.
001800  REPOSITORY.
001900       CLASS  MemberMaster-class
002000       CLASS  Address-class
002100       CLASS  AllMember-class.
002200 DATA DIVISION.
002300 WORKING-STORAGE SECTION.
002400  01  �v�|�Z���h�c               PIC 9(04).
002500  01  �v�|�Z���I�u�W�F�N�g       OBJECT REFERENCE Address-class.
002600 LINKAGE SECTION.
002700 PROCEDURE DIVISION.
002800*
002900      MOVE    �]�ƈ��ԍ�       OF  MemberMaster-class  TO   �]�ƈ��ԍ�.
003000      MOVE    ����             OF  MemberMaster-class  TO   ����.
003100      MOVE    ���ДN����       OF  MemberMaster-class  TO   ���ДN����.
003200      MOVE    �ގДN����       OF  MemberMaster-class  TO   �ގДN����.
003300      MOVE    �E��             OF  MemberMaster-class  TO   �E��.
003400      MOVE    ��{��           OF  MemberMaster-class  TO   ��{��.
003500      MOVE    ���x��           OF  MemberMaster-class  TO   ���x��.
003600*
003700      MOVE    �]�ƈ��ԍ�       TO  �v�|�Z���h�c.
003800      INVOKE  Address-class  "new"  RETURNING  �v�|�Z���I�u�W�F�N�g.
003900      INVOKE  �v�|�Z���I�u�W�F�N�g "DataSet-method"  USING  �v�|�Z���h�c.
004000*
004100      SET     �Z���Q��         TO   �v�|�Z���I�u�W�F�N�g.
004200*
004300 END METHOD DataSet-method.
