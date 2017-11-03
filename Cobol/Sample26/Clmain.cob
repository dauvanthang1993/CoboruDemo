000010*======================================================================
000020* �u�b�n�l�A�g�|COM�N���C�A���g�@�\�v
000030*     �b�n�a�n�k�T�[�o��COBOL�N���C�A���g����̎g�p
000040*
000050* Copyright 1999-2015 FUJITSU LIMITED
000060*======================================================================
000070 IDENTIFICATION DIVISION.
000080 PROGRAM-ID.    CLMAIN.
000090 ENVIRONMENT DIVISION.
000100 CONFIGURATION SECTION.
000110 SPECIAL-NAMES.
000120      SYMBOLIC CONSTANT
000130          ����I��       0
000140          �F�؎��s       100
000150          �݌ɕs��       200
000160          ���i�ԍ����o�^ 1000
000170          �V�X�e���G���[ 10000
000180          .
000190 REPOSITORY.
000200      CLASS ONLINE_STORE AS "*COM:STORESV1:ONLINE_STORE"
000210      CLASS ARRAY AS "*COM-ARRAY"
000220      .
000230
000240 DATA DIVISION.
000250 WORKING-STORAGE SECTION.
000260 01 appname   pic x(30) value "STORESV1.ONLINE_STORE".
000270 01 OLS_SERVICE   OBJECT REFERENCE ONLINE_STORE.
000280 01 ARRAYOBJ      OBJECT REFERENCE ARRAY.
000290 01 ProcCD        PIC 9.
000300  88 ���j���[�\�� VALUE 0.
000310  88 �J�^���O�\�� VALUE 1.
000320  88 �����I��     VALUE 2.
000330  88 �I�[�_�[�m�F VALUE 3.
000340  88 �I�[�_�[�T�� VALUE 4.
000350 01 Agree         PIC X.
000360  88 �������F     VALUE "Y" "y".
000370  88 ������     VALUE "N" "n".
000380 01 Quantity     PIC 9(4) COMP-5.
000390 01 IDXCNT       PIC 9(4) COMP-5.
000400 01 CertifyRet   pic s9(6) comp-5.
000410 01 ReferRet     pic 9(3) comp-3.
000420 01 RET PIC 9(9) COMP-5.
000430 01 G-DUMMY      PIC X.
000440 01 WKreceiptNumber  PIC X(12).
000450 01 ���ݓ��t����.
000460    02 YMD-HMS.
000470       03 currentYear             pic X(04).
000480       03 currentMonth            pic X(02).
000490       03 currentDay              pic X(02).
000500       03 filler                  pic X(06).
000510    02 filler                     pic X(07).
000520 01 DataForArray.
000530  02 ELM-TYPE    PIC S9(9) COMP-5 VALUE 3.
000540  02 DIM         PIC S9(9) COMP-5 VALUE 1.
000550  02 ELM-NO      PIC S9(9) COMP-5.
000560      COPY Product-Table.
000570      COPY OrderSheet-Info.
000580 SCREEN    SECTION.
000590      COPY screens.
000600 PROCEDURE DIVISION.
000610 ProgramSTART.
000620     MOVE ����I�� TO RET
000630     INVOKE ONLINE_STORE "NEW" RETURNING OLS_SERVICE
000640
000650*======================================================================
000660*  ����F��
000670*======================================================================
000680     DISPLAY ����F�؉��
000690     ACCEPT  ����F�؉��
000700
000710     INVOKE OLS_SERVICE "IsUser"
000720                           USING orderer ordererPassword
000730                           RETURNING CertifyRet
000740     IF CertifyRet = ����I�� THEN
000750       SET ���j���[�\�� TO TRUE
000760     ELSE
000770       MOVE CertifyRet TO RET
000780       SET �����I��    TO TRUE
000790     END-IF
000800*======================================================================
000810*  �ǂ��炩�̌�����ProcCD�������I�����̂ƂȂ�܂ŁA�������J��Ԃ��B
000820*   - ���j���[�ŏI����I��
000830*   - �G���[������
000840*======================================================================
000850     PERFORM TEST BEFORE
000860              UNTIL �����I��
000870       EVALUATE TRUE
000880*======================================================================
000890*  ���j���[�\��
000900*======================================================================
000910       WHEN ���j���[�\��
000920         DISPLAY ���j���[���
000930         ACCEPT  ���j���[���
000940*======================================================================
000950*  �J�^���O�i������ʁj�\��
000960*======================================================================
000970       WHEN �J�^���O�\��
000980         MOVE 0 TO Quantity
000990         DISPLAY �J�^���O���
001000         ACCEPT  �J�^���O���
001010         PERFORM �I�[�_�[�쐬
001020*======================================================================
001030*  �I�[�_�[�m�F��ʕ\��
001040*======================================================================
001050       WHEN �I�[�_�[�m�F
001060         DISPLAY �I�[�_�[�m�F���
001070         ACCEPT  �I�[�_�[�m�F���
001080         PERFORM �I�[�_�[����
001090*======================================================================
001100*  �I�[�_�[�T���i�������ʁC���z�̍��v���܂ށj��\������D
001110*======================================================================
001120       WHEN �I�[�_�[�T��
001130         DISPLAY �I�[�_�[�T�����
001140         ACCEPT  �I�[�_�[�T�����
001150         SET ���j���[�\�� TO TRUE
001160       END-EVALUATE
001170     END-PERFORM.
001180*======================================================================
001190*  �G���[����
001200*    RET�̒l�ɉ����āA�K�؂ȃG���[��ʂ�\������
001210*======================================================================
001220 ERR-PROC.
001230*  �G���[�l�ɉ�������ʂ��o�͂���D
001240     EVALUATE RET
001250     WHEN �F�؎��s
001260       DISPLAY �F�؃G���[���
001270     WHEN �݌ɕs��
001280       DISPLAY �݌ɃG���[���
001290     WHEN ���i�ԍ����o�^
001300       DISPLAY �o�^�G���[���
001310     WHEN NOT ����I��
001320       DISPLAY ���̑��G���[���
001330     END-EVALUATE
001340     GO TO ProgramEND.
001350*======================================================================
001360*  �I�����C���X�g�A�̃I�u�W�F�N�g��j�����ďI������
001370*======================================================================
001380 ProgramEND.
001390     SET OLS_SERVICE TO NULL.
001400     SET ARRAYOBJ    TO NULL
001410     EXIT PROGRAM.
001420
001430*======================================================================
001440*    ���͂��ꂽ�I�[�_�[���ʂ��m�F���A����������΍݌ɂ��m�F�������
001450*  �I�[�_�[���쐬����B
001460*======================================================================
001470 �I�[�_�[�쐬.
001480     MOVE SPACE TO receiptRec
001490     PERFORM TEST BEFORE VARYING IDXCNT FROM 1 BY 1
001500                 UNTIL IDXCNT > 20
001510       IF P-QUANT(IDXCNT) NOT = 0 THEN
001520         INVOKE OLS_SERVICE "StockCheck"
001530              USING P-NUM(IDXCNT) R-QUANT(IDXCNT)  RETURNING RET
001540         IF RET NOT = ����I�� THEN
001550            SET �����I�� TO TRUE
001560            EXIT PERFORM
001570         ELSE
001580            *> �݌ɂ�����Ȃ�I�[�_�[�����쐬����B
001590           ADD 1 TO  Quantity
001600           MOVE P-NUM (IDXCNT)  TO  R-NUM (Quantity)
001610           MOVE P-Name(IDXCNT)  TO  R-Name(Quantity)
001620           MOVE P-Model(IDXCNT) TO  R-Model(Quantity)
001630           MOVE P-Price(IDXCNT) TO  R-Price(Quantity)
001640           MOVE P-QUANT(IDXCNT) TO  R-QUANT(Quantity)
001650           COMPUTE SUM-Price(Quantity)
001660                 =  R-Price(Quantity) * R-QUANT(Quantity)
001670         END-IF
001680       END-IF
001690     END-PERFORM
001700     MOVE Quantity    TO receiptQuantity
001710     SET �I�[�_�[�m�F TO TRUE.
001720*======================================================================
001730*    �I�[�_�[�����F���ꂽ�Ȃ�A�����������s���B
001740*  �I�[�_�[���쐬����B
001750*======================================================================
001760 �I�[�_�[����.
001770     IF �������F THEN
001780       MOVE ZERO TO ALLquantity
001790       MOVE receiptQuantity TO  ELM-NO
001800       INVOKE ARRAY "NEW" USING ELM-TYPE DIM ELM-NO
001810                          RETURNING ARRAYOBJ
001820       MOVE FUNCTION CURRENT-DATE TO ���ݓ��t����
001830       MOVE YMD-HMS  TO receiptDate
001840       PERFORM TEST BEFORE VARYING IDXCNT FROM 1 BY 1
001850                            UNTIL IDXCNT > receiptQuantity OR
001860                                  �����I��
001870         INVOKE OLS_SERVICE "OrderRegist"
001880             USING receiptDate orderer R-NUM(IDXCNT) R-QUANT(IDXCNT)
001890             RETURNING receiptNumber
001900*
001910         *> receiptNumber�ɂ́C���s�����I�[�_�[�ԍ����ԋp�����D
001920         *> �o�^�����Ɏ��s�����ꍇ��"ERR"���Ԃ����D
001930         IF receiptNumber NOT = "ERR" THEN
001940           *> �������̗݌v
001950           COMPUTE ALLquantity = ALLquantity + R-QUANT(IDXCNT)
001960           *> �P���i������̉��i��z��v�f�ɐݒ肵�Ă���
001970           MOVE IDXCNT TO ELM-NO
001980           INVOKE ARRAYOBJ "SET-DATA" USING SUM-Price(IDXCNT) ELM-NO
001990         ELSE
002000           MOVE �V�X�e���G���[ TO RET
002010           SET �����I��        TO TRUE
002020         END-IF
002030       END-PERFORM
002040       IF RET = ����I�� THEN
002050         INVOKE OLS_SERVICE "OrderSum"  USING ARRAYOBJ ED-Bill
002060                                        RETURNING ReferRet
002070         MOVE ALLquantity TO ED-ALLquantity
002080         SET �I�[�_�[�T�� TO TRUE
002090       END-IF
002100     ELSE
002110       SET ���j���[�\�� TO TRUE
002120     END-IF
