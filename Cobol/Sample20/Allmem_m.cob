000010*========================================================================
000020*�@�]�ƈ��}�X�^�N���X�iMemberMaster-class�j
000030*�@�@�@�@�@�@�@�@�@�@�@�@�@�|�T���v���v���O�����u�]�ƈ��Ǘ��i�i�����j�v�|
000040*
000050*�@�@�@�]�ƈ����̕ۑ������̂��߂̃f�[�^�����B
000060*
000070*�@�Z�t�@�N�g���f�[�^
000080*�@�@�P�j�]�ƈ��ԍ��@�|�@PIC  S9(4)
000090*�@�@�Q�j�����@�@�@�@�|�@PIC   X(16)
000100*�@�@�R�j���ДN�����@�|�@PIC   X(8)
000110*�@�@�S�j�ގДN�����@�|�@PIC   X(8)
000120*�@�@�T�j�E���@�@�@�@�|�@PIC  S9(1)
000130*�@�@�U�j��{���@�@�@�|�@PIC  S9(8)
000140*�@�@�V�j���x���@�@�@�|�@PIC  S9(8)
000150*�@�@�W�j���ԊO�蓖�@�|�@PIC  S9(5)
000160*�@�@�X�j�c�Ǝ���  �@�|�@PIC  S9(5)
000170*�@�P�O�j���ʎ蓖�@�@�|�@PIC  S9(6)
000180*
000190*                              Copyright 1998-2015 FUJITSU LIMITED
000200*========================================================================
000210 CLASS-ID.   MemberMaster-class.
000220 ENVIRONMENT    DIVISION.
000230 CONFIGURATION    SECTION.
000240*
000250   FACTORY.
000260   ENVIRONMENT    DIVISION.
000270   DATA                 DIVISION.
000280   WORKING-STORAGE SECTION.
000290    01  ���ʏ��.
000300      02  �]�ƈ��ԍ�          PIC  S9(004)    VALUE 0     PROPERTY.
000310      02  ����                PIC   X(016)    VALUE SPACE PROPERTY.
000320      02  ���ДN����          PIC   X(008)    VALUE SPACE PROPERTY.
000330      02  �ގДN����          PIC   X(008)    VALUE SPACE PROPERTY.
000340      02  �E��                PIC  S9(001)    VALUE 0     PROPERTY.
000350      02  ��{��              PIC  S9(008)    VALUE 0     PROPERTY.
000360      02  ���x��              PIC  S9(008)    VALUE 0     PROPERTY.
000370    01  ���ԊO�蓖          PIC  S9(5)        VALUE 0     PROPERTY.
000380    01  �c�Ǝ���            PIC  S9(5)V9(1)   VALUE 0     PROPERTY.
000390    01  ���ʎ蓖            PIC  S9(6)        VALUE 0     PROPERTY.
000400   PROCEDURE  DIVISION.
000410   END FACTORY.
000420  END CLASS  MemberMaster-class.
