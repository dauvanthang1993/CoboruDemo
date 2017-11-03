000100* Copyright 1992-2015 FUJITSU LIMITED
000200 IDENTIFICATION DIVISION.
000300 PROGRAM-ID. K_KEN.
000400*
000500 ENVIRONMENT   DIVISION.
000600 CONFIGURATION SECTION.
000700 INPUT-OUTPUT  SECTION.
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
001800 01   �������R�[�h.
001900      03 �����ԍ�     PIC  9(5).
002000      03 �Ïؔԍ�     PIC  9(4).
002100      03 ����         PIC  N(6).
002200      03 �����z       PIC  9(9).
002300*
002400 WORKING-STORAGE SECTION.
002500 77 �Ï؃`�F�b�N      PIC  9(4).
002600*
002700 LINKAGE SECTION.
002800 01 �u�a�����ԍ�      PIC  9(5) COMP-5.
002900 01 �u�a�Ïؔԍ�      PIC S9(4) COMP-5.
003000 01 �u�a����          PIC  N(6).
003100 01 �u�a�����z        PIC S9(9) COMP-5.
003200 01 �G���[�ԍ�        PIC  9(4) COMP-5.
003300*
003400 PROCEDURE DIVISION WITH STDCALL LINKAGE
003500      USING �u�a�����ԍ� �u�a�Ïؔԍ� �u�a���� �u�a�����z �G���[�ԍ�.
003600*
003700      OPEN I-O �����t�@�C��
003800*
003900      MOVE �u�a�����ԍ� TO �����ԍ�
004000*
004100      READ �����t�@�C��
004200            INVALID KEY
004300                  MOVE 7 TO �G���[�ԍ�
004400                  PERFORM �t�@�C�������
004500                  EXIT PROGRAM
004600            NOT INVALID KEY
004700                  PERFORM �Ïؔԍ��`�F�b�N
004800                  PERFORM �����f�[�^�ݒ�
004900      END-READ
005000      PERFORM �t�@�C�������
005100      EXIT PROGRAM.
005200*
005300*���͂��ꂽ�Ïؔԍ������R�[�h��̈Ïؔԍ��ƈ�v���Ă��邩�`�F�b�N
005400*
005500 �Ïؔԍ��`�F�b�N.
005600      COMPUTE �Ï؃`�F�b�N = �u�a�Ïؔԍ� - �Ïؔԍ�
005700      IF �Ï؃`�F�b�N NOT = 0
005800            MOVE 8 TO �G���[�ԍ�
005900            PERFORM �t�@�C�������
006000            EXIT PROGRAM
006100      END-IF.
006200
006300 �����f�[�^�ݒ�.
006400
006500      MOVE �����ԍ� TO �u�a�����ԍ�
006600      MOVE ����     TO �u�a����
006700      MOVE �����z   TO �u�a�����z
006800      MOVE 0        TO �G���[�ԍ�.
006900
007000 �t�@�C�������.
007100      CLOSE �����t�@�C��.
