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
001700  working-storage section.
001800 01 �F�؃T�[�r�X�N����� pic 9(1) is external.
001900  linkage section.
002000     copy IsapiInf.
002100*
002200 procedure division with stdcall linkage using ISAPI-INFO.
002300*
002400     move 0 to �F�؃T�[�r�X�N�����.
002500*
002600     move 1 to program-status.
002700     exit program.
