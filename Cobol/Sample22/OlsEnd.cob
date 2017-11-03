000100*=================================================================
000200* �u�}���`�X���b�h�v���O���~���O�v
000300*     �X���b�h�ԂŃt�@�C���E�f�[�^�����p���ĔF�؏������������܂�
000400*
000500*=================================================================
000600*
000700*  �t�@�C�����F MTHEND.cob
000800*  ����T�v  �F �I�����C���V���b�s���O���I�����邽�߁A�ڋq���t�@�C����
000900*               �N���[�Y���܂��B
001000*
001100* Copyright 1999-2015 FUJITSU LIMITED
001200*=================================================================
001300 identification division.
001400 program-id. "�I�����C���V���b�s���O��~".
001500 environment division.
001600 input-output section.
001700 file-control.
001800     select �ڋq���t�@�C�� assign to sys006
001900       organization is indexed
002000       access mode  is random
002100       record key   is �ڋq�ԍ�
002200       file status  is �ڋq���t�@�C�����o�͏��.
002300     select �݌ɏ��t�@�C�� assign to sys007
002400       organization is indexed
002500       access mode  is random
002600       record key   is ���i�ԍ� of �݌ɏ��
002700       file status  is �݌ɏ��t�@�C�����o�͏��.
002800     select ���i���t�@�C�� assign to sys008
002900       organization is indexed
003000       access mode  is random
003100       record key   is ���i�ԍ� of ���i���
003200       file status  is ���i���t�@�C�����o�͏��.
003300     select optional �������t�@�C�� assign to sys009
003400       organization is indexed
003500       access mode  is random
003600       record key   is �����ԍ� of �������
003700       file status  is �������t�@�C�����o�͏��.
003800     select optional �������׃t�@�C�� assign to sys010
003900       organization is indexed
004000       access mode  is dynamic
004100       record key   is �����ԍ� of �������� �������i�ԍ� with duplicates
004200       file status  is �������׃t�@�C�����o�͏��.
004300 data division.
004400 file section.
004500 fd �ڋq���t�@�C�� is external.
004600 01 �ڋq���.
004700   02 �ڋq�ԍ�                pic x(32).
004800   02 �Ïؔԍ�                pic x(32).
004900 fd �݌ɏ��t�@�C�� is external.
005000 01 �݌ɏ��.
005100   02 ���i�ԍ�                pic x(10).
005200   02 �݌ɐ�              pic 9(10).
005300 fd ���i���t�@�C�� is external.
005400 01 ���i���.
005500   02 ���i�ԍ�                pic x(12).
005600   02 �^��                pic x(32).
005700   02 �`��                pic x(32).
005800   02 ���i                pic 9(09).
005900 fd �������t�@�C�� is external.
006000 01 �������.
006100   02 �����ԍ�                pic x(12).
006200   02 �����ڋq�ԍ�            pic x(32).
006300   02 �������t                pic x(14).
006400 fd �������׃t�@�C�� is external.
006500 01 ��������.
006600   02 �����ԍ�                pic x(12).
006700   02 �������i�ԍ�            pic x(10).
006800   02 ������              pic 9(09).
006900 working-storage section.
007000   copy user-Log.
007100   copy user-Lock.
007200   01 �I�����C���V���b�s���O�N�����      pic 9(1) is external.
007300   01 �ڋq���t�@�C�����o�͏��          pic x(02).
007400   01 �݌ɏ��t�@�C�����o�͏��          pic x(02).
007500   01 ���i���t�@�C�����o�͏��          pic x(02).
007600   01 �������t�@�C�����o�͏��          pic x(02).
007700   01 �������׃t�@�C�����o�͏��          pic x(02).
007800  linkage section.
007900   01 ���A�l              pic s9(09) comp-5.
008000 procedure division returning ���A�l.
008100*=================================================================
008200*  ��ƈ�����������܂��B
008300*=================================================================
008400     move 0 to ���A�l.
008500     initialize userLog
008600*=================================================================
008700*  �I�����C���V���b�s���O�̋N����Ԃ��m�F���܂��B
008800*=================================================================
008900     move "������" to lock-key.
009000     move -1 to wait-time.
009100     call "COB_LOCK_DATA" with c linkage
009200                          using by reference lock-key
009300                                by value wait-time
009400                                by reference err-datail
009500                          returning ret-value.
009600*=================================================================
009700*  �I�����C���V���b�s���O���N���ςȂ�A�e��t�@�C�����N���[�Y���A
009800*  �I�����C���V���b�s���O���~���܂��B
009900*=================================================================
010000     if �I�����C���V���b�s���O�N����� = 1 then
010100       *> �ڋq���t�@�C�����N���[�Y����
010200       close �ڋq���t�@�C��
010300       if �ڋq���t�@�C�����o�͏�� not = "00" then
010400         move 1 to ���A�l
010500       end-if
010600*
010700       *> �݌ɏ��t�@�C�����N���[�Y����
010800       close �݌ɏ��t�@�C��
010900       if �݌ɏ��t�@�C�����o�͏�� not = "00" then
011000         move 1 to ���A�l
011100       end-if
011200*
011300       *> ���i���t�@�C�����N���[�Y����
011400       close ���i���t�@�C��
011500       if ���i���t�@�C�����o�͏�� not = "00" then
011600         move 1 to ���A�l
011700       end-if
011800*
011900       *> �������t�@�C�����N���[�Y����
012000       close �������t�@�C��
012100       if �������t�@�C�����o�͏�� not = "00" then
012200         move 1 to ���A�l
012300       end-if
012400*
012500       *> �������׃t�@�C�����N���[�Y����
012600       close �������׃t�@�C��
012700       if �������׃t�@�C�����o�͏�� not = "00" then
012800         move 1 to ���A�l
012900       end-if
013000*
013100       if ���A�l not = 0 then
013200         set �G���[ to true
013300         move "�N���[�Y�G���[���������܂����B�v���O����
013400-             "�F�I�����C���V���b�s���O��~" to ����
013500       else
013600         move 0 to �I�����C���V���b�s���O�N�����
013700       end-if
013800     else
013900*=================================================================
014000*  �I�����C���V���b�s���O���N������Ă��Ȃ��Ȃ�A�G���[���O��
014100*  �o�͂��܂��B
014200*=================================================================
014300       set �x�� to true
014400       move 2 to ���A�l
014500       move "�I�����C���V���b�s���O���N������Ă��܂���B
014600-           "�v���O�����F�I�����C���V���b�s���O��~" TO ����
014700       call "COB_REPORT_EVENT" using userLog returning ���A�R�[�h
014800     end-if.
014900*=================================================================
015000* �ďo�����ɕ��A���܂��B
015100*=================================================================
015200 exit-proc.
015300     call "COB_UNLOCK_DATA" with c linkage
015400                            using by reference lock-key
015500                                  by reference err-datail
015600                            returning ret-value.
015700     exit program.
