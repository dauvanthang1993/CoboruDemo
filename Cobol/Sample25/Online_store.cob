000010*======================================================================
000020* �u�b�n�l�A�g�|COM�T�[�o�@�\�v
000030*     �b�n�a�n�k�T�[�o�̗��
000040*
000050* Copyright 1999-2015 FUJITSU LIMITED
000060*======================================================================
000070*
000080*  �N���X��    �FONLINE_STORE
000090*
000100*  �T�v        �F�N���C�A���g����̃��N�G�X�g���󂯁CDB_ACCESS�N���X��
000110*                ���\�b�h�̌ďo��������s���܂��B
000120*  �p���N���X  �FFJBASE
000130*  �Q�ƃN���X  �FDB_ACCESS, *COM-ARRAY
000140*  ���\�b�h    �F�t�@�N�g�����\�b�h
000150*                 �Ȃ�
000160*              �F�I�u�W�F�N�g���\�b�h
000170*                - �F�؏���
000180*                - �݌Ɋm�F
000190*                - �I�[�_�[�o�^
000200*                - �I�[�_�[���Z
000210*  Copyright 1999-2015 FUJITSU LIMITED
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
000370      CLASS DB_ACCESS
000380      CLASS ARRAY AS "*COM-ARRAY"
000390      .
000400
000410 OBJECT.
000420 DATA DIVISION.
000430 WORKING-STORAGE SECTION.
000440 01 ORDER_NUMBER   PIC X(12).       *> �I�[�_�[�ԍ�
000450 PROCEDURE DIVISION.
000460*======================================================================
000470*  �����\�b�h��  �FIsUser�i�F�؏����j.
000480*      �T�v      �F�o�^���[�U�h�c�^�p�X���[�h�̑g�������m�F���܂��B
000490*                   ���A�l�ƈӖ��͈ȉ��̂Ƃ���ł��B
000500*                     0     = ����I���i�o�^���ƈ�v�j
000510*                     100   = �F�؎��s�i�o�^���ƕs��v�j
000520*                     10000 = �V�X�e���G���[�i�c�a�A�N�Z�X���ɃG���[�����j
000530*                             ���G���[�̏ڍׂ̓C�x���g���O�ɏo�͂��܂��B
000540*      �p�����^  �Fusing    UID PIC X(32)
000550*                           PWD PIC X(32)
000560*                  return   PIC 9(9) COMP-5
000570*======================================================================
000580 METHOD-ID.      �F�؏��� AS "IsUser".
000590 DATA            DIVISION.
000600 WORKING-STORAGE SECTION.
000610 01 OBJ          USAGE OBJECT REFERENCE DB_ACCESS.
000620 01 userID       PIC X(32).
000630 01 userPassword PIC X(32).
000640 LINKAGE         SECTION.
000650 01 UID          PIC X(32).
000660 01 PWD          PIC X(32).
000670 01 RET          PIC S9(6) COMP-5.
000680 PROCEDURE       DIVISION
000690                 USING UID PWD  RETURNING RET.
000700     *> DB_ACCESS�N���X�̃I�u�W�F�N�g�𐶐����܂��B
000710     INVOKE DB_ACCESS "NEW" RETURNING OBJ
000720
000730     *> UID�ɑΉ�����p�X���[�h�����߂܂��B
000740     MOVE UID TO userID
000750     INVOKE OBJ "�ڋq���擾" USING userID userPassword
000760                               RETURNING RET
000770
000780     *> �p�X���[�h�̎擾�ɐ���������A�p�X���[�h����vUID
000790     *> �`�F�b�N���܂��B
000800     IF RET = ����I�� AND
000810        PWD NOT = userPassword THEN
000820         MOVE �F�؎��s TO RET
000830     END-IF
000840
000850     *> DB_ACCESS�N���X�̃I�u�W�F�N�g���폜���܂��B
000860     SET OBJ TO NULL
000870
000880     EXIT METHOD.
000890 END METHOD      �F�؏���.
000900/
000910*======================================================================
000920*  �����\�b�h��  �FStockCheck�i�݌Ɋm�F�j
000930*      �T�v      �F���i�ԍ��ƌ����󂯎���āA�I�[�_�[���\���ǂ���
000940*                  �݌ɂ̃`�F�b�N���s���܂��B
000950*                   ���A�l�ƈӖ��͈ȉ��̂Ƃ���ł��B
000960*                     0     = ����I��
000970*                     1000  = ���i�ԍ����o�^
000980*                     10000 = �V�X�e���G���[�i�c�a�A�N�Z�X���ɃG���[�����j
000990*                             ���G���[�̏ڍׂ̓C�x���g���O�ɏo�͂��܂��B
001000*      �p�����^  �Fusing    L_NUMIC X(10)
001010*                           L_QUANT PIC 9(10)
001020*                  return   PIC 9(9) COMP-5
001030*======================================================================
001040 METHOD-ID.      �I�[�_�[�m�F AS "StockCheck".
001050 DATA            DIVISION.
001060 WORKING-STORAGE SECTION.
001070 01 OBJ          USAGE OBJECT REFERENCE DB_ACCESS.
001080 01 stockProductNumber        pic X(10).  *> ���i�ԍ�
001090 01 stockProductQuantity      pic 9(10).  *> �݌ɐ���
001100*01  productInfo.
001110*   02 productNumber          pic X(12).  *> ���i�ԍ�
001120*   02 productName            pic X(32).  *> ���i��
001130*   02 productModel           pic X(32).  *> ���f��
001140*   02 productPrice           pic 9(09).  *> �P��
001150 LINKAGE         SECTION.
001160 01 L_NUM        PIC X(10).
001170 01 L_QUANT      PIC 9(10).
001180 01 RET          PIC 9(9) COMP-5.
001190 PROCEDURE       DIVISION
001200                 USING  L_NUM L_QUANT
001210                 RETURNING RET.
001220
001230     *> DB_ACCESS�N���X�̃I�u�W�F�N�g�𐶐����܂��B
001240     INVOKE DB_ACCESS "NEW" RETURNING OBJ
001250
001260*    INITIALIZE stockProductNumber stockProductQuantity
001270*    INITIALIZE productInfo
001280     *> stockInfo�����productInfo�ɏ���ݒ肵�܂��B
001290     MOVE L_NUM TO  stockProductNumber  *> productNumber
001300
001310     *> �݌ɖ⍇�킹���\�b�h���Ăяo���ăI�[�_�[���ꂽ���i�̍݌ɂ�
001320     *> �擾���C�������Ɣ�r���ăI�[�_�[�\���ǂ������肵�܂��B
001330     INVOKE OBJ "�݌ɖ⍇�킹" USING stockProductNumber
001340                                     stockProductQuantity
001350                               RETURNING RET
001360     IF RET = ����I�� AND stockProductQuantity < L_QUANT THEN
001370       MOVE �݌ɕs�� TO RET
001380     END-IF
001390
001400     *> DB_ACCESS�N���X�̃I�u�W�F�N�g���폜���܂��B
001410     SET OBJ TO NULL
001420
001430     EXIT METHOD.
001440 END METHOD      �I�[�_�[�m�F.
001450/
001460*======================================================================
001470*  �����\�b�h��  �FOrderRegist�i�I�[�_�[�o�^�j
001480*      �T�v  �F�݌ɐ����X�V���ăI�[�_�[���ׂ�o�^���܂��B
001490*                   ���A�l�ƈӖ��͈ȉ��̂Ƃ���ł��B
001500*                     �I�[�_�[�ԍ� = �o�^����
001510*                     "ERR"        = �o�^���s
001520*                             ���G���[�̏ڍׂ̓C�x���g���O�ɏo�͂��܂��B
001530*      �p�����^  �Fusing    L_DATE PIC X(14)
001540*                           L_USER PIC X(32)
001550*  			  L_NUM  PIC X(10)
001560*				  L_QUANT PIC 9(10)
001570*                  return   PIC X(12)
001580*======================================================================
001590 METHOD-ID.      �I�[�_�[�o�^ AS "OrderRegist".
001600 DATA            DIVISION.
001610 WORKING-STORAGE SECTION.
001620 01 repNUMBER.
001630  02           PIC X(4) VALUE  "ONUM".
001640  02  TIMEDATA PIC 9(8).
001650 01 OBJ          USAGE OBJECT REFERENCE DB_ACCESS.
001660 01 RET          PIC 9(9) COMP-5.
001670 01 orderNumber            PIC X(12).
001680 01 orderUserID            PIC X(32).
001690 01 orderDate              PIC X(14).
001700 01 orderProductNumber     PIC X(10).
001710 01 orderProductQuantity   PIC 9(10).
001720 LINKAGE         SECTION.
001730 01 L_DATE       PIC X(14).
001740 01 L_USER       PIC X(32).
001750 01 L_NUM        PIC X(10).
001760 01 L_QUANT      PIC 9(10).
001770 01 RET_NUMBER   PIC X(12).
001780 PROCEDURE       DIVISION
001790                 USING  L_DATE L_USER L_NUM L_QUANT
001800                 RETURNING RET_NUMBER.
001810*
001820     *> DB_ACCESS�N���X�̃I�u�W�F�N�g�𐶐����܂��B
001830     INVOKE DB_ACCESS "NEW" RETURNING OBJ
001840*
001850     *> �I�[�_�[����ݒ肵�܂��B
001860     MOVE L_DATE  TO orderDate
001870     MOVE L_USER  TO orderUserID
001880     MOVE L_NUM   TO orderProductNumber
001890     MOVE L_QUANT TO orderProductQuantity
001900*
001910     *> �����������ɃI�[�_�[�ԍ����̔Ԃ��܂��B���ɃI�[�_�[�ԍ����̔Ԃ��Ă�
001920     *> �ꍇ�́A���ɍ̔Ԃ����I�[�_�[�ԍ���ݒ肵�܂��B
001930     IF ORDER_NUMBER = SPACE THEN
001940       ACCEPT TIMEDATA FROM TIME
001950       MOVE repNUMBER    TO orderNumber RET_NUMBER ORDER_NUMBER
001960       *> �I�[�_�[�o�^���\�b�h���ďo���܂��B
001970       INVOKE OBJ "�I�[�_�[�o�^" USING orderNumber orderUserID
001980                                       orderDate   orderProductNumber
001990                                       orderProductQuantity
002000                                 RETURNING RET
002010     ELSE
002020       MOVE ORDER_NUMBER TO orderNumber RET_NUMBER
002030     END-IF
002040     *> �݌ɍX�V���\�b�h���ďo���܂��B
002050     INVOKE OBJ "�݌ɍX�V" USING orderNumber orderUserID
002060                                 orderDate   orderProductNumber
002070                                 orderProductQuantity
002080                           RETURNING RET
002090*
002100     *> DB_ACCESS�N���X�̃I�u�W�F�N�g���폜���܂��B
002110     SET OBJ TO NULL
002120
002130     *> �G���[�����o�����ꍇ�A�I�[�_�[�ԍ���ERR��ݒ肵���܂��B
002140     IF RET NOT = ����I�� THEN
002150       MOVE "ERR" TO RET_NUMBER
002160     END-IF
002170
002180     EXIT METHOD.
002190 END METHOD     �I�[�_�[�o�^.
002200/
002210*======================================================================
002220*  �����\�b�h��  �FOrderSum�i�I�[�_�[���Z�j
002230*      �T�v      �F�z��v�f�Ɋi�[���ꂽ�I�[�_�[��񂩂�A���v���v�Z
002240*                  ���܂��B
002250*                   ���A�l�ƈӖ��͈ȉ��̂Ƃ���ł��B
002260*                     0     = ����I���i�o�^���ƈ�v�j
002270*      �p�����^  �Fusing    ARRAYOBJ OBJECT REFERENCE ARRAY
002280*                           ED_SUM PIC Z(9)9
002290*                  return   PIC 9(3) PACKED-DECIMAL
002300*======================================================================
002310 METHOD-ID.      �I�[�_�[���Z AS "OrderSum".
002320 DATA            DIVISION.
002330 WORKING-STORAGE SECTION.
002340 01 billSUM      PIC 9(10).
002350 01 BILL         PIC S9(9) COMP-5.
002360 01 ARRAYSIZE    PIC S9(9) COMP-5.
002370 01 DIM          PIC S9(9) COMP-5 VALUE 1.
002380 01 CNT          PIC S9(9) COMP-5.
002390 LINKAGE         SECTION.
002400 01 ARRAYOBJ     OBJECT REFERENCE ARRAY.
002410 01 ED_SUM       PIC Z(9)9.
002420 01 RET          PIC 9(3) PACKED-DECIMAL.
002430 PROCEDURE       DIVISION
002440                 USING ARRAYOBJ
002450                       ED_SUM
002460                 RETURNING RET.
002470     MOVE ����I�� TO RET
002480     MOVE 0        TO billSUM
002490
002500     INVOKE ARRAYOBJ "GET-SIZE" USING DIM
002510                                RETURNING ARRAYSIZE
002520     PERFORM TEST BEFORE VARYING CNT FROM 1 BY 1
002530                  UNTIL CNT > ARRAYSIZE
002540         INVOKE ARRAYOBJ "GET-DATA" USING CNT
002550                                    RETURNING BILL
002560         COMPUTE billSUM     = billSUM  +  BILL
002570     END-PERFORM
002580     MOVE billSUM     TO ED_SUM
002590
002600     *> �I�[�_�[�ԍ������������܂��B
002610     MOVE SPACE TO ORDER_NUMBER
002620
002630     EXIT METHOD.
002640 END METHOD      �I�[�_�[���Z.
002650/
002660*======================================================================
002670*  �����\�b�h��  �FINIT
002680*      �T�v      �F���������\�b�h
002690*      �p�����^  �F�Ȃ�
002700*      ���l      �FFJBASE��INIT���\�b�h��OVERRIDE����
002710*======================================================================
002720 METHOD-ID.      INIT OVERRIDE.
002730 DATA            DIVISION.
002740 WORKING-STORAGE SECTION.
002750 PROCEDURE       DIVISION.
002760      *> FJBASE�N���X��INIT���Ăяo��
002770     INVOKE SUPER "INIT"
002780     *> ORDER_NUMBER������������
002790     MOVE SPACE TO ORDER_NUMBER
002800 END METHOD      INIT.
002810
002820 END OBJECT.
002830 END CLASS      ONLINE_STORE.
002840
