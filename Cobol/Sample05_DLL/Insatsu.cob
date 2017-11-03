*>  Copyright 1992-2015 FUJITSU LIMITED
IDENTIFICATION DIVISION.
 PROGRAM-ID. INSATSU.
*>  ���̃T���v���v���O�����͎��R�`���̐����@�ŋL�q����Ă��܂��B
*>  �|�󎞂ɂ͖|��I�v�V�����r�q�e���g�p���āA�����@�̌`���Ƃ���
*>  ���R�`��(FREE)���w�肵�Ă��������B
ENVIRONMENT DIVISION.
 CONFIGURATION SECTION.
  SPECIAL-NAMES.
    PRINTING MODE PMODE1 IS FOR MOCS
      IN   SIZE   7 POINT
      AT   PITCH  10 CPI
      WITH FONT   GOTHIC
      AT   ANGLE  0 DEGREES
      BY   FORM   F.
*>
 INPUT-OUTPUT SECTION.
  FILE-CONTROL.
    SELECT ����t�@�C��
        ASSIGN       TO  PRINTER.
    SELECT ��ƃt�@�C��
        ASSIGN       TO  ��ƃt�@�C����
        ORGANIZATION IS  LINE SEQUENTIAL.
*>
DATA DIVISION.
 FILE SECTION.
 FD  ����t�@�C��.
 01  ������R�[�h PIC X(60).
 FD  ��ƃt�@�C��.
 01  ��ƃ��R�[�h.
     COPY "S_REC.CBL".
*>
 WORKING-STORAGE SECTION.
 01  ��ƂP���R�[�h CHARACTER TYPE IS PMODE1.
     COPY "S_REC.CBL".
*>
 LINKAGE SECTION.
 01  ��ƃt�@�C����      PIC X(12).
*>
PROCEDURE DIVISION USING ��ƃt�@�C����.
*> �i�P�j����t�@�C���ƍ�ƃt�@�C�����I�[�v�����܂��B
     OPEN OUTPUT ����t�@�C��.
     OPEN INPUT  ��ƃt�@�C��.
*>
 �J��Ԃ��ʒu.
*> �i�Q�j��ƃt�@�C������f�[�^��ǂݍ��݁A������u�ɏo�͂��܂��B
     READ ��ƃt�@�C�� INTO ��ƂP���R�[�h
          AT END GO TO �I������.
     WRITE ������R�[�h FROM ��ƂP���R�[�h AFTER ADVANCING 1 LINE.
     GO TO �J��Ԃ��ʒu.
*>
 �I������.
*> �i�R�j����t�@�C���ƍ�ƃt�@�C�����N���[�Y���܂��B
     CLOSE  ����t�@�C�� ��ƃt�@�C��.
END PROGRAM INSATSU.
