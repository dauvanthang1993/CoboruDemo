000100*=================================================================
000200* �u�}���`�X���b�h�v���O���~���O�v
000300*     �X���b�h�ԂŃt�@�C���E�f�[�^�����p���ăI�����C���V���b�s���O
000400*   �̃A�v���P�[�V�������\�z���܂��B
000500*
000600*=================================================================
000700*
000800*  �t�@�C�����F OLSUSRINF.cob
000900*  ����T�v  �F �I�����C���V���b�s���O�̂��߂̔F�؏���������B
001000*  �p�����[�^�F
001100*     �������F���[�U�h�c
001200*     �������F�p�X���[�h
001300*     ���A�l
001400*       �����F�O
001500*       ���s�F�O�ȊO
001600*
001700* Copyright 1999-2015 FUJITSU LIMITED
001800*=================================================================
001900 identification division.
002000 program-id. "�ڋq���擾".
002100 environment division.
002200 input-output section.
002300 file-control.
002400     select �ڋq���t�@�C�� assign to sys006
002500       organization is indexed
002600       access mode is random
002700       record key is �ڋq�ԍ�
002800       file status is �ڋq���t�@�C�����o�͏��.
002900 data division.
003000 file section.
003100 fd �ڋq���t�@�C�� is external.
003200 01 �ڋq���.
003300   02 �ڋq�ԍ�                pic x(32).
003400   02 �Ïؔԍ�                pic x(32).
003500 working-storage section.
003600   copy user-Log.
003700   copy user-Lock.
003800 01 �I�����C���V���b�s���O�N�����  pic 9(1) is external.
003900 01 �ڋq���t�@�C�����o�͏��          pic x(2).
004000 01 ���b�Z�[�W�e�[�u��.
004100   02               pic x(90).
004200   02               pic x(90) VALUE
004300     "�ڋq�ԍ��Ɍ�肪����܂��B�v���O�����F�ڋq���擾".
004400   02               pic x(90) VALUE
004500     "�Ïؔԍ��Ɍ�肪����܂��B�v���O�����F�ڋq���擾".
004600   02               pic x(90) VALUE
004700     "�I�����C���V���b�s���O���N������Ă��܂���B�v���O�����F�ڋq���擾".
004800 01 redefines ���b�Z�[�W�e�[�u��.
004900   02 �G���[���b�Z�[�W pic x(90) occurs 4 times.
005000 linkage section.
005100   copy User-Info.
005200 01 ���A�l                pic 9(09) comp-5.
005300 procedure division using userInfo returning ���A�l.
005400*=================================================================
005500*  ��ƈ�����������܂��B
005600*=================================================================
005700     move 0 to ���A�l.
005800     initialize userLog
005900*=================================================================
006000*  �I�����C���V���b�s���O�N���̋N����Ԃ��m�F���܂��B
006100*=================================================================
006200     move "������" to lock-key.
006300     move -1 to wait-time.
006400     call "COB_LOCK_DATA" with c linkage
006500                          using by reference lock-key
006600                                by value wait-time
006700                                by reference err-datail
006800                          returning ret-value.
006900     if �I�����C���V���b�s���O�N����� = 1 then
007000*=================================================================
007100*  �I�����C���V���b�s���O�N���̋N������Ă���Ȃ�AuserID���L�[�Ƀ��R�[�h
007200*  ��ǂݍ��݁A�F�؏������s���܂��B
007300*=================================================================
007400       move userID to �ڋq�ԍ�
007500       read �ڋq���t�@�C�� with no lock
007600         invalid key
007700           move 2     to ���A�l
007800           set �G���[ to true
007900         not invalid key
008000           if �Ïؔԍ� not = userPassword
008100             move 3 to ���A�l
008200             set �G���[ to true
008300           end-if
008400       end-read
008500*=================================================================
008600*  �I�����C���V���b�s���O�N���̋N������Ă��Ȃ��Ȃ�A���̎|�̃R�[�h��ݒ�
008700*  ���܂��B
008800*=================================================================
008900     else
009000       move 4     to ���A�l
009100       set �G���[ to true
009200     end-if.
009300 exit-proc.
009400     call "COB_UNLOCK_DATA" with c linkage
009500                            using by reference lock-key
009600                                  by reference err-datail
009700                            returning ret-value.
009800*=================================================================
009900*  ���A�l���O�ȊO�Ȃ�G���[���O���o�͂��܂��B
010000*=================================================================
010100     if ���A�l not = 0 then
010200       move �G���[���b�Z�[�W(���A�l) to ����
010300       call "COB_REPORT_EVENT" using userLog returning ���A�R�[�h
010400     end-if
010500     exit program.
