000100*========================================================================
000200*�@�Z���}�X�^�N���X�iAddressMaster-class�j
000300*�@�@�@�@�@�@�@�@�@�@�@�@�|�T���v���v���O�����u�]�ƈ��Ǘ��i�i�����j�v�|
000400*
000500*�@�@�@�Z�����̕ۑ������̂��߂̃f�[�^�y�у��\�b�h�����B
000600*
000700*�@�Z�I�u�W�F�N�g�f�[�^
000800*�@�@�P�j�X�֔ԍ�
000900*�@�@�Q�j�Z��
001000*
001100*�@�Z�t�@�N�g�����\�b�h
001200*�@�@�P�j�Z���f�[�^�擾�@�@�@�@�iRetAt-method�j
001300*�@�@�Q�j�Z���f�[�^�ۑ�        �iStore-method�j
001400*�@�@�R�j�Z���f�[�^�폜�@�@�@�@�iRemoveAt-method�j
001500*�@�@�S�j�Z���}�X�^�n�o�d�m�@�@�iOpen-method�j
001600*�@�@�T�j�Z���}�X�^�b�k�n�r�d�@�iClose-method�j
001700*
001800*                              Copyright 1997-2015 FUJITSU LIMITED
001900*========================================================================
002000 CLASS-ID .   AddressMaster-class.
002100 ENVIRONMENT   DIVISION .
002200 CONFIGURATION   SECTION.
002300 SPECIAL-NAMES.
002400      SYMBOLIC CONSTANT
002500       ���R�[�h����    is    0
002600       ���R�[�h�Ȃ�    is    1
002700       ��ʃ��R�[�h��  is   63
002800       �Ǘ����R�[�h��  is   59.
002900*
003000   FACTORY.
003100   ENVIRONMENT   DIVISION .
003200   INPUT-OUTPUT         SECTION.
003300   FILE-CONTROL.
003400     SELECT  �Z���}�X�^      ASSIGN             TO  SYS007
003500                             ORGANIZATION       IS  INDEXED
003600                             ACCESS  MODE       IS  DYNAMIC
003700                             RECORD  KEY        IS  �Z���|�L�[.
003800   DATA                 DIVISION .
003900   FILE                 SECTION.
004000    FD  �Z���}�X�^.
004100    01  �Z���|���R�[�h.
004200      02  �Z���|�L�[.
004300        03  �Z���|�h�c       PIC   9(004).
004400      02  �Z���|�X�֔ԍ�     PIC   X(007).
004500      02  �Z���|�Z��         PIC   N(020).
004600   WORKING-STORAGE SECTION.
004700    01  �Z���h�c             PIC   9(004) PROPERTY.
004800    01  �X�֔ԍ�             PIC   X(007) PROPERTY.
004900    01  �Z��                 PIC   N(020) PROPERTY.
005000   PROCEDURE  DIVISION .
005100*
005200*========================================================================
005300*�@�Z����񕜌����\�b�h
005400*
005500*�@�@�@�w�肳�ꂽ�Z���h�c�̏Z�������Z���}�X�^���ǂݍ��݁C�t�@�N�g��
005600*�@�@�f�[�^�ɐݒ肷��D
005700*
005800*�@�Z���́F�@�Z���h�c�@  PIC 9(4)
005900*�@�Z�o�́F�@���A�l      PIC 9(1)
006000*========================================================================
006100   METHOD-ID. RetAt-method.
006200   DATA DIVISION.
006300   LINKAGE SECTION.
006400   01 �k�|�Z���h�c          PIC 9(04).
006500   01 �k�|���A�l            PIC 9(01).
006600   PROCEDURE DIVISION
006700             USING  �k�|�Z���h�c  RETURNING  �k�|���A�l.
006800*
006900       MOVE    �k�|�Z���h�c        TO  �Z���|�h�c.
007000       READ   �Z���}�X�^
007100         INVALID KEY
007200           MOVE    1               TO  �k�|���A�l
007300         NOT INVALID KEY
007400           MOVE   �Z���|�X�֔ԍ�   TO  �X�֔ԍ�
007500           MOVE   �Z���|�Z��       TO  �Z��
007600           MOVE  0                 TO  �k�|���A�l
007700       END-READ.
007800*
007900   END METHOD RetAt-method.
008000*
008100*=======================================================================
008200*�@�Z�����ۑ����\�b�h
008300*
008400*�@�@�@�����\�b�h���Ăяo���ꂽ���_�Ńt�@�N�g���f�[�^�Ɋi�[����Ă���Z
008500*�@�@�������C�Z���}�X�^�ɏ������ށD
008600*�@�@�@�Ȃ��C�Z���h�c���O�̂Ƃ��́C�������Ȃ��D
008700*========================================================================
008800   METHOD-ID. Store-method.
008900   ENVIRONMENT  DIVISION .
009000   DATA DIVISION.
009100   WORKING-STORAGE SECTION.
009200    01  �v�|�q�d�`�c����    PIC 9(01).
009300   LINKAGE SECTION.
009400   PROCEDURE DIVISION.
009500*
009600       IF  �Z���h�c  =  0
009700       THEN
009800           EXIT METHOD
009900       ELSE
010000           MOVE  �Z���h�c       TO  �Z���|�h�c
010100       END-IF.
010200*
010300       READ  �Z���}�X�^
010400         INVALID KEY
010500             MOVE  ���R�[�h�Ȃ�   TO  �v�|�q�d�`�c����
010600         NOT INVALID KEY
010700             MOVE  ���R�[�h����   TO  �v�|�q�d�`�c����
010800       END-READ.
010900*
011000       MOVE   �X�֔ԍ�   TO  �Z���|�X�֔ԍ�
011100       MOVE   �Z��       TO  �Z���|�Z��
011200*
011300       IF  �v�|�q�d�`�c���� =  ���R�[�h�Ȃ�
011400       THEN
011500           WRITE    �Z���|���R�[�h
011600       ELSE
011700           REWRITE �Z���|���R�[�h
011800       END-IF.
011900*
012000   END METHOD Store-method.
012100*
012200*========================================================================
012300*�@�Z�����폜���\�b�h
012400*
012500*�@�@�@�w�肳�ꂽ�Z���h�c�̏Z�������C�Z���}�X�^���폜����B
012600*�@�@�@�폜�����������ꍇ�C���A�l�Ƃ��ĂO���C�w�肳�ꂽ�Z���h�c�̃��R�[
012700*�@�@�h�����݂��Ȃ����̗��R����C�폜���s�����ɏI������ꍇ�C���A�l�Ƃ�
012800*    �ĂP��ԋp����B
012900*
013000*�@�Z���́F�@�Z���h�c�@   PIC 9(4)
013100*�@�Z�o�́F�@���A�l       PIC 9(1)
013200*========================================================================
013300   METHOD-ID. RemoveAt-method.
013400   DATA DIVISION.
013500   LINKAGE SECTION.
013600   01 �k�|�Z���h�c          PIC 9(04).
013700   01 �k�|���A�l            PIC 9(1).
013800   PROCEDURE DIVISION
013900             USING  �k�|�Z���h�c   RETURNING  �k�|���A�l.
014000*
014100       MOVE    �k�|�Z���h�c  TO  �Z���|�h�c.
014200       DELETE  �Z���}�X�^
014300         INVALID KEY
014400           MOVE  1   TO  �k�|���A�l
014500         NOT INVALID KEY
014600           MOVE  0   TO  �k�|���A�l
014700       END-DELETE.
014800*
014900   END METHOD RemoveAt-method.
015000*
015100*========================================================================
015200*�@�Z���}�X�^�t�@�C���n�o�d�m���\�b�h
015300*
015400*�@�@�@�Z���}�X�^�t�@�C�����h�|�n���[�h�łn�o�d�m����B
015500*
015600*========================================================================
015700   METHOD-ID. Open-method.
015800   DATA DIVISION.
015900   LINKAGE SECTION.
016000   PROCEDURE DIVISION.
016100*
016200       OPEN I-O   �Z���}�X�^.
016300*
016400   END METHOD Open-method.
016500*
016600*========================================================================
016700*�@�Z���}�X�^�t�@�C���b�k�n�r�d���\�b�h
016800*
016900*�@�@�@�Z���}�X�^�t�@�C�����b�k�n�r�d����B
017000*
017100*========================================================================
017200   METHOD-ID. Close-method.
017300   DATA DIVISION.
017400   LINKAGE SECTION.
017500   PROCEDURE DIVISION.
017600*
017700       Close �Z���}�X�^.
017800*
017900   END METHOD Close-method.
018000*
018100   END FACTORY.
018200  END CLASS  AddressMaster-class.
