000100*=================================================================
000200* �u�}���`�X���b�h�v���O���~���O�v
000300*     �X���b�h�ԂŃt�@�C���E�f�[�^�����p���ăI�����C���V���b�s���O
000400*   �̃A�v���P�[�V�������\�z���܂��B
000500*
000600*=================================================================
000700*
000800*  �t�@�C�����F ISAInit.cob
000900*  ����T�v  �F ISAPI�g�p���ɕK�v�ȏ������v���O�����ł��B
001000*               IIS���璼�ڌĂяo����܂��B
001100*
001200* Copyright 1999-2015 FUJITSU LIMITED
001300*=================================================================
001400 identification division.
001500 program-id. "GetExtensionVersion".
001600 environment division.
001700 data division.
001800  working-storage section.
001900 01 �I�����C���V���b�s���O�N����� pic 9(1) is external.
002000  linkage section.
002100     copy IsapiInf.
002200*
002300 procedure division with stdcall linkage using ISAPI-INFO.
002400*
002500     move 0 to �I�����C���V���b�s���O�N�����.
002600*
002700     move 1 to program-status.
002800     exit program.
