000100*=======================================================================
000200*�@�R���N�V�����N���X�iCollect�j�@�@�@�@�@�@�@�|�T���v���N���X�|
000300*
000400*�@�@�@�S�ʓI�ȗv�f�̊Ǘ����s�����߂̃f�[�^�Ǝ葱��
000500*
000600*�@�Z�p���N���X
000700*�@�@�@FJBASE
000800*
000900*�@�Z�Q�ƃN���X
001000*�@�@�@BinaryTree-class
001100*
001200*�@�Z�I�u�W�F�N�g�f�[�^
001300*      �S�v�f��           PIC 9(08)  COMP
001400*      �擪�̗v�f         OBJECT  REFERENCE
001500*      �Ō�̗v�f         OBJECT  REFERENCE
001600*      ���݂̗v�f         OBJECT  REFERENCE
001700*      �T���؂̒��_       OBJECT  REFERENCE
001800*
001900*�@�Z�I�u�W�F�N�g���\�b�h
002000*�@�@�P�j�I�u�W�F�N�g�f�[�^�ɑ΂���CGET�y��SET�̃v���p�e�B���\�b�h
002100*�@�@�Q�j�v�f�̗L���m�F���\�b�h�@�@�@�@�@�@�@�@�iCollectionSize-Get�j
002200*�@�@�R�j���v�f�擾���\�b�h�@�@�@�@�@�@�@�@�@�@�iNextElement-Get�j
002300*�@�@�S�j�O�v�f�擾���\�b�h�@�@�@�@�@�@�@�@�@�@�iPreviousElement-Get�j
002400*�@�@�T�j�擪�v�f�擾���\�b�h�@�@�@�@�@�@�@�@�@�iFirstElement-Get�j
002500*�@�@�U�j�S�v�f�����Z���\�b�h�@�@�@�@�@�@�@�@�@�iAdd-CollSize�j
002600*�@�@�V�j�S�v�f�����Z���\�b�h�@�@�@�@�@�@�@�@�@�iSub-CollSize�j
002700*
002800*        Copyright 1997-2015 FUJITSU LIMITED
002900*=======================================================================
003000 CLASS-ID.  Collect  INHERITS  FJBASE.
003100 ENVIRONMENT  DIVISION.
003200 CONFIGURATION  SECTION.
003300   REPOSITORY.
003400     CLASS  BinaryTree-class
003500     CLASS  FJBASE.
003600*
003700   OBJECT.
003800   DATA  DIVISION.
003900   WORKING-STORAGE  SECTION.
004000   01  �S�v�f��           PIC 9(08)  COMP  VALUE 0.
004100   01  �擪�̗v�f         OBJECT  REFERENCE  PROPERTY.
004200   01  �Ō�̗v�f         OBJECT  REFERENCE  PROPERTY.
004300   01  ���݂̗v�f         OBJECT  REFERENCE  PROPERTY.
004400   01  �T���؂̒��_       OBJECT  REFERENCE  BinaryTree-class  PROPERTY.
004500   PROCEDURE  DIVISION.
004600*=======================================================================
004700*�@�v�f�̗L���m�F���\�b�h�iCollectionSize-Get�j
004800*
004900*�@�@�@�S�v�f����ԋp����B
005000*
005100*�@�Z�o�́F�@�S�v�f���iPIC 9(8) COMP�j
005200*=======================================================================
005300   METHOD-ID.  CollectionSize-Get.
005400   DATA  DIVISION.
005500   LINKAGE  SECTION.
005600    01  �k�|�S�v�f��    PIC 9(8)  COMP.
005700   PROCEDURE  DIVISION  RETURNING  �k�|�S�v�f��.
005800        MOVE  �S�v�f��  TO  �k�|�S�v�f��.
005900   END  METHOD  CollectionSize-Get.
006000*
006100*=======================================================================
006200*�@���v�f�擾���\�b�h�iNextElement-Get�j
006300*
006400*�@�Z�o�́F�@�I�u�W�F�N�g�iOBJECT REFERENCE�j
006500*�@�Z���l
006600*�@�@�@���Ԃ��������邽�߂̒�`�ł���C�葱�����������Ȃ��B�T�u�N���X��
006700*�@�@OVERRIDE ����ď��߂ĈӖ������B
006800*=======================================================================
006900   METHOD-ID.  NextElement-Get.
007000   DATA  DIVISION.
007100   WORKING-STORAGE  SECTION.
007200   LINKAGE  SECTION.
007300    01  �k�|�I�u�W�F�N�g   OBJECT  REFERENCE.
007400   PROCEDURE  DIVISION
007500                 RETURNING   �k�|�I�u�W�F�N�g.
007600   END  METHOD  NextElement-Get.
007700*
007800*=======================================================================
007900*�@�O�v�f�擾���\�b�h�iPreviousElement-Get�j
008000*
008100*�@�Z�o�́F�@�I�u�W�F�N�g�iOBJECT REFERENCE�j
008200*�@�Z���l
008300*�@�@�@���Ԃ��������邽�߂̒�`�ł���C�葱�����������Ȃ��B�T�u�N���X��
008400*�@�@OVERRIDE ����ď��߂ĈӖ������B
008500*=======================================================================
008600   METHOD-ID.  PreviousElement-Get.
008700   DATA  DIVISION.
008800   WORKING-STORAGE  SECTION.
008900   LINKAGE  SECTION.
009000    01  �k�|�I�u�W�F�N�g   OBJECT  REFERENCE.
009100   PROCEDURE  DIVISION
009200                 RETURNING   �k�|�I�u�W�F�N�g.
009300   END  METHOD  PreviousElement-Get.
009400*
009500*=======================================================================
009600*�@�擪�v�f�擾���\�b�h�iFirstElement-Get�j
009700*
009800*�@�Z�o�́F�@�I�u�W�F�N�g�iOBJECT REFERENCE�j
009900*�@�Z���l
010000*�@�@�@���Ԃ��������邽�߂̒�`�ł���C�葱�����������Ȃ��B�T�u�N���X��
010100*�@�@OVERRIDE ����ď��߂ĈӖ������B
010200*=======================================================================
010300   METHOD-ID.  FirstElement-Get.
010400   DATA  DIVISION.
010500   WORKING-STORAGE  SECTION.
010600   LINKAGE  SECTION.
010700    01  �k�|�擪�I�u�W�F�N�g  OBJECT  REFERENCE.
010800   PROCEDURE  DIVISION
010900                 RETURNING  �k�|�擪�I�u�W�F�N�g.
011000   END  METHOD  FirstElement-Get.
011100*
011200*=======================================================================
011300*�@�S�v�f�����Z���\�b�h�iAdd-Collsize�j
011400*
011500*�@�@�S�v�f���ɂP�����Z����B
011600*=======================================================================
011700   METHOD-ID.  Add-CollSize.
011800   DATA  DIVISION.
011900   PROCEDURE  DIVISION.
012000        ADD  1  TO  �S�v�f��.
012100   END  METHOD  Add-CollSize.
012200*
012300*=======================================================================
012400*�@�S�v�f�����Z���\�b�h�iSub-Collsize�j
012500*
012600*�@�@�S�v�f������P�����Z����B
012700*=======================================================================
012800   METHOD-ID.  Sub-CollSize.
012900   DATA  DIVISION.
013000   PROCEDURE  DIVISION.
013100        SUBTRACT  1  FROM  �S�v�f��.
013200   END  METHOD  Sub-CollSize.
013300*
013400   END  OBJECT.
013500 END  CLASS  Collect.
