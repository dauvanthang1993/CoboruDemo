000010*========================================================================
000020*�@�Z���}�X�^�N���X�iAddressMaster-class�j
000030*�@�@�@�@�@�@�@�@�@�@�@�@�|�T���v���v���O�����u�]�ƈ��Ǘ��i�i�����j�v�|
000040*
000050*�@�@�@�Z�����̕ۑ������̂��߂̃f�[�^�����B
000060*
000070*�@�Z�t�@�N�g���f�[�^
000080*�@�@�P�j�Z�����ʁ@�|�@PIC  S9(4)
000090*�@�@�Q�j�X�֔ԍ��@�|�@PIC   X(7)
000100*�@�@�R�j�Z���@�@�@�|�@PIC   X(40)
000110*
000120*                              Copyright 1998-2015 FUJITSU LIMITED
000130*========================================================================
000140 CLASS-ID .   AddressMaster-class.
000150 ENVIRONMENT   DIVISION .
000160 CONFIGURATION   SECTION.
000170*
000180   FACTORY.
000190   ENVIRONMENT   DIVISION .
000200   DATA                 DIVISION .
000210   WORKING-STORAGE SECTION.
000220    01  �Z������             PIC  S9(004) PROPERTY.
000230    01  �X�֔ԍ�             PIC   X(007) PROPERTY.
000240    01  �Z��                 PIC   X(040) PROPERTY.
000250   PROCEDURE  DIVISION .
000260*
000270   END FACTORY.
000280  END CLASS  AddressMaster-class.
