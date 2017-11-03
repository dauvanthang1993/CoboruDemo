000100*=================================================================
000200* �u�}���`�X���b�h�v���O���~���O�v
000300*     �X���b�h�ԂŃt�@�C���E�f�[�^�����p���ĔF�؏������������܂�
000400*
000500*=================================================================
000600*
000700*  �t�@�C�����F MTHUSRINF.cob
000800*  ����T�v  �F �F�؃T�[�r�X�̂��߂̔F�؏���������B
000900*  �p�����[�^�F
001000*     �������F���[�U�h�c
001100*     �������F�p�X���[�h
001200*     ���A�l
001300*       �����F�O
001400*       ���s�F�O�ȊO
001500*
001600* Copyright 1999-2015 FUJITSU LIMITED
001700*=================================================================
001800 identification division.
001900 program-id. "�ڋq���擾".
002000 environment division.
002100 input-output section.
002200 file-control.
002300     select �ڋq���t�@�C�� assign to sys006
002400       organization is indexed
002500       access mode is random
002600       record key is �ڋq�ԍ�
002700       file status is �ڋq���t�@�C�����o�͏��.
002800 data division.
002900 file section.
003000 fd �ڋq���t�@�C�� is external.
003100 01 �ڋq���.
003200   02 �ڋq�ԍ�                pic x(32).
003300   02 �Ïؔԍ�                pic x(32).
003400 working-storage section.
003500   copy user-Lock.
003600 01 �F�؃T�[�r�X�N�����  pic 9(1) is external.
003700 01 �ڋq���t�@�C�����o�͏��          pic x(2).
003800 linkage section.
003900   copy User-Info.
004000 01 ���A�l                pic 9(09) comp-5.
004100 procedure division using userInfo returning ���A�l.
004200*=================================================================
004300*  ��ƈ�����������܂��B
004400*=================================================================
004500     move 0 to ���A�l.
004600*=================================================================
004700*  �F�؃T�[�r�X�̋N����Ԃ��m�F���܂��B
004800*=================================================================
004900     move "������" to lock-key.
005000     move -1 to wait-time.
005100     call "COB_LOCK_DATA" with c linkage
005200                          using by reference lock-key
005300                                by value wait-time
005400                                by reference err-datail
005500                          returning ret-value.
005600     if �F�؃T�[�r�X�N����� = 1 then
005700*=================================================================
005800*  �F�؃T�[�r�X���N������Ă���Ȃ�AuserID���L�[�Ƀ��R�[�h��
005900*  �ǂݍ��݁A�F�؏������s���܂��B
006000*=================================================================
006100       move userID to �ڋq�ԍ�
006200       read �ڋq���t�@�C�� with no lock
006300         invalid key
006400           move 2     to ���A�l
006500         not invalid key
006600           if �Ïؔԍ� not = userPassword
006700             move 3 to ���A�l
006800           end-if
006900       end-read
007000*=================================================================
007100*  �F�؃T�[�r�X���N������Ă��Ȃ��Ȃ�A���̎|�̃R�[�h��ݒ肵�܂��B
007200*=================================================================
007300     else
007400       move 4     to ���A�l
007500     end-if.
007600 exit-proc.
007700     call "COB_UNLOCK_DATA" with c linkage
007800                            using by reference lock-key
007900                                  by reference err-datail
008000                            returning ret-value.
008100     exit program.
