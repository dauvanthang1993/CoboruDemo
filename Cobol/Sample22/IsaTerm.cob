000100*=================================================================
000200* �u�}���`�X���b�h�v���O���~���O�v
000300*     �X���b�h�ԂŃt�@�C���E�f�[�^�����p���ăI�����C���V���b�s���O
000400*   �̃A�v���P�[�V�������\�z���܂��B
000500*
000600*=================================================================
000700*
000800*  �t�@�C�����F ISATerm.cob
000900*  ����T�v  �F ISAPI�g�p���ɕK�v�ȏI�������v���O�����ł��B
001000*               IIS���璼�ڌĂяo����܂��B
001100*
001200* Copyright 1999-2015 FUJITSU LIMITED
001300*=================================================================
001400 identification division.
001500 program-id. "TerminateExtension".
001600 environment division.
001700 data division.
001800  linkage section.
001900     copy IsapiFlg.
002000*
002100 procedure division with stdcall linkage using ISAPI-FLAG.
002200*
002300     move 1 to program-status.
002400     exit program.