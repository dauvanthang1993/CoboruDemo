000100*========================================================================
000200*�@�]�ƈ��N���X�iAllMember-class�j
000300*                        �|�T���v���v���O�����u�]�ƈ��Ǘ��i�i�����j�v
000400*
000500*�@�@�@�S�Ă̏]�ƈ��ɂ��ċ��ʂȃf�[�^�y�у��\�b�h�����B
000600*
000700*�@�Z�p���N���X
000800*�@�@�P�jFjbase
000900*
001000*�@�Z�Q�ƃN���X
001100*�@�@�P�j�]�ƈ��}�X�^�N���X�@�@�iMemberMaster-class�j
001200*�@�@�Q�j�Z���N���X�@�@�@�@�@�@�iAddress-class�j
001300*
001400*�@�Z�I�u�W�F�N�g�f�[�^
001500*�@�@�P�j�]�ƈ��ԍ��@�|�@PIC  9(4)
001600*�@�@�Q�j�����@�@�@�@�|�@PIC  N(8)
001700*�@�@�R�j���ДN�����@�|�@PIC  X(8)
001800*�@�@�S�j�ގДN�����@�|�@PIC  X(8)
001900*�@�@�T�j�E���@�@�@�@�|�@PIC  9(1)
002000*�@�@�U�j��{���@�@�@�|�@PIC  9(8)
002100*�@�@�V�j���x���@�@�@�|�@PIC  9(8)
002200*�@�@�W�j�Z���Q�Ɓ@�@�|�@object REFERENCE Address-class
002300*
002400*�@�Z�t�@�N�g�����\�b�h
002500*�@�@�P�j�E���擾�@�@�@�@�iSyokukyuGet-method�j
002600*�@�@�Q�j�]�ƈ��f�[�^�擾�iRetAt-method�j
002700*�@�@�R�j���]�ƈ����擾�iNextGet-method�j
002800*�@�@�S�j�擪�ʒu�Â��@�@�iSetTop-method�j
002900*�@�@�T�j�]�ƈ��f�[�^�폜�iRemoveAt-method�j
003000*�@�@�U�j�}�X�^�n�o�d�m�@�iMasterOpen-method�j
003100*�@�@�V�j�}�X�^�b�k�n�r�d�iMasterClose-method�j
003200*
003300*�@�Z�I�u�W�F�N�g���\�b�h
003400*�@�@�P�j�I�u�W�F�N�g�f�[�^�ɑ΂���CGET�y��SET�̃v���p�e�B���\�b�h
003500*�@�@�Q�j���^�v�Z�@�@�@�@�iSaraly-method�j
003600*�@�@�R�j�ܗ^�v�Z�@�@�@�@�iBonus-method�j
003700*�@�@�S�j�ݐЃ`�F�b�N�@�@�iIOCheck-method�j
003800*�@�@�T�j�f�[�^�ݒ�@�@�@�iDataSet-method�j
003900*�@�@�U�j�ۑ��@�@�@�@�@�@�iStore-method�j
004000*
004100*                              Copyright 1997-2015 FUJITSU LIMITED
004200*========================================================================
004300 CLASS-ID.   AllMember-class INHERITS  FJBASE.
004400 ENVIRONMENT    DIVISION.
004500 CONFIGURATION    SECTION.
004600 REPOSITORY.
004700      CLASS FJBASE
004800      CLASS MemberMaster-class
004900      CLASS Address-class.
005000*
005100  FACTORY.
005200  PROCEDURE DIVISION.
005300*
005400*========================================================================
005500*�@�E���擾���\�b�h�iSyokukyuGet-method�j
005600*
005700*�@�@�@�w�肳�ꂽ�]�ƈ��ԍ��̏]�ƈ��f�[�^�����݂���Ȃ�΁C�E���l���l��
005800*�@�@���ԋp����B
005900*�@�@�@�w�肳�ꂽ�]�ƈ��ԍ��̏]�ƈ��f�[�^�����݂��Ȃ��Ȃ�΁C�O��ԋp��
006000*�@�@��B
006100*
006200*�@�Z���́F�@�]�ƈ��ԍ�         �iPIC 9(8)�j
006300*�@�Z�o�́F�@�E��               �iPIC 9(1))
006400*========================================================================
006500   METHOD-ID.  SyokukyuGet-method.
006600   DATA DIVISION.
006700   WORKING-STORAGE SECTION.
006800    01  �v�|���A�l               PIC 9(1).
006900   LINKAGE SECTION.
007000    01  �k�|�]�ƈ��ԍ�           PIC 9(4).
007100    01  �k�|�E��                 PIC 9(1).
007200   PROCEDURE DIVISION  USING     �k�|�]�ƈ��ԍ�
007300                       RETURNING �k�|�E��.
007400*
007500       MOVE  0   TO  �k�|�E��.
007600       INVOKE  MemberMaster-class  "RetAt-method"
007700                                    USING      �k�|�]�ƈ��ԍ�
007800                                    RETURNING  �v�|���A�l.
007900       IF �v�|���A�l  =  0
008000       THEN
008100           MOVE    �E��  of  MemberMaster-class   TO  �k�|�E��
008200       END-IF.
008300*
008400   END METHOD SyokukyuGet-method.
008500*
008600*========================================================================
008700*�@�]�ƈ��f�[�^�擾���\�b�h
008800*
008900*�@�@�@�w�肵���]�ƈ��ԍ��̏]�ƈ��f�[�^��ێ�����C�I�u�W�F�N�g�C���X�^
009000*�@�@���X�𐶐����C�ԋp����D
009100*
009200*�@�Z���́F�@�]�ƈ��ԍ�         �iPEC 9(8)�j
009300*�@�Z�o�́F�@�]�ƈ��I�u�W�F�N�g �iOBJECT REFERENCE SELF�j
009400*========================================================================
009500   METHOD-ID.  RetAt-method.
009600   DATA DIVISION.
009700   WORKING-STORAGE SECTION.
009800    01  �v�|���A�l                 PIC 9(1).
009900   CONSTANT SECTION.
010000   LINKAGE SECTION.
010100    01  �k�|�]�ƈ��ԍ�             PIC 9(4).
010200    01  �k�|�]�ƈ��I�u�W�F�N�g     OBJECT REFERENCE  SELF.
010300   PROCEDURE DIVISION  USING     �k�|�]�ƈ��ԍ�
010400                       RETURNING �k�|�]�ƈ��I�u�W�F�N�g.
010500*
010600       INVOKE   MemberMaster-class  "RetAt-method"
010700                                          USING       �k�|�]�ƈ��ԍ�
010800                                          RETURNING   �v�|���A�l
010900*
011000       IF �v�|���A�l  =  0
011100       THEN
011200           INVOKE   SELF   "new"  RETURNING  �k�|�]�ƈ��I�u�W�F�N�g
011300           INVOKE   �k�|�]�ƈ��I�u�W�F�N�g  "DataSet-method"
011400       ELSE
011500           SET  �k�|�]�ƈ��I�u�W�F�N�g   TO   NULL
011600       END-IF.
011700*
011800   END METHOD RetAt-method.
011900*
012000*========================================================================
012100*�@���]�ƈ����擾���\�b�h
012200*
012300*�@�@�@�]�ƈ��t�@�C���̎Q�ƈʒu���C���̃��R�[�h�Ɉʒu�Â��C�]�ƈ��ԍ��y
012400*�@�@�ѐE�������l������B
012500*
012600*�@�Z�o�́F�@�]�ƈ����
012700*�@�@�@�@�@�@�@�@�]�ƈ��ԍ�    PIC 9(4)
012800*�@�@�@�@�@�@�@�@�E��          PIC 9(1)
012900*========================================================================
013000   METHOD-ID.  NextGet-method.
013100   DATA DIVISION.
013200   WORKING-STORAGE SECTION.
013300    01  �v�|���A�l             PIC 9(01).
013400   CONSTANT SECTION.
013500   LINKAGE SECTION.
013600    01  �k�|�]�ƈ����.
013700      02  �k�|�]�ƈ��ԍ�       PIC 9(04).
013800      02  �k�|�E��             PIC 9(01).
013900   PROCEDURE DIVISION
014000               RETURNING �k�|�]�ƈ����.
014100*
014200       INVOKE   MemberMaster-class  "RetNext-method"
014300                                     RETURNING   �k�|�]�ƈ����.
014400*
014500   END METHOD NextGet-method.
014600*
014700*========================================================================
014800*�@�]�ƈ��}�X�^�擪�ʒu�Â����\�b�h
014900*
015000*�@�@�@�]�ƈ��}�X�^�̎Q�ƃ��R�[�h��擪�̃��R�[�h�Ɉʒu�Â��C�擪���R�[
015100*�@�@�h�̏]�ƈ����i�]�ƈ��ԍ��C�E���j���l������B
015200*
015300*�@�Z�o�́F�@�]�ƈ����
015400*�@�@�@�@�@�@�@�@�]�ƈ��ԍ�    PIC 9(4)
015500*�@�@�@�@�@�@�@�@�E��          PIC 9(1)
015600*========================================================================
015700   METHOD-ID.  SetTop-method.
015800   DATA DIVISION.
015900   WORKING-STORAGE SECTION.
016000   CONSTANT SECTION.
016100   LINKAGE SECTION.
016200    01  �k�|�]�ƈ����.
016300      02  �k�|�]�ƈ��ԍ�       PIC 9(04).
016400      02  �k�|�E��             PIC 9(01).
016500   PROCEDURE DIVISION
016600                 RETURNING  �k�|�]�ƈ����.
016700*
016800       INVOKE  MemberMaster-class  "SetTop-method"
016900                                    RETURNING  �k�|�]�ƈ����.
017000*
017100   END METHOD SetTop-method.
017200*
017300*========================================================================
017400*�@�]�ƈ��f�[�^�폜���\�b�h
017500*
017600*�@�@�@�w�肳�ꂽ�]�ƈ��ԍ��̃��R�[�h���C�]�ƈ��}�X�^�y�яZ���}�X�^����
017700*�@�@�폜����B
017800*�@�@�@�폜�����������ꍇ�C���A�l�Ƃ��ĂO���C�w�肳�ꂽ�]�ƈ��ԍ��ɑΉ�
017900*�@�@����]�ƈ���񂪑��݂��Ȃ����̗��R����C�폜���s�����ɏI������ꍇ
018000*�@�@�C���A�l�Ƃ��ĂP��ԋp����B
018100*========================================================================
018200   METHOD-ID.  RemoveAt-method.
018300   DATA DIVISION.
018400   WORKING-STORAGE SECTION.
018500   CONSTANT SECTION.
018600   LINKAGE SECTION.
018700    01  �k�|�]�ƈ��ԍ�      PIC 9(04).
018800    01  �k�|���A�l          PIC 9(01).
018900   PROCEDURE DIVISION
019000               USING    �k�|�]�ƈ��ԍ�   RETURNING   �k�|���A�l.
019100*
019200       INVOKE  MemberMaster-class  "RemoveAt-method"
019300                                           USING       �k�|�]�ƈ��ԍ�
019400                                           RETURNING   �k�|���A�l
019500       IF �k�|���A�l  = 0
019600       THEN
019700           INVOKE  Address-class  "RemoveAt-method"
019800                                           USING       �k�|�]�ƈ��ԍ�
019900       END-IF.
020000*
020100   END METHOD RemoveAt-method.
020200*
020300*========================================================================
020400*�@�}�X�^�n�o�d�m���\�b�h
020500*
020600*�@�@�@�]�ƈ��}�X�^�t�@�C���y�яZ���}�X�^�t�@�C���̂n�o�d�m���˗�����B
020700*
020800*========================================================================
020900   METHOD-ID.  MasterOpen-method.
021000   DATA DIVISION.
021100   WORKING-STORAGE SECTION.
021200   CONSTANT SECTION.
021300   LINKAGE SECTION.
021400   PROCEDURE DIVISION.
021500*
021600       INVOKE  MemberMaster-class   "Open-method".
021700       INVOKE  Address-class        "Open-method".
021800*
021900   END METHOD MasterOpen-method.
022000*
022100*========================================================================
022200*�@�}�X�^�b�k�n�r�d���\�b�h
022300*
022400*�@�@�@�]�ƈ��}�X�^�t�@�C���y�яZ���}�X�^�t�@�C���̂b�k�n�r�d���˗�����B
022500*
022600*========================================================================
022700   METHOD-ID.  MasterClose-method.
022800   DATA DIVISION.
022900   WORKING-STORAGE SECTION.
023000   CONSTANT SECTION.
023100   LINKAGE SECTION.
023200   PROCEDURE DIVISION.
023300*
023400       INVOKE  MemberMaster-class   "Close-method".
023500       INVOKE  Address-class        "Close-method".
023600*
023700   END METHOD MasterClose-method.
023800*
023900   END FACTORY.
024000*
024100   OBJECT.
024200   DATA DIVISION.
024300   WORKING-STORAGE SECTION.
024400   01  �]�ƈ��ԍ�          PIC   9(004) PROPERTY.
024500   01  ����                PIC   N(008) PROPERTY.
024600   01  ���ДN����          PIC   X(008) PROPERTY.
024700   01  �ގДN����          PIC   X(008) PROPERTY.
024800   01  �E��                PIC   9(001) PROPERTY.
024900   01  ��{��              PIC   9(008) PROPERTY.
025000   01  ���x��              PIC   9(008) PROPERTY.
025100   01  �Z���Q��            OBJECT  REFERENCE  Address-class PROPERTY.
025200   PROCEDURE DIVISION.
025300*========================================================================
025400*�@���^�v�Z���\�b�h
025500*
025600*�@�@�@���Ԃ��������邽�߂̒�`�ł���C�T�u�N���X��OVERRIDE����邱�Ƃ�
025700*�@�@���C���߂ĈӖ������D
025800*
025900*�@�Z�o�́F�@���x���iPIC 9(8)�j
026000*========================================================================
026100   METHOD-ID.  Salary-method.
026200   DATA DIVISION.
026300   LINKAGE SECTION.
026400    01  �k�|���x��          PIC   9(008).
026500   PROCEDURE   DIVISION    RETURNING   �k�|���x��.
026600   END METHOD  Salary-method.
026700*
026800*========================================================================
026900*�@�ܗ^�v�Z���\�b�h
027000*
027100*�@�@�@���Ԃ��������邽�߂̒�`�ł���C�T�u�N���X��OVERRIDE����邱�Ƃ�
027200*�@�@���C���߂ĈӖ������D
027300*
027400*�@�Z�o�́F�@���x���iPIC 9(8)�j
027500*========================================================================
027600   METHOD-ID.  Bonus-method.
027700   DATA DIVISION.
027800   LINKAGE SECTION.
027900    01  �k�|���x��          PIC   9(008).
028000   PROCEDURE   DIVISION    RETURNING   �k�|���x��.
028100   END METHOD Bonus-method.
028200*
028300*========================================================================
028400*�@�ݐЃ`�F�b�N���\�b�h
028500*
028600*�@�Z�o�́F�@�ݐЋ敪�iPIC X(1)�j
028700*========================================================================
028800   METHOD-ID.  IOCheck-method.
028900   DATA DIVISION.
029000   LINKAGE SECTION.
029100    01  �ݐЋ敪        PIC   X(001).
029200   PROCEDURE   DIVISION    RETURNING   �ݐЋ敪.
029300*
029400       IF  �ގДN����     =     SPACE
029500       THEN
029600            MOVE     "0"         TO     �ݐЋ敪
029700       ELSE
029800            MOVE     "1"         TO     �ݐЋ敪
029900       END-IF.
030000*
030100   END METHOD IOCheck-method.
030200*
030300*========================================================================
030400*�@�f�[�^�ݒ胁�\�b�h
030500*
030600*�@�i�P�j�����t�@�C������ǂݍ��񂾏]�ƈ��f�[�^�̂����́C�S�]�ƈ��ɋ���
030700*�@�@�@�ȃf�[�^���CSELF�̃I�u�W�F�N�g�ɐݒ肷��D
030800*�@�i�Q�j�Z���I�u�W�F�N�g�𐶐����C�����t�@�C�����ǂݍ��񂾃f�[�^���
030900*�@�@�@�肷��D
031000*========================================================================
031100   METHOD-ID.  DataSet-method  PROTOTYPE.
031200   DATA DIVISION.
031300   LINKAGE SECTION.
031400   PROCEDURE DIVISION.
031500   END METHOD DataSet-method.
031600*
031700*========================================================================
031800*�@�ۑ����\�b�h�iPROTOTYPE�j
031900*
032000*�@ SELF�̃I�u�W�F�N�g���ێ�����]�ƈ��f�[�^���C�]�ƈ��}�X�^�ɕۑ�����B
032100*
032200*========================================================================
032300   METHOD-ID.  Store-method  PROTOTYPE.
032400   DATA DIVISION.
032500   LINKAGE SECTION.
032600   PROCEDURE DIVISION.
032700   END METHOD Store-method.
032800*
032900   END OBJECT.
033000  END CLASS AllMember-class.
