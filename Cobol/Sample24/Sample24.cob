000010*======================================================================
000020*
000030*�@�b�n�l�N���C�A���g�i�A�[���o�C���f�B���O�j�̗��
000040*�@�@�G�N�Z�����b�n�l�T�[�o�Ƃ��āC���̋@�\���b�n�a�n�k�v���O��������
000050*�@�g�p���܂��B
000060*
000070*        Copyright 1999-2015 FUJITSU LIMITED
000080*======================================================================
000090 IDENTIFICATION DIVISION.
000100 PROGRAM-ID.    SAMPLE24.
000110 ENVIRONMENT    DIVISION.
000120 CONFIGURATION SECTION.
000130   REPOSITORY.
000140           CLASS COM AS "*COM"
000150           CLASS EXCEL     AS "*COM:EXCEL:APPLICATION"
000160           CLASS WORKBOOKS AS "*COM:EXCEL:WORKBOOKS"
000170           CLASS WORKBOOK  AS "*COM:EXCEL:WORKBOOK"
000180           CLASS SHEETS    AS "*COM:EXCEL:SHEETS"
000190           CLASS SHEET     AS "*COM:EXCEL:WORKSHEET"
000200           CLASS CELLS     AS "*COM:EXCEL:RANGE"
000210           CLASS GRAPHS    AS "*COM:EXCEL:SERIESCOLLECTION"
000220           CLASS GRAPH     AS "*COM:EXCEL:SERIES"
000230           CLASS CHART     AS "*COM:EXCEL:CHART"
000240           CLASS RANGES    AS "*COM:EXCEL:RANGE"
000250           .
000260 DATA           DIVISION.
000270 WORKING-STORAGE SECTION.
000280 01 �G�N�Z��            OBJECT REFERENCE EXCEL.
000290 01 �u�b�N              OBJECT REFERENCE WORKBOOK.
000300 01 �R���N�V����        OBJECT REFERENCE SHEETS.
000310 01 �V�[�g              OBJECT REFERENCE SHEET.
000320 01 �I���Z��            OBJECT REFERENCE CELLS.
000330 01 �Z��                OBJECT REFERENCE CELLS.
000340 01 �J�n�ʒu            OBJECT REFERENCE CELLS.
000350 01 �I���ʒu            OBJECT REFERENCE CELLS.
000360 01 �`���[�g            OBJECT REFERENCE CHART.
000370 01 �O���t              OBJECT REFERENCE GRAPHS.
000380 01 �O���t�f�[�^        OBJECT REFERENCE GRAPH.
000390 01 �͈�                OBJECT REFERENCE RANGES.
000400 01 �ꎞ�I�u�W�F�N�g��  OBJECT REFERENCE COM.
000410 01 �e�X�g�p�t�@�C��    PIC X(256).
000420 01 �v�����^��          PIC X(60).
000430 01 �I���V�[�g��  PIC X(20).
000440 01 �Z���s�ʒu          PIC S9(9) COMP-5.
000450 01 �Z���J�����ʒu      PIC S9(9) COMP-5.
000460 01 �O���t�f�[�^��      PIC S9(9) COMP-5.
000470 01 �O���t�h�c          PIC S9(9) COMP-5.
000480 01 LOOP-COUNT          PIC S9(9) COMP-5.
000490 01 TYPE-SELECT         PIC 9(1).
000500 01 COM-TRUE            PIC 1(1) BIT VALUE B"1".
000510 01 COM-FALES           PIC 1(1) BIT VALUE B"0".
000520 01 PAGE-FROM           PIC S9(9) COMP-5 VALUE 1.
000530 01 PAGE-TO             PIC S9(9) COMP-5 VALUE 999.
000540 01 COPIES              PIC S9(9) COMP-5 VALUE 1.
000550 01 GRAPH-DATA.
000560   02 POINT-DATA.
000570     03                 PIC S9(9) COMP-5 VALUE 1.
000580     03                 PIC S9(9) COMP-5 VALUE 1.
000590     03                 PIC S9(9) COMP-5 VALUE 9.
000600     03                 PIC S9(9) COMP-5 VALUE 2.
000610     03                 PIC S9(9) COMP-5 VALUE 1.
000620     03                 PIC S9(9) COMP-5 VALUE 2.
000630     03                 PIC S9(9) COMP-5 VALUE 7.
000640     03                 PIC S9(9) COMP-5 VALUE 2.
000650     03                 PIC S9(9) COMP-5 VALUE 1.
000660     03                 PIC S9(9) COMP-5 VALUE 1.
000670   02 REDEFINES   POINT-DATA.
000680     03 PDATA           PIC S9(9) COMP-5 OCCURS 10.
000690   02 TYPE-DATA.
000700     03                 PIC S9(9) COMP-5 VALUE 51.
000710     03                 PIC S9(9) COMP-5 VALUE 57.
000720     03                 PIC S9(9) COMP-5 VALUE 4.
000730     03                 PIC S9(9) COMP-5 VALUE 5.
000740     03                 PIC S9(9) COMP-5 VALUE -4151.
000750   02 REDEFINES   TYPE-DATA.
000760     03 GRAPH-TYPE      PIC S9(9) COMP-5 OCCURS 5.
000770 PROCEDURE      DIVISION.
000780*======================================================================
000790*  �G�N�Z�����N�����āC�\����Ԃɂ��܂��B
000800*======================================================================
000810     INVOKE EXCEL "NEW"  RETURNING �G�N�Z��.
000820     MOVE   COM-TRUE TO VISIBLE OF �G�N�Z��
000830*======================================================================
000840*  �e�X�g�p�̃G�N�Z���V�[�g�̃t�@�C��������͂��C������I�[�v�����܂��B
000850*======================================================================
000860     DISPLAY " �e�X�g�p�G�N�Z���V�[�g�̃t�@�C�������t���p�X�Ŏw�肵�Ă�������".
000870     DISPLAY " => " WITH NO ADVANCING.
000880     ACCEPT  �e�X�g�p�t�@�C�� FROM CONSOLE.
000890     INVOKE WORKBOOKS OF �G�N�Z�� "OPEN"
000900                          USING     �e�X�g�p�t�@�C��
000910                          RETURNING �u�b�N.
000920*======================================================================
000930*  SHEET�R���N�V��������C"SHEET1"�̃I�u�W�F�N�g��I�����܂��B
000940*======================================================================
000950     MOVE  "SHEET1" TO �I���V�[�g��.
000960     INVOKE WORKSHEETS OF �u�b�N "GET-ITEM"
000970                        USING     �I���V�[�g��
000980                        RETURNING �ꎞ�I�u�W�F�N�g��.
000990     SET  �V�[�g  TO  �ꎞ�I�u�W�F�N�g��  AS  SHEET.
001000*======================================================================
001010*  �P�s�ڂ̂P�`�P�O�Ԗڂ̃Z���i�`�P�`�i�P�j�ɒl��ݒ肵�܂��B
001020*======================================================================
001030     MOVE 1 TO �Z���s�ʒu.
001040     PERFORM VARYING �Z���J�����ʒu FROM 1 BY 1
001050             UNTIL �Z���J�����ʒu > 10
001060       INVOKE �V�[�g "GET-CELLS"  RETURNING �͈�
001070       INVOKE �͈�   "GET-ITEM"
001080                     USING �Z���s�ʒu �Z���J�����ʒu
001090                     RETURNING �Z��
001100*      INVOKE �Z�� "SET-VALUE"
001110*                    USING PDATA(�Z���J�����ʒu)
001120* Excel2002�ȍ~���g�p����ꍇ�́A��������g���ĉ������B
001130       INVOKE �Z�� "SET-VALUE"
001140                     USING OMITTED PDATA(�Z���J�����ʒu)
001150     END-PERFORM.
001160*======================================================================
001170*  �P�s�ڂ̂P�`�P�O�Ԗڂ̃Z���i�`�P�`�i�P�j��I�����܂��B
001180*======================================================================
001190     MOVE 1 TO �Z���s�ʒu.
001200     MOVE 1 TO �Z���J�����ʒu.      *> �I���J�n�ʒu��
001210     INVOKE �V�[�g "GET-CELLS"  RETURNING �͈�
001220     INVOKE �͈�   "GET-ITEM"   
001230                      USING �Z���s�ʒu �Z���J�����ʒu
001240                      RETURNING �J�n�ʒu.
001250     MOVE 1  TO �Z���s�ʒu.
001260     MOVE 10 TO �Z���J�����ʒu.     *> �I���I���ʒu��
001270     INVOKE �͈�   "GET-ITEM"   
001280                      USING �Z���s�ʒu �Z���J�����ʒu
001290                      RETURNING �I���ʒu.
001300     INVOKE �V�[�g "GET-RANGE" USING �J�n�ʒu �I���ʒu
001310                               RETURNING �I���Z��.
001320*======================================================================
001330*  �`���[�g�R���N�V��������C"GRAPH1"�̃I�u�W�F�N�g��I�����܂��B
001340*======================================================================
001350     MOVE  "GRAPH1" TO �I���V�[�g��.
001360     INVOKE CHARTS OF �u�b�N "GET-ITEM"
001370                        USING     �I���V�[�g��
001380                        RETURNING �ꎞ�I�u�W�F�N�g��.
001390     SET  �`���[�g   TO   �ꎞ�I�u�W�F�N�g��   AS  CHART.
001400*======================================================================
001410*  "GRAPH1"�Ɋ܂܂��O���t�f�[�^�̃R���N�V�����I�u�W�F�N�g���擾��
001420*  �����̃O���t�f�[�^���폜����B
001430*======================================================================
001440     INVOKE �`���[�g "SeriesCollection"
001450                        RETURNING �ꎞ�I�u�W�F�N�g��.
001460     SET  �O���t  TO  �ꎞ�I�u�W�F�N�g��  AS  GRAPHS.
001470     INVOKE �O���t "GET-COUNT"
001480                        RETURNING �O���t�f�[�^��.
001490     MOVE 1 TO �O���t�h�c.
001500     PERFORM VARYING LOOP-COUNT FROM 1 BY 1
001510             UNTIL LOOP-COUNT > �O���t�f�[�^��
001520       INVOKE �O���t "ITEM"
001530                        USING �O���t�h�c
001540                        RETURNING �O���t�f�[�^
001550       INVOKE �O���t�f�[�^ "DELETE"
001560     END-PERFORM.
001570*======================================================================
001580*  �I�������Z���̃f�[�^���O���t�̃R���N�V�����ɒǉ����܂�
001590*======================================================================
001600     MOVE 1 TO �O���t�h�c.
001610     INVOKE �O���t "ADD"  USING �I���Z��.
001620     INVOKE �O���t "ITEM" USING �O���t�h�c
001630                          RETURNING �O���t�f�[�^.
001640*======================================================================
001650*  �쐬����O���t�̎�ނ�I������B
001660*======================================================================
001670     DISPLAY " �쐬����O���t�̎�ނ�I�����Ă��������B".
001680     DISPLAY " �P�F�_�O���t�i�c�j".
001690     DISPLAY " �Q�F�_�O���t�i���j".
001700     DISPLAY " �R�F�܂���O���t".
001710     DISPLAY " �S�F�~�O���t".
001720     DISPLAY " �T�F���[�_�O���t".
001730     DISPLAY " => " WITH NO ADVANCING.
001740     ACCEPT TYPE-SELECT FROM CONSOLE
001750*======================================================================
001760*  �O���t���쐬����B
001770*======================================================================
001780     INVOKE �O���t�f�[�^ "SET-ChartType"
001790                     USING GRAPH-TYPE(TYPE-SELECT).
001800*======================================================================
001810*  �O���t���������B
001820*======================================================================
001830     DISPLAY " �쐬�����O���t���������Ȃ�v�����^�����w�肵�Ă��������B".
001840     DISPLAY " => " WITH NO ADVANCING.
001850     ACCEPT �v�����^�� FROM CONSOLE
001860     IF FUNCTION STORED-CHAR-LENGTH(�v�����^��) NOT = 0 THEN
001870      INVOKE �`���[�g "PrintOut"
001880             USING PAGE-FROM PAGE-TO COPIES COM-FALES �v�����^��
001890     END-IF
001900*======================================================================
001910*  �u�b�N��ۑ�����, �s�v�ȃI�u�W�F�N�g���폜����
001920*======================================================================
001930     INVOKE �u�b�N "SAVE"
001940     INVOKE �u�b�N "CLOSE"
001950     INVOKE �G�N�Z�� "QUIT".
001960     SET �G�N�Z��       TO NULL.
001970     SET �u�b�N         TO NULL.
001980     SET �V�[�g         TO NULL.
001990     SET �I���Z��       TO NULL.
002000     SET �Z��           TO NULL.
002010     SET �J�n�ʒu       TO NULL.
002020     SET �I���ʒu       TO NULL.
002030     SET �`���[�g       TO NULL.
002040     SET �O���t         TO NULL.
002050     SET �O���t�f�[�^   TO NULL.
002060     STOP RUN.
002070 END PROGRAM SAMPLE24.
