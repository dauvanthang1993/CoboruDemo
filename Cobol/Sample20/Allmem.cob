000010*========================================================================
000020*�@�]�ƈ��N���X�iAllMember-class�j
000030*                        �|�T���v���v���O�����u�]�ƈ��Ǘ��i�i�����j�v
000040*
000050*�@�@�@�S�Ă̏]�ƈ��ɂ��ċ��ʂȃf�[�^�y�у��\�b�h�����B
000060*
000070*�@�Z�p���N���X
000080*�@�@�P�jFjbase
000090*
000100*�@�Z�Q�ƃN���X
000110*�@�@�P�j�]�ƈ��}�X�^�N���X�@�@�iMemberMaster-class�j
000120*�@�@�Q�j�Z���N���X�@�@�@�@�@�@�iAddress-class�j
000130*
000140*�@�Z�I�u�W�F�N�g�f�[�^
000150*�@�@�P�j�]�ƈ��ԍ��@�|�@PIC  S9(4)
000160*�@�@�Q�j�����@�@�@�@�|�@PIC   X(16)
000170*�@�@�R�j���ДN�����@�|�@PIC   X(8)
000180*�@�@�S�j�ގДN�����@�|�@PIC   X(8)
000190*�@�@�T�j�E���@�@�@�@�|�@PIC  S9(1)
000200*�@�@�U�j��{���@�@�@�|�@PIC  S9(8)
000210*�@�@�V�j���x���@�@�@�|�@PIC  S9(8)
000220*�@�@�W�j�Z���Q�Ɓ@�@�|�@object REFERENCE Address-class
000230*
000240*�@�Z�t�@�N�g�����\�b�h
000250*�@  �P�j�ڑ��@�@�@�@�@�@�@�@�iConnect-factory-method�j
000260*�@  �Q�j�ؒf�@�@�@�@�@�@�@�@�iDisconnect-factory-method�j
000270*�@  �R�j�]�ƈ��\�擪�ʒu�Â��iSetTop-factory-method�j
000280*�@  �S�j�]�ƈ��f�[�^�폜�@�@�iRemoveAt-factory-method�j
000290*�@  �T�j�E���擾�@�@�@�@�@�@�iSyokukyuGet-factory-method�j
000300*�@  �U�j�]�ƈ��f�[�^�X�V�@�@�iUpdate-factory-method�j
000310*�@  �V�j���]�ƈ����擾�@�@�iNextGet-factory-method�j
000320*�@  �W�j�]�ƈ��f�[�^�ꊇ�X�V�iAllUpdate-factory-method�j
000330*
000340*�@�Z�I�u�W�F�N�g���\�b�h
000350*�@�@�P�j�I�u�W�F�N�g�f�[�^�ɑ΂���CGET�y��SET�̃v���p�e�B���\�b�h
000360*�@  �Q�j�ڑ��@�@�@�@�@�@�@�@�iConnect-method�j
000370*�@  �R�j�ؒf�@�@�@�@�@�@�@�@�iDisconnect-method�j
000380*�@  �S�j�]�ƈ��\�擪�ʒu�Â��iSetTop-method�j
000390*�@  �T�j�]�ƈ��f�[�^�폜�@�@�iRemoveAt-method�j
000400*�@  �U�j�E���擾�@�@�@�@�@�@�iSyokukyuGet-method�j
000410*�@  �V�j�]�ƈ��f�[�^�X�V�@�@�iUpdate-method�j
000420*�@  �W�j���]�ƈ����擾�@�@�iNextGet-method�j
000430*�@  �X�j�]�ƈ��f�[�^�ꊇ�X�V�iAllUpdate-method�j
000440*�@�P�O�j���^�v�Z�@�@�@�@�@�@�iSaraly-method�j
000450*�@�P�P�j�ܗ^�v�Z�@�@�@�@�@�@�iBonus-method�j
000460*�@�P�Q�j�ݐЃ`�F�b�N�@�@�@�@�iIOCheck-method�j
000470*�@�P�R�j�f�[�^�ݒ�@�@�@�@�@�iDataSet-method�j
000480*�@�P�S�j�ۑ��@�@�@�@�@�@�@�@�iStore-method�j
000490*�@�P�T�j�G���[�\���@�@�@�@�@�iErrorDisplay-method�j
000500*
000510*                              Copyright 1998-2015 FUJITSU LIMITED
000520*========================================================================
000530 CLASS-ID.   AllMember-class INHERITS  FJBASE.
000540 ENVIRONMENT    DIVISION.
000550 CONFIGURATION    SECTION.
000560 SPECIAL-NAMES.
000570      SYMBOLIC CONSTANT
000580       ���R�[�h����            IS    0
000590       ���R�[�h�Ȃ�            IS    1
000600
000610       �b�n�m�m�d�b�s��        IS    0
000620       �c�h�r�b�n�m�m�d�b�s��  IS    1
000630       �b�n�l�l�h�s��          IS    2
000640       �r�d�k�d�b�s��          IS    3
000650       �h�m�r�d�q�s��          IS    4
000660       �t�o�c�`�s�d��          IS    5
000670       �c�d�k�d�s�d��          IS    6
000680       �n�o�d�m��              IS    7
000690       �b�k�n�r�d��            IS    8
000700       �e�d�s�b�g��            IS    9
000710       �ʒu�t���t�o�c�`�s�d��  IS   10.
000720
000730 REPOSITORY.
000740      CLASS FJBASE
000750      CLASS MemberMaster-class
000760      CLASS Address-class.
000770*
000780  FACTORY.
000790   DATA DIVISION.
000800   WORKING-STORAGE SECTION.
000810    01  �c�a�A�N�Z�X�|�I�u�W�F�N�g  OBJECT REFERENCE SELF.
000820   PROCEDURE DIVISION.
000830*
000840*========================================================================
000850*�@�ڑ��t�@�N�g�����\�b�h�iConnect-factory-method�j
000860*
000870*�@�@�@�f�[�^�x�[�X�A�N�Z�X�̂��߂�SELF�I�u�W�F�N�g�𐶐����C�ڑ����\�b�h
000880*�@�@�Ƀf�[�^�x�[�X�ւ̐ڑ����˗�����B
000890*========================================================================
000900   METHOD-ID.  Connect-factory-method.
000910   DATA DIVISION.
000920   PROCEDURE DIVISION.
000930*
000940       INVOKE SELF "new"
000950                        RETURNING �c�a�A�N�Z�X�|�I�u�W�F�N�g.
000960       INVOKE �c�a�A�N�Z�X�|�I�u�W�F�N�g "Connect-method".
000970*
000980   END METHOD Connect-factory-method.
000990*
001000*========================================================================
001010*�@�ؒf�t�@�N�g�����\�b�h�iDisconnect-factory-method�j
001020*
001030*�@�@�@�ؒf���\�b�h�Ƀf�[�^�x�[�X�̐ؒf���˗�����B
001040*========================================================================
001050   METHOD-ID.  Disconnect-factory-method.
001060   DATA DIVISION.
001070   PROCEDURE DIVISION.
001080*
001090       INVOKE �c�a�A�N�Z�X�|�I�u�W�F�N�g "Disconnect-method".
001100*
001110   END METHOD Disconnect-factory-method.
001120*
001130*========================================================================
001140*�@�擪�ʒu�Â��t�@�N�g�����\�b�h�iSetTop-factory-method�j
001150*
001160*      �]�ƈ��\�擪�ʒu�Â����]�ƈ��擪�ʒu�Â����\�b�h�Ɉ˗�����B
001170*
001180*�@�Z�o�́F�@�]�ƈ����
001190*�@�@�@�@�@�@�@�@�]�ƈ��ԍ�    PIC S9(4)
001200*�@�@�@�@�@�@�@�@�E��          PIC S9(1)
001210*========================================================================
001220   METHOD-ID. SetTop-factory-method.
001230   DATA DIVISION.
001240   LINKAGE SECTION.
001250   01  �k�|�]�ƈ����.
001260      02  �k�|�ԍ����                PIC S9(04).
001270      02  �k�|�E�����                PIC S9(01).
001280   PROCEDURE DIVISION RETURNING �k�|�]�ƈ����.
001290*
001300       INVOKE �c�a�A�N�Z�X�|�I�u�W�F�N�g "SetTop-method"
001310                                        RETURNING �k�|�]�ƈ����.
001320*
001330   END METHOD SetTop-factory-method.
001340*
001350*========================================================================
001360*�@�]�ƈ��f�[�^�폜�t�@�N�g�����\�b�h�iRemoveAt-factory-method�j
001370*
001380*      �]�ƈ��f�[�^�폜���]�ƈ��f�[�^�폜���\�b�h�Ɉ˗�����B
001390*========================================================================
001400   METHOD-ID. RemoveAt-factory-method.
001410   DATA DIVISION.
001420   LINKAGE SECTION.
001430    01  �k�|�]�ƈ��ԍ�      PIC S9(04).
001440    01  �k�|���A�l          PIC  9(01).
001450   PROCEDURE DIVISION USING �k�|�]�ƈ��ԍ�
001460                      RETURNING �k�|���A�l.
001470*
001480       INVOKE �c�a�A�N�Z�X�|�I�u�W�F�N�g "RemoveAt-method"
001490                                      USING �k�|�]�ƈ��ԍ�
001500                                      RETURNING �k�|���A�l.
001510*
001520   END METHOD RemoveAt-factory-method.
001530*
001540*========================================================================
001550*�@�E���擾�t�@�N�g�����\�b�h�iSyokukyuGet-factory-method�j
001560*
001570*      �E���擾��E���擾���\�b�h�Ɉ˗�����B
001580*
001590*�@�Z���́F�@�]�ƈ��ԍ�         PIC S9(8)
001600*�@�Z�o�́F�@�E��               PIC S9(1)
001610*========================================================================
001620   METHOD-ID. SyokukyuGet-factory-method.
001630   DATA DIVISION.
001640   LINKAGE SECTION.
001650    01  �k�|�]�ƈ��ԍ�           PIC S9(4).
001660    01  �k�|�E��                 PIC S9(1).
001670   PROCEDURE DIVISION USING �k�|�]�ƈ��ԍ�
001680                      RETURNING �k�|�E��.
001690*
001700       INVOKE �c�a�A�N�Z�X�|�I�u�W�F�N�g "SyokukyuGet-method"
001710                                        USING �k�|�]�ƈ��ԍ�
001720                                        RETURNING �k�|�E��.
001730*
001740   END METHOD SyokukyuGet-factory-method.
001750*
001760*========================================================================
001770*�@�]�ƈ��f�[�^�X�V�t�@�N�g�����\�b�h�iUpdate-factory-method�j
001780*
001790*      �]�ƈ��f�[�^�X�V���]�ƈ��f�[�^���\�b�h�Ɉ˗�����B
001800*
001810*�@�Z���́F�@���x��         PIC S9(8)
001820*=======================================================================
001830   METHOD-ID. Update-factory-method.
001840   DATA DIVISION.
001850   LINKAGE SECTION.
001860    01  �k�|���x��                  PIC S9(08).
001870   PROCEDURE DIVISION USING  �k�|���x��.
001880*
001890       INVOKE �c�a�A�N�Z�X�|�I�u�W�F�N�g "Update-method"
001900                                        USING �k�|���x��.
001910*
001920   END METHOD Update-factory-method.
001930*
001940*========================================================================
001950*�@���]�ƈ����擾�t�@�N�g�����\�b�h�iNextGet-factory-method�j
001960*
001970*�@�@�@���]�ƈ����擾�����]�ƈ����擾���\�b�h�Ɉ˗�����B
001980*
001990*�@�Z�o�́F�@�]�ƈ����
002000*�@�@�@�@�@�@�@�@�]�ƈ��ԍ�    PIC S9(4)
002010*�@�@�@�@�@�@�@�@�E��          PIC S9(1)
002020*========================================================================
002030   METHOD-ID. NextGet-factory-method.
002040   DATA DIVISION.
002050   LINKAGE SECTION.
002060   01  �k�|�]�ƈ����.
002070      02  �k�|�ԍ����                PIC S9(04).
002080      02  �k�|�E�����                PIC S9(01).
002090   PROCEDURE DIVISION RETURNING �k�|�]�ƈ����.
002100*
002110       INVOKE �c�a�A�N�Z�X�|�I�u�W�F�N�g "NextGet-method"
002120                                        RETURNING �k�|�]�ƈ����.
002130*
002140   END METHOD NextGet-factory-method.
002150*
002160*========================================================================
002170*�@�]�ƈ��f�[�^�ꊇ�X�V�t�@�N�g�����\�b�h�iAllUpdate-factory-method�j
002180*
002190*      �]�ƈ��f�[�^�ꊇ�X�V���]�ƈ��f�[�^���\�b�h�Ɉ˗�����B
002200*
002210*�@�Z���́F�@�X�V���
002220*                �X�V�]�ƈ���    PIC  9(2)
002230*                �X�V�]�ƈ����  OCCURS 99
002240*                    �X�V�]�ƈ����  PIC S9(4)
002250*                    �X�V�]�ƈ����  PIC S9(8)
002260*=======================================================================
002270   METHOD-ID. AllUpdate-factory-method.
002280   DATA DIVISION.
002290   LINKAGE SECTION.
002300   01  �k�|�X�V���.
002310      02  �k�|�X�V�]�ƈ���            PIC 9(2).
002320      02  �k�|�X�V�]�ƈ����          OCCURS 99.
002330         03  �k�|�X�V�]�ƈ��ԍ�          PIC S9(04).
002340         03  �k�|�X�V���x��              PIC S9(08).
002350   PROCEDURE DIVISION USING �k�|�X�V���.
002360*
002370       INVOKE �c�a�A�N�Z�X�|�I�u�W�F�N�g "AllUpdate-method"
002380                                        USING �k�|�X�V���.
002390*
002400   END METHOD AllUpdate-factory-method.
002410*
002420  END FACTORY.
002430*
002440  OBJECT.
002450   DATA DIVISION.
002460   WORKING-STORAGE SECTION.
002470   01  �]�ƈ��ԍ�          PIC   S9(004) PROPERTY.
002480   01  ����                PIC    X(016) PROPERTY.
002490   01  ���ДN����          PIC    X(008) PROPERTY.
002500   01  �ގДN����          PIC    X(008) PROPERTY.
002510   01  �E��                PIC   S9(001) PROPERTY.
002520   01  ��{��              PIC   S9(008) PROPERTY.
002530   01  ���x��              PIC   S9(008) PROPERTY.
002540   01  �Z���Q��            OBJECT  REFERENCE  Address-class PROPERTY.
002550*
002560     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
002570   01  SQLSTATE            PIC    X(5).
002580   01  SQLCODE             PIC   S9(9) COMP-5.
002590   01  SQLMSG              PIC    X(256).
002600     EXEC SQL END   DECLARE SECTION END-EXEC.
002610   01  �v�|�r�p�k������    PIC    9(2).
002620
002630  PROCEDURE DIVISION.
002640*
002650*========================================================================
002660*�@�ڑ����\�b�h�iConnect-method�j
002670*
002680*�@�@�@�f�[�^�x�[�X�ɐڑ��i�f�t�H���g�T�[�o�ɐڑ��j����B
002690*========================================================================
002700   METHOD-ID.  Connect-method.
002710   DATA DIVISION.
002720   WORKING-STORAGE SECTION.
002730   CONSTANT SECTION.
002740   LINKAGE SECTION.
002750   PROCEDURE DIVISION.
002760*
002770       EXEC SQL
002780           CONNECT TO DEFAULT
002790       END-EXEC.
002800*
002810       IF SQLSTATE NOT = "00000" AND SQLSTATE NOT = "01000"
002820       THEN
002830           MOVE �b�n�m�m�d�b�s��  TO �v�|�r�p�k������
002840           INVOKE SELF "ErrorDisplay-method"
002850                        USING �v�|�r�p�k������
002860       END-IF.
002870*
002880   END METHOD Connect-method.
002890*
002900*========================================================================
002910*�@�ؒf���\�b�h�iDisconnect-method�j
002920*
002930*�@�@�@�g�����U�N�V�������m�肳���C�f�[�^�x�[�X��ؒf����B
002940*========================================================================
002950   METHOD-ID.  Disconnect-method.
002960   DATA DIVISION.
002970   WORKING-STORAGE SECTION.
002980   CONSTANT SECTION.
002990   LINKAGE SECTION.
003000   PROCEDURE DIVISION.
003010*
003020       EXEC SQL
003030           COMMIT WORK
003040       END-EXEC.
003050*
003060       EXEC SQL
003070           DISCONNECT DEFAULT
003080       END-EXEC.
003090*
003100   END METHOD Disconnect-method.
003110*
003120*========================================================================
003130*�@�E���擾���\�b�h�iSyokukyuGet-method�j
003140*
003150*�@�@�@�w�肳�ꂽ�]�ƈ��ԍ��̏]�ƈ��f�[�^�����݂���Ȃ�΁C�E���l���l��
003160*�@�@���ԋp����B
003170*�@�@�@�w�肳�ꂽ�]�ƈ��ԍ��̏]�ƈ��f�[�^�����݂��Ȃ��Ȃ�΁C�O��ԋp��
003180*�@�@��B
003190*
003200*�@�Z���́F�@�]�ƈ��ԍ�         PIC S9(8)
003210*�@�Z�o�́F�@�E��               PIC S9(1)
003220*========================================================================
003230   METHOD-ID.  SyokukyuGet-method.
003240   DATA DIVISION.
003250   WORKING-STORAGE SECTION.
003260   LINKAGE SECTION.
003270      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
003280    01  �k�|�]�ƈ��ԍ�           PIC S9(4).
003290    01  �k�|�E��                 PIC S9(1).
003300      EXEC SQL END   DECLARE SECTION END-EXEC.
003310   PROCEDURE DIVISION  USING     �k�|�]�ƈ��ԍ�
003320                       RETURNING �k�|�E��.
003330*
003340       MOVE  0   TO  �k�|�E��.
003350*
003360       EXEC SQL
003370           SELECT �E�� INTO :�k�|�E�� FROM �]�ƈ��\
003380            WHERE �]�ƈ��ԍ� = :�k�|�]�ƈ��ԍ�
003390       END-EXEC.
003400*
003410       IF SQLCODE NOT = 100 AND SQLSTATE NOT = "00000"
003420       THEN
003430           MOVE �r�d�k�d�b�s��  TO �v�|�r�p�k������
003440           INVOKE SELF "ErrorDisplay-method"
003450                        USING �v�|�r�p�k������
003460       END-IF.
003470*
003480   END METHOD SyokukyuGet-method.
003490*
003500*========================================================================
003510*�@�]�ƈ��f�[�^�擾���\�b�h�iRetAt-method�j
003520*
003530*�@�@�@�w�肵���]�ƈ��ԍ��̏]�ƈ��f�[�^��ێ�����C�I�u�W�F�N�g�C���X�^
003540*�@�@���X�𐶐����C�ԋp����B
003550*
003560*�@�Z���́F�@�]�ƈ��ԍ�          PIC S9(8)
003570*�@�Z�o�́F�@�]�ƈ��I�u�W�F�N�g  OBJECT REFERENCE SELF
003580*========================================================================
003590   METHOD-ID.  RetAt-method.
003600   DATA DIVISION.
003610   WORKING-STORAGE SECTION.
003620      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
003630    01  �v�|�]�ƈ��ԍ�             PIC S9(004).
003640    01  �v�|����                   PIC  X(016).
003650    01  �v�|���ДN����             PIC  X(008).
003660    01  �v�|�ގДN����             PIC  X(008).
003670    01  �v�|�E��                   PIC S9(001).
003680    01  �v�|��{��                 PIC S9(008).
003690    01  �v�|���x��                 PIC S9(008).
003700    01  �v�|���ԊO�蓖             PIC S9(5).
003710    01  �v�|�c�Ǝ���               PIC S9(5)V9(1).
003720    01  �v�|���ʎ蓖               PIC S9(6).
003730      EXEC SQL END   DECLARE SECTION END-EXEC.
003740   CONSTANT SECTION.
003750   LINKAGE SECTION.
003760      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
003770    01  �k�|�]�ƈ��ԍ�             PIC S9(4).
003780      EXEC SQL END   DECLARE SECTION END-EXEC.
003790    01  �k�|�]�ƈ��I�u�W�F�N�g     OBJECT REFERENCE  CLASS OF SELF.
003800   PROCEDURE DIVISION  USING     �k�|�]�ƈ��ԍ�
003810                       RETURNING �k�|�]�ƈ��I�u�W�F�N�g.
003820*
003830       EXEC SQL
003840           SELECT ����, ���ДN����, �ގДN����, �E��,
003850                  ��{��, ���x��, ���ԊO�蓖, �c�Ǝ���,
003860                  ���ʎ蓖
003870            INTO :�v�|����,:�v�|���ДN����,:�v�|�ގДN����,:�v�|�E��,
003880                 :�v�|��{��,:�v�|���x��,:�v�|���ԊO�蓖,:�v�|�c�Ǝ���,
003890                 :�v�|���ʎ蓖  FROM �]�ƈ��\
003900            WHERE �]�ƈ��ԍ� = :�k�|�]�ƈ��ԍ�
003910       END-EXEC.
003920*
003930       MOVE  �k�|�]�ƈ��ԍ�  TO  �]�ƈ��ԍ� OF MemberMaster-class .
003940       MOVE  �v�|����        TO  ����       OF MemberMaster-class .
003950       MOVE  �v�|���ДN����  TO  ���ДN���� OF MemberMaster-class .
003960       MOVE  �v�|�ގДN����  TO  �ގДN���� OF MemberMaster-class .
003970       MOVE  �v�|�E��        TO  �E��       OF MemberMaster-class .
003980       MOVE  �v�|��{��      TO  ��{��     OF MemberMaster-class .
003990       MOVE  �v�|���x��      TO  ���x��     OF MemberMaster-class .
004000       MOVE  �v�|���ԊO�蓖  TO  ���ԊO�蓖 OF MemberMaster-class .
004010       MOVE  �v�|�c�Ǝ���    TO  �c�Ǝ���   OF MemberMaster-class .
004020       MOVE  �v�|���ʎ蓖    TO  ���ʎ蓖   OF MemberMaster-class .
004030*
004040       IF SQLCODE NOT = 100 AND SQLSTATE NOT = "00000"
004050       THEN
004060           MOVE �r�d�k�d�b�s��  TO �v�|�r�p�k������
004070           INVOKE SELF "ErrorDisplay-method"
004080                        USING �v�|�r�p�k������
004090       END-IF.
004100*
004110       IF SQLCODE NOT = 100
004120       THEN
004130           INVOKE   SELF :: "GETCLASS" "new"  RETURNING  �k�|�]�ƈ��I�u�W�F�N�g
004140           INVOKE   �k�|�]�ƈ��I�u�W�F�N�g  "DataSet-method"
004150       ELSE
004160           SET  �k�|�]�ƈ��I�u�W�F�N�g   TO   NULL
004170       END-IF.
004180*
004190   END METHOD RetAt-method.
004200*
004210*========================================================================
004220*�@���]�ƈ����擾���\�b�h�iNextGet-method�j
004230*
004240*�@�@�@�J�[�\�����]�ƈ��\�̎��̍s�Ɉʒu�Â��C�]�ƈ��ԍ��y�ѐE�������l��
004250*�@�@����B
004260*
004270*�@�Z�o�́F�@�]�ƈ����
004280*�@�@�@�@�@�@�@�@�]�ƈ��ԍ�    PIC S9(4)
004290*�@�@�@�@�@�@�@�@�E��          PIC S9(1)
004300*========================================================================
004310   METHOD-ID.  NextGet-method.
004320   DATA DIVISION.
004330   WORKING-STORAGE SECTION.
004340      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
004350    01  �v�|�]�ƈ��ԍ�       PIC S9(04).
004360    01  �v�|�E��             PIC S9(01).
004370      EXEC SQL END   DECLARE SECTION END-EXEC.
004380   CONSTANT SECTION.
004390   LINKAGE SECTION.
004400    01  �k�|�]�ƈ����.
004410      02  �k�|�]�ƈ��ԍ�       PIC S9(04).
004420      02  �k�|�E��             PIC S9(01).
004430   PROCEDURE DIVISION
004440               RETURNING �k�|�]�ƈ����.
004450*
004460       EXEC SQL
004470         DECLARE CURSOR01 CURSOR FOR
004480          SELECT �]�ƈ��ԍ�, �E�� FROM �]�ƈ��\
004490           FOR UPDATE
004500       END-EXEC.
004510
004520       EXEC SQL
004530         FETCH CURSOR01 INTO :�v�|�]�ƈ��ԍ�, :�v�|�E��
004540       END-EXEC.
004550*
004560       IF SQLCODE NOT = 100 AND SQLSTATE NOT = "00000"
004570       THEN
004580           MOVE �e�d�s�b�g��  TO �v�|�r�p�k������
004590           INVOKE SELF "ErrorDisplay-method"
004600                        USING �v�|�r�p�k������
004610       END-IF.
004620
004630       IF SQLCODE = 100 THEN
004640           MOVE  0                    TO   �k�|�]�ƈ��ԍ�
004650           MOVE  0                    TO   �k�|�E��
004660           EXEC SQL
004670               CLOSE CURSOR01
004680           END-EXEC
004690       ELSE
004700           MOVE  �v�|�]�ƈ��ԍ�       TO   �k�|�]�ƈ��ԍ�
004710           MOVE  �v�|�E��             TO   �k�|�E��
004720       END-IF.
004730*
004740   END METHOD NextGet-method.
004750*
004760*========================================================================
004770*�@�]�ƈ��\�擪�ʒu�Â����\�b�h�iSetTop-method�j
004780*
004790*�@�@�@�J�[�\�����]�ƈ��\�̐擪�s�Ɉʒu�Â��C�擪�s�̏]�ƈ����i�]�ƈ���
004800*�@�@���C�E���j���l������B
004810*
004820*�@�Z�o�́F�@�]�ƈ����
004830*�@�@�@�@�@�@�@�@�]�ƈ��ԍ�    PIC S9(4)
004840*�@�@�@�@�@�@�@�@�E��          PIC S9(1)
004850*========================================================================
004860   METHOD-ID.  SetTop-method.
004870   DATA DIVISION.
004880   WORKING-STORAGE SECTION.
004890      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
004900    01  �v�|�]�ƈ��ԍ�       PIC S9(04).
004910    01  �v�|�E��             PIC S9(01).
004920      EXEC SQL END   DECLARE SECTION END-EXEC.
004930   CONSTANT SECTION.
004940   LINKAGE SECTION.
004950    01  �k�|�]�ƈ����.
004960      02  �k�|�]�ƈ��ԍ�       PIC S9(04).
004970      02  �k�|�E��             PIC S9(01).
004980   PROCEDURE DIVISION
004990                 RETURNING  �k�|�]�ƈ����.
005000*
005010       EXEC SQL
005020           OPEN CURSOR01
005030       END-EXEC.
005040*
005050       IF SQLSTATE NOT = "00000"
005060       THEN
005070           MOVE �n�o�d�m��  TO �v�|�r�p�k������
005080           INVOKE SELF "ErrorDisplay-method"
005090                        USING �v�|�r�p�k������
005100       END-IF.
005110
005120       EXEC SQL
005130           FETCH CURSOR01 INTO :�v�|�]�ƈ��ԍ�, :�v�|�E��
005140       END-EXEC.
005150*
005160       IF SQLCODE NOT = 100 AND SQLSTATE NOT = "00000"
005170       THEN
005180           MOVE �e�d�s�b�g��  TO �v�|�r�p�k������
005190           INVOKE SELF "ErrorDisplay-method"
005200                        USING �v�|�r�p�k������
005210       END-IF.
005220*
005230       IF SQLCODE = 100
005240       THEN
005250           MOVE  0                    TO   �k�|�]�ƈ��ԍ�
005260           MOVE  0                    TO   �k�|�E��
005270           EXEC SQL
005280               CLOSE CURSOR01
005290           END-EXEC
005300       ELSE
005310           MOVE  �v�|�]�ƈ��ԍ�       TO   �k�|�]�ƈ��ԍ�
005320           MOVE  �v�|�E��             TO   �k�|�E��
005330       END-IF.
005340*
005350   END METHOD SetTop-method.
005360*
005370*========================================================================
005380*�@�]�ƈ��f�[�^�폜���\�b�h�iRemoveAt-method�j
005390*
005400*�@�@�@�w�肳�ꂽ�]�ƈ��ԍ��̃��R�[�h���C�]�ƈ��\�y�яZ���\����폜����B
005410*�@�@�@�폜�����������ꍇ�C���A�l�Ƃ��ĂO���C�w�肳�ꂽ�]�ƈ��ԍ��ɑΉ�
005420*�@�@����]�ƈ���񂪑��݂��Ȃ����̗��R����C�폜���s�����ɏI������ꍇ
005430*�@�@�C���A�l�Ƃ��ĂP��ԋp����B
005440*
005450*�@�Z���́F�@�]�ƈ��ԍ�     PIC S9(4)
005460*�@�Z�o�́F�@���A�l         PIC  9(1)
005470*========================================================================
005480   METHOD-ID.  RemoveAt-method.
005490   DATA DIVISION.
005500   WORKING-STORAGE SECTION.
005510   CONSTANT SECTION.
005520   LINKAGE SECTION.
005530     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
005540    01  �k�|�]�ƈ��ԍ�      PIC S9(04).
005550     EXEC SQL END   DECLARE SECTION END-EXEC.
005560    01  �k�|���A�l          PIC  9(01).
005570   PROCEDURE DIVISION
005580               USING    �k�|�]�ƈ��ԍ�   RETURNING   �k�|���A�l.
005590*
005600       EXEC SQL
005610           DELETE FROM �]�ƈ��\ WHERE �]�ƈ��ԍ� = :�k�|�]�ƈ��ԍ�
005620       END-EXEC.
005630*
005640       IF SQLCODE NOT = 100 AND SQLSTATE NOT = "00000"
005650       THEN
005660           MOVE �c�d�k�d�s�d��  TO �v�|�r�p�k������
005670           INVOKE SELF "ErrorDisplay-method"
005680                        USING �v�|�r�p�k������
005690       END-IF.
005700*
005710       IF SQLCODE NOT = 100
005720       THEN
005730           MOVE  0   TO  �k�|���A�l
005740           INVOKE  Address-class  "new"
005750                                   RETURNING       �Z���Q��
005760           INVOKE  �Z���Q��  "RemoveAt-method"
005770                              USING       �k�|�]�ƈ��ԍ�
005780           SET �Z���Q�� TO NULL
005790
005800       ELSE
005810           MOVE  1   TO  �k�|���A�l
005820       END-IF.
005830*
005840   END METHOD RemoveAt-method.
005850*
005860*========================================================================
005870*�@���^�v�Z���\�b�h
005880*
005890*�@�@�@���Ԃ��������邽�߂̒�`�ł���C�T�u�N���X��OVERRIDE����邱�Ƃ�
005900*�@�@���C���߂ĈӖ������B
005910*
005920*�@�Z�o�́F�@���x��  PIC S9(8)
005930*========================================================================
005940   METHOD-ID.  Salary-method.
005950   DATA DIVISION.
005960   LINKAGE SECTION.
005970    01  �k�|���x��          PIC   S9(008).
005980   PROCEDURE   DIVISION    RETURNING   �k�|���x��.
005990   END METHOD  Salary-method.
006000*
006010*========================================================================
006020*�@�ܗ^�v�Z���\�b�h
006030*
006040*�@�@�@���Ԃ��������邽�߂̒�`�ł���C�T�u�N���X��OVERRIDE����邱�Ƃ�
006050*�@�@���C���߂ĈӖ������B
006060*
006070*�@�Z�o�́F�@���x��  PIC S9(8)
006080*========================================================================
006090   METHOD-ID.  Bonus-method.
006100   DATA DIVISION.
006110   LINKAGE SECTION.
006120    01  �k�|���x��          PIC   S9(008).
006130   PROCEDURE   DIVISION    RETURNING   �k�|���x��.
006140   END METHOD Bonus-method.
006150*
006160*========================================================================
006170*�@�ݐЃ`�F�b�N���\�b�h
006180*
006190*�@�Z�o�́F�@�ݐЋ敪  PIC X(1)
006200*========================================================================
006210   METHOD-ID.  IOCheck-method.
006220   DATA DIVISION.
006230   LINKAGE SECTION.
006240    01  �ݐЋ敪        PIC   X(001).
006250   PROCEDURE   DIVISION    RETURNING   �ݐЋ敪.
006260*
006270       IF  �ގДN����     =     SPACE
006280       THEN
006290            MOVE     "0"         TO     �ݐЋ敪
006300       ELSE
006310            MOVE     "1"         TO     �ݐЋ敪
006320       END-IF.
006330*
006340   END METHOD IOCheck-method.
006350*
006360*========================================================================
006370*�@�f�[�^�ݒ胁�\�b�h
006380*
006390*�@�i�P�j�f�[�^�x�[�X�\����ǂݍ��񂾏]�ƈ��f�[�^�̂����́C�S�]�ƈ��ɋ���
006400*�@�@�@�ȃf�[�^���CSELF�̃I�u�W�F�N�g�ɐݒ肷��B
006410*�@�i�Q�j�Z���I�u�W�F�N�g�𐶐����C�f�[�^�x�[�X�\���ǂݍ��񂾃f�[�^���
006420*�@�@�@�肷��B
006430*========================================================================
006440   METHOD-ID.  DataSet-method  PROTOTYPE.
006450   DATA DIVISION.
006460   LINKAGE SECTION.
006470   PROCEDURE DIVISION.
006480   END METHOD DataSet-method.
006490*
006500*========================================================================
006510*�@�]�ƈ��ۑ����\�b�h�iStore-method�j
006520*
006530*�@�i�P�jSELF�I�u�W�F�N�g���ێ�����]�ƈ��f�[�^���]�ƈ��\�ɕۑ�����B
006540*�@�i�Q�jSELF�I�u�W�F�N�g���ێ�����Z���f�[�^�̃I�u�W�F�N�g�Q�Ƃ���C
006550*�@�@  ���̏Z���I�u�W�F�N�g���ێ�����Z���f�[�^���Z���\�ɕۑ�����B
006560*
006570*=======================================================================
006580   METHOD-ID.  Store-method.
006590   ENVIRONMENT         DIVISION.
006600   DATA DIVISION.
006610   WORKING-STORAGE SECTION.
006620      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
006630    01  �v�|�]�ƈ��ԍ�             PIC S9(004).
006640    01  �v�|����                   PIC  X(016).
006650    01  �v�|���ДN����             PIC  X(008).
006660    01  �v�|�ގДN����             PIC  X(008).
006670    01  �v�|�E��                   PIC S9(001).
006680    01  �v�|��{��                 PIC S9(008).
006690    01  �v�|���x��                 PIC S9(008).
006700    01  �v�|���ԊO�蓖             PIC S9(5).
006710    01  �v�|�c�Ǝ���               PIC S9(5)V9(1).
006720    01  �v�|���ʎ蓖               PIC S9(6).
006730      EXEC SQL END   DECLARE SECTION END-EXEC.
006740    01  �v�|�q�d�`�c����           PIC 9(1).
006750   LINKAGE SECTION.
006760   PROCEDURE DIVISION.
006770*
006780       MOVE  �]�ƈ��ԍ�  TO  �v�|�]�ƈ��ԍ�.
006790*
006800       EXEC SQL
006810           SELECT �E��
006820            INTO :�v�|�E��  FROM �]�ƈ��\
006830            WHERE �]�ƈ��ԍ� = :�v�|�]�ƈ��ԍ�
006840       END-EXEC.
006850*
006860       IF SQLCODE NOT = 100 AND SQLSTATE NOT = "00000"
006870       THEN
006880           MOVE �r�d�k�d�b�s��  TO �v�|�r�p�k������
006890           INVOKE SELF "ErrorDisplay-method"
006900                        USING �v�|�r�p�k������
006910       END-IF.
006920*
006930       IF SQLCODE = 100
006940       THEN
006950            MOVE  ���R�[�h�Ȃ�   TO  �v�|�q�d�`�c����
006960       ELSE
006970            MOVE  ���R�[�h����   TO  �v�|�q�d�`�c����
006980       END-IF.
006990*
007000       MOVE  ����        TO  �v�|����.
007010       MOVE  ���ДN����  TO  �v�|���ДN����.
007020       MOVE  �ގДN����  TO  �v�|�ގДN����.
007030       MOVE  �E��        TO  �v�|�E��.
007040       MOVE  ��{��      TO  �v�|��{��.
007050       MOVE  ���x��      TO  �v�|���x��.
007060
007070       IF  �v�|�E�� = 1
007080       THEN
007090           MOVE  ���ʎ蓖    OF MemberMaster-class TO  �v�|���ʎ蓖
007100       ELSE
007110           MOVE  ���ԊO�蓖  OF MemberMaster-class TO  �v�|���ԊO�蓖
007120           MOVE  �c�Ǝ���    OF MemberMaster-class TO  �v�|�c�Ǝ���
007130       END-IF.
007140*
007150       IF  �v�|�q�d�`�c����  =  ���R�[�h�Ȃ�
007160       THEN
007170           IF �v�|�E�� = 1
007180           THEN
007190               EXEC SQL
007200                   INSERT INTO
007210                    �]�ƈ��\(�]�ƈ��ԍ�,����,���ДN����,�ގДN����,�E��,
007220                             ��{��,���x��,���ʎ蓖)
007230                    VALUES(:�v�|�]�ƈ��ԍ�,:�v�|����,:�v�|���ДN����,
007240                           :�v�|�ގДN����,:�v�|�E��,:�v�|��{��,
007250                           :�v�|���x��,:�v�|���ʎ蓖)
007260               END-EXEC
007270           ELSE
007280               EXEC SQL
007290                   INSERT INTO
007300                    �]�ƈ��\(�]�ƈ��ԍ�,����,���ДN����,�ގДN����,�E��,
007310                             ��{��,���x��,���ԊO�蓖,�c�Ǝ���)
007320                    VALUES(:�v�|�]�ƈ��ԍ�,:�v�|����,:�v�|���ДN����,
007330                           :�v�|�ގДN����,:�v�|�E��,:�v�|��{��,
007340                           :�v�|���x��,:�v�|���ԊO�蓖,:�v�|�c�Ǝ���)
007350               END-EXEC
007360           END-IF
007370*
007380           IF SQLSTATE NOT = "00000"
007390           THEN
007400               MOVE �h�m�r�d�q�s��  TO �v�|�r�p�k������
007410               INVOKE SELF "ErrorDisplay-method"
007420                            USING �v�|�r�p�k������
007430           END-IF
007440       END-IF.
007450
007460       IF  �v�|�q�d�`�c����  =  ���R�[�h����
007470           IF �v�|�E�� = 1
007480           THEN
007490               EXEC SQL
007500                   UPDATE �]�ƈ��\
007510                    SET ���� = :�v�|����, ���ДN���� = :�v�|���ДN����,
007520                        �ގДN���� = :�v�|�ގДN����, �E�� = :�v�|�E��,
007530                        ��{�� = :�v�|��{��, ���x�� = :�v�|���x��,
007540                        ���ʎ蓖 = :�v�|���ʎ蓖
007550                     WHERE �]�ƈ��ԍ� = :�v�|�]�ƈ��ԍ�
007560               END-EXEC
007570           ELSE
007580               EXEC SQL
007590                   UPDATE �]�ƈ��\
007600                    SET ���� = :�v�|����, ���ДN���� = :�v�|���ДN����,
007610                        �ގДN���� = :�v�|�ގДN����, �E�� = :�v�|�E��,
007620                        ��{�� = :�v�|��{��, ���x�� = :�v�|���x��,
007630                        ���ԊO�蓖 = :�v�|���ԊO�蓖,
007640                        �c�Ǝ��� = :�v�|�c�Ǝ���
007650                     WHERE �]�ƈ��ԍ� = :�v�|�]�ƈ��ԍ�
007660               END-EXEC
007670           END-IF
007680*
007690           IF SQLSTATE NOT = "00000"
007700           THEN
007710               MOVE �t�o�c�`�s�d��  TO �v�|�r�p�k������
007720               INVOKE SELF "ErrorDisplay-method"
007730                            USING �v�|�r�p�k������
007740           END-IF
007750       END-IF.
007760*
007770       INVOKE  �Z���Q��  "Store-method"  USING  �]�ƈ��ԍ�.
007780*
007790   END METHOD Store-method.
007800*
007810*========================================================================
007820*�@�]�ƈ��f�[�^�X�V���\�b�h�iUpdate-method�j
007830*
007840*      �v�Z���ꂽ�]�ƈ��̑��x���f�[�^���]�ƈ��\�ɕۑ�����B
007850*
007860*�@�Z���́F�@���x��           PIC S9(8)
007870*=======================================================================
007880   METHOD-ID.  Update-method.
007890   ENVIRONMENT         DIVISION.
007900   DATA DIVISION.
007910   WORKING-STORAGE SECTION.
007920      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
007930    01  �v�|�]�ƈ��ԍ�             PIC S9(4).
007940      EXEC SQL END   DECLARE SECTION END-EXEC.
007950   LINKAGE SECTION.
007960      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
007970    01  �k�|���x��                 PIC S9(008).
007980      EXEC SQL END   DECLARE SECTION END-EXEC.
007990   PROCEDURE DIVISION USING �k�|���x��.
008000*
008010       EXEC SQL
008020           UPDATE �]�ƈ��\
008030            SET ���x�� = :�k�|���x��
008040             WHERE CURRENT OF CURSOR01
008050       END-EXEC.
008060*
008070       IF SQLSTATE NOT = "00000"
008080       THEN
008090           MOVE �ʒu�t���t�o�c�`�s�d��  TO  �v�|�r�p�k������
008100           INVOKE SELF "ErrorDisplay-method"
008110                        USING �v�|�r�p�k������
008120       END-IF.
008130*
008140   END METHOD Update-method.
008150*
008160*========================================================================
008170*�@�]�ƈ��f�[�^�ꊇ�X�V���\�b�h�iAllUpdate-method�j
008180*
008190*      �v�Z���ꂽ�S�Ă̏]�ƈ��̑��x���f�[�^���]�ƈ��\�ɕۑ�����B
008200*    ��  �J�[�\�����g�p����UPDATE���i�ʒu�t���j�����DELETE���i�ʒu�t���j
008210*      ���s�\�ȏꍇ�Ɏ��s����郁�\�b�h�ł���B
008220*
008230*�@�Z���́F�@�X�V���
008240*                �X�V�]�ƈ���    PIC  9(2)
008250*                �X�V�]�ƈ����  OCCURS 99
008260*                    �X�V�]�ƈ����  PIC S9(4)
008270*                    �X�V�]�ƈ����  PIC S9(8)
008280*=======================================================================
008290   METHOD-ID.  AllUpdate-method.
008300   ENVIRONMENT         DIVISION.
008310   DATA DIVISION.
008320   WORKING-STORAGE SECTION.
008330      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
008340    01  �v�|�]�ƈ��ԍ�             PIC S9(4).
008350    01  �v�|���x��                 PIC S9(8).
008360      EXEC SQL END   DECLARE SECTION END-EXEC.
008370   LINKAGE SECTION.
008380    01  �k�|�X�V���.
008390       02  �k�|�X�V�]�ƈ���            PIC 9(2).
008400       02  �k�|�X�V�]�ƈ����          OCCURS 99.
008410          03  �k�|�X�V�]�ƈ��ԍ�          PIC S9(04).
008420          03  �k�|�X�V���x��              PIC S9(08).
008430   PROCEDURE DIVISION USING �k�|�X�V���.
008440*
008450       MOVE �t�o�c�`�s�d��  TO  �v�|�r�p�k������
008460*
008470       PERFORM UNTIL �k�|�X�V�]�ƈ��� = 0
008480           MOVE  �k�|�X�V�]�ƈ��ԍ�(�k�|�X�V�]�ƈ���)
008490                                   TO  �v�|�]�ƈ��ԍ�
008500           MOVE  �k�|�X�V���x��(�k�|�X�V�]�ƈ���)
008510                                   TO  �v�|���x��
008520           EXEC SQL
008530               UPDATE �]�ƈ��\
008540                SET ���x�� = :�v�|���x��
008550                 WHERE �]�ƈ��ԍ� = :�v�|�]�ƈ��ԍ�
008560           END-EXEC
008570*
008580           IF SQLSTATE NOT = "00000"
008590           THEN
008600               INVOKE SELF "ErrorDisplay-method"
008610                            USING �v�|�r�p�k������
008620           END-IF
008630           SUBTRACT  1  FROM �k�|�X�V�]�ƈ���
008640       END-PERFORM.
008650*
008660   END METHOD AllUpdate-method.
008670*
008680*========================================================================
008690*�@�f�[�^�x�[�X�A�N�Z�X�G���[�\�����\�b�h�iErrorDisplay-method�j
008700*
008710*      �f�[�^�x�[�X�A�N�Z�X���ɃG���[�����������ꍇ�ɁC�G���[���e��\����
008720*    �āC�A�v���P�[�V�������I������B
008730*      �Ȃ��C�b�n�m�m�d�b�s���ȊO�ŃG���[�����������ꍇ�́A�R�l�N�V������
008740*    �ؒf���s���B
008750*
008760*�@�Z���́F�@�r�p�k������     PIC 9(2)
008770*========================================================================
008780   METHOD-ID.  ErrorDisplay-method.
008790   ENVIRONMENT         DIVISION.
008800   DATA DIVISION.
008810   LINKAGE SECTION.
008820    01  �k�|�r�p�k������    PIC 9(2).
008830   PROCEDURE DIVISION USING  �k�|�r�p�k������.
008840*
008850       DISPLAY NC"�f�[�^�x�[�X�A�N�Z�X���ɃG���[���������܂���".
008860       DISPLAY " ".
008870       DISPLAY "SQLSTATE :" SQLSTATE.
008880       DISPLAY "SQLMSG   :" SQLMSG.
008890*
008900       IF  �k�|�r�p�k������  NOT =  �b�n�m�m�d�b�s��
008910       THEN
008920           EXEC SQL
008930               ROLLBACK WORK
008940           END-EXEC
008950*
008960           EXEC SQL
008970               DISCONNECT DEFAULT
008980           END-EXEC
008990       END-IF.
009000*
009010       DISPLAY NC"�A�v���P�[�V�������I�����܂�".
009020       STOP RUN.
009030*
009040   END METHOD ErrorDisplay-method.
009050*
009060   END OBJECT.
009070  END CLASS AllMember-class.
