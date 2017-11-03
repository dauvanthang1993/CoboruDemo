000100*========================================================================
000200*�@�]�ƈ��Ǘ��N���X�iControl-member-class�j
000300*                                   �|�T���v���v���O�����u�]�ƈ��Ǘ��v�|
000400*
000500*�@�@�@�]�ƈ����Ǘ�����]�ƈ������Q�ƃf�[�^����у��\�b�h������
000600*
000700*�@�Z�p���N���X
000800*�@�@�P�jFJBASE
000900*
001000*�@�Z�Q�ƃN���X
001100*�@�@�P�j�f�B�N�V���i���N���X     (Dict)
001200*�@�@�Q�j�Z���N���X               (Address-class)
001300*�@�@�R�j�]�ƈ��N���X             (AllMember-class)
001400*�@�@�S�j��ʏ]�ƈ��N���X         (Member-class)
001500*�@�@�T�j�Ǘ��҃N���X             (Manager-class)
001600*
001700*�@�Z�I�u�W�F�N�g�f�[�^
001800*�@�@�P�j�]�ƈ������Q�Ɓ@�|�@OBJECT REFERENCE  Dict
001900*
002000*�@�Z�I�u�W�F�N�g���\�b�h
002100*�@�@�P�j�]�ƈ��o�^���\�b�h       (Regist-member)
002200*�@�@�Q�j�]�ƈ����l�����\�b�h   (Get-member-info)
002300*�@�@�S�j�]�ƈ��폜���\�b�h       (Remove-member)
002400*�@�@�T�j���^�v�Z���\�b�h         (Cal-salary)
002500*�@�@�U�j���^�l�����\�b�h         (Get-salary)
002600*�@�@�V�j�Z��������\�b�h         (Print-address)
002700*
002800*                              Copyright 1997-2015 FUJITSU LIMITED
002900*========================================================================
003000 CLASS-ID.   Control-member-class INHERITS  FJBASE.
003100 ENVIRONMENT      DIVISION.
003200 CONFIGURATION    SECTION.
003300 REPOSITORY.
003400     CLASS  FJBASE
003500     CLASS  Dict
003600     CLASS  Address-class
003700     CLASS  AllMember-class
003800     CLASS  Member-class
003900     CLASS  Manager-class.
004000*
004100  OBJECT.
004200   DATA DIVISION.
004300   WORKING-STORAGE SECTION.
004400   01  �]�ƈ������|�I�u�W�F�N�g  USAGE  OBJECT REFERENCE  Dict.
004500    PROCEDURE DIVISION.
004600*=======================================================================
004700*�@INIT���\�b�h (INIT)
004800*
004900*�i�P�jNEW���\�b�h����Ă΂��B�I�u�W�F�N�g�f�[�^�����������郁�\�b�h�B
005000*=======================================================================
005100   METHOD-ID.  INIT  OVERRIDE.
005200   DATA DIVISION.
005300   WORKING-STORAGE SECTION.
005400   LINKAGE SECTION.
005500   PROCEDURE DIVISION.
005600*
005700      INVOKE  Dict "NEW"  RETURNING  �]�ƈ������|�I�u�W�F�N�g
005800*
005900   END METHOD  INIT.
006000*
006100*=======================================================================
006200*�@�]�ƈ��o�^���\�b�h (Regist-member)
006300*
006400*�@�����́F  �]�ƈ��ԍ�       (PIC 9(04))
006500*            ����             (PIC N(08))
006600*            �X�֔ԍ�
006700*              �X�֔ԍ��P     (PIC X(03))
006800*              �X�֔ԍ��Q     (PIC X(04))
006900*            �Z��             (PIC N(20))
007000*            ���ДN����       (PIC X(08))
007100*            �ގДN����       (PIC X(08))
007200*            �E��             (PIC 9(01))
007300*            ��{��           (PIC 9(08))
007400*            ���ʎ蓖         (PIC 9(06))
007500*            ���ԊO�蓖       (PIC 9(05))
007600*            �c�Ǝ���         (PIC 999.9)
007700*�@���o�́F�@���A�l           (PIC 9(4) COMP)
007800*          0 : �o�^����
007900*          1 : �o�^���s�i�E�����j
008000*=======================================================================
008100   METHOD-ID.  Regist-member.
008200   DATA DIVISION.
008300   WORKING-STORAGE SECTION.
008400   01  �]�ƈ��|�I�u�W�F�N�g    USAGE  OBJECT REFERENCE  AllMember-class.
008500   01  �Ǘ��ҁ|�I�u�W�F�N�g    USAGE  OBJECT REFERENCE  Manager-class.
008600   01  ��ʎЈ��|�I�u�W�F�N�g  USAGE  OBJECT REFERENCE  Member-class.
008700   01  �Z���|�I�u�W�F�N�g      USAGE  OBJECT REFERENCE  Address-class.
008800   LINKAGE SECTION.
008900   01  �k�|�]�ƈ��ԍ�     PIC 9(04).
009000   01  �w�|�]�ƈ��ԍ�     REDEFINES �k�|�]�ƈ��ԍ�  PIC X(04).
009100   01  �k�|����           PIC N(08).
009200   01  �k�|�X�֔ԍ�.
009300      02  �k�|�X�֔ԍ��P  PIC X(03).
009400      02  �k�|�X�֔ԍ��Q  PIC X(04).
009500   01  �k�|�Z��           PIC N(20).
009600   01  �k�|���ДN����     PIC X(08).
009700   01  �k�|�ގДN����     PIC X(08).
009800   01  �k�|�E��           PIC 9(01).
009900   01  �k�|��{��         PIC 9(08).
010000   01  �k�|���ʎ蓖       PIC 9(06).
010100   01  �k�|���ԊO�蓖     PIC 9(05).
010200   01  �k�|�c�Ǝ���       PIC 999.9.
010300   01  �q�|���A�l         PIC 9(04) COMP.
010400   PROCEDURE DIVISION
010500     USING  �k�|�]�ƈ��ԍ�
010600            �k�|����
010700            �k�|�X�֔ԍ�
010800            �k�|�Z��
010900            �k�|���ДN����
011000            �k�|�ގДN����
011100            �k�|�E��
011200            �k�|��{��
011300            �k�|���ʎ蓖
011400            �k�|���ԊO�蓖
011500            �k�|�c�Ǝ���
011600     RETURNING  �q�|���A�l.
011700*
011800       IF  NOT ( �k�|�E��  =  1    OR
011900                 �k�|�E��  =  2 )  THEN
012000         MOVE  1  TO  �q�|���A�l
012100         EXIT METHOD
012200       END-IF
012300
012400       PERFORM  �f�[�^�ݒ�
012500       INVOKE   �]�ƈ������|�I�u�W�F�N�g  "Element-PutAt"
012600          USING              �w�|�]�ƈ��ԍ�
012700                 BY CONTENT  �]�ƈ��|�I�u�W�F�N�g
012800       MOVE  0  TO  �q�|���A�l
012900       EXIT METHOD.
013000*=======================================================================
013100*�@�f�[�^�ݒ菈��
013200*
013300*�i�P�j�E�����̃I�u�W�F�N�g�𐶐����C�E���ŗL�̓��͏���ݒ肷��B
013400*  �E�@���͂��ꂽ�E�����P�i�Ǘ��ҁj�Ȃ�΁CManager-class �̃I�u�W�F�N�g
013500*�@�@�𐶐����C���ʎ蓖�̒l�����̃I�u�W�F�N�g�ɐݒ肷��B
013600*�@�E�@���͂��ꂽ�E�����Q�i��ʎЈ��j�Ȃ�΁C��ʎЈ��N���X�̃I�u�W�F�N
013700*�@�@�g�𐶐����C���ԊO�蓖�̒l�����̃I�u�W�F�N�g�ɐݒ肷��B
013800*�i�Q�j���ʂ̓��͏����i�P�j�ō쐬�����I�u�W�F�N�g�ɐݒ肷��B
013900*�i�R�jAddress-class �̃I�u�W�F�N�g���l�����C���̃I�u�W�F�N�g�Q�Ƃ��i�P
014000*�@�@�j�ō쐬�����I�u�W�F�N�g�ɐݒ肵����C���͂��ꂽ�Z���f�[�^��ݒ肷
014100*�@�@��B
014200*=======================================================================
014300 �f�[�^�ݒ�       SECTION.
014400*
014500     EVALUATE  �k�|�E��
014600*****�@�@�Ǘ��ҁ@****
014700     WHEN  1
014800         INVOKE  Manager-class  "NEW"  RETURNING  �Ǘ��ҁ|�I�u�W�F�N�g
014900         SET     �]�ƈ��|�I�u�W�F�N�g  TO   �Ǘ��ҁ|�I�u�W�F�N�g
015000         MOVE    �k�|���ʎ蓖          TO
015100                   ���ʎ蓖    OF  �Ǘ��ҁ|�I�u�W�F�N�g
015200*****�@��ʎЈ��@****
015300     WHEN  2
015400         INVOKE  Member-class  "NEW"   RETURNING  ��ʎЈ��|�I�u�W�F�N�g
015500         SET     �]�ƈ��|�I�u�W�F�N�g  TO   ��ʎЈ��|�I�u�W�F�N�g
015600         MOVE    �k�|���ԊO�蓖        TO
015700                   ���ԊO�蓖  OF  ��ʎЈ��|�I�u�W�F�N�g
015800         MOVE    �k�|�c�Ǝ���          TO
015900                   �c�Ǝ���    OF  ��ʎЈ��|�I�u�W�F�N�g
016000     END-EVALUATE.
016100*
016200     INVOKE    Address-class   "NEW"   RETURNING  �Z���|�I�u�W�F�N�g.
016300     MOVE   �k�|�X�֔ԍ�     TO    �X�֔ԍ�   OF  �Z���|�I�u�W�F�N�g.
016400     MOVE   �k�|�Z��         TO    �Z��       OF  �Z���|�I�u�W�F�N�g.
016500*
016600     INVOKE  �]�ƈ��|�I�u�W�F�N�g  "Initial-method"
016700      USING  �k�|�]�ƈ��ԍ�
016800             �k�|����
016900             �k�|���ДN����
017000             �k�|�ގДN����
017100             �k�|�E��
017200             �k�|��{��
017300             �Z���|�I�u�W�F�N�g
017400             .
017500*
017600 �f�[�^�ݒ�o��.
017700     EXIT.
017800*
017900   END METHOD  Regist-member.
018000*
018100*=======================================================================
018200*�@�]�ƈ����l�����\�b�h�iGet-member-info�j
018300*
018400*�@�Z���́F�@�]�ƈ��ԍ��iPIC 9(1)�j
018500*�@�Z�o�́F�@���A�l    �iPIC 9(4) COMP�j
018600*            0 : �폜����
018700*            1 : �폜���s
018800*=======================================================================
018900   METHOD-ID.  Get-member-info.
019000   DATA DIVISION.
019100   WORKING-STORAGE SECTION.
019200   01  �]�ƈ��|�I�u�W�F�N�g   USAGE  OBJECT REFERENCE  AllMember-class.
019300   01  �Z���|�I�u�W�F�N�g     USAGE  OBJECT REFERENCE  Address-class.
019400   01  ���ʁ|�I�u�W�F�N�g     USAGE  OBJECT REFERENCE.
019500   LINKAGE SECTION.
019600   01  �k�|�]�ƈ��ԍ�         PIC 9(04).
019700   01  �w�|�]�ƈ��ԍ�         REDEFINES �k�|�]�ƈ��ԍ�  PIC X(04).
019800   01  �k�|����               PIC N(08).
019900   01  �k�|�X�֔ԍ�.
020000      02  �k�|�X�֔ԍ��P      PIC X(03).
020100      02  �k�|�X�֔ԍ��Q      PIC X(04).
020200   01  �k�|�Z��               PIC N(20).
020300   01  �k�|���ДN����         PIC X(08).
020400   01  �k�|�ގДN����         PIC X(08).
020500   01  �k�|�E��               PIC 9(01).
020600   01  �k�|��{��             PIC 9(08).
020700   01  �k�|���ʎ蓖           PIC 9(06).
020800   01  �k�|���ԊO�蓖         PIC 9(05).
020900   01  �k�|�c�Ǝ���           PIC 999.9.
021000   01  �q�|���A�l             PIC 9(04) COMP.
021100   PROCEDURE DIVISION
021200     USING  �k�|�]�ƈ��ԍ�
021300            �k�|����
021400            �k�|�X�֔ԍ�
021500            �k�|�Z��
021600            �k�|���ДN����
021700            �k�|�ގДN����
021800            �k�|�E��
021900            �k�|��{��
022000            �k�|���ʎ蓖
022100            �k�|���ԊO�蓖
022200            �k�|�c�Ǝ���
022300     RETURNING  �q�|���A�l.
022400*
022500         SET  ���ʁ|�I�u�W�F�N�g  TO
022600              �]�ƈ������|�I�u�W�F�N�g :: "Element-Get" (�w�|�]�ƈ��ԍ�)
022700         IF   ���ʁ|�I�u�W�F�N�g  NOT =  NULL
022800         THEN
022900             SET  �]�ƈ��|�I�u�W�F�N�g  TO
023000                  ���ʁ|�I�u�W�F�N�g  AS  AllMember-class
023100             PERFORM  �f�[�^�擾
023200             MOVE  0  TO  �q�|���A�l
023300         ELSE
023400             MOVE  1  TO  �q�|���A�l
023500         END-IF
023600         EXIT METHOD.
023700*=======================================================================
023800*  �f�[�^�擾����
023900*
024000*�i�P�j���o�����]�ƈ��I�u�W�F�N�g�̏����Q�Ƃ��C������؂�킯��B
024100*  �E�@�w�肳�ꂽ�]�ƈ��ԍ��̃I�u�W�F�N�g�Ȃ�΁C�K�v�ȏ���ݒ肷��B
024200*�@�E�@�w�肳�ꂽ�]�ƈ��ԍ��̃I�u�W�F�N�g�łȂ���΁C���̃I�u�W�F�N�g��
024300*�@�@�l������B
024400*=======================================================================
024500 �f�[�^�擾       SECTION.
024600*
024700       INVOKE  �]�ƈ��|�I�u�W�F�N�g  "Get-member-info"
024800        USING  �k�|����
024900               �k�|���ДN����
025000               �k�|�ގДN����
025100               �k�|�E��
025200               �k�|��{��
025300               �Z���|�I�u�W�F�N�g
025400               .
025500       IF     �k�|�E��  =  1
025600       THEN
025700           MOVE  ���ʎ蓖   OF �]�ƈ��|�I�u�W�F�N�g AS Manager-class
025800             TO  �k�|���ʎ蓖
025900       ELSE
026000           MOVE  ���ԊO�蓖 OF �]�ƈ��|�I�u�W�F�N�g AS Member-class
026100             TO  �k�|���ԊO�蓖
026200           MOVE  �c�Ǝ���   OF �]�ƈ��|�I�u�W�F�N�g AS Member-class
026300             TO  �k�|�c�Ǝ���
026400       END-IF.
026500       MOVE  �X�֔ԍ� OF �Z���|�I�u�W�F�N�g  TO  �k�|�X�֔ԍ�.
026600       MOVE  �Z��     OF �Z���|�I�u�W�F�N�g  TO  �k�|�Z��.
026700*
026800 �f�[�^�擾�o��.
026900     EXIT.
027000*
027100   END METHOD Get-member-info.
027200*
027300*=======================================================================
027400*�@�]�ƈ��폜���\�b�h�iRemove-member�j
027500*
027600*�@�Z���́F�@�]�ƈ��ԍ��iPIC 9(1)�j
027700*�@�Z�o�́F�@���A�l    �iPIC 9(4) COMP�j
027800*          0 : �폜����
027900*          1 : �폜���s
028000*=======================================================================
028100   METHOD-ID.  Remove-member.
028200   DATA DIVISION.
028300   WORKING-STORAGE SECTION.
028400   LINKAGE SECTION.
028500   01  �k�|�]�ƈ��ԍ�  PIC 9(04).
028600   01  �w�|�]�ƈ��ԍ�  REDEFINES �k�|�]�ƈ��ԍ�  PIC X(04).
028700   01  �q�|���A�l      PIC 9(04)  COMP.
028800   PROCEDURE DIVISION
028900     USING  �k�|�]�ƈ��ԍ�
029000     RETURNING  �q�|���A�l.
029100*
029200       MOVE  �]�ƈ������|�I�u�W�F�N�g :: "Remove-At" (�w�|�]�ƈ��ԍ�)
029300         TO  �q�|���A�l
029400       EXIT METHOD.
029500*
029600   END METHOD Remove-member.
029700*
029800*=======================================================================
029900*�@���^�v�Z���\�b�h�iCal-salary�j
030000*
030100*�i�P�j�]�ƈ��S���̋��^���v�Z���A���ꂼ��̏]�ƈ��I�u�W�F�N�g�Ɍ��ʂ�
030200*�@�@�@�f����B
030300*=======================================================================
030400   METHOD-ID.  Cal-salary.
030500   DATA DIVISION.
030600   WORKING-STORAGE SECTION.
030700   01  ���ʁ|�I�u�W�F�N�g    USAGE OBJECT REFERENCE.
030800   01  �]�ƈ��|�I�u�W�F�N�g  USAGE OBJECT REFERENCE  AllMember-class.
030900   LINKAGE SECTION.
031000   PROCEDURE DIVISION.
031100*
031200         SET  ���ʁ|�I�u�W�F�N�g    TO
031300              �]�ƈ������|�I�u�W�F�N�g :: "FirstElement-Get"
031400         SET  �]�ƈ��|�I�u�W�F�N�g  TO
031500              ���ʁ|�I�u�W�F�N�g  AS  AllMember-class
031600         PERFORM  ���^�v�Z����    UNTIL  �]�ƈ��|�I�u�W�F�N�g  =  NULL
031700         EXIT METHOD.
031800*
031900*=======================================================================
032000*  ���^�v�Z����
032100*
032200*�i�P�j���^�v�Z���s�����\�b�h�����s���C���̌��ʂ��I�u�W�F�N�g�ɔ��f����
032300*�@�@��C���̏]�ƈ��I�u�W�F�N�g���l������B
032400*=======================================================================
032500 ���^�v�Z����         SECTION.
032600*
032700     MOVE  �]�ƈ��|�I�u�W�F�N�g :: "Salary-method"
032800       TO    ���x��  OF  �]�ƈ��|�I�u�W�F�N�g.
032900     SET   ���ʁ|�I�u�W�F�N�g    TO
033000             �]�ƈ������|�I�u�W�F�N�g :: "NextElement-Get".
033100     SET   �]�ƈ��|�I�u�W�F�N�g  TO
033200             ���ʁ|�I�u�W�F�N�g  AS  AllMember-class.
033300*
033400 ���^�v�Z�����o��.
033500     EXIT.
033600*
033700   END METHOD Cal-salary.
033800*
033900*=======================================================================
034000*�@���^�l�����\�b�h�iGet-salary�j
034100*
034200*�@�Z���́F�@�]�ƈ��ԍ��iPIC 9(1)�j
034300*�@�Z�o�́F�@���A�l    �iPIC 9(4) COMP�j
034400*            0 : �l������
034500*            1 : �l�����s (�Y���҂Ȃ�)
034600*=======================================================================
034700   METHOD-ID.  Get-salary.
034800   DATA DIVISION.
034900   WORKING-STORAGE SECTION.
035000   01  ���ʁ|�I�u�W�F�N�g    USAGE  OBJECT REFERENCE.
035100   01  �]�ƈ��|�I�u�W�F�N�g  USAGE  OBJECT REFERENCE  AllMember-class.
035200   LINKAGE SECTION.
035300   01  �k�|�]�ƈ��ԍ�  PIC 9(04).
035400   01  �w�|�]�ƈ��ԍ�  REDEFINES �k�|�]�ƈ��ԍ�  PIC X(04).
035500   01  �k�|���x��      PIC 9(08).
035600   01  �q�|���A�l      PIC 9(04)  COMP.
035700   PROCEDURE DIVISION
035800     USING  �k�|�]�ƈ��ԍ�
035900            �k�|���x��
036000     RETURNING  �q�|���A�l.
036100*
036200         SET  ���ʁ|�I�u�W�F�N�g    TO
036300              �]�ƈ������|�I�u�W�F�N�g :: "Element-Get" (�w�|�]�ƈ��ԍ�)
036400         SET  �]�ƈ��|�I�u�W�F�N�g  TO
036500              ���ʁ|�I�u�W�F�N�g AS AllMember-class
036600*
036700         IF  �]�ƈ��|�I�u�W�F�N�g  NOT =  NULL
036800         THEN
036900             MOVE  ���x�� OF �]�ƈ��|�I�u�W�F�N�g  TO  �k�|���x��
037000             MOVE  0  TO  �q�|���A�l
037100         ELSE
037200             MOVE  1  TO  �q�|���A�l
037300         END-IF
037400   END METHOD Get-salary.
037500*
037600*=======================================================================
037700*�@�Z��������\�b�h�iPrint-address�j
037800*
037900*�@�Z���́F�@�I��E���iPIC 9(1)�j
038000*�@�Z�o�́F�@�Z���^
038100*=======================================================================
038200   METHOD-ID.  Print-address.
038300   ENVIRONMENT    DIVISION.
038400   INPUT-OUTPUT    SECTION.
038500   FILE-CONTROL.
038600       SELECT  ����t�@�C��  ASSIGN  TO  PRINTER.
038700   DATA DIVISION.
038800   FILE            SECTION.
038900   FD  ����t�@�C��.
039000   01  �o�̓��R�[�h   PIC X(125).
039100   WORKING-STORAGE SECTION.
039200   01  ����w�b�_�P.
039300     02                       PIC X(05)  VALUE  SPACE.
039400     02                       PIC N(02)  VALUE  NC"���@".
039500     02  ����|���o��         PIC N(04)  VALUE  SPACE.
039600     02                       PIC N(05)  VALUE  NC"�Z���^�@��".
039700     02                       PIC X(98)  VALUE  SPACE.
039800   01  ����w�b�_�Q.
039900     02                       PIC X(05)  VALUE  SPACE.
040000     02                       PIC N(05)  VALUE  NC"�]�ƈ��ԍ�".
040100     02                       PIC X(04)  VALUE  SPACE.
040200     02                       PIC N(03)  VALUE  NC"���@��".
040300     02                       PIC X(14)  VALUE  SPACE.
040400     02                       PIC N(03)  VALUE  NC"�Z�@��".
040500     02                       PIC X(80)  VALUE  SPACE.
040600   01  ����f�[�^.
040700     02                       PIC X(05)  VALUE  SPACE.
040800     02  ����|�]�ƈ��ԍ�     PIC 9(04).
040900     02                       PIC X(10)  VALUE  SPACE.
041000     02  ����|����           PIC N(08).
041100     02                       PIC X(04)  VALUE  SPACE.
041200     02  ����|�X�֔ԍ�.
041300        03  ����|�X�֔ԍ��P  PIC X(03).
041400        03                    PIC X(01)  VALUE  "-".
041500        03  ����|�X�֔ԍ��Q  PIC X(04).
041600     02                       PIC X(02)  VALUE  SPACE.
041700     02  ����|�Z��           PIC N(20).
041800     02                       PIC X(28)  VALUE  SPACE.
041900*
042000   01  �]�ƈ��|�I�u�W�F�N�g   USAGE  OBJECT REFERENCE  AllMember-class.
042100   01  �Z���|�I�u�W�F�N�g     USAGE  OBJECT REFERENCE  Address-class.
042200   01  ���ʁ|�I�u�W�F�N�g     USAGE  OBJECT REFERENCE.
042300   01  �v�|�E��               PIC 9(01).
042400   01  �v�|�X�֔ԍ�.
042500     02  �v�|�X�֔ԍ��P       PIC X(03).
042600     02  �v�|�X�֔ԍ��Q       PIC X(04).
042700   LINKAGE SECTION.
042800   01  �k�|�E���I��           PIC 9(01).
042900   01  �q�|���A�l             PIC 9(04)  COMP.
043000   PROCEDURE DIVISION
043100     USING  �k�|�E���I��
043200     RETURNING  �q�|���A�l.
043300*
043400         SET  ���ʁ|�I�u�W�F�N�g    TO
043500                �]�ƈ������|�I�u�W�F�N�g :: "FirstElement-Get"
043600         SET  �]�ƈ��|�I�u�W�F�N�g  TO
043700                ���ʁ|�I�u�W�F�N�g AS AllMember-class
043800*
043900         IF   �]�ƈ��|�I�u�W�F�N�g  NOT =  NULL
044000           OPEN  OUTPUT  ����t�@�C��
044100           PERFORM  �w�b�_�[�o�͏���
044200           PERFORM  �������
044300                  UNTIL  �]�ƈ��|�I�u�W�F�N�g  =  NULL
044400           CLOSE  ����t�@�C��
044500         END-IF
044600         EXIT METHOD.
044700*=======================================================================
044800*  �w�b�_�[�o�͏���
044900*
045000*�i�P�j�I�����ꂽ�E���ɑ΂���Z���^�́C�w�b�_�[�������������B
045100*=======================================================================
045200 �w�b�_�[�o�͏���         SECTION.
045300*
045400     INITIALIZE ����w�b�_�P ����w�b�_�Q.
045500*
045600     IF  �k�|�E���I��  =  1
045700     THEN
045800         MOVE  NC"�Ǘ���"    TO  ����|���o��
045900     END-IF.
046000     IF  �k�|�E���I��  =  2
046100     THEN
046200         MOVE  NC"��ʎЈ�"  TO  ����|���o��
046300     END-IF.
046400     WRITE  �o�̓��R�[�h  FROM  ����w�b�_�P  AFTER  PAGE.
046500     WRITE  �o�̓��R�[�h  FROM  ����w�b�_�Q  AFTER  2.
046600*
046700 �w�b�_�[�o�͏����o��.
046800     EXIT.
046900*
047000*=======================================================================
047100*  �������
047200*
047300*�i�P�j��������]�ƈ��I�u�W�F�N�g�������Q�Ƃ��C�ΏۂƂȂ�E���ł���Ώ�
047400*�@�@������R�[�h�ɐݒ肵�C����t�@�C���ɏ������ށB
047500*=======================================================================
047600 �������         SECTION.
047700     INITIALIZE ����f�[�^.
047800*
047900     INVOKE  �]�ƈ��|�I�u�W�F�N�g  "Get-print-info"
048000      USING  ����|�]�ƈ��ԍ�
048100             ����|����
048200             �v�|�E��
048300             �Z���|�I�u�W�F�N�g
048400
048500     IF  (�k�|�E���I��  =  1  AND  �v�|�E��  =  1)  OR
048600         (�k�|�E���I��  =  2  AND  �v�|�E��  =  2)
048700     THEN
048800         MOVE   �X�֔ԍ�    OF  �Z���|�I�u�W�F�N�g   TO  �v�|�X�֔ԍ�
048900         MOVE   �v�|�X�֔ԍ��P                       TO  ����|�X�֔ԍ��P
049000         MOVE   �v�|�X�֔ԍ��Q                       TO  ����|�X�֔ԍ��Q
049100         MOVE   �Z��        OF  �Z���|�I�u�W�F�N�g   TO  ����|�Z��
049200*
049300         WRITE  �o�̓��R�[�h    FROM  ����f�[�^  AFTER  2
049400     END-IF.
049500*
049600     SET  ���ʁ|�I�u�W�F�N�g   TO
049700            �]�ƈ������|�I�u�W�F�N�g :: "NextElement-Get".
049800     SET  �]�ƈ��|�I�u�W�F�N�g TO  ���ʁ|�I�u�W�F�N�g AS AllMember-class.
049900 ��������o��.
050000     EXIT.
050100*
050200   END METHOD  Print-address.
050300*
050400  END OBJECT.
050500 END CLASS   Control-member-class.
