000010*=================================================================
000020* �u�Z�V�����Ǘ��@�\���g�p����Web�A�v���P�[�V�����v
000030*     �Z�V�����Ǘ��@�\���g�p���āA����̃N���C�A���g���畡�����
000040*   ���N�G�X�g�ɂ܂��������Ɩ����s���A�v���P�[�V�������\�z���܂��B
000050*
000060*=================================================================
000070*
000080*  �t�@�C�����F SESSOBJ.COB
000090*  ����T�v  �F �Z�V�����Ŏg�p����f�[�^�y�ё��삷�郁�\�b�h
000100*
000110* Copyright 2000-2015 FUJITSU LIMITED
000120*=================================================================
000130 IDENTIFICATION DIVISION.
000140  CLASS-ID �Z�V�����I�u�W�F�N�g INHERITS COBW3-SESSION-ADAPTER.
000150 ENVIRONMENT DIVISION.
000160  CONFIGURATION SECTION.
000170   REPOSITORY.
000180     CLASS COBW3-SESSION-ADAPTER.
000190 IDENTIFICATION DIVISION.
000200  FACTORY.
000210 ENVIRONMENT DIVISION.
000220 DATA DIVISION.
000230 WORKING-STORAGE SECTION.
000240 PROCEDURE DIVISION.
000250 END FACTORY.
000260*
000270 ID DIVISION.
000280  OBJECT.
000290 ENVIRONMENT DIVISION.
000300  INPUT-OUTPUT SECTION.
000310   *> �t�@�C����`
000320   FILE-CONTROL.
000330     SELECT �a���t�@�C�� ASSIGN TO SYS007
000340      ORGANIZATION IS INDEXED
000350      ACCESS MODE  IS RANDOM
000360      RECORD KEY   IS ���[�U�h�c
000370      LOCK MODE    IS AUTOMATIC
000380      FILE STATUS  IS �a���t�@�C�����o�͏��.
000390 DATA DIVISION.
000400  FILE SECTION.
000410   FD �a���t�@�C��.
000420    01 �a���f�[�^.
000430     02 ���[�U�h�c                PIC X(32).
000440     02 �c��                      PIC 9(16).
000450  WORKING-STORAGE SECTION.
000460  01 �a���t�@�C�����o�͏��       PIC X(02).
000470  COPY SESSDATA.
000480 PROCEDURE DIVISION.
000490*
000500*=================================================================
000510*  SWEEP-SESSION���\�b�h
000520*  �Z�V�����^�C���A�E�g���ɌĂяo����܂��B
000530*=================================================================
000540 IDENTIFICATION DIVISION.
000550  METHOD-ID. SWEEP-SESSION OVERRIDE.
000560 DATA DIVISION.
000570 PROCEDURE DIVISION.
000580     CLOSE �a���t�@�C��.
000590     EXIT METHOD.
000600 END METHOD SWEEP-SESSION.
000610*
000620*=================================================================
000630*  �������������\�b�h
000640*=================================================================
000650 IDENTIFICATION DIVISION.
000660  METHOD-ID. ����������.
000670 DATA DIVISION.
000680  LINKAGE SECTION.
000690   01 USERID   PIC X(32).
000700   01 BALANCE  PIC 9(16).
000710   01 ���A�l   PIC 9(09) COMP-5.
000720 PROCEDURE DIVISION USING USERID BALANCE RETURNING ���A�l.
000730     MOVE 0 TO ���A�l.
000740     MOVE USERID TO S-USERID.
000750     *> �a���t�@�C�����I�[�v������
000760     OPEN I-O �a���t�@�C��.
000770     *> �I�[�v���ɐ������������ׂ�
000780     IF �a���t�@�C�����o�͏�� NOT = "00"
000790       MOVE 1 TO ���A�l
000800       EXIT METHOD
000810     END-IF.
000820*
000830      MOVE USERID TO ���[�U�h�c.
000840      READ �a���t�@�C�� INVALID KEY
000850        MOVE 2 TO ���A�l
000860        CLOSE �a���t�@�C��
000870        EXIT METHOD
000880      END-READ.
000890      *> ���R�[�h�����b�N����Ă���ꍇ
000900      IF �a���t�@�C�����o�͏��  = "99"
000910        MOVE 3 TO ���A�l
000920        CLOSE �a���t�@�C��
000930        EXIT METHOD
000940      END-IF.
000950
000960      MOVE �c�� TO S-OLDBALANCE BALANCE.
000970      EXIT METHOD.
000980 END METHOD ����������.
000990*
001000*=================================================================
001010*  �I���������\�b�h
001020*=================================================================
001030 IDENTIFICATION DIVISION.
001040  METHOD-ID. �I������.
001050 DATA DIVISION.
001060 PROCEDURE DIVISION.
001070     CLOSE �a���t�@�C��.
001080     EXIT METHOD.
001090 END METHOD �I������.
001100*
001110*=================================================================
001120*  �Z�V�����f�[�^�擾
001130*=================================================================
001140 IDENTIFICATION DIVISION.
001150  METHOD-ID. �Z�V�����f�[�^�擾.
001160 DATA DIVISION.
001170  LINKAGE SECTION.
001180   COPY GETDATA.
001190 PROCEDURE DIVISION USING GETDATA.
001200     MOVE S-USERID TO G-USERID.
001210     MOVE S-OLDBALANCE TO G-OLDBALANCE.
001220     MOVE S-TRADE TO G-TRADE.
001230     MOVE S-MONEY TO G-MONEY.
001240     MOVE S-NEWBALANCE TO G-NEWBALANCE.
001250     EXIT METHOD.
001260 END METHOD �Z�V�����f�[�^�擾.
001270*
001280*=================================================================
001290*  �a�����\�b�h
001300*=================================================================
001310 IDENTIFICATION DIVISION.
001320  METHOD-ID. �a��.
001330 DATA DIVISION.
001340  LINKAGE SECTION.
001350 01 I-MONEY                       PIC 9(16).
001360 01 O-BALANCE                     PIC 9(16).
001370 01 ���A�l                        PIC 9(09) COMP-5.
001380 PROCEDURE DIVISION USING I-MONEY O-BALANCE RETURNING ���A�l.
001390     MOVE 0 TO ���A�l.
001400     *> �����ӂꂷ�邩���ׂ�
001410     IF I-MONEY + S-OLDBALANCE >= 10000000000000000 THEN
001420       MOVE 1 TO ���A�l
001430       EXIT METHOD
001440     END-IF.
001450     *> �Z�V�����f�[�^�o�^
001460     SET S-DEPOSIT TO TRUE.
001470     MOVE I-MONEY TO S-MONEY.
001480     COMPUTE S-NEWBALANCE = S-OLDBALANCE + S-MONEY.
001490     MOVE S-NEWBALANCE TO O-BALANCE.
001500     EXIT METHOD.
001510 END METHOD �a��.
001520*
001530*=================================================================
001540*  ���߃��\�b�h
001550*=================================================================
001560 IDENTIFICATION DIVISION.
001570  METHOD-ID. ����.
001580 DATA DIVISION.
001590  LINKAGE SECTION.
001600 01 I-MONEY                       PIC 9(16).
001610 01 O-BALANCE                     PIC 9(16).
001620 01 ���A�l                        PIC 9(09) COMP-5.
001630 PROCEDURE DIVISION USING I-MONEY O-BALANCE RETURNING ���A�l.
001640     MOVE 0 TO ���A�l.
001650     *> �}�C�i�X�ɂȂ邩���ׂ�
001660     IF S-OLDBALANCE - I-MONEY < 0 THEN
001670       MOVE 1 TO ���A�l
001680       EXIT METHOD
001690     END-IF.
001700     *> �Z�V�����f�[�^�o�^
001710     SET S-REPAYMENT TO TRUE.
001720     MOVE I-MONEY TO S-MONEY.
001730     COMPUTE S-NEWBALANCE = S-OLDBALANCE - S-MONEY.
001740     MOVE S-NEWBALANCE TO O-BALANCE.
001750     EXIT METHOD.
001760 END METHOD ����.
001770*
001780*=================================================================
001790*  �X�V���\�b�h
001800*=================================================================
001810 IDENTIFICATION DIVISION.
001820  METHOD-ID. �X�V.
001830 DATA DIVISION.
001840  LINKAGE SECTION.
001850   01 ���A�l   PIC 9(09) COMP-5.
001860 PROCEDURE DIVISION RETURNING ���A�l.
001870     MOVE 0 TO ���A�l.
001880     MOVE S-USERID TO ���[�U�h�c.
001890     MOVE S-NEWBALANCE TO �c��.
001900     REWRITE �a���f�[�^.
001910     *> �o�^�ɐ������������ׂ�
001920     IF �a���t�@�C�����o�͏�� NOT = "00"
001930       MOVE 1 TO ���A�l
001940     END-IF.
001950     EXIT METHOD.
001960 END METHOD �X�V.
001970*
001980 END OBJECT.
001990 END CLASS �Z�V�����I�u�W�F�N�g.
