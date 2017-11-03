000100*=======================================================================
000200*�@�f�B�N�V���i���N���X�iDict�j�@ �@�@�@�@�@�@�|�T���v���N���X�|
000300*
000400*�@�@�@�f�B�N�V���i���\���ɂ��I�u�W�F�N�g�Ǘ��葱��
000500*
000600*�@�Z�p���N���X
000700*�@�@�@�R���N�V�����N���X�@�@�@�@�iCollect�j
000800*
000900*�@�Z�Q�ƃN���X
001000*�@�@�@�f�B�N�V���i���m�[�h�N���X�iDictionaryNode-class�j
001100*�@�@�@�񕪒T���؃N���X�@�@�@�@�@�iBinaryTree-class�j
001200*
001300*�@�Z�I�u�W�F�N�g���\�b�h
001400*�@�@�P�j�I�u�W�F�N�g�f�[�^�ɑ΂���CGET�y��SET�̃v���p�e�B���\�b�h
001500*�@�@�Q�j�V�K�v�f�̒ǉ����͒u�����\�b�h�@�@�@�@�@�iElement-PutAt�j
001600*�@�@�R�j�擪�v�f�擾���\�b�h�@�@�@�@�@�@�@�@�@�@�iFirstElement-Get�j
001700*�@�@�S�j�S�v�f�폜���\�b�h�@�@�@�@�@�@�@�@�@�@�@�iRemove-All�j
001800*�@�@�T�j�w��v�f�폜���\�b�h�@�@�@�@�@�@�@�@�@�@�iRemove-At�j
001900*�@�@�U�j�v�f�擾���\�b�h�@�@�@�@�@�@�@�@�@�@�@�@�iElement-Get�j
002000*�@�@�V�j���v�f�擾���\�b�h�@�@�@�@�@�@�@�@�@�@�@�iNextElement-Get�j
002100*�@�@�W�j�O�v�f�擾���\�b�h�@�@�@�@�@�@�@�@�@�@�@�iPreviousElement-Get�j
002200*�@�@�X�j�擪�L�[�擾���\�b�h�@�@�@�@�@�@�@�@�@�@�iFirstKey-Get�j
002300*�@�P�O�j�Ō�L�[�擾���\�b�h�@�@�@�@�@�@�@�@�@�@�iLastKey-Get�j
002400*�@�P�P�j�񕪒T���؍\�z���\�b�h�@�@�@�@�@�@�@�@�@�iBinaryTree-Create�j
002500*�@�P�Q�j�񕪒T���ؗv�f�폜���\�b�h�@�@�@�@�@�@�@�iBinaryTree-RemoveAt�j
002600*
002700*        Copyright 1997-2015 FUJITSU LIMITED
002800*=======================================================================
002900 CLASS-ID.  Dict  INHERITS  Collect.
003000 ENVIRONMENT  DIVISION.
003100 CONFIGURATION  SECTION.
003200   REPOSITORY.
003300     CLASS  Collect
003400     CLASS  DictionaryNode-class
003500     CLASS  BinaryTree-class.
003600*
003700   OBJECT.
003800   DATA  DIVISION.
003900   PROCEDURE  DIVISION.
004000*=======================================================================
004100*�@�V�K�v�f�̒ǉ����͒u�����\�b�h�iElement-PutAt�j
004200*
004300*�@�E�@�w�肳�ꂽ�L�[�l�̗v�f�����󑶍݂��Ȃ��Ȃ�΁C���̃L�[�y�уI�u�W
004400*�@�@�F�N�g�̗v�f��V�K�ɍ쐬������񕪒T���ؗv�f�̐������C�����̒T����
004500*�@�@�ɑ}������D
004600*�@�E�@�w�肳�ꂽ�L�[�l�̗v�f�����łɑ��݂���Ȃ�΁C���̃L�[�̗v�f�̑�
004700*�@�@�ۃI�u�W�F�N�g���w�肳�ꂽ���̂ɒu������B
004800*
004900*�@�Z���́F�@�L�[�l�@�@�@�@�@�iPIC  X ANY LENGTH�j
005000*�@�@�@�@�@�@�ΏۃI�u�W�F�N�g�iobject reference�j
005100*=======================================================================
005200   METHOD-ID.  Element-PutAt.
005300   DATA  DIVISION.
005400   WORKING-STORAGE  SECTION.
005500    01  �v�|�Ō�̗v�f         OBJECT  REFERENCE.
005600    01  �v�|���݂̗v�f         OBJECT  REFERENCE.
005700    01  �v�|�V�v�f             OBJECT  REFERENCE  DictionaryNode-class.
005800    01  �v�|�T����             OBJECT  REFERENCE  BinaryTree-class.
005900    01  �v�|�ΏۃI�u�W�F�N�g   OBJECT  REFERENCE.
006000    01  �v�|�v�f��             PIC 9(08)  COMP.
006100    01  �v�|�L�[               PIC X(10).
006200   LINKAGE  SECTION.
006300    01  �k�|�L�[               PIC X ANY LENGTH.
006400    01  �k�|�ΏۃI�u�W�F�N�g   OBJECT  REFERENCE.
006500   PROCEDURE  DIVISION  USING  �k�|�L�[  �k�|�ΏۃI�u�W�F�N�g.
006600*
006700         INVOKE  SELF  "Element-Get"
006800                     USING  �k�|�L�[  RETURNING  �v�|�ΏۃI�u�W�F�N�g.
006900         IF  �v�|�ΏۃI�u�W�F�N�g  =  NULL
007000         THEN
007100             INVOKE  DictionaryNode-class  "NEW"  RETURNING  �v�|�V�v�f
007200             INVOKE  �v�|�V�v�f  "Set-Key"  USING  �k�|�L�[
007300             SET   �ΏۃI�u�W�F�N�g  OF  �v�|�V�v�f  TO
007400                                                   �k�|�ΏۃI�u�W�F�N�g
007500             SET   ���̗v�f          OF  �v�|�V�v�f  TO  NULL
007600             SET   �v�|�Ō�̗v�f    TO  �Ō�̗v�f  OF  SELF
007700             SET   �O�̗v�f          OF  �v�|�V�v�f  TO  �v�|�Ō�̗v�f
007800             SET   �Ō�̗v�f        OF  SELF        TO  �v�|�V�v�f
007900             MOVE  SELF::"CollectionSize-Get"        TO  �v�|�v�f��
008000*
008100             INVOKE  SELF  "BinaryTree-Create"
008200                     USING   �v�|�V�v�f  �k�|�L�[  RETURNING �v�|�T����
008300             SET   �T���ؗv�f        OF  �v�|�V�v�f  TO  �v�|�T����
008400*
008500             IF    �v�|�v�f��  =  0
008600             THEN
008700                 SET  �擪�̗v�f     OF  SELF        TO  �v�|�V�v�f
008800             ELSE
008900                 SET  ���̗v�f       OF  �v�|�Ō�̗v�f
009000                          AS  DictionaryNode-class   TO  �v�|�V�v�f
009100             END-IF
009200             INVOKE  SELF  "Add-CollSize"
009300             SET  ���݂̗v�f  OF  SELF  TO  �v�|�V�v�f
009400         ELSE
009500             SET  �v�|���݂̗v�f        TO  ���݂̗v�f  OF  SELF
009600             SET  �ΏۃI�u�W�F�N�g  OF  �v�|���݂̗v�f
009700                     AS  DictionaryNode-class  TO  �k�|�ΏۃI�u�W�F�N�g
009800         END-IF.
009900*
010000   END  METHOD  Element-PutAt.
010100*
010200*=======================================================================
010300*�@�擪�v�f�擾���\�b�h�iFirstElement-Get�j
010400*
010500*�@�@�@�擪�̎����v�f�����C�ΏۃI�u�W�F�N�g���擾����B
010600*
010700*�@�Z�o�́F�@�擪�I�u�W�F�N�g�iobject reference�j
010800*=======================================================================
010900   METHOD-ID.  FirstElement-Get OVERRIDE.
011000   DATA  DIVISION.
011100   WORKING-STORAGE  SECTION.
011200    01  �v�|�擪�̗v�f        OBJECT  REFERENCE.
011300   LINKAGE  SECTION.
011400    01  �k�|�擪�I�u�W�F�N�g  OBJECT  REFERENCE.
011500   PROCEDURE  DIVISION  RETURNING  �k�|�擪�I�u�W�F�N�g.
011600*
011700       IF  SELF::"CollectionSize-Get"  NOT =  0
011800       THEN
011900           SET  �v�|�擪�̗v�f         TO  �擪�̗v�f  OF  SELF
012000           SET  �k�|�擪�I�u�W�F�N�g   TO
012100                    �ΏۃI�u�W�F�N�g   OF  �v�|�擪�̗v�f
012200                                               AS  DictionaryNode-class
012300           SET  ���݂̗v�f  OF SELF    TO  �v�|�擪�̗v�f
012400       ELSE
012500           SET  �k�|�擪�I�u�W�F�N�g   TO  NULL
012600       END-IF.
012700*
012800   END  METHOD  FirstElement-Get.
012900*
013000*======================================================================
013100*�@�S�v�f�폜���\�b�h�iRemove-All�j
013200*
013300*�@�@�@�������ꂽ�S�Ă̗v�f���폜����B
013400*
013500*======================================================================
013600   METHOD-ID.  Remove-All.
013700   DATA  DIVISION.
013800   WORKING-STORAGE  SECTION.
013900    01  �v�|�v�f��            PIC 9(08)  COMP.
014000    01  �v�|���v�f            OBJECT  REFERENCE  DictionaryNode-class.
014100    01  �v�|���̗v�f          OBJECT  REFERENCE.
014200    01  �v�|�ꎞ�̈�          OBJECT  REFERENCE.
014300    01  �v�|�T����            OBJECT  REFERENCE  BinaryTree-class.
014400   PROCEDURE  DIVISION.
014500
014600       MOVE  SELF::"CollectionSize-Get"  TO  �v�|�v�f��.
014700       SET   �v�|�ꎞ�̈�          TO  �擪�̗v�f  OF  SELF.
014800       SET   �v�|���v�f            TO  �v�|�ꎞ�̈�
014900                                   AS  DictionaryNode-class.
015000*
015100       PERFORM  UNTIL  �v�|�v�f��   <=  0
015200           SET  �O�̗v�f       OF  �v�|���v�f  TO  NULL
015300           SET  �v�|�ꎞ�̈�   TO  �T���ؗv�f  OF  �v�|���v�f
015400           SET  �v�|�T����                     TO
015500                                 �v�|�ꎞ�̈�  AS  BinaryTree-class
015600           SET  ��������       OF  �v�|�T����  TO  NULL
015700           SET  �E������       OF  �v�|�T����  TO  NULL
015800           SET  �T���ؗv�f     OF  �v�|���v�f  TO  NULL
015900           SET  �v�|�ꎞ�̈�   TO  ���̗v�f    OF  �v�|���v�f
016000           SET  ���̗v�f       OF  �v�|���v�f  TO  NULL
016100           SET  �v�|���v�f                     TO
016200                                 �v�|�ꎞ�̈�  AS  DictionaryNode-class
016300           INVOKE  SELF  "Sub-CollSize"
016400           ADD  -1  TO  �v�|�v�f��
016500       END-PERFORM.
016600*
016700       SET  �擪�̗v�f    OF  SELF  TO  NULL.
016800       SET  �Ō�̗v�f    OF  SELF  TO  NULL.
016900       SET  ���݂̗v�f    OF  SELF  TO  NULL.
017000       SET  �T���؂̒��_  OF  SELF  TO  NULL.
017100*
017200   END  METHOD  Remove-All.
017300*
017400*======================================================================
017500*�@�w��v�f�폜���\�b�h�iRemove-At�j
017600*
017700*�@�@�w�肳�ꂽ�L�[�̗v�f���C���X�g�\���C�Q���T���؂̗�������폜����B
017800*
017900*�@�Z���́F�@�L�[�@�@�@�@�@�iPIC  X ANY LENGTH�j
018000*�@�Z�o�́F�@���A�l        �iPIC  9(4) COMP)
018100*�@�Z���l�F
018200*�@�@�@�폜������ɏI�������ꍇ�C���A�l�Ƃ��ĂO���ԋp����܂��B
018300*�@�@�@�w�肵���L�[�̗v�f�����݂����C�폜�ł��Ȃ������ꍇ�C���A�l�Ƃ�
018400*�@�@�ĂP���ԋp����܂��B
018500*=======================================================================
018600   METHOD-ID.  Remove-At.
018700   DATA  DIVISION.
018800   WORKING-STORAGE  SECTION.
018900    01  �v�|�I�u�W�F�N�g      OBJECT  REFERENCE.
019000    01  �v�|���v�f            OBJECT  REFERENCE  DictionaryNode-class.
019100    01  �v�|�O�̗v�f          OBJECT  REFERENCE.
019200    01  �v�|���̗v�f          OBJECT  REFERENCE.
019300    01  �v�|�ꎞ�̈�          OBJECT  REFERENCE.
019400   LINKAGE  SECTION.
019500    01  �k�|�L�[              PIC X ANY LENGTH.
019600    01  �k�|���A�l            PIC 9(04)  COMP.
019700   PROCEDURE  DIVISION
019800                  USING  �k�|�L�[  RETURNING  �k�|���A�l.
019900*
020000         INVOKE  SELF  "Element-Get"
020100                           USING  �k�|�L�[ RETURNING  �v�|�I�u�W�F�N�g.
020200         IF   �v�|�I�u�W�F�N�g  NOT =  NULL
020300         THEN
020400             SET   �v�|�ꎞ�̈�     TO  ���݂̗v�f    OF  SELF
020500             SET   �v�|���v�f       TO  �v�|�ꎞ�̈�
020600                                               AS  DictionaryNode-class
020700             SET   �v�|�O�̗v�f     TO  �O�̗v�f      OF  �v�|���v�f
020800             SET   �v�|���̗v�f     TO  ���̗v�f      OF  �v�|���v�f
020900             SET   �ΏۃI�u�W�F�N�g OF  �v�|���v�f    TO  NULL
021000             SET   �O�̗v�f         OF  �v�|���v�f    TO  NULL
021100             SET   ���̗v�f         OF  �v�|���v�f    TO  NULL
021200             SET   �T���ؗv�f       OF  �v�|���v�f    TO  NULL
021300*
021400             EVALUATE  �v�|�O�̗v�f   ALSO  �v�|���̗v�f
021500             WHEN      NULL           ALSO  NULL
021600                 SET   �擪�̗v�f   OF  SELF          TO  NULL
021700                 SET   �Ō�̗v�f   OF  SELF          TO  NULL
021800                 SET   ���݂̗v�f   OF  SELF          TO  NULL
021900             WHEN      NULL           ALSO  NOT NULL
022000                 SET   �擪�̗v�f   OF  SELF          TO  �v�|���̗v�f
022100                 SET   ���݂̗v�f   OF  SELF          TO  �v�|���̗v�f
022200                 SET   �O�̗v�f     OF  �v�|���̗v�f
022300                          AS  DictionaryNode-class    TO  NULL
022400             WHEN      NOT NULL      ALSO  NULL
022500                 SET   ���݂̗v�f   OF  SELF          TO  �v�|�O�̗v�f
022600                 SET   ���̗v�f     OF  �v�|�O�̗v�f
022700                          AS  DictionaryNode-class    TO  NULL
022800             WHEN      NOT NULL      ALSO  NOT NULL
022900                 SET   ���݂̗v�f   OF  SELF          TO  �v�|���̗v�f
023000                 SET   �O�̗v�f     OF  �v�|���̗v�f
023100                          AS  DictionaryNode-class    TO  �v�|�O�̗v�f
023200                 SET   ���̗v�f     OF  �v�|�O�̗v�f
023300                          AS  DictionaryNode-class    TO  �v�|���̗v�f
023400             END-EVALUATE
023500*
023600             INVOKE  SELF  "BinaryTree-RemoveAt"  USING  �k�|�L�[
023700             INVOKE  SELF  "Sub-CollSize"
023800             MOVE  0               TO  �k�|���A�l
023900         ELSE
024000             MOVE  1               TO  �k�|���A�l
024100         END-IF.
024200*
024300   END  METHOD  Remove-At.
024400*=======================================================================
024500*�@�v�f�擾���\�b�h�iElement-Get�j
024600*
024700*�@�@�@�w�肳�ꂽ�L�[�̗v�f�̑ΏۃI�u�W�F�N�g���擾����B
024800*
024900*�@�Z���́F�@�L�[�@�@�@�@�@�iPIC  X ANY LENGTH�j
025000*�@�Z�o�́F�@�I�u�W�F�N�g�@�iobject reference�j
025100*�@�Z���l�F
025200*�@�@�@�w�肳�ꂽ�L�[�̗v�f���C�T���؂ɑ��݂��Ȃ��ꍇ�CNULL���ԋp�����
025300*�@�@���B
025400*=======================================================================
025500   METHOD-ID.  Element-Get.
025600   DATA  DIVISION.
025700   WORKING-STORAGE  SECTION.
025800    01  �v�|�擪�̗v�f       OBJECT  REFERENCE.
025900    01  �v�|�T����           OBJECT  REFERENCE  BinaryTree-class.
026000    01  �v�|�Ώۗv�f         OBJECT  REFERENCE  DictionaryNode-class.
026100    01  �v�|�L�[             PIC X(10).
026200    01  �v�|�ꎞ�̈�         OBJECT  REFERENCE.
026300   LINKAGE  SECTION.
026400    01  �k�|�L�[             PIC X  ANY LENGTH.
026500    01  �k�|�I�u�W�F�N�g     OBJECT  REFERENCE.
026600   PROCEDURE  DIVISION  USING  �k�|�L�[  RETURNING  �k�|�I�u�W�F�N�g.
026700*
026800         SET   �k�|�I�u�W�F�N�g  TO  NULL.
026900         SET   �v�|�T����        TO  �T���؂̒��_  OF  SELF.
027000*
027100         PERFORM  UNTIL  �v�|�T����  =   NULL
027200             INVOKE  �v�|�T����  "Get-Key"  RETURNING   �v�|�L�[
027300             EVALUATE  TRUE
027400             WHEN   �k�|�L�[  <  �v�|�L�[
027500                 SET   �v�|�ꎞ�̈�     TO  ��������  OF  �v�|�T����
027600             WHEN   �k�|�L�[  >  �v�|�L�[
027700                 SET   �v�|�ꎞ�̈�     TO  �E������  OF  �v�|�T����
027800             WHEN   �k�|�L�[  =  �v�|�L�[
027900                 SET  �v�|�Ώۗv�f   ���݂̗v�f   OF  SELF  TO
028000                                           �Ώۗv�f   OF  �v�|�T����
028100                 SET  �k�|�I�u�W�F�N�g  TO
028200                                    �ΏۃI�u�W�F�N�g  OF  �v�|�Ώۗv�f
028300                 SET  �v�|�ꎞ�̈�      TO   NULL
028400             END-EVALUATE
028500             SET   �v�|�T����  TO   �v�|�ꎞ�̈�  AS  BinaryTree-class
028600         END-PERFORM
028700*
028800   END  METHOD  Element-Get.
028900*
029000*=======================================================================
029100*�@�擪�L�[�擾���\�b�h�iFirstKey-Get�j
029200*
029300*�@�@�@�擪�v�f�̃L�[���擾����B
029400*
029500*�@�Z�o�́F�@�L�[�@�@�@�@�@�iPIC  X ANY LENGTH�j
029600*======================================================================
029700   METHOD-ID.  FirstKey-Get.
029800   DATA  DIVISION.
029900   WORKING-STORAGE  SECTION.
030000    01  �v�|�擪�̗v�f      OBJECT  REFERENCE.
030100    01  �v�|�L�[            PIC X(10).
030200   LINKAGE  SECTION.
030300    01  �k�|�L�[            PIC X ANY LENGTH.
030400   PROCEDURE  DIVISION  RETURNING  �k�|�L�[.
030500*
030600         IF  SELF::"CollectionSize-Get"  NOT =  0
030700         THEN
030800             SET   �v�|�擪�̗v�f            TO  �擪�̗v�f  OF  SELF
030900             INVOKE  �v�|�擪�̗v�f  AS  DictionaryNode-class
031000                "Get-Key"  RETURNING  �v�|�L�[
031100             MOVE  �v�|�L�[  TO  �k�|�L�[
031200             SET   ���݂̗v�f  OF  SELF      TO  �v�|�擪�̗v�f
031300         ELSE
031400             MOVE  SPACE  TO  �k�|�L�[
031500         END-IF.
031600*
031700   END  METHOD  FirstKey-Get.
031800*
031900*======================================================================
032000*�@�Ō�L�[�擾���\�b�h�iLastKey-Get�j
032100*
032200*�@�@�@�Ō�̗v�f�̃L�[���擾����B
032300*
032400*�@�Z�o�́F�@�L�[�@�@�@�@�@�iPIC X ANY LENGTH�j
032500*=======================================================================
032600   METHOD-ID.  LastKey-Get.
032700   DATA  DIVISION.
032800   WORKING-STORAGE  SECTION.
032900    01  �v�|�Ō�̗v�f      OBJECT  REFERENCE.
033000    01  �v�|�L�[            PIC X(10).
033100   LINKAGE  SECTION.
033200    01  �k�|�L�[            PIC X ANY LENGTH.
033300   PROCEDURE  DIVISION  RETURNING  �k�|�L�[.
033400*
033500         IF  SELF::"CollectionSize-Get"  NOT =  0
033600         THEN
033700             SET   �v�|�Ō�̗v�f            TO  �Ō�̗v�f  OF  SELF
033800             INVOKE  �v�|�Ō�̗v�f  AS  DictionaryNode-class
033900                     "Get-Key"  RETURNING  �v�|�L�[
034000             MOVE  �v�|�L�[  TO  �k�|�L�[
034100             SET   ���݂̗v�f  OF  SELF      TO  �v�|�Ō�̗v�f
034200         ELSE
034300             MOVE  SPACE  TO  �k�|�L�[
034400         END-IF.
034500*
034600   END  METHOD  LastKey-Get.
034700*
034800*=======================================================================
034900*�@���v�f�擾���\�b�h�iNextElement-Get�j
035000*
035100*�@�@�@���̗v�f�̑ΏۃI�u�W�F�N�g���擾����B
035200*
035300*�@�Z�o�́F�@�I�u�W�F�N�g�@�@�iobject reference�j
035400*=======================================================================
035500   METHOD-ID.  NextElement-Get  OVERRIDE.
035600   DATA  DIVISION.
035700   WORKING-STORAGE  SECTION.
035800    01  �v�|���̗v�f       OBJECT  REFERENCE.
035900    01  �v�|���v�f         OBJECT  REFERENCE.
036000   LINKAGE  SECTION.
036100    01  �k�|�I�u�W�F�N�g   OBJECT  REFERENCE.
036200   PROCEDURE  DIVISION  RETURNING   �k�|�I�u�W�F�N�g.
036300*
036400         SET  �k�|�I�u�W�F�N�g  TO  NULL.
036500         SET  �v�|���v�f        TO  ���݂̗v�f  OF  SELF.
036600         SET  �v�|���̗v�f      TO
036700                   ���̗v�f  OF  �v�|���v�f  AS  DictionaryNode-class.
036800*
036900         IF   �v�|���̗v�f  NOT =  NULL
037000         THEN
037100             SET  �k�|�I�u�W�F�N�g  TO
037200                           �ΏۃI�u�W�F�N�g  OF  �v�|���̗v�f
037300                                             AS  DictionaryNode-class
037400             SET  ���݂̗v�f  OF  SELF  TO  �v�|���̗v�f
037500         END-IF.
037600*
037700   END  METHOD  NextElement-Get.
037800*
037900*=======================================================================
038000*�@�O�v�f�擾���\�b�h�iPreviousElement-Get�j
038100*
038200*�@�@�@�O�̗v�f�̑ΏۃI�u�W�F�N�g���擾����B
038300*
038400*�@�Z�o�́F�@�O�̃I�u�W�F�N�g�@�iobject reference�j
038500*=======================================================================
038600   METHOD-ID.  PreviousElement-Get  OVERRIDE.
038700   DATA  DIVISION.
038800   WORKING-STORAGE  SECTION.
038900    01  �v�|�O�̗v�f           OBJECT  REFERENCE.
039000    01  �v�|���v�f             OBJECT  REFERENCE.
039100   LINKAGE  SECTION.
039200    01  �k�|�O�̃I�u�W�F�N�g   OBJECT  REFERENCE.
039300   PROCEDURE  DIVISION  RETURNING   �k�|�O�̃I�u�W�F�N�g.
039400*
039500         SET  �k�|�O�̃I�u�W�F�N�g  TO  NULL.
039600         SET  �v�|���v�f            TO  ���݂̗v�f  OF  SELF.
039700         SET  �v�|�O�̗v�f          TO
039800                 �O�̗v�f   OF  �v�|���v�f  AS  DictionaryNode-class.
039900*
040000         IF  �v�|�O�̗v�f  NOT =  NULL
040100         THEN
040200             SET  �k�|�O�̃I�u�W�F�N�g  TO
040300                      �ΏۃI�u�W�F�N�g  OF  �v�|�O�̗v�f
040400                                        AS  DictionaryNode-class
040500             SET  ���݂̗v�f  OF  SELF  TO  �v�|�O�̗v�f
040600         END-IF.
040700*
040800   END  METHOD  PreviousElement-Get.
040900*
041000*=======================================================================
041100*�@�񕪒T���؍\�z���\�b�h�iBinaryTree-Create�j
041200*
041300*�@�@�@�ǉ����ꂽ�v�f��񕪒T���؂ɉ�����B
041400*
041500*�@�Z���́F�@�v�f�@�@�@�@�iOBJECT REFERENCE DictinaryNode-class�j
041600*�@�@�@�@�@�@�L�[�@�@�@�@�iPIC  X ANY LENGTH�j
041700*�@�Z�o�́F�@�V�T���ؗv�f�iOBJECT REFERENCE BinaryTree-class)
041800*�@�Z���l�F
041900*�@�@�w�肳�ꂽ�L�[���C�T���؂Ɋ����̏ꍇ�C���ʓI�ɂ͉����s���܂���B
042000*=======================================================================
042100   METHOD-ID.  BinaryTree-Create.
042200   DATA  DIVISION.
042300   WORKING-STORAGE  SECTION.
042400    01  �v�|�T���؂̒��_       OBJECT  REFERENCE  BinaryTree-class.
042500    01  �v�|�T����             OBJECT  REFERENCE  BinaryTree-class.
042600    01  �v�|������             OBJECT  REFERENCE.
042700    01  �v�|�ꎞ�̈�           OBJECT  REFERENCE.
042800    01  �v�|���               PIC  X(4)  VALUE  SPACE.
042900    01  �v�|�L�[               PIC  X(10).
043000   LINKAGE  SECTION.
043100    01  �k�|�v�f               OBJECT  REFERENCE  DictionaryNode-class.
043200    01  �k�|�L�[               PIC  X ANY LENGTH.
043300    01  �k�|�V�T����           OBJECT  REFERENCE  BinaryTree-class.
043400   PROCEDURE  DIVISION
043500                  USING  �k�|�v�f  �k�|�L�[  RETURNING  �k�|�V�T����.
043600*
043700         INVOKE  BinaryTree-class  "NEW"  RETURNING  �k�|�V�T����.
043800         INVOKE  �k�|�V�T����  "Set-Key"  USING  �k�|�L�[.
043900         SET   �Ώۗv�f    OF  �k�|�V�T����    TO  �k�|�v�f.
044000         SET   ��������    OF  �k�|�V�T����    TO  NULL.
044100         SET   �E������    OF  �k�|�V�T����    TO  NULL.
044200*
044300         SET   �v�|�T���؂̒��_             TO  �T���؂̒��_  OF  SELF.
044400         IF    �v�|�T���؂̒��_  =  NULL
044500         THEN
044600             SET   �T���؂̒��_  OF  SELF      TO  �k�|�V�T����
044700         ELSE
044800             SET   �v�|�T����                  TO  �v�|�T���؂̒��_
044900             PERFORM   UNTIL  �v�|���  =  "�I��"
045000                 INVOKE  �v�|�T����  "Get-Key"  RETURNING  �v�|�L�[
045100                 EVALUATE  TRUE
045200                 WHEN   �k�|�L�[  <  �v�|�L�[
045300                     SET  �v�|������     TO   ��������   OF  �v�|�T����
045400                     IF   �v�|������   =   NULL
045500                     THEN
045600                         SET   ��������  OF  �v�|�T����  TO
045700                                                         �k�|�V�T����
045800                         MOVE  "�I��"                    TO   �v�|���
045900                     ELSE
046000                         INVOKE  �v�|������ AS BinaryTree-class  "Get-Key"
046100                            RETURNING  �v�|�L�[
046200                         IF     �k�|�L�[   >   �v�|�L�[
046300                             SET   ��������  OF  �k�|�V�T����   TO
046400                                                           �v�|������
046500                             SET   ��������  OF  �v�|�T����     TO
046600                                                           �k�|�V�T����
046700                             MOVE  "�I��"    TO   �v�|���
046800                         ELSE
046900                             SET   �v�|�T����   TO   �v�|������
047000                                                AS  BinaryTree-class
047100                         END-IF
047200                     END-IF
047300                 WHEN   �k�|�L�[  >  �v�|�L�[
047400                     SET  �v�|������    TO  �E������   OF  �v�|�T����
047500                     IF   �v�|������   =   NULL
047600                     THEN
047700                         SET   �E������  OF  �v�|�T����   TO
047800                                                          �k�|�V�T����
047900                         MOVE  "�I��"                     TO   �v�|���
048000                     ELSE
048100                         INVOKE  �v�|������  AS  BinaryTree-class
048200                               "Get-Key"  RETURNING  �v�|�L�[
048300                         IF    �k�|�L�[   <   �v�|�L�[
048400                             SET   ��������  OF  �k�|�V�T����   TO
048500                                                           �v�|������
048600                             SET   ��������  OF  �v�|�T����     TO
048700                                                           �k�|�V�T����
048800                             MOVE  "�I��"                       TO
048900                                                           �v�|���
049000                         ELSE
049100                             SET   �v�|�T����   TO   �v�|������
049200                                                AS   BinaryTree-class
049300                         END-IF
049400                     END-IF
049500                 WHEN   �k�|�L�[  =  �v�|�L�[
049600                     SET   �k�|�V�T����    TO   NULL
049700                     MOVE  "�I��"          TO   �v�|���
049800                 END-EVALUATE
049900             END-PERFORM
050000         END-IF
050100*
050200   END  METHOD  BinaryTree-Create.
050300*
050400*=======================================================================
050500*�@�񕪒T���ؗv�f�폜���\�b�h�iBinaryTree-RemoveAt�j
050600*
050700*�@�@�@�w�肳�ꂽ�L�[�̒T���ؗv�f���C�T���؂���폜����B
050800*
050900*�@�Z���́F�@�L�[�@�iPIC  X ANY LENGTH�j
051000*�@�Z���l�F
051100*�@�@�@�w�肳�ꂽ�L�[�̗v�f���C�T���؂ɑ��݂��Ȃ��ꍇ�C���ʓI�ɂ͉����s
051200*�@�@���܂���B
051300*=======================================================================
051400   METHOD-ID.  BinaryTree-RemoveAt.
051500   DATA  DIVISION.
051600   WORKING-STORAGE  SECTION.
051700    01  �v�|�e�T����           OBJECT  REFERENCE  BinaryTree-class.
051800    01  �v�|�T����             OBJECT  REFERENCE  BinaryTree-class.
051900    01  �v�|������             OBJECT  REFERENCE  BinaryTree-class.
052000    01  �v�|��������           OBJECT  REFERENCE.
052100    01  �v�|�E������           OBJECT  REFERENCE.
052200    01  �v�|�ꎞ�̈�           OBJECT  REFERENCE.
052300    01  �v�|�Ώۗv�f           OBJECT  REFERENCE  DictionaryNode-class.
052400    01  �v�|���E���           PIC  X(2).
052500    01  �v�|�L�[               PIC  X(10).
052600   LINKAGE  SECTION.
052700    01  �k�|�L�[               PIC  X ANY LENGTH.
052800   PROCEDURE  DIVISION  USING  �k�|�L�[.
052900*
053000         SET   �v�|�e�T����  �v�|������    TO  NULL.
053100         SET   �v�|�T����                  TO  �T���؂̒��_  OF  SELF.
053200         IF    �v�|�T����   =   NULL
053300         THEN
053400             EXIT METHOD
053500         ELSE
053600             INVOKE  �v�|�T����  "Get-Key"  RETURNING  �v�|�L�[
053700         END-IF.
053800*
053900         PERFORM  UNTIL  �k�|�L�[  =   �v�|�L�[
054000             EVALUATE  TRUE
054100             WHEN   �k�|�L�[   <   �v�|�L�[
054200                 SET   �v�|�e�T����    TO   �v�|�T����
054300                 SET   �v�|�ꎞ�̈�    TO   ��������  OF  �v�|�T����
054400                 MOVE  "��"            TO   �v�|���E���
054500             WHEN   �k�|�L�[   >   �v�|�L�[
054600                 SET   �v�|�e�T����    TO   �v�|�T����
054700                 SET   �v�|�ꎞ�̈�    TO   �E������  OF  �v�|�T����
054800                 MOVE  "�E"            TO   �v�|���E���
054900             END-EVALUATE
055000             IF  �v�|�ꎞ�̈�   =   NULL
055100             THEN
055200                 EXIT METHOD
055300             ELSE
055400                 SET   �v�|�T����            TO   �v�|�ꎞ�̈�
055500                                                  AS  BinaryTree-class
055600                 INVOKE  �v�|�T����  "Get-Key"  RETURNING  �v�|�L�[
055700             END-IF
055800         END-PERFORM.
055900*
056000         SET   �v�|��������              TO   ��������  OF  �v�|�T����.
056100         SET   �v�|�E������              TO   �E������  OF  �v�|�T����.
056200*
056300         IF     �v�|��������  NOT =  NULL    AND
056400                �v�|�E������  NOT =  NULL
056500         THEN
056600             SET  �v�|������         TO    �v�|��������
056700                                               AS  BinaryTree-class
056800             SET  �v�|�ꎞ�̈�       TO    �E������  OF  �v�|������
056900             PERFORM   UNTIL   �v�|�ꎞ�̈�  =   NULL
057000                 SET  �v�|������     TO    �v�|�ꎞ�̈�
057100                                               AS  BinaryTree-class
057200                 SET  �v�|�ꎞ�̈�   TO    �E������  OF  �v�|������
057300             END-PERFORM
057400             SET   �v�|�Ώۗv�f      TO    �Ώۗv�f  OF  �v�|������
057500             INVOKE  �v�|������  "Get-Key"  RETURNING  �v�|�L�[
057600             INVOKE  SELF  "BinaryTree-RemoveAt"  USING  �v�|�L�[
057700             INVOKE  �v�|�T����  "Set-Key"  USING  �v�|�L�[
057800             SET   �Ώۗv�f    OF  �v�|�T����     TO   �v�|�Ώۗv�f
057900             SET   �T���ؗv�f  OF  �v�|�Ώۗv�f   TO   �v�|�T����
058000         ELSE
058100             SET   ��������  OF  �v�|�T����  TO   NULL
058200             SET   �E������  OF  �v�|�T����  TO   NULL
058300             SET   �Ώۗv�f  OF  �v�|�T����  TO   NULL
058400*
058500             EVALUATE �v�|��������   ALSO  �v�|�E������
058600             WHEN          NULL      ALSO       NULL
058700                 SET  �v�|������     TO         NULL
058800             WHEN          NULL      ALSO   NOT NULL
058900                 SET  �v�|������     TO    �v�|�E������
059000                                               AS  BinaryTree-class
059100             WHEN      NOT NULL      ALSO       NULL
059200                 SET  �v�|������     TO    �v�|��������
059300                                               AS  BinaryTree-class
059400             END-EVALUATE
059500*
059600             EVALUATE TRUE
059700             WHEN   �v�|�e�T����  =  NULL
059800                 SET   �T���؂̒��_  OF  SELF          TO  �v�|������
059900             WHEN   �v�|���E���  =  "��"
060000                 SET   ��������      OF  �v�|�e�T����  TO  �v�|������
060100             WHEN   �v�|���E���  =  "�E"
060200                 SET   �E������      OF  �v�|�e�T����  TO  �v�|������
060300             END-EVALUATE
060400         END-IF.
060500*
060600   END  METHOD  BinaryTree-RemoveAt.
060700*
060800   END  OBJECT.
060900 END  CLASS  Dict.
