000100*=================================================================
000200* �u�}���`�X���b�h�v���O���~���O�v
000300*     �X���b�h�ԂŃt�@�C���E�f�[�^�����p���ăI�����C���V���b�s���O
000400*   �̃A�v���P�[�V�������\�z���܂��B
000500*
000600*=================================================================
000700*
000800*  �t�@�C�����F OLSSTCGT.cob
000900*  ����T�v  �F �I�����C���V���b�s���O�̂��߂́A�݌ɖ⍇��̏���
001000*               �����܂��B
001100*  �p�����[�^�F
001200*     �������F�݌ɏ��(�W�c����)
001300*     ���A�l
001400*       �����F�O
001500*       ���s�F�O�ȊO
001600*
001700* Copyright 1999-2015 FUJITSU LIMITED
001800*=================================================================
001900 identification division.
002000  program-id. "�݌ɖ⍇�킹".
002100* ���i�̍݌ɂ��݌Ƀt�@�C��������o���B
002200*   �ďo�����F
002300*   �p�����[�^
002400*     �������F���i�ԍ�
002500*   ���A�l
002600*     �����F�O
002700*     ���s�F�O�ȊO
002800 environment division.
002900 input-output section.
003000 file-control.
003100     select �݌ɏ��t�@�C�� assign to sys007
003200       organization is indexed
003300       access mode is random
003400       record key is ���i�ԍ�
003500       file status is �݌ɏ��t�@�C�����o�͏��.
003600 data division.
003700 file section.
003800 fd �݌ɏ��t�@�C�� is external.
003900 01 �݌ɏ��f�[�^.
004000   02 ���i�ԍ�                pic x(10).
004100   02 �݌ɐ�              pic 9(10).
004200 working-storage section.
004300   copy user-Log.
004400   copy user-Lock.
004500 01 �I�����C���V���b�s���O�N�����    pic 9(1) is external.
004600 01 �݌ɏ��t�@�C�����o�͏��        pic x(2).
004700 01 ���b�Z�[�W�e�[�u��.
004800   02               pic x(90).
004900   02               pic x(90) VALUE
005000     "�����Ȑ��i�ԍ����w�肳��܂����B�v���O�����F�݌ɖ⍇�킹" .
005100   02               pic x(90).
005200   02               pic x(90) VALUE
005300     "�I�����C���V���b�s���O���N������Ă��܂���B�v���O�����F�݌ɖ⍇�킹".
005400 01 redefines ���b�Z�[�W�e�[�u��.
005500   02 �G���[���b�Z�[�W pic x(90) occurs 4 times.
005600 linkage section.
005700   copy Stock-Info.
005800 01 ���A�l               pic 9(09) comp-5.
005900 procedure division using stockInfo returning ���A�l.
006000*=================================================================
006100*  ��ƈ�����������܂��B
006200*=================================================================
006300     move 0 to ���A�l.
006400     initialize userLog.
006500*=================================================================
006600*  �I�����C���V���b�s���O�̋N����Ԃ��m�F���܂��B
006700*=================================================================
006800     move "������" to lock-key.
006900     move -1 to wait-time.
007000     call "COB_LOCK_DATA" with c linkage
007100                          using by reference lock-key
007200                                by value wait-time
007300                                by reference err-datail
007400                          returning ret-value.
007500*=================================================================
007600*  �I�����C���V���b�s���O�N���ςȂ�A�݌ɏ������o���B
007700*=================================================================
007800     if �I�����C���V���b�s���O�N����� = 1 then
007900       *> stockQuantity�񐔕��������J��Ԃ�
008000       perform test before
008100           varying stockIndex from 1 by 1
008200                   until stockIndex > stockQuantity or
008300                         �G���[
008400*=================================================================
008500*  ���i�ԍ����L�[�ɍ݌ɏ���ǂݍ��ށB���R�[�h���b�N(fs=99)�Ȃ�
008600*  ��������܂ŁA�ǂݍ��݂��s���B
008700*=================================================================
008800         move stockProductNumber(stockIndex) to ���i�ԍ�
008900         perform test after
009000              until �݌ɏ��t�@�C�����o�͏�� not = "99"
009100           read �݌ɏ��t�@�C��
009200             invalid key           *> �����L�[�Ȃ�G���[�Ƃ���
009300               move 2 to ���A�l    *> ���[�v��E�o
009400               set �G���[ to true
009500               exit perform
009600           end-read
009700         end-perform
009800         move �݌ɐ� to stockProductQuantity(stockIndex)
009900       end-perform
010000*=================================================================
010100*  �I�����C���V���b�s���O�N������Ă��Ȃ��Ȃ�A�G���[�Ƃ���B
010200*=================================================================
010300     else
010400       set �G���[ to true
010500       move 4 to ���A�l
010600     end-if.
010700*=================================================================
010800* �ďo�����ɕ��A����
010900*=================================================================
011000 exit-proc.
011100     call "COB_UNLOCK_DATA" with c linkage
011200                            using by reference lock-key
011300                                  by reference err-datail
011400                            returning ret-value.
011500*=================================================================
011600*  ���A�l���O�ȊO�Ȃ�G���[���O���o�͂��܂��B
011700*=================================================================
011800     if ���A�l not = 0 then
011900       move �G���[���b�Z�[�W(���A�l) to ����
012000       call "COB_REPORT_EVENT" using userLog returning ���A�R�[�h
012100     end-if
012200     exit program.