000100*=================================================================
000200* �u�}���`�X���b�h�v���O���~���O�v
000300*     �X���b�h�ԂŃt�@�C���E�f�[�^�����p���ĔF�؏������������܂�
000400*
000500*=================================================================
000600*
000700*  �t�@�C�����F ISATerm.cob
000800*  ����T�v  �F ISAPI�g�p���ɕK�v�ȏI�������v���O�����ł��B
000900*               IIS���璼�ڌĂяo����܂��B
001000*
001100* Copyright 1999-2015 FUJITSU LIMITED
001200*=================================================================
001300 identification division.
001400 program-id. "TerminateExtension".
001500 environment division.
001600 data division.
001700  linkage section.
001800     copy IsapiFlg.
001900*
002000 procedure division with stdcall linkage using ISAPI-FLAG.
002100*
002200     move 1 to program-status.
002300     exit program.
