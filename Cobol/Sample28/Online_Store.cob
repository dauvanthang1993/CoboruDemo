000010*======================================================================
000020* �u�b�n�l�A�g�|COM�T�[�o�@�\�v
000030*     �l�s�r�z���̂b�n�a�n�k�T�[�o�̗��
000040*
000050*======================================================================
000060*
000070*  �N���X��    �FONLINE_STORE
000080*
000090*  �T�v        �F�N���C�A���g����̃��N�G�X�g���󂯁CDB_ACCESS�N���X��
000100*                ���\�b�h�̌ďo��������s���܂��B
000110*  �p���N���X  �FFJBASE
000120*  �Q�ƃN���X  �F*COM�A*COM-ARRAY�A*COM-EXCEPTION
000130*  ���\�b�h    �F�t�@�N�g�����\�b�h
000140*                 �Ȃ�
000150*              �F�I�u�W�F�N�g���\�b�h
000160*                - �F�؏���
000170*                - �I�[�_�[�쐬
000180*                - �I�[�_�[�o�^
000190*                - �I�[�_�[���Z
000200*
000210* Copyright 1999-2015 FUJITSU LIMITED
000220*======================================================================
000230 IDENTIFICATION DIVISION.
000240 CLASS-ID.      ONLINE_STORE INHERITS FJBASE.
000250 ENVIRONMENT DIVISION.
000260 CONFIGURATION SECTION.
000270 SPECIAL-NAMES.
000280      SYMBOLIC CONSTANT
000290          ����I��       0
000300          �F�؎��s       100
000310          �݌ɕs��       200
000320          ���i�ԍ����o�^ 1000
000330          �V�X�e���G���[ 10000
000340          .
000350 REPOSITORY.
000360      CLASS FJBASE
000370      CLASS DB_ACCESS AS "*COM"
000380      CLASS ARRAY AS "*COM-ARRAY"
000390      CLASS COM-EXP AS "*COM-EXCEPTION"
000400      CLASS DB_USERINF AS "*COM"
000410      .
000420
000430 OBJECT.
000440 DATA DIVISION.
000450 WORKING-STORAGE SECTION.
000460 01 OBJ          USAGE OBJECT REFERENCE DB_USERINF.
000470 01 EXOBJ        USAGE OBJECT REFERENCE COM-EXP.
000480
000490 01 ORDER_NUMBER   PIC X(12).       *> �I�[�_�[�ԍ�
000500
000510 01 APPNAME        PIC X(30) VALUE "STORESV2.DB_ACCESS".
000520 PROCEDURE DIVISION.
000530*======================================================================
000540*  �����\�b�h��  �FIsUser�i�F�؏����j.
000550*      �T�v      �F�o�^���[�U�h�c�^�p�X���[�h�̑g�������m�F���܂��B
000560*                   ���A�l�ƈӖ��͈ȉ��̂Ƃ���ł��B
000570*                     0     = ����I���i�o�^���ƈ�v�j
000580*                     100   = �F�؎��s�i�o�^���ƕs��v�j
000590*                     10000 = �V�X�e���G���[�i�c�a�A�N�Z�X���ɃG���[�����j
000600*                             ���G���[�̏ڍׂ̓C�x���g���O�ɏo�͂��܂��B
000610*      �p�����^  �Fusing    UID PIC X(32)
000620*                           PWD PIC X(32)
000630*                  return   PIC 9(9) COMP-5
000640*======================================================================
000650 METHOD-ID.      �F�؏��� AS "IsUser".
000660 DATA            DIVISION.
000670 WORKING-STORAGE SECTION.
000680 01 OBJ          USAGE OBJECT REFERENCE DB_ACCESS.
000690 01 userID       PIC X(32).
000700 01 userPassword PIC X(32).
000710 LINKAGE         SECTION.
000720 01 UID          PIC X(32).
000730 01 PWD          PIC X(32).
000740 01 RET          PIC S9(6) COMP-5.
000750 PROCEDURE       DIVISION
000760                 USING UID PWD  RETURNING RET.
000770*
000780 DECLARATIVES.
000790 DBexception SECTION.
000800     USE AFTER EXCEPTION COM-EXP.
000810         SET EXOBJ TO EXCEPTION-OBJECT
000820         SET OBJ TO NULL
000830         EXIT METHOD. 
000840 END DECLARATIVES.
000850     *> DB_ACCESS�N���X�̃I�u�W�F�N�g�𐶐����܂��B
000860     INVOKE DB_ACCESS "CREATE-OBJECT" USING APPNAME
000870                                      RETURNING OBJ
000880     *> UID�ɑΉ�����p�X���[�h�����߂܂��B
000890     MOVE UID TO userID
000900     INVOKE OBJ "�ڋq���擾" USING userID userPassword
000910                               RETURNING RET
000920
000930     *> �p�X���[�h�̎擾�ɐ���������A�p�X���[�h����vUID
000940     *> �`�F�b�N���܂��B
000950     IF RET = ����I�� AND
000960        PWD NOT = userPassword THEN
000970         MOVE �F�؎��s TO RET
000980     END-IF
000990
001000     *> DB_ACCESS�N���X�̃I�u�W�F�N�g���폜���܂��B
001010     SET OBJ TO NULL
001020
001030     EXIT METHOD.
001040 END METHOD      �F�؏���.
001050/
001060*======================================================================
001070*  �����\�b�h��  �FStockCheck�i�݌Ɋm�F�j
001080*      �T�v      �F���i�ԍ��ƌ����󂯎���āA�I�[�_�[���\���ǂ���
001090*                  �݌ɂ̃`�F�b�N���s���܂��B
001100*                   ���A�l�ƈӖ��͈ȉ��̂Ƃ���ł��B
001110*                     0     = ����I��
001120*                     1000  = ���i�ԍ����o�^
001130*                     10000 = �V�X�e���G���[�i�c�a�A�N�Z�X���ɃG���[�����j
001140*                             ���G���[�̏ڍׂ̓C�x���g���O�ɏo�͂��܂��B
001150*      �p�����^  �Fusing    L_NUMIC X(10)
001160*                           L_QUANT PIC 9(10)
001170*                  return   PIC 9(9) COMP-5
001180*======================================================================
001190 METHOD-ID.      �I�[�_�[�m�F AS "StockCheck".
001200 DATA            DIVISION.
001210 WORKING-STORAGE SECTION.
001220 01 OBJ          USAGE OBJECT REFERENCE DB_ACCESS.
001230 01 stockProductNumber        PIC X(10).  *> ���i�ԍ�
001240 01 stockProductQuantity      PIC 9(10).  *> �݌ɐ���
001250 01  productInfo.
001260    02 productNumber          PIC X(12).  *> ���i�ԍ�
001270    02 productName            PIC X(32).  *> ���i��
001280    02 productModel           PIC X(32).  *> ���f��
001290    02 productPrice           PIC 9(09).  *> �P��
001300 LINKAGE         SECTION.
001310 01 L_NUM        PIC X(10).
001320 01 L_QUANT      PIC 9(10).
001330 01 RET          PIC 9(9) COMP-5.
001340 PROCEDURE       DIVISION
001350                 USING  L_NUM L_QUANT
001360                 RETURNING RET.
001370*
001380 DECLARATIVES.
001390 DBexception SECTION.
001400     USE AFTER EXCEPTION COM-EXP.
001410         SET EXOBJ TO EXCEPTION-OBJECT
001420         SET OBJ TO NULL
001430         EXIT METHOD. 
001440 END DECLARATIVES.
001450*
001460     *> DB_ACCESS�N���X�̃I�u�W�F�N�g�𐶐����܂��B
001470     INVOKE DB_ACCESS "CREATE-OBJECT" USING APPNAME
001480                                      RETURNING OBJ
001490
001500     INITIALIZE stockProductNumber stockProductQuantity
001510     INITIALIZE productInfo
001520     *> stockInfo�����productInfo�ɏ���ݒ肵�܂��B
001530     MOVE L_NUM TO  stockProductNumber  productNumber
001540
001550     *> �݌ɖ⍇�킹���\�b�h���Ăяo���ăI�[�_�[���ꂽ���i�̍݌ɂ�
001560     *> �擾���C�������Ɣ�r���ăI�[�_�[�\���ǂ������肵�܂��B
001570     INVOKE OBJ "�݌ɖ⍇�킹" USING stockProductNumber stockProductQuantity RETURNING RET
001580     IF RET = ����I�� AND stockProductQuantity < L_QUANT THEN
001590       MOVE �݌ɕs�� TO RET
001600     END-IF
001610
001620     *> DB_ACCESS�N���X�̃I�u�W�F�N�g���폜���܂��B
001630     SET OBJ TO NULL
001640
001650     EXIT METHOD.
001660 END METHOD      �I�[�_�[�m�F.
001670/
001680*======================================================================
001690*  �����\�b�h��  �FOrderRegist�i�I�[�_�[�o�^�j
001700*      �T�v      �F�o�^���[�U�h�c�^�p�X���[�h�̑g�������m�F���܂��B
001710*                   ���A�l�ƈӖ��͈ȉ��̂Ƃ���ł��B
001720*                     0     = ����I���i�o�^���ƈ�v�j
001730*                     100   = �F�؎��s�i�o�^���ƕs��v�j
001740*                     10000 = �V�X�e���G���[�i�c�a�A�N�Z�X���ɃG���[�����j
001750*                             ���G���[�̏ڍׂ̓C�x���g���O�ɏo�͂��܂��B
001760*      �p�����^  �Fusing    UID PIC X(32)
001770*                           PWD PIC X(32)
001780*                  return   PIC 9(9) COMP-5
001790*======================================================================
001800 METHOD-ID.      �I�[�_�[�o�^ AS "OrderRegist".
001810 DATA            DIVISION.
001820 WORKING-STORAGE SECTION.
001830 01 repNUMBER.
001840  02           PIC X(4) VALUE  "ONUM".
001850  02  TIMEDATA PIC 9(8).
001860 01 OBJ          USAGE OBJECT REFERENCE DB_ACCESS.
001870 01 RET          PIC 9(9) COMP-5.
001880 01 orderNumber            PIC X(12).
001890 01 orderUserID            PIC X(32).
001900 01 orderDate              PIC X(14).
001910 01 orderProductNumber     PIC X(10).
001920 01 orderProductQuantity   PIC 9(10).
001930 LINKAGE         SECTION.
001940 01 L_DATE       PIC X(14).
001950 01 L_USER       PIC X(32).
001960 01 L_NUM        PIC X(10).
001970 01 L_QUANT      PIC 9(10).
001980 01 RET_NUMBER   PIC X(12).
001990 PROCEDURE       DIVISION
002000                 USING  L_DATE L_USER L_NUM L_QUANT
002010                 RETURNING RET_NUMBER.
002020*
002030 DECLARATIVES.
002040 DBexception SECTION.
002050     USE AFTER EXCEPTION COM-EXP.
002060         SET EXOBJ TO EXCEPTION-OBJECT
002070         SET OBJ TO NULL
002080         EXIT METHOD. 
002090 END DECLARATIVES.
002100*
002110     *> DB_ACCESS�N���X�̃I�u�W�F�N�g�𐶐����܂��B
002120     INVOKE DB_ACCESS "CREATE-OBJECT" USING APPNAME
002130                                      RETURNING OBJ
002140*
002150     *> �I�[�_�[����ݒ肵�܂��B
002160     INITIALIZE orderNumber orderUserID orderDate orderProductNumber orderProductQuantity
002170     MOVE L_DATE  TO orderDate
002180     MOVE L_USER  TO orderUserID
002190     MOVE L_NUM   TO orderProductNumber
002200     MOVE L_QUANT TO orderProductQuantity
002210*
002220     *> �����������ɃI�[�_�[�ԍ����̔Ԃ��܂��B���ɃI�[�_�[�ԍ����̔Ԃ��Ă�
002230     *> �ꍇ�́A���ɍ̔Ԃ����I�[�_�[�ԍ���ݒ肵�܂��B
002240     IF ORDER_NUMBER = SPACE THEN
002250       ACCEPT TIMEDATA FROM TIME
002260       MOVE repNUMBER    TO orderNumber RET_NUMBER ORDER_NUMBER
002270       *> �I�[�_�[�o�^���\�b�h���ďo���܂��B
002280       INVOKE OBJ "�I�[�_�[�o�^" USING orderNumber orderUserID orderDate orderProductNumber orderProductQuantity
002290                                 RETURNING RET
002300     ELSE
002310       MOVE ORDER_NUMBER TO orderNumber RET_NUMBER
002320     END-IF
002330     *> �݌ɍX�V���\�b�h���ďo���܂��B
002340     INVOKE OBJ "�݌ɍX�V" USING orderNumber orderUserID orderDate orderProductNumber orderProductQuantity
002350                           RETURNING RET
002360*
002370     *> DB_ACCESS�N���X�̃I�u�W�F�N�g���폜���܂��B
002380     SET OBJ TO NULL
002390
002400     *> �G���[�����o�����ꍇ�A�I�[�_�[�ԍ���ERR��ݒ肵���܂��B
002410     IF RET NOT = ����I�� THEN
002420       MOVE "ERR" TO RET_NUMBER
002430     END-IF
002440
002450     EXIT METHOD.
002460 END METHOD     �I�[�_�[�o�^.
002470/
002480*======================================================================
002490*  �����\�b�h��  �FOrderSum�i�I�[�_�[���Z�j
002500*      �T�v      �F�z��v�f�Ɋi�[���ꂽ�I�[�_�[��񂩂�A���v���v�Z
002510*                  ���܂��B
002520*                   ���A�l�ƈӖ��͈ȉ��̂Ƃ���ł��B
002530*                     0     = ����I���i�o�^���ƈ�v�j
002540*      �p�����^  �Fusing    ARRAYOBJ OBJECT REFERENCE ARRAY
002550*                           ED_SUM PIC Z(9)9
002560*                  return   PIC 9(3) PACKED-DECIMAL
002570*======================================================================
002580 METHOD-ID.      �I�[�_�[���Z AS "OrderSum".
002590 DATA            DIVISION.
002600 WORKING-STORAGE SECTION.
002610 01 billSUM      PIC 9(10).
002620 01 BILL         PIC S9(9) COMP-5.
002630 01 ARRAYSIZE    PIC S9(9) COMP-5.
002640 01 DIM          PIC S9(9) COMP-5 VALUE 1.
002650 01 CNT          PIC S9(9) COMP-5.
002660 LINKAGE         SECTION.
002670 01 ARRAYOBJ     OBJECT REFERENCE ARRAY.
002680 01 ED_SUM       PIC Z(9)9.
002690 01 RET          PIC 9(3) PACKED-DECIMAL.
002700 PROCEDURE       DIVISION
002710                 USING ARRAYOBJ ED_SUM RETURNING RET.
002720*
002730 DECLARATIVES.
002740 DBexception SECTION.
002750     USE AFTER EXCEPTION COM-EXP.
002760         SET EXOBJ TO EXCEPTION-OBJECT
002770         SET OBJ TO NULL
002780         EXIT METHOD. 
002790 END DECLARATIVES.
002800*
002810     MOVE ����I�� TO RET
002820     MOVE 0        TO billSUM
002830
002840     INVOKE ARRAYOBJ "GET-SIZE" USING DIM RETURNING ARRAYSIZE
002850     PERFORM TEST BEFORE VARYING CNT FROM 1 BY 1
002860                  UNTIL CNT > ARRAYSIZE
002870         INVOKE ARRAYOBJ "GET-DATA" USING CNT RETURNING BILL
002880         COMPUTE billSUM     = billSUM  +  BILL
002890     END-PERFORM
002900     MOVE billSUM     TO ED_SUM
002910
002920     *> �I�[�_�[�ԍ������������܂��B
002930     MOVE SPACE TO ORDER_NUMBER
002940
002950     EXIT METHOD.
002960 END METHOD      �I�[�_�[���Z.
002970/
002980*======================================================================
002990*  �����\�b�h��  �FINIT
003000*      �T�v      �F���������\�b�h
003010*      �p�����^  �F�Ȃ�
003020*      ���l      �FFJBASE��INIT���\�b�h��OVERRIDE����
003030*======================================================================
003040 METHOD-ID.      INIT OVERRIDE.
003050 DATA            DIVISION.
003060 WORKING-STORAGE SECTION.
003070 PROCEDURE       DIVISION.
003080     *> FJBASE�N���X��INIT���Ăяo��
003090     INVOKE SUPER "INIT"
003100     *> ORDER_NUMBER������������
003110     MOVE SPACE TO ORDER_NUMBER
003120 END METHOD      INIT.
003130
003140 END OBJECT.
003150 END CLASS      ONLINE_STORE.
003160
