000100*=================================================================
000200* �u�}���`�X���b�h�v���O���~���O�v
000300*     �X���b�h�ԂŃt�@�C���E�f�[�^�����p���ăI�����C���V���b�s���O
000400*   �̃A�v���P�[�V�������\�z���܂��B
000500*
000600*=================================================================
000700*
000800*  �t�@�C�����F OLSSRCODR.cob
000900*  ����T�v  �F �I�����C���V���b�s���O�̂��߂́A�݌Ƀf�[�^�̍X�V
001000*               �ƃI�[�_�[�f�[�^�̓o�^���s���B
001100*  �p�����[�^�F
001200*     �������F�I�[�_�[���(�W�c����)
001300*     ���A�l
001400*       �����F�O
001500*       ���s�F�O�ȊO
001600*
001700* Copyright 1999-2015 FUJITSU LIMITED
001800*=================================================================
001900 identification division.
002000  program-id. "�݌ɍX�V�I�[�_�[�o�^".
002100 data division.
002200 working-storage section.
002300  copy user-Log.
002400  copy user-Lock.
002500  01 �I�����C���V���b�s���O�N�����   pic 9(1) is external.
002600  01 �݌ɍX�V��               pic 9(02) value 1.
002700  01 �I�[�_�[�o�^��           pic 9(02) value 1.
002800 01 ���b�Z�[�W�e�[�u��.
002900   02               pic x(90) value
003000     "�������܂��͔������ׂ̓o�^�Ɏ��s���܂����B�v���O�����F�݌ɍX�V�I�[�_�[�o�^".
003100   02               pic x(90) value
003200     "�����Ȑ��i�ԍ����w�肳��܂����B�v���O�����F�݌ɍX�V�I�[�_�[�o�^".
003300   02               pic x(90) value
003400     "�݌ɂ�����܂���B�v���O�����F�݌ɍX�V�I�[�_�[�o�^".
003500   02               pic x(90) value
003600     "�I�����C���V���b�s���O���N������Ă��܂���B�v���O�����F�݌ɍX�V�I�[�_�[�o�^".
003700 01 redefines ���b�Z�[�W�e�[�u��.
003800   02 �G���[���b�Z�[�W pic x(90) occurs 4 times.
003900 linkage section.
004000  copy Order-Info.
004100  01 ���A�l global     pic 9(09) comp-5.
004200 procedure division using orderInfo returning ���A�l.
004300*=================================================================
004400*  ��ƈ�����������܂��B
004500*=================================================================
004600     move 0 to ���A�l.
004700     initialize userLog.
004800*=================================================================
004900*  �I�����C���V���b�s���O�̋N����Ԃ��m�F���܂��B
005000*=================================================================
005100     move "������"  to lock-key.
005200     move -1        to wait-time.
005300     call "COB_LOCK_DATA" with c linkage
005400                          using by reference lock-key
005500                                by value wait-time
005600                                by reference err-datail
005700                          returning ret-value.
005800*=================================================================
005900*  �I�����C���V���b�s���O���N������Ă���Ȃ�A�݌ɂ̍X�V��
006000*  �I�[�_�[�̓o�^���s���B
006100*=================================================================
006200     if �I�����C���V���b�s���O�N����� = 1 then
006300       perform test before
006400         varying orderIndex from 1 by 1
006500               until orderIndex > orderQuantity or
006600                     ���A�l not = 0
006700         call "�݌ɍX�V����" using orderProductNumber(orderIndex)
006800                                   orderProductQuantity(orderIndex)
006900                             returning ���A�l
007000       end-perform
007100       if ���A�l = 0 then
007200         call "�I�[�_�[�o�^����" using orderInfo
007300                                 returning ���A�l
007400       end-if
007500     else
007600       move 4 to ���A�l
007700       set �G���[ to true
007800     end-if.
007900 exit-proc.
008000*=================================================================
008100*  ���A�l���O�ȊO�Ȃ�G���[���O���o�͂��܂��B
008200*=================================================================
008300     move "������"  to lock-key.
008400     call "COB_UNLOCK_DATA" with c linkage
008500                            using by reference lock-key
008600                                  by reference err-datail
008700                            returning ret-value.
008800*=================================================================
008900*  ���A�l���O�ȊO�Ȃ�G���[���O���o�͂��܂��B
009000*=================================================================
009100     if ���A�l not = 0 then
009200       move �G���[���b�Z�[�W(���A�l) to ����
009300       call "COB_REPORT_EVENT" using userLog returning ���A�R�[�h
009400     end-if
009500     exit program.
009600/
009700*=================================================================
009800*  �݌ɍX�V����
009900*  �p�����[�^�F
010000*     �������F���i�ԍ�
010100*     �������F�I�[�_�[����
010200*     ���A�l
010300*       �����F�O
010400*       ���s�F�O�ȊO
010500*
010600*=================================================================
010700 identification division.
010800 program-id.    �݌ɍX�V����.
010900 environment    division.
011000 input-output section.
011100 file-control.
011200     select �݌ɏ��t�@�C�� assign to sys007
011300       organization is indexed
011400       access mode  is random
011500       record key   is ���i�ԍ�
011600       file status  is �݌ɏ��t�@�C�����o�͏��.
011700 data           division.
011800 file            section.
011900 fd �݌ɏ��t�@�C�� is external.
012000 01 �݌ɏ��.
012100   02 ���i�ԍ�              pic x(10).
012200   02 �݌ɐ�                pic 9(10).
012300 working-storage section.
012400 01 �݌ɏ��t�@�C�����o�͏��       pic x(02).
012500 linkage         section.
012600 01 orderProductNumber      pic x(10).
012700 01 orderProductQuantity   pic 9(10).
012800  01 ���A�l            pic 9(09) comp-5.
012900 procedure      division
013000                    using orderProductNumber orderProductQuantity
013100                    returning ���A�l.
013200*=================================================================
013300*  �݌ɏ��t�@�C���̏������s���B�������A�ʃX���b�h�ł̑����
013400*  �r�����邽�߁A"�݌ɍX�V����"���L�[�Ƃ��ă��b�N���s���B
013500*=================================================================
013600     move "�݌ɍX�V����"  to lock-key.
013700     move -1      to wait-time.
013800     call "COB_LOCK_DATA" with c linkage
013900                          using by reference lock-key
014000                                by value wait-time
014100                                by reference err-datail
014200                          returning ret-value.
014300*=================================================================
014400*  ���i�ԍ����L�[�Ƃ��āA���R�[�h��ǂݍ��ށB���R�[�h���b�N���
014500*  (fs=99)�ɂ���Ȃ�A��������܂ŏ������J��Ԃ��B
014600*=================================================================
014700     move orderProductNumber to ���i�ԍ�
014800     perform test after
014900         until �݌ɏ��t�@�C�����o�͏�� not = "99"
015000       read �݌ɏ��t�@�C��
015100         invalid key
015200           set �G���[ to true
015300           move 2 to ���A�l
015400       end-read
015500     end-perform
015600*=================================================================
015700*  �I�[�_�[���ʂ��݌ɐ����傫���Ȃ�G���[�Ƃ��A�����łȂ��Ȃ�
015800*  �݌ɐ����Čv�Z���āA���R�[�h���X�V����
015900*=================================================================
016000     if �݌ɐ� < orderProductQuantity then
016100       set �G���[ to true
016200       move 3 to ���A�l
016300     else
016400       compute �݌ɐ� = �݌ɐ� - orderProductQuantity
016500       rewrite �݌ɏ�� end-rewrite
016600       move 0 to ���A�l
016700     end-if.
016800*=================================================================
016900*  "�݌ɍX�V����"�̃��b�N����������
017000*=================================================================
017100     call "COB_UNLOCK_DATA" with c linkage
017200                            using by reference lock-key
017300                                  by reference err-datail
017400                            returning ret-value.
017500 end program    �݌ɍX�V����.
017600/
017700*=================================================================
017800*  �I�[�_�[�o�^����
017900*  �p�����[�^�F
018000*     �������F�I�[�_�[���
018100*     ���A�l
018200*       �����F�O
018300*       ���s�F�O�ȊO
018400*
018500*=================================================================
018600 identification division.
018700 program-id.    �I�[�_�[�o�^����.
018800 environment    division.
018900 input-output section.
019000 file-control.
019100     select optional �������t�@�C�� assign to sys009
019200       organization is indexed
019300       access mode  is random
019400       record key   is �����ԍ� of �������
019500       file status  is �������t�@�C�����o�͏��.
019600     select optional �������׃t�@�C�� assign to sys010
019700       organization is indexed
019800       access mode  is dynamic
019900       record key   is �����ԍ� of �������� �������i�ԍ� with duplicates
020000       file status  is �������׃t�@�C�����o�͏��.
020100 data            division.
020200 file            section.
020300 fd �������t�@�C�� is external.
020400 01 �������.
020500   02 �����ԍ�              pic x(12).
020600   02 �����ڋq�ԍ�          pic x(32).
020700   02 �������t              pic x(14).
020800 fd �������׃t�@�C�� is external.
020900 01 ��������.
021000   02 �����ԍ�              pic x(12).
021100   02 �������i�ԍ�          pic x(10).
021200   02 ������                pic 9(09).
021300 working-storage section.
021400  01 �������t�@�C�����o�͏��       pic x(02).
021500  01 �������׃t�@�C�����o�͏��       pic x(02).
021600  01 �I�[�_�ԍ�.
021700   02 filler              pic x(04) value "ONUM".
021800   02 �ԍ�                pic x(08).
021900  01 �I�[�_�[�ԍ��쐬���         pic 9(08).
022000 linkage section.
022100  copy Order-Info.
022200  01 ���A�l            pic 9(09) comp-5.
022300 procedure division using orderInfo
022400                    returning ���A�l.
022500     move 0 to ���A�l
022600*=================================================================
022700*  �������t�@�C���̏������s���B�������A�ʃX���b�h�ł̑����
022800*  �r�����邽�߁A"�������"���L�[�Ƃ��ă��b�N���s���B
022900*=================================================================
023000     move all space   to lock-key.
023100     move "�������"  to lock-key.
023200     move -1      to wait-time.
023300     call "COB_LOCK_DATA" with c linkage
023400                          using by reference lock-key
023500                                by value wait-time
023600                                by reference err-datail
023700                          returning ret-value.
023800*=================================================================
023900*  �I�[�_�[�ԍ����̔Ԃ��A�I�[�_�[�����t�@�C���ɓo�^����
024000*=================================================================
024100     accept �ԍ� from time.      *> * �I�[�_�[�ԍ����쐬����
024200     move orderUserID to �����ڋq�ԍ�.
024300     move orderDate   to �������t.
024400     move �I�[�_�ԍ�  to �����ԍ� of �������.
024500*
024600     write �������.
024700*=================================================================
024800*  "�������"�̃��b�N����������
024900*=================================================================
025000     call "COB_UNLOCK_DATA" with c linkage
025100                            using by reference lock-key
025200                                  by reference err-datail
025300                            returning ret-value.
025400     move �I�[�_�ԍ� to orderNumber.
025500*=================================================================
025600*  �������̓o�^�ɐ���������A�������ׂ̓o�^���s���B���̍ہA
025700*  ������񖾍ׂɑ΂���ʃX���b�h�̏�����r���Ƃ��邽��"��������"
025800*  ���L�[�Ƃ��āA���b�N���s���B
025900*=================================================================
026000     if �������t�@�C�����o�͏�� = "00" then
026100       move "��������"  to lock-key
026200       move -1      to wait-time
026300       call "COB_LOCK_DATA" with c linkage
026400                            using by reference lock-key
026500                                  by value wait-time
026600                                  by reference err-datail
026700                            returning ret-value
026800*=================================================================
026900*  orderQuantity�����A�������ׂ��t�@�C���ɓo�^����
027000*=================================================================
027100       perform test before
027200           varying orderIndex from 1 by 1
027300                   until orderIndex > orderQuantity
027400         move �I�[�_�ԍ�                       to �����ԍ� of ��������
027500         move orderProductNumber(orderIndex)   to �������i�ԍ�
027600         move orderProductQuantity(orderIndex) to ������
027700         write ��������
027800         if �������׃t�@�C�����o�͏�� not = "00"
027900           set �G���[ to true
028000           move 1 to ���A�l
028100           exit perform
028200         end-if
028300       end-perform
028400*=================================================================
028500*  "��������"�̃��b�N����������
028600*=================================================================
028700       call "COB_UNLOCK_DATA" with c linkage
028800                              using by reference lock-key
028900                                    by reference err-datail
029000                              returning ret-value
029100     else
029200       set �G���[ to true
029300       move 1 to ���A�l
029400     end-if.
029500* �I�[�_�[���ׂ�o�^����
029600* �ďo�����ɕ��A����
029700 end program    �I�[�_�[�o�^����.
029800 end program    "�݌ɍX�V�I�[�_�[�o�^".
