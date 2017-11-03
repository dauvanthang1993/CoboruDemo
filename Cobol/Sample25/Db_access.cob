000010*======================================================================
000020*  �N���X��    �FDB_ACCESS
000030*
000040*  �T�v        �F�f�[�^�x�[�X�A�g���s�Ȃ��葱�������������N���X�ł��B
000050*  �p���N���X  �FFJBASE
000060*  �Q�ƃN���X  �F�Ȃ�
000070*  ���\�b�h    �F�t�@�N�g�����\�b�h
000080*                  �Ȃ�
000090*                �I�u�W�F�N�g���\�b�h
000100*                - �ڋq���擾
000110*                - �݌ɖ⍇�킹
000120*                - �݌ɍX�V�I�[�_�[�o�^
000130*                - WRITE-ERR-LOG
000140*  ���l        �F DB_ACCESS�N���X�̓C���X�^���X�ɌŗL�̃f�[�^�����Ȃ�
000150*                 �葱���̂݃N���X�ł��邪�A������SQL���̓I�v�W�F�N�g
000160*                 ���\�b�h�ɂ����L�q�ł��Ȃ����߁A�C���X�^���X�𐶐�
000170*                 ����K�v������܂��B
000180* Copyright 1999-2015 FUJITSU LIMITED
000190*======================================================================
000200*     ���̃v���O�����ł́A�ڑ��f�[�^�x�[�X�Ƃ���
000210*     Microsoft(R) SQL Server(TM)��z�肵�Ă��܂��B
000220*     �ڑ��f�[�^�x�[�X�Ƃ���Microsoft(R) SQL Server(TM)�ȊO��
000230*     �g�p����ꍇ�A�L���萔SQSVCNN-OK�̒l��"00000"�ɕύX����
000240*     �������B
000250*======================================================================
000260 CLASS-ID.     DB_ACCESS INHERITS FJBASE.
000270 ENVIRONMENT DIVISION.
000280 CONFIGURATION SECTION.
000290 SPECIAL-NAMES.
000300     SYMBOLIC CONSTANT
000310         ����I��       0
000320         �F�؎��s       100
000330         �݌ɕs��       200
000340         ���i�ԍ����o�^ 1000
000350         �V�X�e���G���[ 10000
000360         EXECSQL-OK     "00000"
000370         SQSVCNN-OK     "01000"    *> Microsoft SQL server�ŗL�̒l
000380         .
000390 REPOSITORY.
000400        CLASS FJBASE
000410        .
000420 OBJECT.
000430 DATA DIVISION.
000440 WORKING-STORAGE SECTION.
000450     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
000460 01 SQLSTATE PIC X(5).
000470 01 SQLMSG   PIC X(110).
000480     EXEC SQL END DECLARE SECTION END-EXEC.
000490 PROCEDURE DIVISION.
000500*======================================================================
000510*  �����\�b�h��  �F�ڋq���擾
000520*      �T�v  �F�o�^���[�U�h�c�^�p�X���[�h�̑g�������m�F���܂��B
000530*                   ���A�l�ƈӖ��͈ȉ��̂Ƃ���ł��B
000540*                     0     = ����I���i�o�^���ƈ�v�j
000550*                     100   = �F�؎��s�i�o�^���ƕs��v�j
000560*                     10000 = �V�X�e���G���[�i�c�a�A�N�Z�X���ɃG���[�����j
000570*                             ���G���[�̏ڍׂ̓C�x���g���O�ɏo�͂��܂��B
000580*      �p�����^  �Fusing    userInfo
000590*                  return   PIC 9(9) COMP-5
000600*      �g�p  �FuserID��userPassword�ɕ������ݒ肵�Čďo���B
000610*======================================================================
000620 METHOD-ID. �ڋq���擾.
000630 DATA DIVISION.
000640 WORKING-STORAGE SECTION.
000650     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
000660 01 W-USERID.
000670  49 ULG     PIC S9(4) COMP-5.
000680  49 UID     PIC X(32).
000690 01 W-PASSWD.
000700  49 PLG     PIC S9(4) COMP-5.
000710  49 PWD     PIC X(32).
000720     EXEC SQL END DECLARE SECTION END-EXEC.
000730 LINKAGE SECTION.
000740 01 userID       PIC X(32).
000750 01 userPassword PIC X(32).
000760 01 RET      PIC S9(6) COMP-5.
000770 PROCEDURE DIVISION USING userID
000780                          userPassword
000790                    RETURNING RET.
000800     *> �p�X���[�h���擾���܂��B
000810     COMPUTE ULG = FUNCTION STORED-CHAR-LENGTH(userID)
000820     MOVE userID TO UID
000830*================================================================
000840*  �c�a�ɐڑ����āA�ڋq�e�[�u�����烆�[�U�h�c���L�[�Ƀp�X���[�h��
000850*  ���o���܂��B
000860*================================================================
000870     EXEC SQL CONNECT TO DEFAULT END-EXEC
000880     IF NOT (SQLSTATE = EXECSQL-OK OR SQSVCNN-OK) THEN
000890       MOVE �V�X�e���G���[ TO RET
000900       INVOKE SELF "WRITE-ERR-LOG"
000910       GO TO METHOD-EXIT
000920     END-IF
000930
000940     EXEC SQL
000950          SELECT �p�X���[�h INTO :W-PASSWD FROM �ڋq
000960                 WHERE ���[�U�h�c = :W-USERID
000970     END-EXEC
000980     MOVE PWD TO userpassword
000990
001000     IF NOT SQLSTATE = EXECSQL-OK THEN
001010       MOVE �F�؎��s TO RET
001020     END-IF
001030*================================================================
001040*  �c�a��ؒf���܂��B
001050*================================================================
001060     EXEC SQL ROLLBACK WORK END-EXEC
001070     EXEC SQL DISCONNECT DEFAULT END-EXEC.
001080 METHOD-EXIT.
001090     EXIT METHOD.
001100 END METHOD  �ڋq���擾.
001110/
001120*======================================================================
001130*  �����\�b�h��  �F�݌ɖ⍇�킹
001140*      �T�v  �F�݌ɐ����v�Z����
001150*                   ���A�l�ƈӖ��͈ȉ��̂Ƃ���ł��B
001160*                     0     = ����I��
001170*                     1000  = ���i�ԍ����o�^
001180*                     10000 = �V�X�e���G���[�i�c�a�A�N�Z�X���ɃG���[�����j
001190*                             ���G���[�̏ڍׂ̓C�x���g���O�ɏo�͂��܂��B
001200*      �p�����^  �Fusing    stockInfo
001210*                  return   PIC 9(9) COMP-5
001220*      �g�p  �FuserID�i���[�U�h�c�j��userPassword�i�p�X���[�h�j��
001230*              �������ݒ肵�Čďo���B
001240*======================================================================
001250 METHOD-ID.  �݌ɖ⍇�킹.
001260 DATA DIVISION.
001270 WORKING-STORAGE SECTION.
001280      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
001290 01 W-NUM PIC X(10).
001300 01 W-QT  PIC S9(10).
001310      EXEC SQL END DECLARE SECTION END-EXEC.
001320 LINKAGE SECTION.
001330 01 stockProductNumber     PIC X(10).  *> ���i�ԍ�
001340 01 stockProductQuantity   PIC 9(10).  *> �݌ɐ���
001350 01 RET           PIC 9(9) COMP-5.
001360 PROCEDURE DIVISION USING stockProductNumber
001370                          stockProductQuantity
001380                    RETURNING RET.
001390
001400     MOVE ����I�� TO RET
001410*================================================================
001420*  �c�a�ɐڑ����܂��B
001430*================================================================
001440     EXEC SQL CONNECT TO DEFAULT END-EXEC
001450     IF NOT (SQLSTATE = EXECSQL-OK OR SQSVCNN-OK) THEN
001460       MOVE �V�X�e���G���[ TO RET
001470       INVOKE SELF "WRITE-ERR-LOG"
001480       GO TO METHOD-EXIT
001490     END-IF
001500*================================================================
001510*  �݌Ƀf�[�^�̎擾�������ďo���܂��B
001520*================================================================
001530     MOVE stockproductNumber TO W-NUM
001540     EXEC SQL
001550          SELECT �݌ɐ� INTO :W-QT FROM �݌�
001560                 WHERE  ���i�ԍ� = :W-NUM
001570     END-EXEC
001580     MOVE W-QT TO stockproductQuantity
001590
001600     IF NOT SQLSTATE = EXECSQL-OK THEN
001610       MOVE ���i�ԍ����o�^ TO RET
001620       INVOKE SELF "WRITE-ERR-LOG"
001630     END-IF
001640*================================================================
001650*  �c�a��ؒf���܂��B
001660*================================================================
001670     EXEC SQL ROLLBACK WORK END-EXEC
001680     EXEC SQL DISCONNECT DEFAULT END-EXEC.
001690 METHOD-EXIT.
001700     EXIT METHOD.
001710 END METHOD  �݌ɖ⍇�킹.
001720/
001730*======================================================================
001740*  �����\�b�h��  �F�I�[�_�[�o�^
001750*      �T�v  �F�݌ɐ����X�V����O���������܂��B
001760*                   ���A�l�ƈӖ��͈ȉ��̂Ƃ���ł��B
001770*                     0     = ����I��
001780*                     10000 = �V�X�e���G���[�i�c�a�A�N�Z�X���ɃG���[�����j
001790*                             ���G���[�̏ڍׂ̓C�x���g���O�ɏo�͂��܂��B
001800*      �p�����^  �Fusing orderInf
001810*                   return   PIC 9(9) COMP-5
001820*      �g�p  �ForderUserID�i�����҂h�c�j�CorderDate�i�������j�C
001830*              orderNumber�i�I�[�_�[�����j�CorderProductNumber�i�I�[�_�[���i�ԍ��j�C
001840*              orderProductQuantity�i�I�[�_�[���j�ɒl��ݒ肵�Čďo���܂��B
001850*======================================================================
001860 METHOD-ID.  �I�[�_�[�o�^.
001870 DATA DIVISION.
001880 WORKING-STORAGE SECTION.
001890     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
001900 01 W-num     PIC X(12).
001910 01 W-user    PIC X(32).
001920 01 W-date    PIC X(14).
001930     EXEC SQL END DECLARE SECTION END-EXEC.
001940 LINKAGE SECTION.
001950 01 orderNumber            PIC X(12).
001960 01 orderUserID            PIC X(32).
001970 01 orderDate              PIC X(14).
001980 01 orderProductNumber     PIC X(10).
001990 01 orderProductQuantity   PIC 9(10).
002000 01 RET       PIC 9(9) COMP-5.
002010
002020 PROCEDURE DIVISION USING orderNumber
002030                          orderUserID
002040                          orderDate
002050                          orderProductNumber
002060                          orderProductQuantity
002070                    RETURNING RET.
002080
002090      MOVE ����I�� TO RET
002100*================================================================
002110*  �c�a�ɐڑ����āA�I�[�_�[�����I�[�_�[�e�[�u���ɒǉ����܂��B
002120*================================================================
002130
002140      EXEC SQL CONNECT TO DEFAULT END-EXEC
002150      IF NOT (SQLSTATE = EXECSQL-OK OR SQSVCNN-OK) THEN
002160         MOVE �V�X�e���G���[ TO RET
002170         INVOKE SELF "WRITE-ERR-LOG"
002180         EXIT METHOD
002190      END-IF
002200
002210      EXEC SQL WHENEVER SQLERROR GO TO :END-PROC END-EXEC.
002220
002230      *>�I�[�_�[�e�[�u���ւ̓o�^
002240      MOVE orderNumber TO W-num
002250      MOVE orderUserID TO W-user
002260      MOVE orderDate   TO W-date
002270
002280      EXEC SQL
002290           INSERT INTO  �I�[�_�[
002300                  VALUES  (:W-num, :W-user, :W-date)
002310      END-EXEC.
002320
002330*================================================================
002340*  �c�a��ؒf���܂��B
002350*================================================================
002360 END-PROC.
002370      IF SQLSTATE = EXECSQL-OK THEN
002380        *>�o�^�����I�[�_�[���m�肵�܂��B
002390        EXEC SQL COMMIT WORK END-EXEC
002400      ELSE
002410        *>SQLERROR�������̏��������܂��B
002420        MOVE �V�X�e���G���[ TO RET
002430        INVOKE SELF "WRITE-ERR-LOG"
002440        EXEC SQL WHENEVER SQLERROR CONTINUE END-EXEC
002450        EXEC SQL ROLLBACK WORK END-EXEC
002460      END-IF
002470      EXEC SQL DISCONNECT DEFAULT END-EXEC
002480
002490      EXIT METHOD.
002500
002510 END METHOD  �I�[�_�[�o�^.
002520/
002530*======================================================================
002540*  �����\�b�h��  �F�݌ɍX�V
002550*      �T�v  �F�݌ɐ����X�V���ăI�[�_�[���ׂ�o�^���܂��B
002560*                   �݌ɐ����I�[�_�[��������΁C�݌ɐ����X�V����
002570*                   �I�[�_�[���ׂ�o�^���܂��B�I�[�_�[�ԍ��̓��\�b�h����
002580*                   �̔Ԃ���orderInfo�z��ɐݒ肵�܂��B
002590*                   ���A�l�ƈӖ��͈ȉ��̂Ƃ���ł��B
002600*                     0     = ����I��
002610*                     10000 = �V�X�e���G���[�i�c�a�A�N�Z�X���ɃG���[�����j
002620*                             ���G���[�̏ڍׂ̓C�x���g���O�ɏo�͂��܂��B
002630*      �p�����^  �Fusing orderInf
002640*                   return   PIC 9(9) COMP-5
002650*      �g�p  �ForderUserID�i�����҂h�c�j�CorderDate�i�������j�C
002660*              orderNumber�i�I�[�_�[�����j�CorderProductNumber�i�I�[�_�[���i�ԍ��j�C
002670*              orderProductQuantity�i�I�[�_�[���j�ɒl��ݒ肵�Čďo���܂��B
002680*======================================================================
002690 METHOD-ID.  �݌ɍX�V.
002700 DATA DIVISION.
002710 WORKING-STORAGE SECTION.
002720     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
002730 01 W-order   PIC X(12).
002740 01 W-prdt    PIC X(10).
002750 01 W-orderQT     PIC S9(10).
002760 01 W-stockQT     PIC S9(10).
002770     EXEC SQL END DECLARE SECTION END-EXEC.
002780 LINKAGE SECTION.
002790 01 orderNumber            PIC X(12).
002800 01 orderUserID            PIC X(32).
002810 01 orderDate              PIC X(14).
002820 01 orderProductNumber     PIC X(10).
002830 01 orderProductQuantity   PIC 9(10).
002840 01 RET       PIC 9(9) COMP-5.
002850
002860 PROCEDURE DIVISION USING orderNumber
002870                          orderUserID
002880                          orderDate
002890                          orderProductNumber
002900                          orderProductQuantity
002910                    RETURNING RET.
002920
002930      MOVE ����I�� TO RET
002940*================================================================
002950*  �c�a�ɐڑ����āA�I�[�_�[�����I�[�_�[�e�[�u���ɒǉ����܂��B
002960*================================================================
002970      EXEC SQL CONNECT TO DEFAULT END-EXEC
002980      IF NOT (SQLSTATE = EXECSQL-OK OR SQSVCNN-OK) THEN
002990         MOVE �V�X�e���G���[ TO RET
003000         INVOKE SELF "WRITE-ERR-LOG"
003010         EXIT METHOD
003020      END-IF
003030
003040      EXEC SQL WHENEVER SQLERROR GO TO :END-PROC END-EXEC.
003050
003060*================================================================
003070*  �݌ɐ��̍Čv�Z�A�݌Ƀe�[�u���̍X�V�A�I�[�_�[���ׂ��쐬���܂��B
003080*  �������A�G���[���N�����ꍇ�A�������I�����܂��B
003090*================================================================
003100      *>�݌ɐ����甭�������������c�ʂ��v�Z���܂��B
003110      MOVE orderProductNumber  TO W-prdt
003120      EXEC SQL
003130           SELECT �݌ɐ� INTO :W-stockQT FROM �݌�
003140                  WHERE  ���i�ԍ� = :W-prdt
003150      END-EXEC
003160      *>�݌ɂ��Ȃ���ΕύX��j�����ď������I�����܂��B
003170      IF W-stockQT < orderproductQuantity THEN
003180        MOVE  �݌ɕs�� TO RET
003190        EXEC SQL ROLLBACK WORK END-EXEC
003200        EXEC SQL DISCONNECT DEFAULT END-EXEC
003210        EXIT METHOD
003220      END-IF
003230
003240      COMPUTE W-stockQT  = W-stockQT - orderproductQuantity
003250
003260      *>�݌ɐ����X�V���܂��B
003270      EXEC SQL
003280           UPDATE �݌�
003290                  SET �݌ɐ� = :W-stockQT
003300                  WHERE  ���i�ԍ� = :W-prdt
003310      END-EXEC
003320
003330      *>�I�[�_�[���ׂ�o�^���܂��B
003340      MOVE orderNumber TO W-order
003350      MOVE orderProductQuantity TO W-orderQT
003360      EXEC SQL
003370           INSERT INTO  �I�[�_�[����
003380                  VALUES (:W-order, :W-prdt, :W-orderQT)
003390      END-EXEC.
003400
003410*================================================================
003420*  �c�a��ؒf���܂��B
003430*================================================================
003440 END-PROC.
003450      IF SQLSTATE = EXECSQL-OK THEN
003460        *>�ύX�����݌ɂ��m�肵�܂��B
003470        EXEC SQL COMMIT WORK END-EXEC
003480      ELSE
003490        *>SQLERROR�������̏��������܂��B
003500        MOVE �V�X�e���G���[ TO RET
003510        INVOKE SELF "WRITE-ERR-LOG"
003520        EXEC SQL WHENEVER SQLERROR CONTINUE END-EXEC
003530        EXEC SQL ROLLBACK WORK END-EXEC
003540      END-IF
003550      EXEC SQL DISCONNECT DEFAULT END-EXEC
003560
003570      EXIT METHOD.
003580
003590 END METHOD  �݌ɍX�V.
003600/
003610*======================================================================
003620*  �����\�b�h��   �FWRITE-ERR-LOG
003630*      �T�v       �F�G���[���O���o�͂��܂��B
003640*      �p�����^   �F�Ȃ�
003650*      �ďo���_�@ �F���炩�̃G���[�������������ł��B
003660*======================================================================
003670 METHOD-ID. WRITE-ERR-LOG.
003680 DATA DIVISION.
003690 WORKING-STORAGE SECTION.
003700 01  userLog.
003710  02   �C�x���g�ԍ�       PIC  9(9)  COMP-5.
003720  02   ���               PIC  9(4)  COMP-5.
003730    88  �G���[            VALUE 2.
003740  02                      PIC  9(4)  COMP-5.
003750  02   �f�[�^.
003760    03    �f�[�^��        PIC  9(9)  COMP-5.
003770    03    �f�[�^�A�h���X  POINTER.
003780  02   �G���[�ڍ׏��     PIC  9(9)  COMP-5.
003790  02                      PIC  9(9)  COMP-5.
003800  02   �\�[�X��           PIC  X(256).
003810  02   ����               PIC  X(1024).
003820* RETURNING��Ɏw�肷��f�[�^����
003830 01  ���A�R�[�h           PIC S9(9)  COMP-5.
003840 PROCEDURE DIVISION.
003850     INITIALIZE userLog
003860     SET �G���[ OF ��� TO TRUE
003870     MOVE SPACE    TO �\�[�X��
003880     MOVE SQLSTATE TO ����(1:5)
003890     MOVE SQLMSG   TO ����(6:FUNCTION LENG(SQLMSG))
003900     CALL "COB_REPORT_EVENT" USING userLog
003910                             RETURNING ���A�R�[�h
003920     EXIT METHOD
003930 END METHOD WRITE-ERR-LOG.
003940*
003950 END OBJECT.
003960*
003970 END CLASS DB_ACCESS.
