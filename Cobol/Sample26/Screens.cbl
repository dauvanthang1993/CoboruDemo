000010* Copyright 1999-2015 FUJITSU LIMITED
000020 01 ����F�؉��
000030           BLANK SCREEN REQUIRED BACKGROUND-COLOR 7.
000040  02       FOREGROUND-COLOR 1.
000050   03      LINE 2 COLUMN 2
000060           VALUE NC"���Ȃ��̂h�c�ƃp�X���[�h����͂��Ă��������B".
000070  02       FOREGROUND-COLOR 0.
000080   03      LINE 5 COLUMN 4 VALUE NC"���[�U�h�c".
000090   03 GID  LINE 5 COLUMN 15 PIC X(32) TO orderer AUTO.
000100   03      LINE 6 COLUMN 4 VALUE NC"�p�X���[�h".
000110   03 GPWD LINE 6 COLUMN 15 PIC X(32) TO ordererPassword SECURE.
000120  02       FOREGROUND-COLOR 5 LINE 10 COLUMN 20
000130           VALUE NC"���͌�A�d�m�s�d�q�L�[�������Ă��������B".
000140*
000150 01 ���j���[���
000160           BLANK SCREEN REQUIRED BACKGROUND-COLOR 7.
000170  02       FOREGROUND-COLOR 1.
000180   03      LINE 2 COLUMN 2
000190           VALUE NC"������I�����Ă��������B".
000200  02       FOREGROUND-COLOR 0.
000210   03      LINE 5 COLUMN 4 VALUE "1.  �J�^���O�V���b�s���O".
000220   03      LINE 6 COLUMN 4 VALUE "2.  �I��".
000230   03      LINE 8 COLUMN 15 VALUE "---> " .
000240   03      LINE 8 COLUMN 20 PIC 9  TO ProcCD REQUIRED.
000250  02       FOREGROUND-COLOR 5 LINE 10 COLUMN 20
000260           VALUE NC"���͌�A�d�m�s�d�q�L�[�������Ă��������B".
000270*
000280 01 �J�^���O���
000290           BLANK SCREEN BACKGROUND-COLOR 7.
000300  02       FOREGROUND-COLOR 1 LINE 2 COLUMN 2
000310           VALUE "���ʂ���͂��Ă��������B".
000320  02       FOREGROUND-COLOR 0 .
000330   03 .
000340    04      LINE 4 COLUMN 5  VALUE NC"���i��".
000350    04             COLUMN 20 VALUE NC"�Ώۂn�r".
000360    04             COLUMN 35 VALUE NC"�P��".
000370    04             COLUMN 51 VALUE NC"����".
000380    04      LINE 5 COLUMN 1
000390       VALUE NC"�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\".
000400   03 .
000410    04  PDT-Name1   LINE PLUS 1
000420                    COLUMN 3  PIC X(15)  FROM P-Name (1).
000430    04  PDT-Model1  COLUMN 20 PIC X(10)  FROM P-Model(1).
000440    04  PDT-Price1  COLUMN 30 PIC Z(9)9  FROM P-Price(1).
000450    04  PDT-QT1     COLUMN 50 PIC Z(10)  FROM ZERO TO P-QUANT(1) AUTO UNDERLINE.
000460   03 .
000470    04  PDT-Name2   LINE PLUS 1
000480                    COLUMN 3  PIC X(15)  FROM P-Name (2).
000490    04  PDT-Model2  COLUMN 20 PIC X(10)  FROM P-Model(2).
000500    04  PDT-Price2  COLUMN 30 PIC Z(9)9  FROM P-Price(2).
000510    04  PDT-QT2     COLUMN 50 PIC Z(10)  FROM ZERO TO P-QUANT(2) AUTO UNDERLINE.
000520   03 .
000530    04  PDT-Name3   LINE PLUS 1
000540                    COLUMN 3  PIC X(15) FROM P-Name (3).
000550    04  PDT-Model3  COLUMN 20 PIC X(10) FROM P-Model(3).
000560    04  PDT-Price3  COLUMN 30 PIC Z(9)9 FROM P-Price(3).
000570    04  PDT-QT3     COLUMN 50 PIC Z(10) FROM ZERO TO P-QUANT(3) AUTO UNDERLINE.
000580   03  .
000590    04  PDT-Name4   LINE PLUS 1
000600                    COLUMN 3  PIC X(15) FROM P-Name (4).
000610    04  PDT-Model4  COLUMN 20 PIC X(10) FROM P-Model(4).
000620    04  PDT-Price4  COLUMN 30 PIC Z(9)9 FROM P-Price(4).
000630    04  PDT-QT4     COLUMN 50 PIC Z(10) FROM ZERO TO P-QUANT(4)  AUTO UNDERLINE.
000640   03  .
000650    04  PDT-Name5   LINE PLUS 1
000660                    COLUMN 3  PIC X(15) FROM P-Name (5).
000670    04  PDT-Model5  COLUMN 20 PIC X(10) FROM P-Model(5).
000680    04  PDT-Price5  COLUMN 30 PIC Z(9)9 FROM P-Price(5).
000690    04  PDT-QT5     COLUMN 50 PIC Z(10) FROM ZERO TO P-QUANT(5)  AUTO UNDERLINE.
000700   03  .
000710    04  PDT-Name6   LINE PLUS 1
000720                    COLUMN 3  PIC X(15) FROM P-Name (6).
000730    04  PDT-Model6  COLUMN 20 PIC X(10) FROM P-Model(6).
000740    04  PDT-Price6  COLUMN 30 PIC Z(9)9 FROM P-Price(6).
000750    04  PDT-QT6     COLUMN 50 PIC Z(10) FROM ZERO TO P-QUANT(6)  AUTO UNDERLINE.
000760   03  .
000770    04  PDT-Name7   LINE PLUS 1
000780                    COLUMN 3  PIC X(15) FROM P-Name (7).
000790    04  PDT-Model7  COLUMN 20 PIC X(10) FROM P-Model(7).
000800    04  PDT-Price7  COLUMN 30 PIC Z(9)9 FROM P-Price(7).
000810    04  PDT-QT7     COLUMN 50 PIC Z(10) FROM ZERO TO P-QUANT(7) AUTO UNDERLINE.
000820   03  .
000830    04  PDT-Name8   LINE PLUS 1
000840                    COLUMN 3  PIC X(15) FROM P-Name (8).
000850    04  PDT-Model8  COLUMN 20 PIC X(10) FROM P-Model(8).
000860    04  PDT-Price8  COLUMN 30 PIC Z(9)9 FROM P-Price(8).
000870    04  PDT-QT8     COLUMN 50 PIC Z(10) FROM ZERO TO P-QUANT(8)  AUTO UNDERLINE.
000880   03  .
000890    04  PDT-Name9   LINE PLUS 1
000900                    COLUMN 3  PIC X(15) FROM P-Name (9).
000910    04  PDT-Model9  COLUMN 20 PIC X(10) FROM P-Model(9).
000920    04  PDT-Price9  COLUMN 30 PIC Z(9)9 FROM P-Price(9).
000930    04  PDT-QT9     COLUMN 50 PIC Z(10) FROM ZERO TO P-QUANT(9)  AUTO UNDERLINE.
000940   03  .
000950    04  PDT-Name10  LINE PLUS 1
000960                    COLUMN 3  PIC X(15) FROM P-Name (10).
000970    04  PDT-Model10 COLUMN 20 PIC X(10) FROM P-Model(10).
000980    04  PDT-Price10 COLUMN 30 PIC Z(9)9 FROM P-Price(10).
000990    04  PDT-QT10    COLUMN 50 PIC Z(10) FROM ZERO TO P-QUANT(10)  AUTO UNDERLINE.
001000   03 .
001010    04  PDT-Name11  LINE PLUS 1
001020                    COLUMN 3  PIC X(15) FROM P-Name (11).
001030    04  PDT-Model11 COLUMN 20 PIC X(10) FROM P-Model(11).
001040    04  PDT-Price11 COLUMN 30 PIC Z(9)9 FROM P-Price(11).
001050    04  PDT-QT11    COLUMN 50 PIC Z(10) FROM ZERO TO P-QUANT(11)  AUTO UNDERLINE.
001060   03  .
001070    04  PDT-Name12  LINE PLUS 1
001080                    COLUMN 3  PIC X(15) FROM P-Name (12).
001090    04  PDT-Model12 COLUMN 20 PIC X(10) FROM P-Model(12).
001100    04  PDT-Price12 COLUMN 30 PIC Z(9)9 FROM P-Price(12).
001110    04  PDT-QT12    COLUMN 50 PIC Z(10) FROM ZERO TO P-QUANT(12)  AUTO UNDERLINE.
001120   03  .
001130    04  PDT-Name13   LINE PLUS 1
001140                     COLUMN 3  PIC X(15) FROM P-Name (13).
001150    04  PDT-Model13  COLUMN 20 PIC X(10) FROM P-Model(13).
001160    04  PDT-Price13  COLUMN 30 PIC Z(9)9 FROM P-Price(13).
001170    04  PDT-QT13     COLUMN 50 PIC Z(10) FROM ZERO TO P-QUANT(13)  AUTO UNDERLINE.
001180   03  .
001190    04  PDT-Name14   LINE PLUS 1
001200                     COLUMN 3  PIC X(15) FROM P-Name (14).
001210    04  PDT-Model14  COLUMN 20 PIC X(10) FROM P-Model(14).
001220    04  PDT-Price14  COLUMN 30 PIC Z(9)9 FROM P-Price(14).
001230    04  PDT-QT14     COLUMN 50 PIC Z(10) FROM ZERO TO P-QUANT(14)  AUTO UNDERLINE.
001240   03  .
001250    04  PDT-Name15   LINE PLUS 1
001260                     COLUMN 3  PIC X(15) FROM P-Name (15).
001270    04  PDT-Model15  COLUMN 20 PIC X(10) FROM P-Model(15).
001280    04  PDT-Price15  COLUMN 30 PIC Z(9)9 FROM P-Price(15).
001290    04  PDT-QT15     COLUMN 50 PIC Z(10) FROM ZERO TO P-QUANT(15)  AUTO UNDERLINE.
001300   03  .
001310    04  PDT-Name16   LINE PLUS 1
001320                     COLUMN 3  PIC X(15) FROM P-Name (16).
001330    04  PDT-Model16  COLUMN 20 PIC X(10) FROM P-Model(16).
001340    04  PDT-Price16  COLUMN 30 PIC Z(9)9 FROM P-Price(16).
001350    04  PDT-QT16     COLUMN 50 PIC Z(10) FROM ZERO TO P-QUANT(16)  AUTO UNDERLINE.
001360   03  .
001370    04  PDT-Name17   LINE PLUS 1
001380                     COLUMN 3  PIC X(15) FROM P-Name (17).
001390    04  PDT-Model17  COLUMN 20 PIC X(10) FROM P-Model(17).
001400    04  PDT-Price17  COLUMN 30 PIC Z(9)9 FROM P-Price(17).
001410    04  PDT-QT17     COLUMN 50 PIC Z(10) FROM ZERO TO P-QUANT(17)  AUTO UNDERLINE.
001420   03  .
001430    04  PDT-Name18   LINE PLUS 1
001440                     COLUMN 3  PIC X(15) FROM P-Name (18).
001450    04  PDT-Model18  COLUMN 20 PIC X(10) FROM P-Model(18).
001460    04  PDT-Price18  COLUMN 30 PIC Z(9)9 FROM P-Price(18).
001470    04  PDT-QT18     COLUMN 50 PIC Z(10) FROM ZERO TO P-QUANT(18)  AUTO UNDERLINE.
001480   03  .
001490    04  PDT-Name19   LINE PLUS 1
001500                     COLUMN 3  PIC X(15) FROM P-Name (19).
001510    04  PDT-Model19  COLUMN 20 PIC X(10) FROM P-Model(19).
001520    04  PDT-Price19  COLUMN 30 PIC Z(9)9 FROM P-Price(19).
001530    04  PDT-QT19     COLUMN 50 PIC Z(10) FROM ZERO TO P-QUANT(19)  AUTO UNDERLINE.
001540   03  .
001550    04  PDT-Name20   LINE PLUS 1
001560                     COLUMN 3  PIC X(15) FROM P-Name (20).
001570    04  PDT-Model20  COLUMN 20 PIC X(10) FROM P-Model(20).
001580    04  PDT-Price20  COLUMN 30 PIC Z(9)9 FROM P-Price(20).
001590    04  PDT-QT20     COLUMN 50 PIC Z(10) FROM ZERO TO P-QUANT(20)   AUTO UNDERLINE.
001600*
001610 01 �I�[�_�[�m�F���
001620           BLANK SCREEN BACKGROUND-COLOR 7.
001630  02       FOREGROUND-COLOR 1 LINE 1 COLUMN 2
001640           VALUE "�I�[�_�[���m�F���Ă��������B�B".
001650  02       FOREGROUND-COLOR 0 .
001660   03 .
001670    04     LINE 3 COLUMN  4 VALUE NC"���i��".
001680    04            COLUMN 49 VALUE NC"����".
001690    04     LINE 4 COLUMN 1
001700       VALUE NC"�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\".
001710   03  .
001720    04  ORD-Name1   LINE PLUS 1
001730                    COLUMN 4  PIC X(15) FROM R-Name (1).
001740    04  ORD-Model1  COLUMN 20 PIC X(15) FROM R-Model(1).
001750    04  ORD-QT1     COLUMN 43 PIC Z(9)9 FROM ED-R-QUANT(1) BLANK WHEN ZERO.
001760   03  .
001770    04  ORD-Name2   LINE PLUS 1
001780                    COLUMN 4  PIC X(15) FROM R-Name (2).
001790    04  ORD-Model2  COLUMN 20 PIC X(15) FROM R-Model(2).
001800    04  ORD-QT2     COLUMN 43 PIC Z(9)9 FROM ED-R-QUANT(2) BLANK WHEN ZERO.
001810   03  .
001820    04  ORD-Name3   LINE PLUS 1
001830                    COLUMN 4  PIC X(15) FROM R-Name (3).
001840    04  ORD-Model3  COLUMN 20 PIC X(15) FROM R-Model(3).
001850    04  ORD-QT3     COLUMN 43 PIC Z(9)9 FROM ED-R-QUANT(3) BLANK WHEN ZERO.
001860   03  .
001870    04  ORD-Name4   LINE PLUS 1
001880                    COLUMN 4  PIC X(15) FROM R-Name (4).
001890    04  ORD-Model4  COLUMN 20 PIC X(15) FROM R-Model(4).
001900    04  ORD-QT4     COLUMN 43 PIC Z(9)9 FROM ED-R-QUANT(4) BLANK WHEN ZERO.
001910   03  .
001920    04  ORD-Name5   LINE PLUS 1
001930                    COLUMN 4  PIC X(15) FROM R-Name (5).
001940    04  ORD-Model5  COLUMN 20 PIC X(15) FROM R-Model(5).
001950    04  ORD-QT5     COLUMN 43 PIC Z(9)9 FROM ED-R-QUANT(5) BLANK WHEN ZERO.
001960   03  .
001970    04  ORD-Name6   LINE PLUS 1
001980                    COLUMN 4  PIC X(15) FROM R-Name (6).
001990    04  ORD-Model6  COLUMN 20 PIC X(15) FROM R-Model(6).
002000    04  ORD-QT6     COLUMN 43 PIC Z(9)9 FROM ED-R-QUANT(6) BLANK WHEN ZERO.
002010   03  .
002020    04  ORD-Name7   LINE PLUS 1
002030                    COLUMN 4  PIC X(15) FROM R-Name (7).
002040    04  ORD-Model7  COLUMN 20 PIC X(15) FROM R-Model(7).
002050    04  ORD-QT7     COLUMN 43 PIC Z(9)9 FROM ED-R-QUANT(7) BLANK WHEN ZERO.
002060   03  .
002070    04  ORD-Name8   LINE PLUS 1
002080                    COLUMN 4  PIC X(15) FROM R-Name (8).
002090    04  ORD-Model8  COLUMN 20 PIC X(15) FROM R-Model(8).
002100    04  ORD-QT8     COLUMN 43 PIC Z(9)9 FROM ED-R-QUANT(8) BLANK WHEN ZERO.
002110   03  .
002120    04  ORD-Name9   LINE PLUS 1
002130                    COLUMN 4  PIC X(15) FROM R-Name (9).
002140    04  ORD-Model9  COLUMN 20 PIC X(15) FROM R-Model(9).
002150    04  ORD-QT9     COLUMN 43 PIC Z(9)9 FROM ED-R-QUANT(9) BLANK WHEN ZERO.
002160   03  .
002170    04  ORD-Name10  LINE PLUS 1
002180                    COLUMN 4  PIC X(15) FROM R-Name (10).
002190    04  ORD-Model10 COLUMN 20 PIC X(15) FROM R-Model(10).
002200    04  ORD-QT10    COLUMN 43 PIC Z(9)9 FROM ED-R-QUANT(10) BLANK WHEN ZERO.
002210   03  .
002220    04  ORD-Name11  LINE PLUS 1
002230                    COLUMN 4  PIC X(15) FROM R-Name (11).
002240    04  ORD-Model11 COLUMN 20 PIC X(15) FROM R-Model(11).
002250    04  ORD-QT11    COLUMN 43 PIC Z(9)9 FROM ED-R-QUANT(11) BLANK WHEN ZERO.
002260   03  .
002270    04  ORD-Name12  LINE PLUS 1
002280                    COLUMN 4  PIC X(15) FROM R-Name (12).
002290    04  ORD-Model12 COLUMN 20 PIC X(15) FROM R-Model(12).
002300    04  ORD-QT12    COLUMN 43 PIC Z(9)9 FROM ED-R-QUANT(12) BLANK WHEN ZERO.
002310   03  .
002320    04  ORD-Name13  LINE PLUS 1
002330                    COLUMN 4  PIC X(15) FROM R-Name (13).
002340    04  ORD-Model13 COLUMN 20 PIC X(15) FROM R-Model(13).
002350    04  ORD-QT13    COLUMN 43 PIC Z(9)9 FROM ED-R-QUANT(13) BLANK WHEN ZERO.
002360   03  .
002370    04  ORD-Name14  LINE PLUS 1
002380                    COLUMN 4  PIC X(15) FROM R-Name (14).
002390    04  ORD-Model14 COLUMN 20 PIC X(15) FROM R-Model(14).
002400    04  ORD-QT14    COLUMN 43 PIC Z(9)9 FROM ED-R-QUANT(14) BLANK WHEN ZERO.
002410   03  .
002420    04  ORD-Name15  LINE PLUS 1
002430                    COLUMN 4  PIC X(15) FROM R-Name (15).
002440    04  ORD-Model15 COLUMN 20 PIC X(15) FROM R-Model(15).
002450    04  ORD-QT15    COLUMN 43 PIC Z(9)9 FROM ED-R-QUANT(15) BLANK WHEN ZERO.
002460   03  .
002470    04  ORD-Name16  LINE PLUS 1
002480                    COLUMN 4  PIC X(15) FROM R-Name (16).
002490    04  ORD-Model16 COLUMN 20 PIC X(15) FROM R-Model(16).
002500    04  ORD-QT16    COLUMN 43 PIC Z(9)9 FROM ED-R-QUANT(16) BLANK WHEN ZERO.
002510   03  .
002520    04  ORD-Name17  LINE PLUS 1
002530                    COLUMN 4  PIC X(15) FROM R-Name (17).
002540    04  ORD-Model17 COLUMN 20 PIC X(15) FROM R-Model(17).
002550    04  ORD-QT17    COLUMN 43 PIC Z(9)9 FROM ED-R-QUANT(17) BLANK WHEN ZERO.
002560   03  .
002570    04  ORD-Name18  LINE PLUS 1
002580                    COLUMN 4  PIC X(15) FROM R-Name (18).
002590    04  ORD-Model18 COLUMN 20 PIC X(15) FROM R-Model(18).
002600    04  ORD-QT18    COLUMN 43 PIC Z(9)9 FROM ED-R-QUANT(18) BLANK WHEN ZERO.
002610   03  .
002620    04  ORD-Name19  LINE PLUS 1
002630                    COLUMN 4  PIC X(15) FROM R-Name (19).
002640    04  ORD-Model19 COLUMN 20 PIC X(15) FROM R-Model(19).
002650    04  ORD-QT19    COLUMN 43 PIC Z(9)9 FROM ED-R-QUANT(19) BLANK WHEN ZERO.
002660   03  .
002670    04  ORD-Name20  LINE PLUS 1
002680                    COLUMN 4  PIC X(15) FROM R-Name (20).
002690    04  ORD-Model20 COLUMN 20 PIC X(15) FROM R-Model(20).
002700    04  ORD-QT20    COLUMN 43 PIC Z(9)9 FROM ED-R-QUANT(20) BLANK WHEN ZERO.
002710  02       FOREGROUND-COLOR 5.
002720    03  LINE PLUS 2
002730        COLUMN 6   VALUE "��낵���ł����H(Y/N)=>".
002740    03  COLUMN 32  PIC X(1) TO Agree.
002750*
002760 01 �I�[�_�[�T�����
002770          BLANK SCREEN REQUIRED BACKGROUND-COLOR 7.
002780  02      FOREGROUND-COLOR 1 LINE 1 COLUMN 2
002790          VALUE NC"�ȉ��̃I�[�_�[���󂯕t���܂����B".
002800  02      COLUMN 35  PIC X USING G-DUMMY.
002810  02      FOREGROUND-COLOR 0 .
002820   03 .
002830    04    LINE 3 COLUMN 1  VALUE NC"�I�[�_�[�ԍ��F".
002840    04           COLUMN 15 PIC X(15) FROM receiptNumber.
002850    04           COLUMN 44 PIC X(4)  FROM receiptYear.
002860    04           COLUMN 48 VALUE "/".
002870    04           COLUMN 49 PIC X(2)  FROM receiptMonth.
002880    04           COLUMN 51 VALUE "/".
002890    04           COLUMN 52 PIC X(2)  FROM receiptDay.
002900    04           COLUMN 54 VALUE "  ".
002910    04           COLUMN 56 PIC X(2)  FROM receiptHour.
002920    04           COLUMN 58 VALUE ":".
002930    04           COLUMN 59 PIC X(2)  FROM receiptMin.
002940    04    LINE 4 COLUMN 1
002950       VALUE NC"�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\".
002960   03  .
002970    04    LINE PLUS 1
002980          COLUMN 2  PIC X(15) FROM R-Name (1).
002990    04    COLUMN 17 PIC X(15) FROM R-Model(1).
003000    04    COLUMN 34 PIC Z(9)9 FROM ED-R-Price(1) BLANK WHEN ZERO.
003010    04    COLUMN 44 PIC Z(9)9 FROM ED-R-QUANT(1) BLANK WHEN ZERO.
003020    04    COLUMN 56 PIC Z(9)9 FROM ED-SUM-Price(1) BLANK WHEN ZERO.
003030   03 .
003040    04    LINE PLUS 1
003050          COLUMN 2  PIC X(15) FROM R-Name (2).
003060    04    COLUMN 17 PIC X(15) FROM R-Model(2).
003070    04    COLUMN 34 PIC Z(9)9 FROM ED-R-Price(2) BLANK WHEN ZERO.
003080    04    COLUMN 44 PIC Z(9)9 FROM ED-R-QUANT(2) BLANK WHEN ZERO.
003090    04    COLUMN 56 PIC Z(9)9 FROM ED-SUM-Price(2) BLANK WHEN ZERO.
003100   03 .
003110    04    LINE PLUS 1
003120          COLUMN 2  PIC X(15) FROM R-Name (3).
003130    04    COLUMN 17 PIC X(15) FROM R-Model(3).
003140    04    COLUMN 34 PIC Z(9)9 FROM ED-R-Price(3) BLANK WHEN ZERO.
003150    04    COLUMN 44 PIC Z(9)9 FROM ED-R-QUANT(3) BLANK WHEN ZERO.
003160    04    COLUMN 56 PIC Z(9)9 FROM ED-SUM-Price(3) BLANK WHEN ZERO.
003170   03  .
003180    04    LINE PLUS 1
003190          COLUMN 2  PIC X(15) FROM R-Name (4).
003200    04    COLUMN 17 PIC X(15) FROM R-Model(4).
003210    04    COLUMN 34 PIC Z(9)9 FROM ED-R-Price(4) BLANK WHEN ZERO.
003220    04    COLUMN 44 PIC Z(9)9 FROM ED-R-QUANT(4) BLANK WHEN ZERO.
003230    04    COLUMN 56 PIC Z(9)9 FROM ED-SUM-Price(4) BLANK WHEN ZERO.
003240   03 .
003250    04    LINE PLUS 1
003260          COLUMN 2  PIC X(15) FROM R-Name (5).
003270    04    COLUMN 17 PIC X(15) FROM R-Model(5).
003280    04    COLUMN 34 PIC Z(9)9 FROM ED-R-Price(5) BLANK WHEN ZERO.
003290    04    COLUMN 44 PIC Z(9)9 FROM ED-R-QUANT(5) BLANK WHEN ZERO.
003300    04    COLUMN 56 PIC Z(9)9 FROM ED-SUM-Price(5) BLANK WHEN ZERO.
003310   03 .
003320    04    LINE PLUS 1
003330          COLUMN 2  PIC X(15) FROM R-Name (6).
003340    04    COLUMN 17 PIC X(15) FROM R-Model(6).
003350    04    COLUMN 34 PIC Z(9)9 FROM ED-R-Price(6) BLANK WHEN ZERO.
003360    04    COLUMN 44 PIC Z(9)9 FROM ED-R-QUANT(6) BLANK WHEN ZERO.
003370    04    COLUMN 56 PIC Z(9)9 FROM ED-SUM-Price(6) BLANK WHEN ZERO.
003380   03 .
003390    04    LINE PLUS 1
003400          COLUMN 2  PIC X(15) FROM R-Name (7).
003410    04    COLUMN 17 PIC X(15) FROM R-Model(7).
003420    04    COLUMN 34 PIC Z(9)9 FROM ED-R-Price(7) BLANK WHEN ZERO.
003430    04    COLUMN 44 PIC Z(9)9 FROM ED-R-QUANT(7) BLANK WHEN ZERO.
003440    04    COLUMN 56 PIC Z(9)9 FROM ED-SUM-Price(7) BLANK WHEN ZERO.
003450   03 .
003460    04    LINE PLUS 1
003470          COLUMN 2  PIC X(15) FROM R-Name (8).
003480    04    COLUMN 17 PIC X(15) FROM R-Model(8).
003490    04    COLUMN 34 PIC Z(9)9 FROM ED-R-Price(8) BLANK WHEN ZERO.
003500    04    COLUMN 44 PIC Z(9)9 FROM ED-R-QUANT(8) BLANK WHEN ZERO.
003510    04    COLUMN 56 PIC Z(9)9 FROM ED-SUM-Price(8) BLANK WHEN ZERO.
003520   03 .
003530    04    LINE PLUS 1
003540          COLUMN 2  PIC X(15) FROM R-Name (9).
003550    04    COLUMN 17 PIC X(15) FROM R-Model(9).
003560    04    COLUMN 34 PIC Z(9)9 FROM ED-R-Price(9) BLANK WHEN ZERO.
003570    04    COLUMN 44 PIC Z(9)9 FROM ED-R-QUANT(9) BLANK WHEN ZERO.
003580    04    COLUMN 56 PIC Z(9)9 FROM ED-SUM-Price(9) BLANK WHEN ZERO.
003590   03 .
003600    04    LINE PLUS 1
003610          COLUMN 2  PIC X(15) FROM R-Name (10).
003620    04    COLUMN 17 PIC X(15) FROM R-Model(10).
003630    04    COLUMN 34 PIC Z(9)9 FROM ED-R-Price(10) BLANK WHEN ZERO.
003640    04    COLUMN 44 PIC Z(9)9 FROM ED-R-QUANT(10) BLANK WHEN ZERO.
003650    04    COLUMN 56 PIC Z(9)9 FROM ED-SUM-Price(10) BLANK WHEN ZERO.
003660   03 .
003670    04    LINE PLUS 1
003680          COLUMN 2  PIC X(15) FROM R-Name (11).
003690    04    COLUMN 17 PIC X(15) FROM R-Model(11).
003700    04    COLUMN 34 PIC Z(9)9 FROM ED-R-Price(11) BLANK WHEN ZERO.
003710    04    COLUMN 44 PIC Z(9)9 FROM ED-R-QUANT(11) BLANK WHEN ZERO.
003720    04    COLUMN 56 PIC Z(9)9 FROM ED-SUM-Price(11) BLANK WHEN ZERO.
003730   03 .
003740    04    LINE PLUS 1
003750          COLUMN 2  PIC X(15) FROM R-Name (12).
003760    04    COLUMN 17 PIC X(15) FROM R-Model(12).
003770    04    COLUMN 34 PIC Z(9)9 FROM ED-R-Price(12) BLANK WHEN ZERO.
003780    04    COLUMN 44 PIC Z(9)9 FROM ED-R-QUANT(12) BLANK WHEN ZERO.
003790    04    COLUMN 56 PIC Z(9)9 FROM ED-SUM-Price(12) BLANK WHEN ZERO.
003800   03 .
003810    04    LINE PLUS 1
003820          COLUMN 2  PIC X(15) FROM R-Name (13).
003830    04    COLUMN 17 PIC X(15) FROM R-Model(13).
003840    04    COLUMN 34 PIC Z(9)9 FROM ED-R-Price(13) BLANK WHEN ZERO.
003850    04    COLUMN 44 PIC Z(9)9 FROM ED-R-QUANT(13) BLANK WHEN ZERO.
003860    04    COLUMN 56 PIC Z(9)9 FROM ED-SUM-Price(13) BLANK WHEN ZERO.
003870   03 .
003880    04    LINE PLUS 1
003890          COLUMN 2  PIC X(15) FROM R-Name (14).
003900    04    COLUMN 17 PIC X(15) FROM R-Model(14).
003910    04    COLUMN 34 PIC Z(9)9 FROM ED-R-Price(14) BLANK WHEN ZERO.
003920    04    COLUMN 44 PIC Z(9)9 FROM ED-R-QUANT(14) BLANK WHEN ZERO.
003930    04    COLUMN 56 PIC Z(9)9 FROM ED-SUM-Price(14) BLANK WHEN ZERO.
003940   03 .
003950    04    LINE PLUS 1
003960          COLUMN 2  PIC X(15) FROM R-Name (15).
003970    04    COLUMN 17 PIC X(15) FROM R-Model(15).
003980    04    COLUMN 34 PIC Z(9)9 FROM ED-R-Price(15) BLANK WHEN ZERO.
003990    04    COLUMN 44 PIC Z(9)9 FROM ED-R-QUANT(15) BLANK WHEN ZERO.
004000    04    COLUMN 56 PIC Z(9)9 FROM ED-SUM-Price(15) BLANK WHEN ZERO.
004010   03 .
004020    04    LINE PLUS 1
004030          COLUMN 2  PIC X(15) FROM R-Name (16).
004040    04    COLUMN 17 PIC X(15) FROM R-Model(16).
004050    04    COLUMN 34 PIC Z(9)9 FROM ED-R-Price(16) BLANK WHEN ZERO.
004060    04    COLUMN 44 PIC Z(9)9 FROM ED-R-QUANT(16) BLANK WHEN ZERO.
004070    04    COLUMN 56 PIC Z(9)9 FROM ED-SUM-Price(16) BLANK WHEN ZERO.
004080   03 .
004090    04    LINE PLUS 1
004100          COLUMN 2  PIC X(15) FROM R-Name (17).
004110    04    COLUMN 17 PIC X(15) FROM R-Model(17).
004120    04    COLUMN 34 PIC Z(9)9 FROM ED-R-Price(17) BLANK WHEN ZERO.
004130    04    COLUMN 44 PIC Z(9)9 FROM ED-R-QUANT(17) BLANK WHEN ZERO.
004140    04    COLUMN 56 PIC Z(9)9 FROM ED-SUM-Price(17) BLANK WHEN ZERO.
004150   03 .
004160    04    LINE PLUS 1
004170          COLUMN 2  PIC X(15) FROM R-Name (18).
004180    04    COLUMN 17 PIC X(15) FROM R-Model(18).
004190    04    COLUMN 34 PIC Z(9)9 FROM ED-R-Price(18) BLANK WHEN ZERO.
004200    04    COLUMN 44 PIC Z(9)9 FROM ED-R-QUANT(18) BLANK WHEN ZERO.
004210    04    COLUMN 56 PIC Z(9)9 FROM ED-SUM-Price(18) BLANK WHEN ZERO.
004220   03 .
004230    04    LINE PLUS 1
004240          COLUMN 2  PIC X(15) FROM R-Name (19).
004250    04    COLUMN 17 PIC X(15) FROM R-Model(19).
004260    04    COLUMN 34 PIC Z(9)9 FROM ED-R-Price(19) BLANK WHEN ZERO.
004270    04    COLUMN 44 PIC Z(9)9 FROM ED-R-QUANT(19) BLANK WHEN ZERO.
004280    04    COLUMN 56 PIC Z(9)9 FROM ED-SUM-Price(19) BLANK WHEN ZERO.
004290   03 .
004300    04    LINE PLUS 1
004310          COLUMN 2  PIC X(15) FROM R-Name (20).
004320    04    COLUMN 17 PIC X(15) FROM R-Model(20).
004330    04    COLUMN 34 PIC Z(9)9 FROM ED-R-Price(20) BLANK WHEN ZERO.
004340    04    COLUMN 44 PIC Z(9)9 FROM ED-R-QUANT(20) BLANK WHEN ZERO.
004350    04    COLUMN 56 PIC Z(9)9 FROM ED-SUM-Price(20) BLANK WHEN ZERO.
004360   03     LINE PLUS 1 COLUMN 1
004370       VALUE NC"�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\".
004380   03 .
004390    04    LINE PLUS 1
004400          COLUMN 30 VALUE NC"���ʍ��v".
004410    04    COLUMN 57 PIC Z(9)9 FROM ED-ALLquantity.
004420  03 .
004430    04    LINE PLUS 1
004440          COLUMN 30 VALUE NC"�x�����z".
004450    04    COLUMN 53 PIC \\,\\\,\\\,\\9 FROM ED-Bill.
004460*
004470 01 �F�؃G���[��� BLANK SCREEN BACKGROUND-COLOR 6.
004480  02  LINE 6 COLUMN 3 FOREGROUND-COLOR 0
004490      VALUE NC"�G���[�F���[�U�h�c�܂��̓p�X���[�h�Ɍ�肪����܂��B".
004500*
004510 01 �݌ɃG���[��� BLANK SCREEN BACKGROUND-COLOR 6.
004520  02  LINE 6 COLUMN 3 FOREGROUND-COLOR 0
004530      VALUE NC"�G���[�F�݌ɕs���ł��B".
004540*
004550 01 �o�^�G���[��� BLANK SCREEN BACKGROUND-COLOR 6.
004560  02  LINE 6 COLUMN 3 FOREGROUND-COLOR 0
004570      VALUE NC"�G���[�F�Y�����鐻�i������܂���B".
004580*
004590 01 ���̑��G���[��� BLANK SCREEN BACKGROUND-COLOR 4.
004600  02  LINE 6 COLUMN 3 FOREGROUND-COLOR 7
004610      VALUE NC"�G���[�F�ڍׂȏ��̓V�X�e���̃C�x���g���O���Q�Ƃ��Ă��������B".