000100*=================================================================
000200* �u�}���`�X���b�h�v���O���~���O�v
000300*     �X���b�h�ԂŃt�@�C���E�f�[�^�����p���ĔF�؏������������܂�
000400*
000500*=================================================================
000600*
000700*  �t�@�C�����F MTHSTR.cob
000800*  ����T�v  �F �F�؃T�[�r�X���J�n���邽�߁A�ڋq���t�@�C����
000900*               �I�[�v�����܂��B
001000*
001100* Copyright 1999-2015 FUJITSU LIMITED
001200*=================================================================
001300 identification division.
001400  program-id. "�F�؃T�[�r�X�N��".
001500 environment division.
001600 configuration section.
001700 special-names.
001800      symbolic constant
001900        no-limit is -1.
002000 input-output  section.
002100 file-control.
002200     select �ڋq���t�@�C�� assign to sys006
002300       organization is indexed
002400       access mode  is random
002500       record key   is �ڋq�ԍ�
002600       file status  is �ڋq���t�@�C�����o�͏��.
002700 data division.
002800 file section.
002900 fd �ڋq���t�@�C�� is external.
003000 01 �ڋq���.
003100   02 �ڋq�ԍ�                          pic x(32).
003200   02 �Ïؔԍ�                          pic x(32).
003300 working-storage section.
003400   copy user-Lock.
003500   01 �F�؃T�[�r�X�N�����      pic 9(1) is external.
003600   01 �ڋq���t�@�C�����o�͏��          pic x(02).
003700  linkage section.
003800   01 ���A�l                              pic s9(09) comp-5.
003900 procedure division returning ���A�l.
004000*=================================================================
004100*  ��ƈ�����������܂��B
004200*=================================================================
004300     move 0 to ���A�l.
004400*=================================================================
004500*  �F�؃T�[�r�X�̋N����Ԃ��m�F���܂��B
004600*=================================================================
004700     move "������"  to lock-key.
004800     move NO-LIMIT  to wait-time.
004900     call "COB_LOCK_DATA" with c linkage
005000                          using by reference lock-key
005100                                by value wait-time
005200                                by reference err-datail
005300                          returning ret-value.
005400*=================================================================
005500*  �F�؃T�[�r�X���N������Ă��Ȃ��Ȃ�A�ڋq���t�@�C�����I�[�v��
005600*  ���A�F�؃T�[�r�X���N�����܂��B
005700*=================================================================
005800     if �F�؃T�[�r�X�N����� not = 1 then
005900       open input �ڋq���t�@�C��
006000       if �ڋq���t�@�C�����o�͏�� not = "00" then
006100         move 1 to ���A�l
006200       else
006300         move 1 to �F�؃T�[�r�X�N�����
006400       end-if
006500     else
006600*=================================================================
006700*  �F�؃T�[�r�X���N���ςȂ�A�G���[���O���o�͂��܂��B
006800*=================================================================
006900       move 2 to ���A�l
007000     end-if.
007100*=================================================================
007200* �ďo�����ɕ��A���܂��B
007300*=================================================================
007400 exit-proc.
007500     call "COB_UNLOCK_DATA" with c linkage
007600                            using by reference lock-key
007700                                  by reference err-datail
007800                            returning ret-value
007900     exit program.
