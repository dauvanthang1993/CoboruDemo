000010*========================================================================
000020*�@�]�ƈ��f�[�^�ݒ胁�\�b�h
000030*�@�@�@�@�@�@�@�@�@�@�@�@�|�T���v���v���O�����u�]�ƈ��Ǘ��i�i�����j�v�|
000040*
000050*�@�@�@�f�[�^�x�[�X�\����ǂݍ��񂾏]�ƈ��f�[�^�̂����́C�S�]�ƈ��ɋ��ʂ�
000060*�@�@�f�[�^���CSELF�̃I�u�W�F�N�g�ɐݒ肷��B
000070*�@�@�@�Z���I�u�W�F�N�g�𐶐����C���̎Q�Ƃ�SELF�̃I�u�W�F�N�g�ɐݒ肷��B
000080*
000090*�@�Z�Q�ƃN���X
000100*�@�@�P�j�]�ƈ��}�X�^�N���X�@�iMemberMaster-class�j
000110*    �Q�j�]�ƈ��N���X�@�@�@�@�iAllMember-class�j�@�@�@�������N���X
000120*
000130*                              Copyright 1998-2015 FUJITSU LIMITED
000140*========================================================================
000150 METHOD-ID.  DataSet-method  OF AllMember-class.
000160 ENVIRONMENT         DIVISION.
000170 CONFIGURATION       SECTION.
000180  REPOSITORY.
000190       CLASS  MemberMaster-class
000200       CLASS  Address-class
000210       CLASS  AllMember-class.
000220 DATA DIVISION.
000230 WORKING-STORAGE SECTION.
000240  01  �v�|�Z������               PIC S9(04).
000250  01  �v�|�Z���I�u�W�F�N�g       OBJECT REFERENCE Address-class.
000260 LINKAGE SECTION.
000270 PROCEDURE DIVISION.
000280*
000290      MOVE    �]�ƈ��ԍ�       OF  MemberMaster-class  TO   �]�ƈ��ԍ�.
000300      MOVE    ����             OF  MemberMaster-class  TO   ����.
000310      MOVE    ���ДN����       OF  MemberMaster-class  TO   ���ДN����.
000320      MOVE    �ގДN����       OF  MemberMaster-class  TO   �ގДN����.
000330      MOVE    �E��             OF  MemberMaster-class  TO   �E��.
000340      MOVE    ��{��           OF  MemberMaster-class  TO   ��{��.
000350      MOVE    ���x��           OF  MemberMaster-class  TO   ���x��.
000360*
000370      MOVE    �]�ƈ��ԍ�       TO  �v�|�Z������.
000380      INVOKE  Address-class  "NEW"  RETURNING  �v�|�Z���I�u�W�F�N�g.
000390      INVOKE  �v�|�Z���I�u�W�F�N�g "DataSet-method"  USING  �v�|�Z������.
000400*
000410      SET     �Z���Q��         TO   �v�|�Z���I�u�W�F�N�g.
000420*
000430 END METHOD DataSet-method.
