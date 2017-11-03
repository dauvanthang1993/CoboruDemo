000100*======================================================================
000200*�@�񕪒T���؃N���X�iBinaryTree-class�j�@�@�@�@�@�@�|�T���v���N���X�|
000300*
000400*�@�@�@�񕪒T���؂̂P�v�f���\������f�[�^�ƁC����ɑ΂���葱��
000500*
000600*�@�Z�p���N���X
000700*�@�@�@FJBASE
000800*
000900*�@�Z�Q�ƃN���X
001000*�@�@�@DictionaryNode-class
001100*
001200*�@�Z�I�u�W�F�N�g�f�[�^
001300*      �L�[����          PIC 9(02)
001400*      �L�[              PIC X  OCCURS 10 DEPENDING ON �L�[����
001500*      �Ώۗv�f          OBJECT  REFERENCE  DictionaryNode-class
001600*      ��������          OBJECT  REFERENCE
001700*      �E������          OBJECT  REFERENCE
001800*
001900*�@�Z�I�u�W�F�N�g���\�b�h
002000*�@�@�P�j�L�[�ݒ胁�\�b�h (Set-Key)
002100*�@�@�Q�j�L�[�Q�ƃ��\�b�h (Get-Key)
002200*
002300*        Copyright 1997-2015 FUJITSU LIMITED
002400*======================================================================
002500 CLASS-ID.  BinaryTree-class  INHERITS  FJBASE.
002600 ENVIRONMENT  DIVISION.
002700 CONFIGURATION  SECTION.
002800   REPOSITORY.
002900     CLASS  DictionaryNode-class
003000     CLASS  FJBASE.
003100*
003200   OBJECT.
003300   DATA  DIVISION.
003400   WORKING-STORAGE  SECTION.
003500   01  �L�[����       PIC 9(02).
003600   01  �L�[.
003700     02               PIC X  OCCURS 10 DEPENDING ON �L�[����.
003800   01  �Ώۗv�f       OBJECT  REFERENCE  DictionaryNode-class  PROPERTY.
003900   01  ��������       OBJECT  REFERENCE  PROPERTY.
004000   01  �E������       OBJECT  REFERENCE  PROPERTY.
004100   PROCEDURE  DIVISION.
004200*
004300*=======================================================================
004400*�@�L�[�ݒ胁�\�b�h�iSet-Key�j
004500*
004600*�@�Z���́F�@�L�[�l�@�@�@�@�@�iPIC  X ANY LENGTH�j
004700*=======================================================================
004800   METHOD-ID.  Set-Key.
004900   DATA DIVISION.
005000   LINKAGE SECTION.
005100   01  �k�|�L�[       PIC X  ANY LENGTH.
005200   PROCEDURE DIVISION  USING  �k�|�L�[.
005300      COMPUTE  �L�[����  =  FUNCTION LENGTH (�k�|�L�[)
005400      MOVE  �k�|�L�[  TO  �L�[
005500   END METHOD  Set-Key.
005600*
005700*=======================================================================
005800*�@�L�[�Q�ƃ��\�b�h�iSet-Key�j
005900*
006000*�@�Z�o�́F�@�L�[�l�@�@�@�@�@�iPIC  X ANY LENGTH�j
006100*=======================================================================
006200   METHOD-ID.  Get-Key.
006300   DATA DIVISION.
006400   LINKAGE SECTION.
006500   01  �k�|�L�[       PIC  X ANY LENGTH.
006600   PROCEDURE DIVISION  RETURNING  �k�|�L�[.
006700      MOVE  �L�[  TO  �k�|�L�[
006800   END METHOD  Get-Key.
006900*
007000   END  OBJECT.
007100 END  CLASS  BinaryTree-class.
