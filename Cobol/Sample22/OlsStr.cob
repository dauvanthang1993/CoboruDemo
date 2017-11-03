000100*=================================================================
000200* �u�}���`�X���b�h�v���O���~���O�v
000300*     �X���b�h�ԂŃt�@�C���E�f�[�^�����p���ăI�����C���V���b�s���O
000400*   �̃A�v���P�[�V�������\�z���܂��B
000500*
000600*=================================================================
000700*
000800*  �t�@�C�����F OLSSTR.cob
000900*  ����T�v  �F �I�����C���V���b�s���O���J�n���邽�߁A�e��t�@�C��
001000*               ���I�[�v�����܂��B
001100*
001200* Copyright 1999-2015 FUJITSU LIMITED
001300*=================================================================
001400 identification division.
001500  program-id. "�I�����C���V���b�s���O�N��".
001600 environment division.
001700 configuration section.
001800 special-names.
001900      symbolic constant
002000        no-limit is -1.
002100 input-output  section.
002200 file-control.
002300     select �ڋq���t�@�C�� assign to sys006
002400       organization is indexed
002500       access mode  is random
002600       record key   is �ڋq�ԍ�
002700       file status  is �ڋq���t�@�C�����o�͏��.
002800     select �݌ɏ��t�@�C�� assign to sys007
002900       organization is indexed
003000       access mode  is random
003100       record key   is ���i�ԍ� of �݌ɏ��
003200       file status  is �݌ɏ��t�@�C�����o�͏��.
003300     select ���i���t�@�C�� assign to sys008
003400       organization is indexed
003500       access mode  is random
003600       record key   is ���i�ԍ� of ���i���
003700       file status  is ���i���t�@�C�����o�͏��.
003800     select optional �������t�@�C�� assign to sys009
003900       organization is indexed
004000       access mode  is random
004100       record key   is �����ԍ� of �������
004200       file status  is �������t�@�C�����o�͏��.
004300     select optional �������׃t�@�C�� assign to sys010
004400       organization is indexed
004500       access mode  is dynamic
004600       record key   is �����ԍ� of �������� �������i�ԍ� with duplicates
004700       file status  is �������׃t�@�C�����o�͏��.
004800 data division.
004900 file section.
005000 fd �ڋq���t�@�C�� is external.
005100 01 �ڋq���.
005200   02 �ڋq�ԍ�                          pic x(32).
005300   02 �Ïؔԍ�                          pic x(32).
005400 fd �݌ɏ��t�@�C�� is external.
005500 01 �݌ɏ��.
005600   02 ���i�ԍ�                pic x(10).
005700   02 �݌ɐ�              pic 9(10).
005800 fd ���i���t�@�C�� is external.
005900 01 ���i���.
006000   02 ���i�ԍ�                pic x(12).
006100   02 �^��                pic x(32).
006200   02 �`��                pic x(32).
006300   02 ���i                pic 9(09).
006400 fd �������t�@�C�� is external.
006500 01 �������.
006600   02 �����ԍ�                pic x(12).
006700   02 �����ڋq�ԍ�            pic x(32).
006800   02 �������t                pic x(14).
006900 fd �������׃t�@�C�� is external.
007000 01 ��������.
007100   02 �����ԍ�                pic x(12).
007200   02 �������i�ԍ�            pic x(10).
007300   02 ������              pic 9(09).
007400 working-storage section.
007500   copy user-Log.
007600   copy user-Lock.
007700   01 �I�����C���V���b�s���O�N�����      pic 9(1) is external.
007800   01 �ڋq���t�@�C�����o�͏��          pic x(02).
007900   01 �݌ɏ��t�@�C�����o�͏��          pic x(02).
008000   01 ���i���t�@�C�����o�͏��          pic x(02).
008100   01 �������t�@�C�����o�͏��          pic x(02).
008200   01 �������׃t�@�C�����o�͏��          pic x(02).
008300   01 ���o�͏��                          pic x(02).
008400   01 �t�@�C����                          pic x(24).
008500  linkage section.
008600   01 ���A�l                              pic s9(09) comp-5.
008700 procedure division returning ���A�l.
008800*=================================================================
008900*  ��ƈ�����������܂��B
009000*=================================================================
009100     move 0 to ���A�l.
009200     initialize userLog.
009300*=================================================================
009400*  �I�����C���V���b�s���O�̋N����Ԃ��m�F���܂��B
009500*=================================================================
009600     move "������"  to lock-key.
009700     move NO-LIMIT  to wait-time.
009800     call "COB_LOCK_DATA" with c linkage
009900                          using by reference lock-key
010000                                by value wait-time
010100                                by reference err-datail
010200                          returning ret-value.
010300*=================================================================
010400*  �I�����C���V���b�s���O���N������Ă��Ȃ��Ȃ�A�e��t�@�C����
010500*  �I�[�v�����A�I�����C���V���b�s���O���N�����܂��B
010600*=================================================================
010700     if �I�����C���V���b�s���O�N����� not = 1 then
010800*
010900       *> �ڋq���t�@�C�����I�[�v������
011000       open input �ڋq���t�@�C��
011100       if �ڋq���t�@�C�����o�͏�� not = "00"
011200         move "�ڋq���t�@�C��"         to �t�@�C����
011300         move �ڋq���t�@�C�����o�͏�� to ���o�͏��
011400         move 1 to ���A�l
011500         go to exit-proc
011600       end-if
011700*
011800       *> �݌ɏ��t�@�C�����I�[�v������
011900       open i-o �݌ɏ��t�@�C��
012000       if �݌ɏ��t�@�C�����o�͏�� not = "00"
012100         close �ڋq���t�@�C��
012200         move "�݌ɏ��t�@�C��"         to �t�@�C����
012300         move �݌ɏ��t�@�C�����o�͏�� to ���o�͏��
012400         move 1 to ���A�l
012500         go to exit-proc
012600       end-if
012700*
012800       *> ���i���t�@�C�����I�[�v������
012900       open input ���i���t�@�C��
013000       if ���i���t�@�C�����o�͏�� not = "00"
013100         close �ڋq���t�@�C��
013200         close �݌ɏ��t�@�C��
013300         move "���i���t�@�C��"         to �t�@�C����
013400         move ���i���t�@�C�����o�͏�� to ���o�͏��
013500         move 1 to ���A�l
013600         go to exit-proc
013700       end-if
013800*
013900       *> �������t�@�C�����I�[�v������
014000       open i-o �������t�@�C��
014100       if not (�������t�@�C�����o�͏�� = "00" or
014200               �������t�@�C�����o�͏�� = "05") then
014300         close �ڋq���t�@�C��
014400         close �݌ɏ��t�@�C��
014500         close ���i���t�@�C��
014600         move "�������t�@�C��"         to �t�@�C����
014700         move �������t�@�C�����o�͏�� to ���o�͏��
014800         move 1 to ���A�l
014900         go to exit-proc
015000       end-if
015100*
015200       *> �������׃t�@�C�����I�[�v������
015300       open i-o �������׃t�@�C��
015400       if not (�������׃t�@�C�����o�͏�� = "00" or
015500               �������׃t�@�C�����o�͏�� = "05") then
015600         close �ڋq���t�@�C��
015700         close �݌ɏ��t�@�C��
015800         close ���i���t�@�C��
015900         close �������t�@�C��
016000         move "�������׃t�@�C��"         to �t�@�C����
016100         move �������׃t�@�C�����o�͏�� to ���o�͏��
016200         move 1 to ���A�l
016300         go to exit-proc
016400       end-if
016500       move 1 to �I�����C���V���b�s���O�N�����
016600     else
016700*=================================================================
016800*  �I�����C���V���b�s���O���N���ςȂ�A�G���[���O���o�͂��܂��B
016900*=================================================================
017000       set �x�� to true
017100       move "�I�����C���V���b�s���O�͂��łɋN������Ă��܂��B
017200-           "�v���O�����F�I�����C���V���b�s���O�N��" TO ����
017300       move 2 to ���A�l
017400     end-if.
017500*=================================================================
017600* �ďo�����ɕ��A���܂��B
017700*=================================================================
017800 exit-proc.
017900     call "COB_UNLOCK_DATA" with c linkage
018000                            using by reference lock-key
018100                                  by reference err-datail
018200                            returning ret-value
018300     if ���A�l not = 0 then
018400       if ���A�l not = 1 then
018500         set �G���[ to true
018600         string "�I�[�v���G���[���������܂����B�v���O�����F�I�����C��
018700-               "�V���b�s���O�N�� �t�@�C������"  delimited by size
018800                �t�@�C����                       delimited by space
018900                ���o�͏��                       delimited by size
019000                into ����
019100       end-if
019200       call "COB_REPORT_EVENT" using userLog
019300                                   returning ���A�R�[�h
019400     end-if
019500     exit program.
