000100*=================================================================
000200* �u�}���`�X���b�h�v���O���~���O�v
000300*     �X���b�h�ԂŃt�@�C���E�f�[�^�����p���ĔF�؏������������܂�
000400*
000500*=================================================================
000600*
000700*  �t�@�C�����F ISAInit.cob
000800*  ����T�v  �F ISAPI�g�p���ɕK�v�ȏ������v���O�����ł��B
000900*               IIS���璼�ڌĂяo����܂��B
001000*
001100* Copyright 1999-2015 FUJITSU LIMITED
001200*=================================================================
001300 identification division.
001400 program-id. "GetExtensionVersion".
001500 environment division.
001600 data division.
001700  linkage section.
001800     copy IsapiInf.
001900*
002000 procedure division with stdcall linkage using ISAPI-INFO.
002100     move 1 to program-status.
002200     exit program.
