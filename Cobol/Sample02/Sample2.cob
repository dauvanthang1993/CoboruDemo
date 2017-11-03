000100* Copyright 1992-2015 FUJITSU LIMITED
000200 IDENTIFICATION DIVISION.
000300  PROGRAM-ID. SAMPLE2.
000400*
000500 ENVIRONMENT DIVISION.
000600  INPUT-OUTPUT SECTION.
000700   FILE-CONTROL.
000800     SELECT �f�[�^�t�@�C��
000900         ASSIGN       TO  INFILE
001000         ORGANIZATION IS  LINE SEQUENTIAL.
001100     SELECT �����t�@�C��
001200         ASSIGN       TO  OUTFILE
001300         ORGANIZATION IS  INDEXED
001400         RECORD KEY   IS  ���i�R�[�h  OF  �������R�[�h
001500         ALTERNATE RECORD KEY IS  ���i��  OF  �������R�[�h
001600         ACCESS MODE  IS  SEQUENTIAL.
001700*
001800 DATA DIVISION.
001900  FILE SECTION.
002000  FD  �f�[�^�t�@�C��.
002100  01  �f�[�^���R�[�h.
002200      02  ���i���R�[�h.
002300          03  ���i�R�[�h    PIC X(4).
002400          03                PIC X.
002500          03  ���i��        PIC N(20).
002600          03                PIC X.
002700          03  �P��          PIC 9(4).
002800  FD  �����t�@�C��.
002900  01  �������R�[�h.
003000      COPY  SYOHINM.
003100*
003200 PROCEDURE DIVISION.
003300**�i�P�j�g�p����t�@�C�����I�[�v�����܂��B
003400      OPEN INPUT  �f�[�^�t�@�C��.
003500      OPEN OUTPUT �����t�@�C��.
003600*
003700  �J��Ԃ��ʒu.
003800**�i�Q�j�s���t�@�C������ǂݍ��񂾃��R�[�h���������R�[�h�ɕҏW���A�����t
003900**    �@�C���ɏ����o���܂��B�S�Ẵ��R�[�h��ǂݍ��񂾂�A�I�������ɕ���
004000**    ���܂��B
004100      READ �f�[�^�t�@�C�� AT END GO TO �I������.
004200      MOVE CORR �f�[�^���R�[�h TO �������R�[�h.
004300      WRITE �������R�[�h.
004400      GO TO �J��Ԃ��ʒu.
004500*
004600  �I������.
004700**�i�R�j�g�p�����t�@�C�����N���[�Y���܂��B
004800      CLOSE  �f�[�^�t�@�C��  �����t�@�C��.
004900 END PROGRAM SAMPLE2.
