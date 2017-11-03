000100* Copyright 1992-2015 FUJITSU LIMITED
000200 IDENTIFICATION DIVISION.
000300 PROGRAM-ID. K_SIN.
000400*
000500 ENVIRONMENT DIVISION.
000600 CONFIGURATION SECTION.
000700 INPUT-OUTPUT SECTION.
000800 FILE-CONTROL.
000900      SELECT OPTIONAL �����t�@�C��
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
002500 77 �V�K������        PIC  9(6).
002600 77 �V�K�����`�F�b�N  PIC  9(4).
002700*
002800 LINKAGE SECTION.
002900 01 �u�a����          PIC  N(6).
003000 01 �u�a�����z        PIC S9(9) COMP-5.
003100 01 �u�a�Ïؔԍ�      PIC S9(4) COMP-5.
003200 01 �u�a�����ԍ�      PIC  X(5).
003300 01 �G���[�ԍ�        PIC  9(4) COMP-5.
003400*
003500 PROCEDURE DIVISION WITH STDCALL LINKAGE 
003600      USING �u�a���� �u�a�����z �u�a�Ïؔԍ� �u�a�����ԍ� �G���[�ԍ�.
003700*
003800      OPEN I-O �����t�@�C��
003900*
004000      MOVE 0 TO �V�K�����`�F�b�N
004100      MOVE 1 TO �����ԍ�
004200*
004300* �g�p����Ă�������ԍ���ǂݔ�΂��Ă���
004400* �����ԍ��������ł��Ȃ��Ȃ�܂Ō����ԍ����{�P���Ă���
004500* �����ł��Ȃ��Ȃ������_�̌����ԍ���V�K�����ԍ��Ƃ���
004600*
004700      PERFORM UNTIL �V�K�����`�F�b�N NOT = 0
004800            READ �����t�@�C��
004900                  INVALID KEY
005000                        MOVE �����ԍ� TO �V�K������
005100                        MOVE 1 TO �V�K�����`�F�b�N
005200                  NOT INVALID KEY
005300                        ADD 1 TO �����ԍ�
005400            END-READ
005500      END-PERFORM
005600*
005700      PERFORM �������`�F�b�N
005800*
005900      MOVE �u�a�����z TO �����z
006000      MOVE �u�a�Ïؔԍ� TO �Ïؔԍ�
006100      MOVE �u�a���� TO ����
006200*
006300      MOVE ���� TO �u�a����
006400      MOVE �����ԍ� TO �u�a�����ԍ�
006500*
006600      MOVE 0 TO �G���[�ԍ�
006700      WRITE �������R�[�h
006800      CLOSE �����t�@�C��
006900      EXIT PROGRAM.
007000*
007100*�V�K�������������̐������I�[�o�[���Ă��Ȃ����`�F�b�N
007200 �������`�F�b�N.
007300      IF �V�K������ > 50
007400            MOVE 11 TO �G���[�ԍ�
007500            CLOSE �����t�@�C��
007600            EXIT PROGRAM
007700      END-IF
007800      MOVE �V�K������ TO �����ԍ�.
007900
