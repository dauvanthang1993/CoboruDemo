000100*=======================================================================
000200*�@���X�g�N���X�iList�j�@             �@�@�@�@�@�@�|�T���v���N���X�|
000300*
000400*�@�@�@���X�g�\���ɂ��I�u�W�F�N�g�Ǘ��葱��
000500*
000600*�@�Z�p���N���X
000700*�@�@�@�R���N�V�����N���X�@�@�@�@�iCollect�j
000800*
000900*�@�Z�Q�ƃN���X
001000*�@�@�@���X�g�m�[�h�N���X�iListNode-class�j
001100*
001200*
001300*�@�Z�I�u�W�F�N�g���\�b�h
001400*�@�@�P�j�I�u�W�F�N�g�f�[�^�ɑ΂���CGET�y��SET�̃v���p�e�B���\�b�h
001500*�@�@�Q�j�v�f�擾���\�b�h�@�@�@�@�@�@�@�@�@�@�@�@�iElement-Get�j
001600*�@�@�R�j�擪�v�f�擾���\�b�h�@�@�@�@�@�@�@�@�@�@�iFirstElement-Get�j
001700*�@�@�S�j�Ō�̗v�f�擾���\�b�h�@�@�@�@�@�@�@�@�@�iLastElement-Get�j
001800*�@�@�T�j�v�f�ԍ��擾���\�b�h�@�@�@�@�@�@�@�@�@�@�iElementNo-Get�j
001900*�@�@�U�j�v�f�ǉ����\�b�h�@�@�@�@�@�@�@�@�@�@�@�@�iElement-PutLast�j
002000*�@�@�V�j�v�f�u�����\�b�h�@�@�@�@�@�@�@�@�@�@�@�@�iElement-PutAt�j
002100*�@�@�W�j�v�f�}�����\�b�h�@�@�@�@�@�@�@�@�@�@�@�@�iElement-Insert�j
002200*�@�@�X�j�S�v�f�폜���\�b�h�@�@�@�@�@�@�@�@�@�@�@�iRemove-All�j
002300*�@�P�O�j�w��v�f�폜���\�b�h�@�@�@�@�@�@�@�@�@�@�iRemove-At�j
002400*�@�P�P�j���v�f�擾���\�b�h�@�@�@�@�@�@�@�@�@�@�@�iNextElement-Get�j
002500*�@�P�Q�j�O�v�f�擾���\�b�h�@�@�@�@�@�@�@�@�@�@�@�iPreviousElement-Get�j
002600*
002700*        Copyright 1997-2015 FUJITSU LIMITED
002800*=======================================================================
002900 CLASS-ID.  List  INHERITS  Collect.
003000 ENVIRONMENT  DIVISION.
003100 CONFIGURATION  SECTION.
003200   REPOSITORY.
003300     CLASS  Collect
003400     CLASS  ListNode-class.
003500
003600   OBJECT.
003700   DATA  DIVISION.
003800   PROCEDURE  DIVISION.
003900*=======================================================================
004000*�@�v�f�擾���\�b�h�iElement-Get�j
004100*
004200*�@�@�@�w�肳�ꂽ�ԍ��̃��X�g�v�f�́C�ΏۃI�u�W�F�N�g���擾����B
004300*
004400*�@�Z���́F�@�v�f�ԍ��iPIC  9(8) COMP�j
004500*�@�Z�o�́F�@�v�f�iOBJECT REFERENCE�j
004600*�@�Z���l�F
004700*�@�@�@�w�肳�ꂽ�ԍ��̗v�f�����݂��Ȃ��ꍇ�CNULL���ԋp����܂��B
004800*========================================================================
004900   METHOD-ID.  Element-Get.
005000   DATA  DIVISION.
005100   WORKING-STORAGE  SECTION.
005200    01  �v�|�ꎞ�̈�            OBJECT  REFERENCE.
005300    01  �v�|���v�f              OBJECT  REFERENCE  ListNode-class.
005400    01  �v�|�v�f�ԍ�            PIC 9(08)  COMP.
005500   LINKAGE  SECTION.
005600    01  �k�|�v�f�ԍ�            PIC 9(08)  COMP.
005700    01  �k�|�ΏۃI�u�W�F�N�g    OBJECT  REFERENCE.
005800   PROCEDURE  DIVISION
005900              USING  �k�|�v�f�ԍ�  RETURNING  �k�|�ΏۃI�u�W�F�N�g.
006000*
006100       SET �k�|�ΏۃI�u�W�F�N�g  TO  NULL.
006200       SET �v�|�ꎞ�̈�          TO  �擪�̗v�f    OF  SELF.
006300       SET �v�|���v�f            TO  �v�|�ꎞ�̈�  AS  ListNode-class.
006400       MOVE  1                   TO  �v�|�v�f�ԍ�.
006500*
006600       PERFORM    UNTIL  �v�|�v�f�ԍ�  =  �k�|�v�f�ԍ�  OR
006700                         �v�|���v�f    =  NULL
006800           SET �v�|�ꎞ�̈�      TO  ���̗v�f      OF  �v�|���v�f
006900           SET �v�|���v�f        TO  �v�|�ꎞ�̈�  AS  ListNode-class
007000           ADD  1                TO  �v�|�v�f�ԍ�
007100       END-PERFORM.
007200*
007300       IF  �v�|���v�f  NOT  =  NULL
007400       THEN
007500           SET  �k�|�ΏۃI�u�W�F�N�g   TO
007600                                      �ΏۃI�u�W�F�N�g  OF  �v�|���v�f
007700       END-IF.
007800*
007900   END  METHOD  Element-Get.
008000*
008100*========================================================================
008200*�@�擪�v�f�擾���\�b�h�iFirstElement-Get�j
008300*
008400*�@�@�@�擪�̃��X�g�v�f�����C�ΏۃI�u�W�F�N�g���擾����B
008500*
008600*�@�Z�o�́F�@�擪�I�u�W�F�N�g�iOBJECT REFERENCE�j
008700*========================================================================
008800   METHOD-ID.  FirstElement-Get OVERRIDE.
008900   DATA  DIVISION.
009000   WORKING-STORAGE  SECTION.
009100    01  �v�|�擪�̗v�f        OBJECT  REFERENCE.
009200   LINKAGE  SECTION.
009300    01  �k�|�擪�I�u�W�F�N�g  OBJECT  REFERENCE.
009400   PROCEDURE  DIVISION  RETURNING  �k�|�擪�I�u�W�F�N�g.
009500*
009600       IF  SELF::"CollectionSize-Get"  NOT =  0
009700       THEN
009800           SET �v�|�擪�̗v�f         TO  �擪�̗v�f  OF  SELF
009900           SET �k�|�擪�I�u�W�F�N�g   TO
010000              �ΏۃI�u�W�F�N�g   OF  �v�|�擪�̗v�f  AS  ListNode-class
010100           SET ���݂̗v�f  OF SELF    TO  �v�|�擪�̗v�f
010200       ELSE
010300           SET �k�|�擪�I�u�W�F�N�g   TO  NULL
010400       END-IF.
010500*
010600   END  METHOD  FirstElement-Get.
010700*
010800*========================================================================
010900*�@�Ō�̗v�f�擾���\�b�h�iLastElement-Get�j
011000*
011100*�@�@�@���X�g�\���̍Ō�̗v�f�����C�ΏۃI�u�W�F�N�g���擾����B
011200*
011300*�@�Z�o�́F�@�Ō�I�u�W�F�N�g�iOBJECT REFERENCE�j
011400*========================================================================
011500   METHOD-ID.  LastElement-Get.
011600   DATA  DIVISION.
011700   WORKING-STORAGE  SECTION.
011800    01  �v�|�Ō�̗v�f           OBJECT  REFERENCE.
011900   LINKAGE  SECTION.
012000    01  �k�|�Ō�̃I�u�W�F�N�g   OBJECT REFERENCE.
012100   PROCEDURE  DIVISION  RETURNING  �k�|�Ō�̃I�u�W�F�N�g.
012200
012300       IF  SELF::"CollectionSize-Get"  NOT =  0
012400       THEN
012500           SET �v�|�Ō�̗v�f           TO  �Ō�̗v�f  OF  SELF
012600           SET �k�|�Ō�̃I�u�W�F�N�g   TO
012700              �ΏۃI�u�W�F�N�g   OF  �v�|�Ō�̗v�f  AS  ListNode-class
012800           SET ���݂̗v�f  OF  SELF     TO  �v�|�Ō�̗v�f
012900       ELSE
013000           SET �k�|�Ō�̃I�u�W�F�N�g   TO  NULL
013100       END-IF.
013200*
013300   END  METHOD  LastElement-Get.
013400
013500*========================================================================
013600*�@�v�f�ԍ��擾���\�b�h�iElementNo-Get�j
013700*
013800*�@�@�@�I�u�W�F�N�g�ɑ΂���v�f�̗v�f�ԍ����擾����B
013900*
014000*�@�Z���́F�@�ΏۃI�u�W�F�N�g�iOBJECT REFERENCE�j
014100*�@�Z�o�́F�@�v�f�ԍ�        �iPIC 9(8) COMP�j
014200*========================================================================
014300   METHOD-ID.  ElementNo-Get.
014400   DATA  DIVISION.
014500   WORKING-STORAGE  SECTION.
014600    01  �v�|�v�f�ԍ�            PIC 9(08)  COMP.
014700    01  �v�|���v�f              OBJECT  REFERENCE  ListNode-class.
014800    01  �v�|���I�u�W�F�N�g      OBJECT  REFERENCE.
014900    01  �v�|�ꎞ�̈�            OBJECT  REFERENCE.
015000   LINKAGE  SECTION.
015100    01  �k�|�v�f�ԍ�            PIC 9(08)  COMP.
015200    01  �k�|�ΏۃI�u�W�F�N�g    OBJECT  REFERENCE.
015300   PROCEDURE  DIVISION
015400                  USING  �k�|�ΏۃI�u�W�F�N�g  RETURNING  �k�|�v�f�ԍ�.
015500*
015600       MOVE   0                  TO   �k�|�v�f�ԍ�.
015700       SET   �v�|�ꎞ�̈�        TO   �擪�̗v�f        OF  SELF.
015800       SET   �v�|���v�f          TO   �v�|�ꎞ�̈�  AS  ListNode-class.
015900       IF    �v�|���v�f  =  NULL
016000       THEN
016100           EXIT METHOD
016200       ELSE
016300           SET  �v�|���I�u�W�F�N�g  TO  �ΏۃI�u�W�F�N�g OF  �v�|���v�f
016400           MOVE   1                 TO  �v�|�v�f�ԍ�
016500       END-IF.
016600*
016700       PERFORM  UNTIL  �v�|���I�u�W�F�N�g  =  �k�|�ΏۃI�u�W�F�N�g
016800           SET �v�|�ꎞ�̈�       TO  ���̗v�f      OF  �v�|���v�f
016900           SET �v�|���v�f         TO  �v�|�ꎞ�̈�  AS  ListNode-class
017000           IF   �v�|���v�f  =  NULL
017100           THEN
017200               EXIT  METHOD
017300           ELSE
017400               SET �v�|���I�u�W�F�N�g TO
017500                                   �ΏۃI�u�W�F�N�g  OF  �v�|���v�f
017600               ADD  1   TO   �v�|�v�f�ԍ�
017700           END-IF
017800       END-PERFORM.
017900*
018000       MOVE   �v�|�v�f�ԍ�   TO   �k�|�v�f�ԍ�.
018100*
018200   END  METHOD  ElementNo-Get.
018300*
018400*========================================================================
018500*�@�v�f�ǉ����\�b�h�iElement-PutLast�j
018600*
018700*�@�@�@�ΏۃI�u�W�F�N�g�ɑ΂���V�v�f�𐶐����C���X�g�̍Ō�̗v�f�̌��
018800*�@�@�ǉ�����B
018900*
019000*�@�Z���́F�@�ΏۃI�u�W�F�N�g�iOBJECT REFERENCE�j
019100*========================================================================
019200   METHOD-ID.  Element-PutLast.
019300   DATA  DIVISION.
019400   WORKING-STORAGE  SECTION.
019500    01  �v�|�V�v�f              OBJECT  REFERENCE  ListNode-class.
019600    01  �v�|�Ō�̗v�f          OBJECT  REFERENCE  ListNode-class.
019700    01  �v�|�ꎞ�̈�            OBJECT  REFERENCE.
019800   LINKAGE  SECTION.
019900    01  �k�|�ΏۃI�u�W�F�N�g    OBJECT  REFERENCE.
020000   PROCEDURE  DIVISION  USING  �k�|�ΏۃI�u�W�F�N�g.
020100*
020200      INVOKE  ListNode-class  "new"  RETURNING   �v�|�V�v�f.
020300      SET  �ΏۃI�u�W�F�N�g OF  �v�|�V�v�f   TO  �k�|�ΏۃI�u�W�F�N�g.
020400      SET  ���݂̗v�f       OF  SELF         TO  �v�|�V�v�f.
020500*
020600      IF  SELF::"CollectionSize-Get"  =  0
020700      THEN
020800          SET  ���̗v�f         OF  �v�|�V�v�f      TO  NULL
020900          SET  �O�̗v�f         OF  �v�|�V�v�f      TO  NULL
021000          SET  �擪�̗v�f       OF  SELF            TO  �v�|�V�v�f
021100          SET  �Ō�̗v�f       OF  SELF            TO  �v�|�V�v�f
021200      ELSE
021300          SET  �v�|�ꎞ�̈�         TO  �Ō�̗v�f  OF  SELF
021400          SET  �v�|�Ō�̗v�f   TO  �v�|�ꎞ�̈�    AS  ListNode-class
021500          SET  ���̗v�f         OF  �v�|�Ō�̗v�f  TO  �v�|�V�v�f
021600          SET  ���̗v�f         OF  �v�|�V�v�f      TO  NULL
021700          SET  �O�̗v�f         OF  �v�|�V�v�f      TO  �v�|�Ō�̗v�f
021800          SET  �Ō�̗v�f       OF  SELF            TO  �v�|�V�v�f
021900      END-IF.
022000      INVOKE  SELF  "Add-CollSize".
022100*
022200   END  METHOD  Element-PutLast.
022300*========================================================================
022400*�@�v�f�u�����\�b�h�iElement-PutAt�j
022500*
022600*�@�@�@�w�肵���ԍ��̗v�f�̑ΏۃI�u�W�F�N�g��u��������B
022700*
022800*�@�Z���́F�@�v�f�ԍ�        �iPIC 9(8) COMP�j
022900*�@�@�@�@�@�@�ΏۃI�u�W�F�N�g�iOBJECT REFERENCE�j
023000*�@�Z�o�́F�@���A�l�@�@�@�@�@�iPIC 9(4) COMP�j
023100*
023200*========================================================================
023300   METHOD-ID.  Element-PutAt.
023400   DATA  DIVISION.
023500   WORKING-STORAGE  SECTION.
023600    01  �v�|�v�f�ԍ�            PIC 9(08)  COMP.
023700    01  �v�|�u���Ώۗv�f        OBJECT  REFERENCE  ListNode-class.
023800    01  �v�|�ꎞ�̈�            OBJECT  REFERENCE.
023900   LINKAGE  SECTION.
024000    01  �k�|�v�f�ԍ�            PIC 9(08)  COMP.
024100    01  �k�|�ΏۃI�u�W�F�N�g    OBJECT  REFERENCE.
024200    01  �k�|���A�l              PIC 9(04)  COMP.
024300   PROCEDURE  DIVISION
024400       USING  �k�|�v�f�ԍ� �k�|�ΏۃI�u�W�F�N�g  RETURNING  �k�|���A�l.
024500*
024600       MOVE  0                   TO   �k�|���A�l.
024700       SET  �v�|�ꎞ�̈�         TO   �擪�̗v�f    OF  SELF.
024800       SET  �v�|�u���Ώۗv�f     TO   �v�|�ꎞ�̈�  AS  ListNode-class.
024900       MOVE  1                   TO   �v�|�v�f�ԍ�.
025000*
025100       PERFORM    UNTIL  �v�|�v�f�ԍ�      =  �k�|�v�f�ԍ�  OR
025200                         �v�|�u���Ώۗv�f  =  NULL
025300           SET �v�|�ꎞ�̈�      TO   ���̗v�f      OF  �v�|�u���Ώۗv�f
025400           SET �v�|�u���Ώۗv�f  TO   �v�|�ꎞ�̈�  AS  ListNode-class
025500           ADD  1                TO   �v�|�v�f�ԍ�
025600       END-PERFORM.
025700*
025800       IF  �v�|�u���Ώۗv�f  NOT  =  NULL
025900       THEN
026000           SET  �ΏۃI�u�W�F�N�g  OF   �v�|�u���Ώۗv�f   TO
026100                                                �k�|�ΏۃI�u�W�F�N�g
026200           MOVE  �v�|�v�f�ԍ�     TO   �k�|���A�l
026300       END-IF.
026400*
026500   END  METHOD  Element-PutAt.
026600*
026700*========================================================================
026800*�@�v�f�}�����\�b�h�iElement-Insert�j
026900*
027000*�@�@�@�ΏۃI�u�W�F�N�g�ɑ΂���V�K���X�g�v�f�𐶐����C�w�肳�ꂽ�ԍ���
027100*�@�@�ʒu��
027200*�@�@�C���̗v�f��}������B
027300*
027400*�@�Z���́F�@�w��ԍ��@�@    �iPIC 9(8) COMP�j
027500*�@�@�@�@�@�@�ΏۃI�u�W�F�N�g�iOBJECT REFERENCE�j
027600*�@�Z�o�́F�@���A�l�@�@�@�@�@�iPIC 9(4) COMP�j
027700*�@�Z���l�F
027800*�@�@�@�}��������ɍs��ꂽ�ꍇ�C���A�l�Ƃ��āC�w�肳�ꂽ�ԍ��Ɠ����l��
027900*�@�@�ԋp���܂��B
028000*�@�@�@�w�肳�ꂽ�ԍ����C���v�f���{�P���傫���l�̏ꍇ�C���A�l�Ƃ��ĂO
028100*�@�@��ԋp���܂��B���̏ꍇ�C���ʓI�ɂ͉����s���܂���B
028200*========================================================================
028300   METHOD-ID.  Element-Insert.
028400   DATA  DIVISION.
028500   WORKING-STORAGE  SECTION.
028600    01  �v�|�V�v�f              OBJECT  REFERENCE  ListNode-class.
028700    01  �v�|���v�f              OBJECT  REFERENCE  ListNode-class.
028800    01  �v�|�O�̗v�f            OBJECT  REFERENCE.
028900    01  �v�|���̗v�f            OBJECT  REFERENCE.
029000    01  �v�|�v�f�ԍ�            PIC 9(08)  COMP.
029100    01  �v�|�v�f��              PIC 9(08)  COMP.
029200    01  �v�|�ꎞ�̈�            OBJECT  REFERENCE.
029300   LINKAGE  SECTION.
029400    01  �k�|�w��v�f�ԍ�        PIC 9(08)  COMP.
029500    01  �k�|�ΏۃI�u�W�F�N�g    OBJECT  REFERENCE.
029600    01  �k�|���A�l              PIC 9(04)  COMP.
029700   PROCEDURE  DIVISION  USING   �k�|�w��v�f�ԍ�  �k�|�ΏۃI�u�W�F�N�g
029800                        RETURNING  �k�|���A�l.
029900*
030000       MOVE  SELF::"CollectionSize-Get"    TO  �v�|�v�f��.
030100       IF    �k�|�w��v�f�ԍ�   >  �v�|�v�f��  +  1
030200       THEN
030300           MOVE   0              TO  �k�|���A�l
030400           EXIT  METHOD
030500       END-IF.
030600*
030700       SET  �v�|�ꎞ�̈�        TO   �擪�̗v�f    OF  SELF.
030800       SET  �v�|���v�f          TO   �v�|�ꎞ�̈�  AS  ListNode-class.
030900       MOVE  1                  TO   �v�|�v�f�ԍ�.
031000*
031100       PERFORM  UNTIL  �v�|�v�f�ԍ�  =  �k�|�w��v�f�ԍ�  OR
031200                       �v�|���v�f    =  NULL
031300           SET  �v�|���̗v�f    TO   ���̗v�f      OF  �v�|���v�f
031400           SET  �v�|���v�f      TO   �v�|���̗v�f  AS  ListNode-class
031500           ADD   1              TO   �v�|�v�f�ԍ�
031600       END-PERFORM.
031700*
031800       INVOKE  ListNode-class  "new"  RETURNING   �v�|�V�v�f
031900       SET  �ΏۃI�u�W�F�N�g OF  �v�|�V�v�f  TO  �k�|�ΏۃI�u�W�F�N�g
032000*
032100       IF   �v�|���v�f  =  NULL
032200       THEN
032300           IF  �v�|�v�f��  =  0
032400           THEN
032500               SET �擪�̗v�f     OF  SELF          TO   �v�|�V�v�f
032600               SET �O�̗v�f       OF  �v�|�V�v�f    TO   NULL
032700           ELSE
032800               SET �v�|�O�̗v�f   TO  �Ō�̗v�f    OF   SELF
032900               SET ���̗v�f       OF  �v�|�O�̗v�f  AS   ListNode-class
033000                                                    TO   �v�|�V�v�f
033100               SET �O�̗v�f       OF  �v�|�V�v�f    TO   �v�|�O�̗v�f
033200           END-IF
033300           SET  �Ō�̗v�f        OF  SELF          TO   �v�|�V�v�f
033400           SET  ���̗v�f          OF  �v�|�V�v�f    TO   NULL
033500       ELSE
033600           IF  �v�|�v�f��  =  1
033700           THEN
033800               SET  �擪�̗v�f    OF  SELF          TO   �v�|�V�v�f
033900               SET  �O�̗v�f      OF  �v�|�V�v�f    TO   NULL
034000           ELSE
034100               SET  �v�|�O�̗v�f  TO
034200                        �O�̗v�f  OF  �v�|���v�f    AS  ListNode-class
034300               SET  �O�̗v�f      OF  �v�|�V�v�f    TO  �v�|�O�̗v�f
034400               SET  ���̗v�f      OF  �v�|�O�̗v�f  AS  ListNode-class
034500                                                    TO  �v�|�V�v�f
034600           END-IF
034700           SET  ���̗v�f      OF  �v�|�V�v�f    TO   �v�|���v�f
034800           SET  �O�̗v�f      OF  �v�|���v�f    TO   �v�|�V�v�f
034900       END-IF
035000       INVOKE  SELF  "Add-CollSize"
035100       SET  ���݂̗v�f  OF  SELF  TO  �v�|�V�v�f
035200       MOVE  �k�|�w��v�f�ԍ�     TO  �k�|���A�l
035300*
035400   END  METHOD  Element-Insert.
035500*
035600*========================================================================
035700*�@�S�v�f�폜���\�b�h�iRemove-All�j
035800*
035900*�@�@�@�������ꂽ�S�Ă̗v�f���폜����B
036000*
036100*========================================================================
036200   METHOD-ID.  Remove-All.
036300   DATA  DIVISION.
036400   WORKING-STORAGE  SECTION.
036500    01  �v�|�v�f��          PIC 9(08)  COMP.
036600    01  �v�|���v�f          OBJECT  REFERENCE  ListNode-class.
036700    01  �v�|���̗v�f        OBJECT  REFERENCE.
036800    01  �v�|�ꎞ�̈�        OBJECT  REFERENCE.
036900   PROCEDURE  DIVISION.
037000*
037100       MOVE  SELF::"CollectionSize-Get"  TO  �v�|�v�f��.
037200       SET  �v�|�ꎞ�̈�          TO  �擪�̗v�f    OF  SELF.
037300       SET  �v�|���v�f            TO  �v�|�ꎞ�̈�  AS  ListNode-class.
037400*
037500       PERFORM  UNTIL  �v�|�v�f��   <=  0
037600           SET �O�̗v�f  OF  �v�|���v�f         TO  NULL
037700           SET �v�|�ꎞ�̈�   TO  ���̗v�f      OF  �v�|���v�f
037800           SET ���̗v�f  OF  �v�|���v�f         TO  NULL
037900           SET �v�|���v�f     TO  �v�|�ꎞ�̈�  AS  ListNode-class
038000           INVOKE  SELF  "Sub-CollSize"
038100           ADD  -1  TO  �v�|�v�f��
038200       END-PERFORM.
038300*
038400       SET �擪�̗v�f  OF  SELF  TO  NULL.
038500       SET �Ō�̗v�f  OF  SELF  TO  NULL.
038600       SET ���݂̗v�f  OF  SELF  TO  NULL.
038700*
038800   END  METHOD  Remove-All.
038900*
039000*========================================================================
039100*�@�w��v�f�폜���\�b�h�iRemove-At�j
039200*
039300*�@�@�@�w�肳�ꂽ�v�f�ԍ��̗v�f���폜����B
039400*
039500*�@�Z���́F�@�v�f�ԍ��@�@�@�@�iPIC 9(8) COMP�j
039600*�@�Z�o�́F�@���A�l�@�@�@�@�@�iPIC 9(4) COMP�j
039700*�@�Z���l�F
039800*�@�@�@�폜������ɍs��ꂽ�ꍇ�C���A�l�Ƃ��āC�w�肳�ꂽ�ԍ��Ɠ����l��
039900*�@�@�ԋp���܂��B
040000*�@�@�@�w�肳�ꂽ�ԍ����C���v�f�����傫���l�̏ꍇ�C���A�l�Ƃ��ĂO���
040100*�@�@�p���܂��B���̏ꍇ�C���ʓI�ɂ͉����s���܂���B
040200*========================================================================
040300   METHOD-ID.  Remove-At.
040400   DATA  DIVISION.
040500   WORKING-STORAGE  SECTION.
040600    01  �v�|���v�f            OBJECT  REFERENCE  ListNode-class.
040700    01  �v�|�O�̗v�f          OBJECT  REFERENCE.
040800    01  �v�|���̗v�f          OBJECT  REFERENCE.
040900    01  �v�|�ꎞ�̈�          OBJECT  REFERENCE.
041000    01  �v�|�v�f�ԍ�          PIC 9(08)  COMP.
041100    01  �v�|�v�f��            PIC 9(08)  COMP.
041200   LINKAGE  SECTION.
041300    01  �k�|�w��v�f�ԍ�      PIC 9(08)  COMP.
041400    01  �k�|���A�l            PIC 9(04)  COMP.
041500   PROCEDURE  DIVISION
041600                 USING  �k�|�w��v�f�ԍ�  RETURNING  �k�|���A�l.
041700
041800       MOVE  SELF::"CollectionSize-Get"    TO  �v�|�v�f��.
041900       IF    �k�|�w��v�f�ԍ�   >  �v�|�v�f��
042000       THEN
042100           MOVE   0                TO  �k�|���A�l
042200           EXIT   METHOD
042300       END-IF.
042400*
042500       SET  �v�|�ꎞ�̈�        TO   �擪�̗v�f    OF  SELF.
042600       SET  �v�|���v�f          TO   �v�|�ꎞ�̈�  AS  ListNode-class.
042700       MOVE  1                  TO   �v�|�v�f�ԍ�.
042800       PERFORM  UNTIL  �v�|�v�f�ԍ�  =  �k�|�w��v�f�ԍ�
042900           SET  �v�|���̗v�f    TO   ���̗v�f      OF  �v�|���v�f
043000           SET  �v�|���v�f      TO   �v�|���̗v�f  AS  ListNode-class
043100           ADD   1              TO   �v�|�v�f�ԍ�
043200       END-PERFORM.
043300*
043400       SET �ΏۃI�u�W�F�N�g  OF  �v�|���v�f   TO  NULL.
043500       SET �v�|�O�̗v�f                  TO  �O�̗v�f  OF  �v�|���v�f.
043600       SET �v�|���̗v�f                  TO  ���̗v�f  OF  �v�|���v�f.
043700       SET �O�̗v�f  OF  �v�|���v�f      TO  NULL.
043800       SET ���̗v�f  OF  �v�|���v�f      TO  NULL.
043900*
044000       IF   �v�|�O�̗v�f   =   NULL
044100       THEN
044200           IF   �v�|���̗v�f  =  NULL
044300           THEN
044400               SET  �擪�̗v�f  OF  SELF          TO  NULL
044500               SET  �Ō�̗v�f  OF  SELF          TO  NULL
044600               SET  ���݂̗v�f  OF  SELF          TO  NULL
044700           ELSE
044800               SET  �擪�̗v�f  OF  SELF          TO  �v�|���̗v�f
044900               SET  �O�̗v�f    OF  �v�|���̗v�f  AS  ListNode-class
045000                                                  TO  NULL
045100               SET  ���݂̗v�f  OF  SELF          TO  �v�|���̗v�f
045200           END-IF
045300       ELSE
045400           IF  �v�|���̗v�f  =  NULL
045500           THEN
045600               SET  �Ō�̗v�f  OF  SELF          TO  �v�|�O�̗v�f
045700               SET  ���̗v�f    OF  �v�|�O�̗v�f  AS  ListNode-class
045800                                                  TO  NULL
045900               SET  ���݂̗v�f  OF  SELF          TO  �v�|�O�̗v�f
046000           ELSE
046100               SET  ���̗v�f    OF  �v�|�O�̗v�f  AS  ListNode-class
046200                                                  TO  �v�|���̗v�f
046300               SET  �O�̗v�f    OF  �v�|���̗v�f  AS  ListNode-class
046400                                                  TO  �v�|�O�̗v�f
046500               SET  ���݂̗v�f  OF  SELF          TO  �v�|���̗v�f
046600           END-IF
046700       END-IF.
046800       INVOKE  SELF  "Sub-CollSize".
046900       MOVE    �k�|�w��v�f�ԍ�  TO  �k�|���A�l.
047000*
047100   END  METHOD  Remove-At.
047200*
047300*========================================================================
047400*�@���v�f�擾���\�b�h�iNextElement-Get�j
047500*
047600*�@�@�@���̗v�f�̑ΏۃI�u�W�F�N�g���擾����B
047700*
047800*�@�Z�o�́F�@���̃I�u�W�F�N�g�@�iOBJECT REFERENCE�j
047900*========================================================================
048000   METHOD-ID.  NextElement-Get OVERRIDE.
048100   DATA  DIVISION.
048200   WORKING-STORAGE  SECTION.
048300   01  �v�|���̗v�f           OBJECT  REFERENCE.
048400   01  �v�|���v�f             OBJECT  REFERENCE.
048500   LINKAGE  SECTION.
048600   01  �k�|���̃I�u�W�F�N�g   OBJECT  REFERENCE.
048700   PROCEDURE  DIVISION  RETURNING   �k�|���̃I�u�W�F�N�g.
048800*
048900       SET �k�|���̃I�u�W�F�N�g   TO  NULL.
049000       SET �v�|���v�f     TO  ���݂̗v�f  OF  SELF.
049100       SET �v�|���̗v�f   TO  ���̗v�f    OF  �v�|���v�f
049200                                          AS  ListNode-class.
049300       IF   �v�|���̗v�f  NOT =  NULL
049400       THEN
049500           SET  �k�|���̃I�u�W�F�N�g  TO
049600               �ΏۃI�u�W�F�N�g  OF   �v�|���̗v�f  AS  ListNode-class
049700           SET  ���݂̗v�f  OF  SELF  TO  �v�|���̗v�f
049800       END-IF.
049900*
050000   END  METHOD  NextElement-Get.
050100*
050200*========================================================================
050300*�@�O�v�f�擾���\�b�h�iPreviousElement-Get�j
050400*
050500*�@�@�@�O�̗v�f�̑ΏۃI�u�W�F�N�g���擾����B
050600*
050700*�@�Z�o�́F�@�O�̃I�u�W�F�N�g�@�iOBJECT REFERENCE�j
050800*========================================================================
050900   METHOD-ID.  PreviousElement-Get  OVERRIDE.
051000   DATA  DIVISION.
051100   WORKING-STORAGE  SECTION.
051200    01  �v�|�O�̗v�f           OBJECT  REFERENCE.
051300    01  �v�|���v�f             OBJECT  REFERENCE.
051400   LINKAGE  SECTION.
051500    01  �k�|�O�̃I�u�W�F�N�g   OBJECT  REFERENCE.
051600   PROCEDURE  DIVISION  RETURNING   �k�|�O�̃I�u�W�F�N�g.
051700*
051800         SET �k�|�O�̃I�u�W�F�N�g  TO  NULL.
051900         SET �v�|���v�f            TO  ���݂̗v�f  OF  SELF.
052000         SET �v�|�O�̗v�f          TO  �O�̗v�f    OF  �v�|���v�f
052100                                                   AS  ListNode-class.
052200*
052300         IF  �v�|�O�̗v�f  NOT =  NULL
052400         THEN
052500             SET �k�|�O�̃I�u�W�F�N�g  TO
052600                     �ΏۃI�u�W�F�N�g  OF  �v�|�O�̗v�f
052700                                       AS    ListNode-class
052800             SET ���݂̗v�f  OF  SELF  TO  �v�|�O�̗v�f
052900         END-IF.
053000*
053100   END  METHOD  PreviousElement-Get.
053200*
053300   END  OBJECT.
053400 END  CLASS  List.
