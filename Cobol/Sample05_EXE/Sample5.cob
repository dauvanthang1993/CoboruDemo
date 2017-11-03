*>  Copyright 1992-2015 FUJITSU LIMITED
IDENTIFICATION DIVISION.
 PROGRAM-ID. SAMPLE5.
*>  ���̃T���v���v���O�����͎��R�`���̐����@�ŋL�q����Ă��܂��B
*>  �|�󎞂ɂ͖|��I�v�V�����r�q�e���g�p���āA�����@�̌`���Ƃ���
*>  ���R�`��(FREE)���w�肵�Ă��������B
ENVIRONMENT DIVISION.
 CONFIGURATION SECTION.
  SPECIAL-NAMES.
    SYSERR IS ���b�Z�[�W�o�͐�.
 INPUT-OUTPUT SECTION.
  FILE-CONTROL.
    SELECT �}�X�^�t�@�C��
        ASSIGN       TO  INFILE
        ORGANIZATION IS  INDEXED
        ACCESS MODE  IS  SEQUENTIAL
        RECORD KEY   IS  ���i�R�[�h OF �}�X�^���R�[�h
        ALTERNATE RECORD KEY IS ���i�� OF �}�X�^���R�[�h.
    SELECT ��ƃt�@�C��
        ASSIGN       TO  ��ƃt�@�C����
        ORGANIZATION IS  LINE SEQUENTIAL.
*>  ���R�`���ł͒��L�s��"*>"�Ŏn�܂�s�ł��B
*>  "*>"�̑O�ɋ󔒂����������Ă����܂��܂���B
                     *>  ���̍s���]���Ē��L�s�ł�
DATA DIVISION.
 FILE SECTION.
 FD  �}�X�^�t�@�C��.
 01  �}�X�^���R�[�h.
     02  ���i���R�[�h.
         03  ���i�R�[�h      PIC X(4).
         03  ���i��          PIC N(20).
         03  �P��            PIC 9(4)  BINARY.
 FD  ��ƃt�@�C��.
 01  ��ƃ��R�[�h.
     COPY "S_REC.CBL".
*>
 WORKING-STORAGE SECTION.
 01  ��ƃt�@�C����      PIC X(12) VALUE SPACE.
*>
 LINKAGE SECTION.
 01  �p�����[�^.
     03  �p�����[�^��         PIC 9(4) BINARY.
     03  �p�����[�^������.
         05  �p�����[�^����   PIC X
                 OCCURS 1 TO 8 DEPENDING ON �p�����[�^��.
*>
PROCEDURE DIVISION USING �p�����[�^.
*> �i�P�j��ƃt�@�C���������肵�܂��B
     IF �p�����[�^�� = 0
       *> ���̍s�͎��R�`���ɂ�����萔�̌p���������܂�
       DISPLAY NC"�p�����[�^���w�肳��Ă��܂���B"-
       "�p�����[�^���w�肵�Ă��������B"             
          UPON ���b�Z�[�W�o�͐�
       GO TO �����I��.
     IF �p�����[�^�� > 8
       DISPLAY NC"�p�����[�^���W�����𒴂��Ă��܂�"
          UPON ���b�Z�[�W�o�͐�
       GO TO �����I��.
     MOVE �p�����[�^������(1:�p�����[�^��) TO ��ƃt�@�C����.
     ADD 1 TO �p�����[�^��.
     MOVE ".TMP" TO ��ƃt�@�C����(�p�����[�^��:4).
     DISPLAY NC"��ƃt�@�C��" "(" ��ƃt�@�C���� ")" NC"���쐬���܂�"
          UPON ���b�Z�[�W�o�͐�.
*>
*> �i�Q�j�g�p����t�@�C�����I�[�v�����܂��B
     OPEN INPUT  �}�X�^�t�@�C��.
     START �}�X�^�t�@�C�� FIRST RECORD.
     OPEN OUTPUT ��ƃt�@�C��.
     MOVE SPACE TO ��ƃ��R�[�h.
*>
*> �i�R�j�����t�@�C������ǂݍ��񂾃��R�[�h���s���t�@�C���ɏ����o���܂��B
*>       �S�Ẵ��R�[�h�̏������I��������t�@�C�����N���[�Y���܂��B
*>
 �J��Ԃ��ʒu.
     READ �}�X�^�t�@�C�� AT END GO TO �t�@�C���̃N���[�Y.
     MOVE CORR �}�X�^���R�[�h TO ��ƃ��R�[�h.
     WRITE ��ƃ��R�[�h.
     GO TO �J��Ԃ��ʒu.
 �t�@�C���̃N���[�Y.
     CLOSE  �}�X�^�t�@�C��  ��ƃt�@�C��.
*>
 �������.
*> �i�S�j����������[�`�����Ăяo���A�s���t�@�C���̓��e��������܂��B
     CALL "INSATSU" USING ��ƃt�@�C����.
*>
 �����I��.
    EXIT PROGRAM.
END PROGRAM SAMPLE5.
