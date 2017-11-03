000010*========================================================================
000020*�@�Z���N���X�iAddress-class�j�@�@�@�|�T���v���v���O�����u�]�ƈ��Ǘ��v�|
000030*
000040*�@�@�@�]�ƈ��ЂƂ�ɑ΂���Z���f�[�^�ƁC������Q�ƁE�X�V���邽�߂̃��\
000050*    �b�h�����B
000060*
000070*�@�Z�p���N���X
000080*�@�@�@FJBASE
000090*
000100*�@�Z�Q�ƃN���X
000110*�@�@�@�Z���}�X�^�N���X�iAddressMaster-class�j
000120*
000130*�@�Z�I�u�W�F�N�g�f�[�^
000140*�@�@�@�X�֔ԍ�
000150*�@�@�@�Z��
000160*
000170*�@�Z�I�u�W�F�N�g���\�b�h
000180*�@�@�P�j�f�[�^�ݒ�@�@�@�@�iDataSet-method�j
000190*�@�@�Q�j�f�[�^�ۑ��@�@�@�@�iStore-method�j
000200*�@�@�R�j�f�[�^�폜�@�@�@�@�iRemoveAt-method�j
000210*�@  �S�j�G���[�\���@�@�@�@�iErrorDisplay-method�j
000220*
000230*                              Copyright 1998-2015 FUJITSU LIMITED
000240*========================================================================
000250 CLASS-ID.   Address-class INHERITS FJBASE.
000260 ENVIRONMENT    DIVISION.
000270 CONFIGURATION    SECTION.
000280 SPECIAL-NAMES.
000290      SYMBOLIC CONSTANT
000300       ���R�[�h����            IS    0
000310       ���R�[�h�Ȃ�            IS    1
000320
000330       �r�d�k�d�b�s��          IS    3
000340       �h�m�r�d�q�s��          IS    4
000350       �t�o�c�`�s�d��          IS    5
000360       �c�d�k�d�s�d��          IS    6.
000370*
000380 REPOSITORY.
000390     CLASS FJBASE.
000400*
000410   OBJECT.
000420   DATA DIVISION.
000430   WORKING-STORAGE SECTION.
000440    01  �Z���h�c             PIC   S9(004) PROPERTY.
000450    01  �X�֔ԍ�             PIC    X(007) PROPERTY.
000460    01  �Z��                 PIC    X(040) PROPERTY.
000470*
000480      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
000490    01  SQLSTATE             PIC    X(5).
000500    01  SQLCODE              PIC   S9(9) COMP-5.
000510    01  SQLMSG               PIC    X(256).
000520      EXEC SQL END   DECLARE SECTION END-EXEC.
000530    01  �v�|�r�p�k������     PIC    9(2).
000540*
000550   PROCEDURE DIVISION.
000560*
000570*========================================================================
000580*�@�Z���f�[�^�폜���\�b�h
000590*
000600*�@�@�@�w�肳�ꂽ�Z�����ʂ̏Z�������폜����B
000610*
000620*�@�Z���́F�@�Z�����ʁ@  PIC S9(4)
000630*========================================================================
000640   METHOD-ID. RemoveAt-method.
000650   DATA DIVISION.
000660   LINKAGE SECTION.
000670     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
000680   01 �k�|�Z������          PIC S9(04).
000690     EXEC SQL END   DECLARE SECTION END-EXEC.
000700   PROCEDURE DIVISION
000710                USING  �k�|�Z������.
000720*
000730       EXEC SQL
000740           DELETE FROM �Z���\ WHERE �Z������ = :�k�|�Z������
000750       END-EXEC.
000760*
000770       IF SQLCODE NOT = 100 AND SQLSTATE NOT = "00000"
000780       THEN
000790           MOVE �c�d�k�d�s�d��  TO  �v�|�r�p�k������
000800           INVOKE SELF "ErrorDisplay-method"
000810                        USING �v�|�r�p�k������
000820       END-IF.
000830*
000840   END METHOD RemoveAt-method.
000850*
000860*========================================================================
000870*�@�Z���f�[�^�ݒ胁�\�b�h
000880*
000890*�@�@�@�w�肳�ꂽ�Z�����ʂ̏Z�������Z���\���ǂݍ��݁C�I�u�W�F�N�g�f�[
000900*�@�@�^�ɐݒ肷��D
000910*
000920*�@�Z���́F�@�Z���h�c�@  PIC S9(4)
000930*========================================================================
000940   METHOD-ID. DataSet-method.
000950   DATA DIVISION.
000960   WORKING-STORAGE SECTION.
000970     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
000980   01  �v�|�X�֔ԍ�         PIC   X(007).
000990   01  �v�|�Z��             PIC   X(040).
001000     EXEC SQL END   DECLARE SECTION END-EXEC.
001010   LINKAGE SECTION.
001020     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
001030   01 �k�|�Z������          PIC  S9(04).
001040     EXEC SQL END   DECLARE SECTION END-EXEC.
001050   PROCEDURE DIVISION
001060             USING  �k�|�Z������.
001070*
001080       EXEC SQL
001090           SELECT �X�֔ԍ�, �Z�� INTO :�v�|�X�֔ԍ�, :�v�|�Z��
001100            FROM �Z���\
001110             WHERE �Z������ = :�k�|�Z������
001120       END-EXEC.
001130*
001140       IF SQLCODE NOT = 100 AND SQLSTATE NOT = "00000"
001150       THEN
001160           MOVE �r�d�k�d�b�s��  TO  �v�|�r�p�k������
001170           INVOKE SELF "ErrorDisplay-method"
001180                        USING �v�|�r�p�k������
001190       END-IF.
001200*
001210       MOVE �v�|�X�֔ԍ�  TO  �X�֔ԍ�.
001220       MOVE �v�|�Z��      TO  �Z��.
001230*
001240   END METHOD DataSet-method.
001250*
001260*========================================================================
001270*�@�Z���f�[�^�ۑ����\�b�h
001280*
001290*�@�@�@�I�u�W�F�N�g�f�[�^���ێ�����Z�������C�Z���\�ɕۑ�����B
001300*
001310*�@�Z���́F�@�Z�����ʁ@  PIC S9(4)
001320*========================================================================
001330   METHOD-ID. Store-method.
001340   DATA DIVISION.
001350   WORKING-STORAGE SECTION.
001360   01  �v�|�q�d�`�c����     PIC 9(01).
001370     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
001380   01  �v�|�X�֔ԍ�         PIC   X(007).
001390   01  �v�|�Z��             PIC   X(040).
001400     EXEC SQL END   DECLARE SECTION END-EXEC.
001410   LINKAGE SECTION.
001420     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
001430   01 �k�|�Z������          PIC  S9(04).
001440     EXEC SQL END   DECLARE SECTION END-EXEC.
001450   PROCEDURE DIVISION
001460                USING  �k�|�Z������.
001470*
001480       IF  �k�|�Z������  =  0
001490       THEN
001500           EXIT METHOD
001510       END-IF.
001520*
001530       EXEC SQL
001540           SELECT �X�֔ԍ�, �Z�� INTO :�v�|�X�֔ԍ�, :�v�|�Z��
001550            FROM �Z���\
001560             WHERE �Z������ = :�k�|�Z������
001570       END-EXEC.
001580*
001590       IF SQLCODE NOT = 100 AND SQLSTATE NOT = "00000"
001600       THEN
001610           MOVE �r�d�k�d�b�s��  TO  �v�|�r�p�k������
001620           INVOKE SELF "ErrorDisplay-method"
001630                        USING �v�|�r�p�k������
001640       END-IF.
001650*
001660       IF SQLCODE = 100
001670       THEN
001680             MOVE  ���R�[�h�Ȃ�   TO  �v�|�q�d�`�c����
001690       ELSE
001700             MOVE  ���R�[�h����   TO  �v�|�q�d�`�c����
001710       END-IF.
001720*
001730       MOVE �X�֔ԍ�      TO  �v�|�X�֔ԍ�.
001740       MOVE �Z��          TO  �v�|�Z��.
001750*
001760       IF  �v�|�q�d�`�c���� =  ���R�[�h�Ȃ�
001770       THEN
001780           EXEC SQL
001790               INSERT INTO �Z���\
001800                VALUES(:�k�|�Z������, :�v�|�X�֔ԍ�, :�v�|�Z��)
001810           END-EXEC
001820*
001830           IF SQLSTATE NOT = "00000"
001840           THEN
001850               MOVE �h�m�r�d�q�s��  TO  �v�|�r�p�k������
001860               INVOKE SELF "ErrorDisplay-method"
001870                            USING �v�|�r�p�k������
001880           END-IF
001890       ELSE
001900           EXEC SQL
001910               UPDATE �Z���\ SET
001920                �X�֔ԍ� = :�v�|�X�֔ԍ�, �Z�� = :�v�|�Z��
001930                 WHERE �Z������ = :�k�|�Z������
001940           END-EXEC
001950*
001960           IF SQLSTATE NOT = "00000"
001970           THEN
001980               MOVE �t�o�c�`�s�d��  TO  �v�|�r�p�k������
001990               INVOKE SELF "ErrorDisplay-method"
002000                            USING �v�|�r�p�k������
002010           END-IF
002020       END-IF.
002030*
002040   END METHOD Store-method.
002050*
002060*========================================================================
002070*�@�f�[�^�x�[�X�A�N�Z�X�G���[�\�����\�b�h�iErrorDisplay-method�j
002080*
002090*      �f�[�^�x�[�X�A�N�Z�X���ɃG���[�����������ꍇ�ɁC�G���[���e��\����
002100*    �āC�R�l�N�V������ؒf���C�A�v���P�[�V�������I������B
002110*========================================================================
002120   METHOD-ID.  ErrorDisplay-method.
002130   ENVIRONMENT         DIVISION.
002140   DATA DIVISION.
002150   LINKAGE SECTION.
002160    01  �k�|�r�p�k������    PIC 9(2).
002170   PROCEDURE DIVISION USING  �k�|�r�p�k������.
002180*
002190       DISPLAY NC"�f�[�^�x�[�X�A�N�Z�X���ɃG���[���������܂���".
002200       DISPLAY " ".
002210       DISPLAY "SQLSTATE :" SQLSTATE.
002220       DISPLAY "SQLMSG   :" SQLMSG.
002230*
002240       EXEC SQL
002250           ROLLBACK WORK
002260       END-EXEC.
002270*
002280       EXEC SQL
002290           DISCONNECT DEFAULT
002300       END-EXEC.
002310*
002320       DISPLAY NC"�A�v���P�[�V�������I�����܂�".
002330       STOP RUN.
002340*
002350   END METHOD ErrorDisplay-method.
002360*
002370   END OBJECT.
002380 END CLASS Address-class.
