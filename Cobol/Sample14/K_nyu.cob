000100* Copyright 1992-2015 FUJITSU LIMITED
000200 IDENTIFICATION DIVISION.
000300 PROGRAM-ID. K_NYU.
000400*
000500 ENVIRONMENT DIVISION.
000600 CONFIGURATION SECTION.
000700 INPUT-OUTPUT SECTION.
000800 FILE-CONTROL.
000900      SELECT  �����t�@�C��
001000                ASSIGN  TO "tyokin.dat"
001100                ORGANIZATION IS  INDEXED
001200                RECORD KEY   IS  �����ԍ�
001300                ACCESS MODE  IS  RANDOM.
001400*
001500 DATA DIVISION.
001600 FILE SECTION.
001700 FD   �����t�@�C��.
001800 01    �������R�[�h.
001900       03 �����ԍ�    PIC  9(5).
002000       03 �Ïؔԍ�    PIC  9(4).
002100       03 ����        PIC  N(6).
002200       03 �����z      PIC  9(9).
002300*
002400 WORKING-STORAGE SECTION.
002500 77 �����z����        PIC  9(10).
002600*
002700 LINKAGE SECTION.
002800 01 �u�a�����ԍ�      PIC  9(5) COMP-5.
002900 01 �u�a�����z        PIC S9(9) COMP-5.
003000 01 �u�a�����z        PIC S9(9) COMP-5.
003100 01 �G���[�ԍ�        PIC  9(4) COMP-5.
003200*
003300 PROCEDURE DIVISION WITH STDCALL LINKAGE 
003400      USING �u�a�����ԍ� �u�a�����z �u�a�����z �G���[�ԍ�.
003500*
003600      OPEN I-O �����t�@�C��
003700      MOVE �u�a�����ԍ� TO �����ԍ�
003800*
003900      READ �����t�@�C��
004000            INVALID KEY
004100                  MOVE 7 TO �G���[�ԍ�
004200                  PERFORM �t�@�C�������
004300                  EXIT PROGRAM
004400            NOT INVALID KEY
004500                  PERFORM �����z�`�F�b�N
004600      END-READ
004700*
004800      REWRITE �������R�[�h
004900      MOVE �����z TO �u�a�����z
005000      MOVE 0 TO �G���[�ԍ�
005100      PERFORM �t�@�C�������
005200      EXIT PROGRAM.
005300*
005400 �����z�`�F�b�N.
005500      COMPUTE �����z���� = �����z + �u�a�����z
005600      IF �����z���� > 999999999
005700            MOVE 10 TO �G���[�ԍ�
005800            PERFORM �t�@�C�������
005900            EXIT PROGRAM
006000      END-IF
006100      MOVE �����z���� TO �����z.
006200
006300 �t�@�C�������.
006400      CLOSE �����t�@�C��.
006500
