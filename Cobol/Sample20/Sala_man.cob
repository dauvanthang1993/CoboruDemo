000010*=======================================================================
000020*�@�Ǘ����^�v�Z���\�b�h�@�@�@�@�@�@�|�T���v���v���O�����u�]�ƈ��Ǘ��v�|
000030*
000040*�@�@�@�Ǘ��҂ɑ΂��鋋�^�v�Z���s���B
000050*
000060*�@�Z�����N���X�F�@�Ǘ��҃N���X
000070*�@�Z�o�́@�@�@�F�@���x���iPIC S9(8)�j
000080*
000090*                              Copyright 1998-2015 FUJITSU LIMITED
000100*=======================================================================
000110 METHOD-ID.  Salary-method  OF Manager-class.
000120 ENVIRONMENT        DIVISION.
000130 CONFIGURATION      SECTION.
000140   REPOSITORY.
000150       CLASS  Manager-class.
000160 DATA DIVISION.
000170 WORKING-STORAGE    SECTION.
000180  01  �v�|��{��         PIC   S9(008).
000190 LINKAGE SECTION.
000200  01  �k�|���x��         PIC   S9(008).
000210 PROCEDURE   DIVISION    RETURNING   �k�|���x��.
000220*
000230     MOVE   ��{��  OF  SELF     TO    �v�|��{��.
000240     COMPUTE  �k�|���x��   =   �v�|��{��  +  ���ʎ蓖.
000250*
000260 END METHOD Salary-method.
