000100*========================================================================
000200*�@�Z���N���X�iAddress-class�j�@�@�@�|�T���v���v���O�����u�]�ƈ��Ǘ��v�|
000300*
000400*�@�@�@�]�ƈ��ЂƂ�ɑ΂���Z���f�[�^�ƁC������Q�ƁE�X�V���邽�߂̃��\
000500*    �b�h�����B
000600*
000700*�@�Z�p���N���X
000800*�@�@�@�e����������
000900*
001000*�@�Z�Q�ƃN���X
001100*�@�@�@�Z���}�X�^�N���X�iAddressMaster-class�j
001200*
001300*�@�Z�I�u�W�F�N�g�f�[�^
001400*�@�@�@�X�֔ԍ�
001500*�@�@�@�Z��
001600*
001700*�@�Z�I�u�W�F�N�g���\�b�h
001800*�@�@�P�j�f�[�^�ݒ�@    �@ �iDataSet-method�j
001900*�@�@�Q�j�f�[�^�ۑ��@    �@ �iStore-method�j
002000*�@�@�R�j�f�[�^�폜�@    �@ �iRemoveAt-method�j
002100*�@�@�S�j�}�X�^�t�@�C��OPEN �iOpen-method�j
002200*�@�@�T�j�}�X�^�t�@�C��CLOSE�iCLose-method�j
002300*
002400*                              Copyright 1997-2015 FUJITSU LIMITED
002500*========================================================================
002600 CLASS-ID.   Address-class INHERITS FJBASE.
002700 ENVIRONMENT    DIVISION.
002800 CONFIGURATION    SECTION.
002900 REPOSITORY.
003000     CLASS AddressMaster-class
003100     CLASS FJBASE.
003200*
003300   FACTORY.
003400   PROCEDURE DIVISION.
003500*
003600*========================================================================
003700*�@�Z���f�[�^�폜���\�b�h
003800*
003900*�@�@�@�w�肳�ꂽ�Z���h�c�̏Z�������폜����B
004000*
004100*�@�Z���́F�@�Z���h�c�@  PIC 9(4)
004200*========================================================================
004300   METHOD-ID. RemoveAt-method.
004400   DATA DIVISION.
004500   LINKAGE SECTION.
004600   01 �k�|�Z���h�c          PIC 9(04).
004700   PROCEDURE DIVISION
004800                USING  �k�|�Z���h�c.
004900*
005000       INVOKE  AddressMaster-class  "RemoveAt-method"
005100                                               USING   �k�|�Z���h�c.
005200*
005300   END METHOD RemoveAt-method.
005400*
005500*========================================================================
005600*�@�Z���}�X�^�t�@�C���n�o�d�m���\�b�h
005700*
005800*�@�@�@�Z���}�X�^�t�@�C�����n�o�d�m����B
005900*
006000*========================================================================
006100   METHOD-ID. Open-method.
006200   DATA DIVISION.
006300   LINKAGE SECTION.
006400   PROCEDURE DIVISION.
006500*
006600       INVOKE  AddressMaster-class  "Open-method".
006700*
006800   END METHOD Open-method.
006900*
007000*========================================================================
007100*�@�Z���}�X�^�t�@�C���b�k�n�r�d���\�b�h
007200*
007300*�@�@�@�Z���}�X�^�t�@�C�����b�k�n�r�d����B
007400*
007500*========================================================================
007600   METHOD-ID. Close-method.
007700   DATA DIVISION.
007800   LINKAGE SECTION.
007900   PROCEDURE DIVISION.
008000*
008100       INVOKE  AddressMaster-class  "CLose-method".
008200*
008300   END METHOD CLose-method.
008400*
008500   END FACTORY.
008600*
008700   OBJECT.
008800   DATA DIVISION.
008900   WORKING-STORAGE SECTION.
009000   01  �X�֔ԍ�             PIC   X(007) PROPERTY.
009100   01  �Z��                 PIC   N(020) PROPERTY.
009200   PROCEDURE DIVISION.
009300*
009400*========================================================================
009500*�@�Z���f�[�^�ݒ胁�\�b�h
009600*
009700*�@�@�@�w�肳�ꂽ�Z���h�c�̏Z�������Z���}�X�^���ǂݍ��݁C�I�u�W�F�N�g
009800*�@�@�f�[�^�ɐݒ肷��D
009900*
010000*�@�Z���́F�@�Z���h�c�@  PIC 9(4)
010100*========================================================================
010200   METHOD-ID. DataSet-method.
010300   DATA DIVISION.
010400   LINKAGE SECTION.
010500   01 �k�|�Z���h�c          PIC 9(04).
010600   PROCEDURE DIVISION
010700             USING  �k�|�Z���h�c.
010800*
010900       INVOKE  AddressMaster-class  "RetAt-method"  USING  �k�|�Z���h�c.
011000       MOVE    �X�֔ԍ�  OF  AddressMaster-class  TO  �X�֔ԍ�.
011100       MOVE    �Z��      OF  AddressMaster-class  TO  �Z��.
011200*
011300   END METHOD DataSet-method.
011400*
011500*========================================================================
011600*�@�Z���f�[�^�ۑ����\�b�h
011700*
011800*�@�@�@�I�u�W�F�N�g�f�[�^���ێ�����Z�������C�]�ƈ��}�X�^�t�@�C���ɕ�
011900*�@�@������B
012000*
012100*�@�Z���́F�@�Z���h�c�@  PIC 9(4)
012200*========================================================================
012300   METHOD-ID. Store-method.
012400   DATA DIVISION.
012500   LINKAGE SECTION.
012600   01 �k�|�Z���h�c          PIC 9(04).
012700   PROCEDURE DIVISION
012800                USING  �k�|�Z���h�c.
012900*
013000       MOVE   �k�|�Z���h�c    TO  �Z���h�c    OF  AddressMaster-class.
013100       MOVE   �X�֔ԍ�        TO  �X�֔ԍ�    OF  AddressMaster-class.
013200       MOVE   �Z��            TO  �Z��        OF  AddressMaster-class.
013300       INVOKE  AddressMaster-class  "Store-method".
013400*
013500   END METHOD Store-method.
013600*
013700   END OBJECT.
013800 END CLASS Address-class.
