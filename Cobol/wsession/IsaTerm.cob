000010*=================================================================
000020* �u�Z�V�����Ǘ��@�\���g�p����Web�A�v���P�[�V�����v
000030*     �Z�V�����Ǘ��@�\���g�p���āA����̃N���C�A���g���畡�����
000040*   ���N�G�X�g�ɂ܂��������Ɩ����s���A�v���P�[�V�������\�z���܂��B
000050*
000060*=================================================================
000070*
000080*  �t�@�C�����F ISATERM.COB
000090*  ����T�v  �F ISAPI�g�p���ɕK�v�ȏI�������v���O�����ł��B
000100*               IIS���璼�ڌĂяo����܂��B
000110*
000120* Copyright 2000-2015 FUJITSU LIMITED
000130*=================================================================
000140 IDENTIFICATION DIVISION.
000150 PROGRAM-ID. "TerminateExtension".
000160 ENVIRONMENT DIVISION.
000170 DATA DIVISION.
000180  LINKAGE SECTION.
000190     COPY ISAPIFLG.
000200*
000210 PROCEDURE DIVISION WITH STDCALL LINKAGE USING ISAPI-FLAG.
000220*
000230     MOVE 1 TO PROGRAM-STATUS.
000240     EXIT PROGRAM.
