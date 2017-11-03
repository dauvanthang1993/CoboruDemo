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
000130*                - SQL_SYSTEM_ERR
000140*  ���l        �F DB_ACCESS�N���X�̓C���X�^���X�ɌŗL�̃f�[�^�����Ȃ�
000150*                 �葱���̂݃N���X�ł��邪�A������SQL���̓I�v�W�F�N�g
000160*                 ���\�b�h�ɂ����L�q�ł��Ȃ����߁A�C���X�^���X�𐶐�
000170*                 ����K�v������܂��B
000180*
000190* Copyright 1999-2015 FUJITSU LIMITED
000200*======================================================================
000210*     ���̃v���O�����ł́A�ڑ��f�[�^�x�[�X�Ƃ���
000220*     Microsoft(R) SQL Server(TM)��z�肵�Ă��܂��B
000230*     �ڑ��f�[�^�x�[�X�Ƃ���Microsoft(R) SQL Server(TM)�ȊO��
000240*     �g�p����ꍇ�A�L���萔SQSVCNN-OK�̒l��"00000"�ɕύX����
000250*     �������B
000260*======================================================================
000270 CLASS-ID.     DB_ACCESS INHERITS FJBASE.
000280 ENVIRONMENT DIVISION.
000290 CONFIGURATION SECTION.
000300 SPECIAL-NAMES.
000310     SYMBOLIC CONSTANT
000320         ����I��       0
000330         �F�؎��s       100
000340         �݌ɕs��       200
000350         ���i�ԍ����o�^ 1000
000360         �V�X�e���G���[ 10000
000370         EXECSQL-OK     "00000"
000380         SQSVCNN-OK     "01000"    *> Microsoft SQL server�ŗL�̒l
000390         .
000400 REPOSITORY.
000410        CLASS FJBASE
000420        CLASS COM-EXP AS "*COM-EXCEPTION"
000430        CLASS CONTEXT AS "*COM"
000440        .
000450 OBJECT.
000460 DATA DIVISION.
000470 WORKING-STORAGE SECTION.
000480 01 EXOBJ        OBJECT REFERENCE COM-EXP.
000490 01 EXCODE       PIC S9(4) COMP-5 VALUE 99.
000500 01 EXMSG        PIC X(115). 
000510 01 EXSRC        PIC N(10).
000520 01 OBJCON       OBJECT REFERENCE CONTEXT.
000530     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
000540 01 SQLSTATE PIC X(5).
000550 01 SQLMSG   PIC X(110).
000560     EXEC SQL END DECLARE SECTION END-EXEC.
000570 PROCEDURE DIVISION.
000580*======================================================================
000590*  �����\�b�h��  �F�ڋq���擾
000600*      �T�v  �F�o�^���[�U�h�c�^�p�X���[�h�̑g�������m�F���܂��B
000610*                   ���A�l�ƈӖ��͈ȉ��̂Ƃ���ł��B
000620*                     0     = ����I���i�o�^���ƈ�v�j
000630*                     100   = �F�؎��s�i�o�^���ƕs��v�j
000640*                     10000 = �V�X�e���G���[�i�c�a�A�N�Z�X���ɃG���[�����j
000650*                             ���G���[�̏ڍׂ̓C�x���g���O�ɏo�͂��܂��B
000660*      �p�����^  �Fusing    userInfo
000670*                  return   PIC 9(9) COMP-5
000680*      �g�p  �FuserID��userPassword�ɕ������ݒ肵�Čďo���B
000690*======================================================================
000700 METHOD-ID. �ڋq���擾.
000710 DATA DIVISION.
000720 WORKING-STORAGE SECTION.
000730     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
000740 01 W-USERID.
000750  49 ULG     PIC S9(4) COMP-5.
000760  49 UID     PIC X(32).
000770 01 W-PASSWD.
000780  49 PLG     PIC S9(4) COMP-5.
000790  49 PWD     PIC X(32).
000800     EXEC SQL END DECLARE SECTION END-EXEC.
000810 LINKAGE SECTION.
000820 01 userID       PIC X(32).
000830 01 userPassword PIC X(32).
000840 01 RET          PIC S9(6) COMP-5.
000850 PROCEDURE DIVISION USING userID userPassword
000860                    RETURNING RET.
000870     *> �p�X���[�h���擾���܂��B
000880     MOVE FUNCTION LENG(userID) TO ULG
000890     MOVE userID TO UID
000900
000910     INVOKE CONTEXT "GetObjectContext" RETURNING OBJCON
000920*================================================================
000930*  �c�a�ɐڑ����āA�ڋq�e�[�u�����烆�[�U�h�c���L�[�Ƀp�X���[�h��
000940*  ���o���܂��B
000950*================================================================
000960     EXEC SQL CONNECT TO DEFAULT END-EXEC
000970     IF NOT (SQLSTATE = EXECSQL-OK OR SQSVCNN-OK) THEN
000980       MOVE �V�X�e���G���[ TO RET
000990       MOVE N"�ڋq���擾" TO EXSRC
001000       INITIALIZE EXMSG
001010       INVOKE SELF "SQL_SYSTEM_ERR"
001020       INVOKE CONTEXT "SetAbort"
001030       EXIT METHOD
001040     END-IF
001050
001060     EXEC SQL
001070          SELECT �p�X���[�h INTO :W-PASSWD FROM �ڋq
001080                 WHERE ���[�U�h�c = :W-USERID
001090     END-EXEC
001100     MOVE PWD TO userpassword
001110
001120     IF NOT SQLSTATE = EXECSQL-OK THEN
001130       MOVE �F�؎��s TO RET
001140       MOVE N"�ڋq���擾" TO EXSRC
001150       INITIALIZE EXMSG
001160       INVOKE SELF "SQL_SYSTEM_ERR"
001170       EXIT METHOD
001180     END-IF
001190*================================================================
001200*  �c�a��ؒf���܂��B
001210*================================================================
001220     EXEC SQL DISCONNECT DEFAULT END-EXEC
001230     INVOKE OBJCON "SetComplete"
001240     SET OBJCON TO NULL
001250
001260     EXIT METHOD.
001270 END METHOD  �ڋq���擾.
001280/
001290*======================================================================
001300*  �����\�b�h��  �F�݌ɖ⍇�킹
001310*      �T�v  �F�݌ɐ����v�Z����
001320*                   ���A�l�ƈӖ��͈ȉ��̂Ƃ���ł��B
001330*                     0     = ����I��
001340*                     1000  = ���i�ԍ����o�^
001350*                     10000 = �V�X�e���G���[�i�c�a�A�N�Z�X���ɃG���[�����j
001360*                             ���G���[�̏ڍׂ̓C�x���g���O�ɏo�͂��܂��B
001370*      �p�����^  �Fusing    stockInfo
001380*                  return   PIC 9(9) COMP-5
001390*      �g�p  �FuserID�i���[�U�h�c�j��userPassword�i�p�X���[�h�j��
001400*              �������ݒ肵�Čďo���B
001410*======================================================================
001420 METHOD-ID.  �݌ɖ⍇�킹.
001430 DATA DIVISION.
001440 WORKING-STORAGE SECTION.
001450      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
001460 01 W-NUM PIC X(10).
001470 01 W-QT  PIC S9(10).
001480      EXEC SQL END DECLARE SECTION END-EXEC.
001490 LINKAGE SECTION.
001500 01 stockProductNumber     PIC X(10).  *> ���i�ԍ�
001510 01 stockProductQuantity   PIC 9(10).  *> �݌ɐ���
001520 01 RET           PIC 9(9) COMP-5.
001530 PROCEDURE DIVISION USING stockProductNumber stockProductQuantity
001540                    RETURNING RET.
001550
001560     MOVE ����I�� TO RET
001570
001580     INVOKE CONTEXT "GetObjectContext" RETURNING OBJCON
001590*================================================================
001600*  �c�a�ɐڑ����܂��B
001610*================================================================
001620     EXEC SQL CONNECT TO DEFAULT END-EXEC
001630     IF NOT (SQLSTATE = EXECSQL-OK OR SQSVCNN-OK) THEN
001640       MOVE �V�X�e���G���[ TO RET
001650       MOVE N"�݌ɖ⍇�킹" TO EXSRC
001660       INITIALIZE EXMSG
001670       INVOKE SELF "SQL_SYSTEM_ERR"
001680       INVOKE CONTEXT "SetAbort"
001690       EXIT METHOD
001700     END-IF
001710*================================================================
001720*  �݌Ƀf�[�^�̎擾�������ďo���܂��B
001730*================================================================
001740     MOVE stockproductNumber TO W-NUM
001750     EXEC SQL 
001760          SELECT �݌ɐ� INTO :W-QT FROM �݌�
001770                 WHERE  ���i�ԍ� = :W-NUM
001780     END-EXEC
001790     MOVE W-QT TO stockproductQuantity
001800
001810     IF NOT SQLSTATE = EXECSQL-OK THEN
001820       MOVE ���i�ԍ����o�^ TO RET
001830       MOVE N"�݌ɖ⍇�킹" TO EXSRC
001840       INITIALIZE EXMSG
001850       INVOKE SELF "SQL_SYSTEM_ERR"
001860       EXIT METHOD
001870     END-IF
001880
001890*================================================================
001900*  �c�a��ؒf���܂��B
001910*================================================================
001920     EXEC SQL DISCONNECT DEFAULT END-EXEC
001930     INVOKE OBJCON "SetComplete"
001940     SET OBJCON TO NULL
001950
001960     EXIT METHOD.
001970 END METHOD  �݌ɖ⍇�킹.
001980/
001990*======================================================================
002000*  �����\�b�h��  �F�I�[�_�[�o�^
002010*      �T�v  �F�݌ɐ����X�V����O���������܂��B
002020*                   ���A�l�ƈӖ��͈ȉ��̂Ƃ���ł��B
002030*                     0     = ����I��
002040*                     10000 = �V�X�e���G���[�i�c�a�A�N�Z�X���ɃG���[�����j
002050*                             ���G���[�̏ڍׂ̓C�x���g���O�ɏo�͂��܂��B
002060*      �p�����^  �Fusing orderInf
002070*                   return   PIC 9(9) COMP-5
002080*      �g�p  �ForderUserID�i�����҂h�c�j�CorderDate�i�������j�C
002090*              orderNumber�i�I�[�_�[�����j�CorderProductNumber�i�I�[�_�[���i�ԍ��j�C
002100*              orderProductQuantity�i�I�[�_�[���j�ɒl��ݒ肵�Čďo���܂��B
002110*======================================================================
002120 METHOD-ID.  �I�[�_�[�o�^.
002130 DATA DIVISION.
002140 WORKING-STORAGE SECTION.
002150     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
002160 01 W-num     PIC X(12).
002170 01 W-user    PIC X(32).
002180 01 W-date    PIC X(14).
002190     EXEC SQL END DECLARE SECTION END-EXEC.
002200 LINKAGE SECTION.
002210 01 orderNumber            PIC X(12).
002220 01 orderUserID            PIC X(32).
002230 01 orderDate              PIC X(14).
002240 01 orderProductNumber     PIC X(10).
002250 01 orderProductQuantity   PIC 9(10).
002260 01 RET       PIC 9(9) COMP-5.
002270
002280 PROCEDURE DIVISION USING orderNumber orderUserID orderDate orderProductNumber orderProductQuantity
002290                    RETURNING RET.
002300
002310      MOVE ����I�� TO RET
002320      INVOKE CONTEXT "GetObjectContext" RETURNING OBJCON
002330*================================================================
002340*  �c�a�ɐڑ����āA�I�[�_�[�����I�[�_�[�e�[�u���ɒǉ����܂��B
002350*================================================================
002360      EXEC SQL CONNECT TO DEFAULT END-EXEC
002370      IF NOT (SQLSTATE = EXECSQL-OK OR SQSVCNN-OK) THEN
002380         MOVE �V�X�e���G���[ TO RET
002390         MOVE N"�I�[�_�[�o�^" TO EXSRC
002400         INITIALIZE EXMSG
002410         INVOKE SELF "SQL_SYSTEM_ERR"
002420         EXIT METHOD
002430      END-IF
002440
002450      EXEC SQL WHENEVER SQLERROR GO TO :END-PROC END-EXEC.
002460
002470      *>�I�[�_�[�e�[�u���ւ̓o�^
002480      MOVE orderNumber TO W-num
002490      MOVE orderUserID TO W-user
002500      MOVE orderDate   TO W-date
002510
002520      EXEC SQL
002530           INSERT INTO  �I�[�_�[
002540                  VALUES  (:W-num, :W-user, :W-date)
002550      END-EXEC.
002560
002570*================================================================
002580*  �c�a��ؒf���܂��B
002590*================================================================
002600 END-PROC.
002610      IF SQLSTATE = EXECSQL-OK THEN
002620        *>�o�^�����I�[�_�[���m�肵�܂��B
002630        EXEC SQL DISCONNECT DEFAULT END-EXEC
002640        INVOKE OBJCON "SetComplete"
002650        SET OBJCON TO NULL
002660      ELSE
002670        *>SQLERROR�������̏��������܂��B
002680        EXEC SQL WHENEVER SQLERROR CONTINUE END-EXEC
002690        INVOKE OBJCON "SetAbort"
002700        EXEC SQL DISCONNECT DEFAULT END-EXEC
002710
002720        MOVE �V�X�e���G���[ TO RET
002730        MOVE N"�I�[�_�[�o�^" TO EXSRC
002740        INITIALIZE EXMSG
002750        INVOKE SELF "SQL_SYSTEM_ERR"
002760      END-IF
002770
002780      EXIT METHOD.
002790
002800 END METHOD  �I�[�_�[�o�^.
002810/
002820*======================================================================
002830*  �����\�b�h��  �F�݌ɍX�V
002840*      �T�v  �F�݌ɐ����X�V���ăI�[�_�[���ׂ�o�^���܂��B
002850*                   �݌ɐ����I�[�_�[��������΁C�݌ɐ����X�V����
002860*                   �I�[�_�[���ׂ�o�^���܂��B�I�[�_�[�ԍ��̓��\�b�h����
002870*                   �̔Ԃ���orderInfo�z��ɐݒ肵�܂��B
002880*                   ���A�l�ƈӖ��͈ȉ��̂Ƃ���ł��B
002890*                     0     = ����I��
002900*                     10000 = �V�X�e���G���[�i�c�a�A�N�Z�X���ɃG���[�����j
002910*                             ���G���[�̏ڍׂ̓C�x���g���O�ɏo�͂��܂��B
002920*      �p�����^  �Fusing orderInf
002930*                   return   PIC 9(9) COMP-5
002940*      �g�p  �ForderUserID�i�����҂h�c�j�CorderDate�i�������j�C
002950*              orderNumber�i�I�[�_�[�����j�CorderProductNumber�i�I�[�_�[���i�ԍ��j�C
002960*              orderProductQuantity�i�I�[�_�[���j�ɒl��ݒ肵�Čďo���܂��B
002970*======================================================================
002980 METHOD-ID.  �݌ɍX�V.
002990 DATA DIVISION.
003000 WORKING-STORAGE SECTION.
003010     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
003020 01 W-order   PIC X(12).
003030 01 W-prdt    PIC X(10).
003040 01 W-orderQT     PIC S9(10).
003050 01 W-stockQT     PIC S9(10).
003060     EXEC SQL END DECLARE SECTION END-EXEC.
003070 LINKAGE SECTION.
003080 01 orderNumber            PIC X(12).
003090 01 orderUserID            PIC X(32).
003100 01 orderDate              PIC X(14).
003110 01 orderProductNumber     PIC X(10).
003120 01 orderProductQuantity   PIC 9(10).
003130 01 RET       PIC 9(9) COMP-5.
003140
003150 PROCEDURE DIVISION USING orderNumber orderUserID orderDate orderProductNumber orderProductQuantity
003160                    RETURNING RET.
003170
003180      MOVE ����I�� TO RET
003190      INVOKE CONTEXT "GetObjectContext" RETURNING OBJCON
003200*================================================================
003210*  �c�a�ɐڑ����āA�I�[�_�[�����I�[�_�[�e�[�u���ɒǉ����܂��B
003220*================================================================
003230      EXEC SQL CONNECT TO DEFAULT END-EXEC
003240      IF NOT (SQLSTATE = EXECSQL-OK OR SQSVCNN-OK) THEN
003250         MOVE �V�X�e���G���[ TO RET
003260         MOVE N"�݌ɍX�V�i�P�j" TO EXSRC
003270         INITIALIZE EXMSG
003280         INVOKE SELF "SQL_SYSTEM_ERR"
003290         EXIT METHOD
003300      END-IF
003310
003320      EXEC SQL WHENEVER SQLERROR GO TO :END-PROC END-EXEC.
003330
003340*================================================================
003350*  �݌ɐ��̍Čv�Z�A�݌Ƀe�[�u���̍X�V�A�I�[�_�[���ׂ��쐬���܂��B
003360*  �������A�G���[���N�����ꍇ�A�������I�����܂��B
003370*================================================================
003380      *>�݌ɐ����甭�������������c�ʂ��v�Z���܂��B
003390      MOVE orderProductNumber  TO W-prdt
003400      EXEC SQL 
003410           SELECT �݌ɐ� INTO :W-stockQT FROM �݌�
003420                  WHERE  ���i�ԍ� = :W-prdt
003430      END-EXEC
003440      *>�݌ɂ��Ȃ���ΕύX��j�����ď������I�����܂��B
003450      IF W-stockQT < orderproductQuantity THEN
003460        MOVE  �݌ɕs�� TO RET
003470        INVOKE OBJCON "SetAbort"
003480        SET OBJCON TO NULL
003490        EXIT METHOD
003500      END-IF
003510
003520      COMPUTE W-stockQT =
003530              W-stockQT - orderproductQuantity
003540
003550      *>�݌ɐ����X�V����
003560      EXEC SQL
003570           UPDATE �݌� 
003580                 SET �݌ɐ� = :W-stockQT
003590                 WHERE  ���i�ԍ� = :W-prdt
003600      END-EXEC
003610
003620      *>�I�[�_�[���ׂ�o�^����
003630      MOVE orderNumber TO W-order
003640      MOVE orderProductQuantity TO W-orderQT
003650      EXEC SQL 
003660           INSERT INTO  �I�[�_�[���� 
003670                 VALUES (:W-order, :W-prdt, :W-orderQT)
003680      END-EXEC.
003690
003700*================================================================
003710*  �c�a��ؒf���܂��B
003720*================================================================
003730 END-PROC.
003740      IF SQLSTATE = EXECSQL-OK THEN
003750        *>�ύX�����݌ɂ��m�肵�܂��B
003760        EXEC SQL DISCONNECT DEFAULT END-EXEC
003770        INVOKE OBJCON "SetComplete"
003780        SET OBJCON TO NULL
003790      ELSE
003800        *>SQLERROR�������̏��������܂��B
003810        EXEC SQL WHENEVER SQLERROR CONTINUE END-EXEC
003820        INVOKE OBJCON "SetAbort"
003830        EXEC SQL DISCONNECT DEFAULT END-EXEC
003840
003850        MOVE �V�X�e���G���[ TO RET
003860        MOVE N"�I�[�_�[�o�^" TO EXSRC
003870        INITIALIZE EXMSG
003880        INVOKE SELF "SQL_SYSTEM_ERR"
003890      END-IF
003900
003910      EXIT METHOD.
003920
003930 END METHOD  �݌ɍX�V.
003940/
003950*======================================================================
003960*  �����\�b�h��   �FSQL_SYSTEM_ERR
003970*      �T�v       �F�G���[���O���o�͂��܂��B
003980*      �p�����^   �F�Ȃ�
003990*      �ďo���_�@ �F���炩�̃G���[�������������ł��B
004000*======================================================================
004010 METHOD-ID. SQL_SYSTEM_ERR.
004020 DATA DIVISION.
004030 WORKING-STORAGE SECTION.
004040 PROCEDURE DIVISION.
004050     INVOKE COM-EXP "NEW" RETURNING EXOBJ
004060     INVOKE EXOBJ "SET-WCODE" USING EXCODE
004070     INVOKE EXOBJ "SET-SOURCE" USING EXSRC
004080     STRING SQLMSG(1:FUNCTION STORED-CHAR-LENGTH(SQLMSG))
004090            "(SQLSTATE=" SQLSTATE  ")" DELIMITED BY SIZE INTO EXMSG
004100     INVOKE EXOBJ "SET-DESCRIPTION" USING EXMSG
004110     SET OBJCON TO NULL
004120 END METHOD SQL_SYSTEM_ERR.
004130*
004140 END OBJECT.
004150*
004160 END CLASS DB_ACCESS.
