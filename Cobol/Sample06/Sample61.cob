000010*=================================================================
000020*�u�R�}���h�s�����̎�����v
000030*
000040*
000050*  Copyright 2000-2015 FUJITSU LIMITED
000060*=================================================================
000070 IDENTIFICATION DIVISION.
000080  PROGRAM-ID. SAMPLE6.
000090*
000100 ENVIRONMENT DIVISION.
000110  CONFIGURATION SECTION.
000120  SPECIAL-NAMES.
000130     ARGUMENT-NUMBER IS �����̔ԍ�
000140     ARGUMENT-VALUE  IS �����̒l.
000150*
000160 DATA DIVISION.
000170 WORKING-STORAGE SECTION.
000180   01  �����̐�    PIC 9(4)  BINARY.
000190   01  ���t�̍�    PIC S9(5) DISPLAY.
000200*
000210   01  �ʎZ���P    PIC S9(8) BINARY.
000220   01  �����P.
000230     02  �N�����P.
000240         03  �N   PIC 9999.
000250         03  ��   PIC 99.
000260         03  ��   PIC 99.
000270     02  ���t���P  REDEFINES �N�����P  PIC X(8).
000280*
000290   01  �ʎZ���Q    PIC S9(8) BINARY.
000300   01  �����Q.
000310     02  �N�����Q.
000320         03  �N  PIC 9999.
000330         03  ��  PIC 99.
000340         03  ��  PIC 99.
000350     02  ���t���Q  REDEFINES �N�����Q  PIC X(8).
000360*
000370 PROCEDURE DIVISION.
000380     ACCEPT �����̐� FROM �����̔ԍ�.
000390     IF �����̐� NOT = 2 THEN
000400       DISPLAY "�����̐��Ɍ�肪����܂��D"
000410       GO TO �I������
000420     END-IF
000430*
000440     ACCEPT ���t���P FROM �����̒l.
000450     IF �N OF �N�����P < 1900 THEN
000460         DISPLAY "���͓��t�͂P�X�O�O�N�ȍ~�̓��t����͂��Ă��������D"
000470         GO TO �I������
000480     END-IF.
000490     ACCEPT ���t���Q FROM �����̒l.
000500     IF �N OF �N�����Q < 1900 THEN
000510         DISPLAY "���͓��t�͂P�X�O�O�N�ȍ~�̓��t����͂��Ă��������D"
000520         GO TO �I������
000530     END-IF.
000540     CALL "SUMCALC"  USING �N�����P �ʎZ���P.
000550     CALL "SUMCALC"  USING �N�����Q �ʎZ���Q.
000560*
000570     COMPUTE ���t�̍� = �ʎZ���Q - �ʎZ���P.
000580     DISPLAY "�����̍��́@" ���t�̍� "���ł��D".
000590*
000600 �I������.
000610     EXIT PROGRAM.
000620*
000630/
000640*=================================================================
000650*  �ȉ��̃v���O������1900�N1��1������̓������v�Z����.
000660*=================================================================
000670 IDENTIFICATION DIVISION.
000680   PROGRAM-ID. SUMCALC  INITIAL PROGRAM.
000690*
000700 DATA DIVISION.
000710 WORKING-STORAGE SECTION.
000720   77  ���v����    PIC S9(8) BINARY.
000730   77  �J�E���^    PIC S9(4) BINARY.
000740   77  ���邤�N��  PIC S9(8) BINARY.
000750   77  ��Ɨp�N    PIC S9(4) BINARY.
000760   77  �]��P      PIC S9(4) BINARY.
000770   77  �]��Q      PIC S9(4) BINARY.
000780   77  �]��R      PIC S9(4) BINARY.
000790   01  �����e�[�u��.
000800      02  ����     PIC X(24)
000810                   VALUE  "312831303130313130313031".
000820      02  ����     REDEFINES ����
000830                   PIC 99 OCCURS 12 TIMES.
000840*
000850 LINKAGE SECTION.
000860   01  ���͓��t.
000870         03  �N  PIC 9999.
000880         03  ��  PIC 99.
000890         03  ��  PIC 99.
000900   01  �o�͓���  PIC S9(8)  BINARY.
000910*
000920 PROCEDURE DIVISION  USING ���͓��t �o�͓���.
000930*
000940* �O�N�܂ł́u���邤�N�v���l������D
000950     COMPUTE ���邤�N�� = (�N - 1900 - 1) / 4.
000960* �O�N�܂ł̒ʎZ���t�����߂�B
000970     COMPUTE ���v���� = (�N - 1900) * 365 + ���邤�N��.
000980*
000990* ���͂��ꂽ�N�����邤�N���ǂ������肷��
001000     DIVIDE �N BY 4   GIVING ��Ɨp�N REMAINDER �]��P.
001010     DIVIDE �N BY 100 GIVING ��Ɨp�N REMAINDER �]��Q.
001020     DIVIDE �N BY 400 GIVING ��Ɨp�N REMAINDER �]��R.
001030*
001040* �N���S�̔{���ŁA����100�̔{���łȂ���Ή[�N
001050* �������A400�̔{���̔N���[�N
001060     IF �]��P = 0 THEN
001070       IF �]��Q NOT = 0 OR
001080           �]��R     = 0 THEN
001090         MOVE "29" TO ����(2)
001100       END-IF
001110     END-IF.
001120*
001130* ���͂��ꂽ�N�̌����v�Z���ē����ɂ���.
001140     PERFORM  VARYING �J�E���^ FROM 1 BY 1 UNTIL �J�E���^ = ��
001150       COMPUTE ���v���� = ���v���� + ����(�J�E���^)
001160     END-PERFORM.
001170*
001180* �������v�Z����.
001190     COMPUTE �o�͓��� = ���v���� + ��.
001200*
001210     EXIT PROGRAM.
001220 END PROGRAM  SUMCALC.
001230 END PROGRAM  SAMPLE6.