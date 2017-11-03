000100*=======================================================================
000200*�@�f�B�N�V���i���m�[�h�N���X�iDictionarytNode-class�j�|�T���v���N���X�|
000300*
000400*�@�@�@�f�B�N�V���i���\���ɂ��I�u�W�F�N�g�Ǘ��ł́C�P�v�f���\������f
000500*�@�@�[�^�Ƃ���ɑ΂���葱��
000600*
000700*�@�Z�p���N���X
000800*�@�@�@FJBASE
000900*
001000*�@�Z�I�u�W�F�N�g�f�[�^
001100*      �ΏۃI�u�W�F�N�g  OBJECT  REFERENCE
001200*      �L�[����          PIC 9(02)
001300*      �L�[              PIC X  OCCURS 10 DEPENDING ON �L�[����
001400*      ���̗v�f          OBJECT  REFERENCE
001500*      �O�̗v�f          OBJECT  REFERENCE
001600*�@�@�@�T���ؗv�f        OBJECT  REFERENCE
001700*
001800*�@�Z�I�u�W�F�N�g���\�b�h
001900*�@�@�P�j�L�[�ݒ胁�\�b�h (Set-Key)
002000*�@�@�Q�j�L�[�Q�ƃ��\�b�h (Get-Key)
002100*
002200*        Copyright 1997-2015 FUJITSU LIMITED
002300*=======================================================================
002400 CLASS-ID.  DictionaryNode-class  INHERITS  FJBASE.
002500 ENVIRONMENT  DIVISION.
002600 CONFIGURATION  SECTION.
002700   REPOSITORY.
002800     CLASS  FJBASE.
002900*
003000   OBJECT.
003100   DATA  DIVISION.
003200   WORKING-STORAGE  SECTION.
003300   01  �L�[����          PIC 9(02).
003400   01  �L�[.
003500     02                  PIC X  OCCURS 10 DEPENDING ON �L�[����.
003600   01  �ΏۃI�u�W�F�N�g  OBJECT  REFERENCE  PROPERTY.
003700   01  ���̗v�f          OBJECT  REFERENCE  PROPERTY.
003800   01  �O�̗v�f          OBJECT  REFERENCE  PROPERTY.
003900   01  �T���ؗv�f        OBJECT  REFERENCE  PROPERTY.
004000   PROCEDURE  DIVISION.
004100*
004200*=======================================================================
004300*�@�L�[�ݒ胁�\�b�h�iSet-Key�j
004400*
004500*�@�Z���́F�@�L�[�l�@�@�@�@�@�iPIC  X ANY LENGTH�j
004600*=======================================================================
004700   METHOD-ID.  Set-Key.
004800   DATA DIVISION.
004900   LINKAGE SECTION.
005000   01  �k�|�L�[       PIC  X ANY LENGTH.
005100   PROCEDURE DIVISION  USING  �k�|�L�[.
005200      COMPUTE  �L�[����  =  FUNCTION LENGTH (�k�|�L�[)
005300      MOVE  �k�|�L�[  TO  �L�[
005400   END METHOD  Set-Key.
005500*
005600*=======================================================================
005700*�@�L�[�Q�ƃ��\�b�h�iSet-Key�j
005800*
005900*�@�Z�o�́F�@�L�[�l�@�@�@�@�@�iPIC  X ANY LENGTH�j
006000*=======================================================================
006100   METHOD-ID.  Get-Key.
006200   DATA DIVISION.
006300   LINKAGE SECTION.
006400   01  �k�|�L�[       PIC  X ANY LENGTH.
006500   PROCEDURE DIVISION  RETURNING  �k�|�L�[.
006600      MOVE  �L�[  TO  �k�|�L�[
006700   END METHOD  Get-Key.
006800*
006900   END  OBJECT.
007000 END  CLASS  DictionaryNode-class.
