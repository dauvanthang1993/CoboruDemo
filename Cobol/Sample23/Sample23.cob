000100*======================================================================
000200*
000300*�@�b�n�l�N���C�A���g�i���C�g�o�C���f�B���O�j�̗��
000400*�@�@�G�N�Z�����b�n�l�T�[�o�Ƃ��āC���̋@�\���b�n�a�n�k�v���O��������
000500*�@�g�p���܂��B
000600*
000700*        Copyright 1999-2015 FUJITSU LIMITED
000800*======================================================================
000900 IDENTIFICATION DIVISION.
001000 PROGRAM-ID.    SAMPLE23.
001100 ENVIRONMENT    DIVISION.
001200 CONFIGURATION SECTION.
001300   REPOSITORY.
001400           CLASS COM AS "*COM".
001500 DATA           DIVISION.
001600 WORKING-STORAGE SECTION.
001700 01 �G�N�Z��            OBJECT REFERENCE COM.
001800 01 �u�b�N              OBJECT REFERENCE COM.
001900 01 �R���N�V����        OBJECT REFERENCE COM.
002000 01 �V�[�g              OBJECT REFERENCE COM.
002100 01 �I���Z��            OBJECT REFERENCE COM.
002200 01 �Z��                OBJECT REFERENCE COM.
002300 01 �J�n�ʒu            OBJECT REFERENCE COM.
002400 01 �I���ʒu            OBJECT REFERENCE COM.
002500 01 �`���[�g            OBJECT REFERENCE COM.
002600 01 �O���t              OBJECT REFERENCE COM.
002700 01 �O���t�f�[�^        OBJECT REFERENCE COM.
002800 01 �A�v���P�[�V������  PIC X(20).
002900 01 �e�X�g�p�t�@�C��    PIC X(256).
003000 01 �v�����^��          PIC X(60).
003100 01 �I���V�[�g��  PIC X(20).
003200 01 �Z���s�ʒu          PIC S9(9) COMP-5.
003300 01 �Z���J�����ʒu      PIC S9(9) COMP-5.
003400 01 �O���t�f�[�^��      PIC S9(9) COMP-5.
003500 01 �O���t�h�c          PIC S9(9) COMP-5.
003600 01 LOOP-COUNT          PIC S9(9) COMP-5.
003700 01 TYPE-SELECT         PIC 9(1).
003800 01 COM-TRUE            PIC 1(1) BIT VALUE B"1".
003900 01 COM-FALSE           PIC 1(1) BIT VALUE B"0".
004000 01 PAGE-FROM           PIC S9(9) COMP-5 VALUE 1.
004100 01 PAGE-TO             PIC S9(9) COMP-5 VALUE 999.
004200 01 COPIES              PIC S9(9) COMP-5 VALUE 1.
004300 01 GRAPH-DATA.
004400   02 POINT-DATA.
004500     03                 PIC S9(9) COMP-5 VALUE 1.
004600     03                 PIC S9(9) COMP-5 VALUE 1.
004700     03                 PIC S9(9) COMP-5 VALUE 9.
004800     03                 PIC S9(9) COMP-5 VALUE 2.
004900     03                 PIC S9(9) COMP-5 VALUE 1.
005000     03                 PIC S9(9) COMP-5 VALUE 2.
005100     03                 PIC S9(9) COMP-5 VALUE 7.
005200     03                 PIC S9(9) COMP-5 VALUE 2.
005300     03                 PIC S9(9) COMP-5 VALUE 1.
005400     03                 PIC S9(9) COMP-5 VALUE 1.
005500   02 REDEFINES   POINT-DATA.
005600     03 PDATA           PIC S9(9) COMP-5 OCCURS 10.
005700   02 TYPE-DATA.
005800     03                 PIC S9(9) COMP-5 VALUE 51.
005900     03                 PIC S9(9) COMP-5 VALUE 57.
006000     03                 PIC S9(9) COMP-5 VALUE 4.
006100     03                 PIC S9(9) COMP-5 VALUE 5.
006200     03                 PIC S9(9) COMP-5 VALUE -4151.
006300   02 REDEFINES   TYPE-DATA.
006400     03 GRAPH-TYPE      PIC S9(9) COMP-5 OCCURS 5.
006500 PROCEDURE      DIVISION.
006600*======================================================================
006700*  �G�N�Z�����N�����āC�\����Ԃɂ��܂��B
006800*======================================================================
006900     MOVE "EXCEL.APPLICATION" TO �A�v���P�[�V������.
007000     INVOKE COM "CREATE-OBJECT"
007100                         USING     �A�v���P�[�V������
007200                         RETURNING �G�N�Z��.
007300     INVOKE �G�N�Z�� "SET-VISIBLE"
007400                         USING COM-TRUE.
007500*======================================================================
007600*  �e�X�g�p�̃G�N�Z���V�[�g�̃t�@�C��������͂��C������I�[�v�����܂��B
007700*======================================================================
007800     DISPLAY " �e�X�g�pExcel�t�@�C���̃t�@�C�������t���p�X�Ŏw�肵�Ă�������".
007900     DISPLAY " => " WITH NO ADVANCING.
008000     ACCEPT  �e�X�g�p�t�@�C�� FROM CONSOLE.
008100*
008200     INVOKE �G�N�Z�� "GET-WORKBOOKS"             *> WORKBOOK�I�u�W�F�N�g
008300                          RETURNING �u�b�N.      *> ���擾����
008400     INVOKE �u�b�N "OPEN" USING     �e�X�g�p�t�@�C��
008500                          RETURNING �u�b�N.
008600*======================================================================
008700*  SHEET�R���N�V��������C"SHEET1"�̃I�u�W�F�N�g��I�����܂��B
008800*======================================================================
008900     MOVE  "SHEET1" TO �I���V�[�g��.
009000     INVOKE �u�b�N "GET-WORKSHEETS"
009100                        RETURNING �R���N�V����.
009200     INVOKE �R���N�V���� "GET-ITEM"
009300                        USING     �I���V�[�g��
009400                        RETURNING �V�[�g.
009500*======================================================================
009600*  �P�s�ڂ̂P�`�P�O�Ԗڂ̃Z���i�`�P�`�i�P�j�ɒl��ݒ肵�܂��B
009700*======================================================================
009800     MOVE 1 TO �Z���s�ʒu.
009900     PERFORM VARYING �Z���J�����ʒu FROM 1 BY 1
010000             UNTIL �Z���J�����ʒu > 10
010100       INVOKE �V�[�g "GET-CELLS"
010200                     USING �Z���s�ʒu �Z���J�����ʒu
010300                     RETURNING �Z��
010400       INVOKE �Z�� "SET-VALUE"
010500                     USING PDATA(�Z���J�����ʒu)
010600     END-PERFORM.
010700*======================================================================
010800*  �P�s�ڂ̂P�`�P�O�Ԗڂ̃Z���i�`�P�`�i�P�j��I�����܂��B
010900*======================================================================
011000     MOVE 1 TO �Z���s�ʒu.
011100     MOVE 1 TO �Z���J�����ʒu.      *> �I���J�n�ʒu��
011200     INVOKE �V�[�g "GET-CELLS"      *> CELL�I�u�W�F�N�g���擾
011300                      USING �Z���s�ʒu �Z���J�����ʒu
011400                      RETURNING �J�n�ʒu.
011500     MOVE 1  TO �Z���s�ʒu.
011600     MOVE 10 TO �Z���J�����ʒu.     *> �I���I���ʒu��
011700     INVOKE �V�[�g "GET-CELLS"      *> CELL�I�u�W�F�N�g���擾
011800                      USING �Z���s�ʒu �Z���J�����ʒu
011900                      RETURNING �I���ʒu.
012000     INVOKE �V�[�g "GET-RANGE" USING �J�n�ʒu �I���ʒu
012100                               RETURNING �I���Z��.
012200*======================================================================
012300*  �`���[�g�R���N�V��������C"GRAPH1"�̃I�u�W�F�N�g��I�����܂��B
012400*======================================================================
012500     MOVE  "GRAPH1" TO �I���V�[�g��.
012600     INVOKE �u�b�N "GET-CHARTS"
012700                        RETURNING �R���N�V����.
012800     INVOKE �R���N�V���� "GET-ITEM"
012900                        USING     �I���V�[�g��
013000                        RETURNING �`���[�g.
013100*======================================================================
013200*  "GRAPH1"�Ɋ܂܂��O���t�f�[�^�̃R���N�V�����I�u�W�F�N�g���擾��
013300*  �����̃O���t�f�[�^���폜���܂��B
013400*======================================================================
013500     INVOKE �`���[�g "SeriesCollection"
013600                        RETURNING �O���t.
013700     INVOKE �O���t "GET-COUNT"
013800                        RETURNING �O���t�f�[�^��.
013900     MOVE 1 TO �O���t�h�c.
014000     PERFORM VARYING LOOP-COUNT FROM 1 BY 1
014100             UNTIL LOOP-COUNT > �O���t�f�[�^��
014200       INVOKE �O���t "ITEM"
014300                        USING �O���t�h�c
014400                        RETURNING �O���t�f�[�^
014500       INVOKE �O���t�f�[�^ "DELETE"
014600     END-PERFORM.
014700*======================================================================
014800*  �I�������Z���̃f�[�^���O���t�f�[�^�Ƃ��Ēǉ����܂�
014900*======================================================================
015000     MOVE 1 TO �O���t�h�c.
015100     INVOKE �O���t "ADD"  USING �I���Z��.
015200     INVOKE �O���t "ITEM" USING �O���t�h�c
015300                          RETURNING �O���t�f�[�^.
015400*======================================================================
015500*  �쐬����O���t�̎�ނ�I������B
015600*======================================================================
015700     DISPLAY " �쐬����O���t�̎�ނ�I�����Ă��������B".
015800     DISPLAY " �P�F�_�O���t�i�c�j".
015900     DISPLAY " �Q�F�_�O���t�i���j".
016000     DISPLAY " �R�F�܂���O���t".
016100     DISPLAY " �S�F�~�O���t".
016200     DISPLAY " �T�F���[�_�O���t".
016300     DISPLAY " => " WITH NO ADVANCING.
016400     ACCEPT TYPE-SELECT FROM CONSOLE
016500*======================================================================
016600*  �O���t���쐬����B
016700*======================================================================
016800     INVOKE �O���t�f�[�^ "SET-ChartType"
016900                     USING GRAPH-TYPE(TYPE-SELECT).
017000*======================================================================
017100*  �O���t���������B
017200*======================================================================
017300     DISPLAY " �쐬�����O���t���������Ȃ�v�����^�����w�肵�Ă��������B".
017400     DISPLAY " => " WITH NO ADVANCING.
017500     ACCEPT �v�����^�� FROM CONSOLE
017600     IF FUNCTION STORED-CHAR-LENGTH(�v�����^��) NOT = 0 THEN
017700       INVOKE �`���[�g "PrintOut"
017800             USING PAGE-FROM PAGE-TO COPIES COM-FALSE �v�����^��
017900     END-IF
018000*======================================================================
018100*  �u�b�N��ۑ�����, �s�v�ȃI�u�W�F�N�g���폜����
018200*======================================================================
018300     INVOKE �u�b�N "SAVE"
018400     INVOKE �u�b�N "CLOSE"
018500     INVOKE �G�N�Z�� "QUIT".
018600     SET �G�N�Z��       TO NULL.
018700     SET �u�b�N         TO NULL.
018800     SET �V�[�g         TO NULL.
018900     SET �I���Z��       TO NULL.
019000     SET �Z��           TO NULL.
019100     SET �J�n�ʒu       TO NULL.
019200     SET �I���ʒu       TO NULL.
019300     SET �`���[�g       TO NULL.
019400     SET �O���t         TO NULL.
019500     SET �O���t�f�[�^   TO NULL.
019600     STOP RUN.
019700 END PROGRAM SAMPLE23.
