000100* Copyright 1992-2015 FUJITSU LIMITED
000200 IDENTIFICATION DIVISION.
000300  PROGRAM-ID. SAMPLE7.
000400*
000500 ENVIRONMENT DIVISION.
000600*
000700  CONFIGURATION SECTION.
000800  SPECIAL-NAMES.
000900     ENVIRONMENT-NAME  IS ���ϐ���
001000     ENVIRONMENT-VALUE IS ���ϐ��l.
001100*
001200  INPUT-OUTPUT SECTION.
001300  FILE-CONTROL.
001400       SELECT ���}�X�^�t�@�C��
001500         ASSIGN TO INFILE
001600         ORGANIZATION IS INDEXED
001700         RECORD KEY IS ���i�R�[�h OF ���}�X�^���R�[�h
001800         ALTERNATE RECORD KEY IS ���i�� OF ���}�X�^���R�[�h
001900         ACCESS MODE IS SEQUENTIAL.
002000       SELECT �V�}�X�^�t�@�C��
002100         ASSIGN TO OUTFILE
002200         ORGANIZATION IS INDEXED
002300         RECORD KEY IS ���i�R�[�h OF �V�}�X�^���R�[�h
002400         ALTERNATE RECORD KEY IS ���i�� OF �V�}�X�^���R�[�h
002500         ACCESS MODE IS SEQUENTIAL.
002600*
002700 DATA DIVISION.
002800*
002900  FILE SECTION.
003000  FD ���}�X�^�t�@�C��.
003100  01 ���}�X�^���R�[�h.
003200     COPY  SYOHINM.
003300  FD �V�}�X�^�t�@�C��.
003400  01 �V�}�X�^���R�[�h.
003500     COPY  SYOHINM.
003600  WORKING-STORAGE SECTION.
003700  01  �t�@�C����   PIC X(100).
003800  01  ���t�@�C���� PIC X(100).
003900  01  �V�t�@�C�����̊g���q�P  PIC X(2) VALUE ".a".
004000  01  �V�t�@�C�����̊g���q�Q  PIC X(2) VALUE ".b".
004100*
004200 PROCEDURE DIVISION.
004300*
004400**�i�P�j���}�X�^�t�@�C�����𓾂�B
004500      MOVE SPACE TO ���t�@�C����.
004600      DISPLAY "INFILE" UPON ���ϐ���.
004700      ACCEPT ���t�@�C���� FROM ���ϐ��l
004800                        ON EXCEPTION GO TO �I������
004900      END-ACCEPT.
005000*
005100**�i�Q�j�V�}�X�^�t�@�C���P���쐬����B
005200      MOVE SPACE TO �t�@�C����.
005300      STRING ���t�@�C���� �V�t�@�C�����̊g���q�P DELIMITED BY "  "
005400        INTO �t�@�C����.
005500      DISPLAY "OUTFILE" UPON ���ϐ���.
005600      DISPLAY �t�@�C���� UPON ���ϐ��l.
005700      OPEN OUTPUT �V�}�X�^�t�@�C��.
005800      OPEN INPUT ���}�X�^�t�@�C��.
005900      START ���}�X�^�t�@�C�� FIRST RECORD.
006000*
006100 ���t�@�C�����͂P.
006200      READ ���}�X�^�t�@�C�� AT END GO TO �t�@�C���P�I������.
006300        IF ���i�R�[�h OF ���}�X�^���R�[�h(1:1) = "0" THEN
006400          MOVE ���}�X�^���R�[�h TO �V�}�X�^���R�[�h
006500          WRITE �V�}�X�^���R�[�h
006600        END-IF.
006700      GO TO ���t�@�C�����͂P.
006800 �t�@�C���P�I������.
006900      CLOSE ���}�X�^�t�@�C�� �V�}�X�^�t�@�C��.
007000*
007100**�i�R�j�V�}�X�^�t�@�C���Q���쐬����B
007200      MOVE SPACE TO �t�@�C����.
007300      STRING ���t�@�C���� �V�t�@�C�����̊g���q�Q DELIMITED BY "  "
007400        INTO �t�@�C����.
007500      DISPLAY "OUTFILE" UPON ���ϐ���.
007600      DISPLAY �t�@�C���� UPON ���ϐ��l.
007700      OPEN OUTPUT �V�}�X�^�t�@�C��
007800      OPEN INPUT ���}�X�^�t�@�C��.
007900      START ���}�X�^�t�@�C�� FIRST RECORD.
008000*
008100 ���t�@�C�����͂Q.
008200      READ ���}�X�^�t�@�C�� AT END GO TO �t�@�C���Q�I������.
008300        IF ���i�R�[�h OF ���}�X�^���R�[�h(1:1) NOT = "0" THEN
008400          MOVE ���}�X�^���R�[�h TO �V�}�X�^���R�[�h
008500          WRITE �V�}�X�^���R�[�h
008600        END-IF.
008700      GO TO ���t�@�C�����͂Q.
008800 �t�@�C���Q�I������.
008900      CLOSE ���}�X�^�t�@�C�� �V�}�X�^�t�@�C��.
009000*
009100**�i�S�j�I�������B
009200 �I������.
009300      EXIT PROGRAM.
009400 END PROGRAM SAMPLE7.
