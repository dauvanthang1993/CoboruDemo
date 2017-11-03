000100*=================================================================
000200* �u�}���`�X���b�h�v���O���~���O�v
000300*     �X���b�h�ԂŃt�@�C���E�f�[�^�����p���ăI�����C���V���b�s���O
000400*   �̃A�v���P�[�V�������\�z���܂��B
000500*
000600*=================================================================
000700*
000800*  �t�@�C�����F OLSPRDGT.cob
000900*  ����T�v  �F �I�����C���V���b�s���O�̂��߂́A���i�f�[�^�擾��
001000*               ���������܂��B
001100*  �p�����[�^�F
001200*     �������F���i���(�W�c����)
001300*     ���A�l
001400*       �����F�O
001500*       ���s�F�O�ȊO
001600*
001700* Copyright 1999-2015 FUJITSU LIMITED
001800*=================================================================
001900 identification division.
002000  program-id. "���i�f�[�^�擾".
002100* ���i�̃f�[�^�𐻕i�t�@�C��������o��
002200*   �ďo�����F
002300*   �p�����[�^
002400*     �������F
002500*   ���A�l
002600*     �����F�O
002700*     ���s�F�O�ȊO
002800 environment division.
002900  input-output section.
003000   file-control.
003100     select ���i���t�@�C�� assign to sys008
003200      organization is indexed
003300      access mode is random
003400      record key is ���i�ԍ�
003500      file status is ���i���t�@�C�����o�͏��.
003600 data division.
003700  file section.
003800   fd ���i���t�@�C�� is external.
003900    01 ���i���f�[�^.
004000     02 ���i�ԍ�              pic x(12).
004100     02 �^��              pic x(32).
004200     02 �`��              pic x(32).
004300     02 ���i              pic 9(09).
004400  working-storage section.
004500   copy user-Log.
004600   copy user-Lock.
004700   01 �I�����C���V���b�s���O�N�����  pic 9(1) is external.
004800   01 ���i���t�@�C�����o�͏��      pic x(2).
004900 01 ���b�Z�[�W�e�[�u��.
005000   02               pic x(90).
005100   02               pic x(90) VALUE
005200     "�����Ȑ��i�ԍ����w�肳��܂����B�v���O�����F���i�f�[�^�擾".
005300   02               pic x(90).
005400   02               pic x(90) VALUE
005500     "�I�����C���V���b�s���O���N������Ă��܂���B�v���O�����F���i�f�[�^�擾".
005600 01 redefines ���b�Z�[�W�e�[�u��.
005700   02 �G���[���b�Z�[�W pic x(90) occurs 4 times.
005800  linkage section.
005900   copy Product-Info.
006000   01 ���A�l              pic 9(9) comp-5.
006100 procedure division using productInfo returning ���A�l.
006200*=================================================================
006300*  ��ƈ�����������܂��B
006400*=================================================================
006500     move 0 to ���A�l.
006600     initialize userLog.
006700*=================================================================
006800*  �I�����C���V���b�s���O�̋N����Ԃ��m�F���܂��B
006900*=================================================================
007000     move "������" to lock-key.
007100     move -1 to wait-time.
007200     call "COB_LOCK_DATA" with c linkage
007300                          using by reference lock-key
007400                                by value wait-time
007500                                by reference err-datail
007600                          returning ret-value.
007700*=================================================================
007800*  �I�����C���V���b�s���O���N������Ă���Ȃ�A�݌ɏ������o��
007900*=================================================================
008000     if �I�����C���V���b�s���O�N����� = 1 then
008100       *> productQuantity�񐔕��������J��Ԃ�
008200       perform test before
008300           varying productIndex from 1 by 1
008400                   until productIndex > productQuantity
008500*=================================================================
008600*  ���i�ԍ����L�[�ɐ��i�������o���B
008700*=================================================================
008800         move productNumber(productIndex) to ���i�ԍ�
008900         read ���i���t�@�C�� with no lock
009000           invalid key
009100             move 2 to ���A�l      *> �����L�[�Ȃ�G���[�Ƃ���
009200             set �G���[ to true    *> ���[�v��E�o
009300             exit perform
009400         end-read
009500         move �^��    to productName(productIndex)
009600         move �`��    to productModel(productIndex)
009700         move ���i    to productPrice(productIndex)
009800       end-perform
009900*=================================================================
010000*  �I�����C���V���b�s���O���N������Ă��Ȃ��Ȃ�A�G���[�Ƃ���B
010100*=================================================================
010200     else
010300       move 3 to ���A�l
010400       set �G���[ to true
010500     end-if.
010600*=================================================================
010700* �ďo�����ɕ��A����
010800*=================================================================
010900 exit-proc.
011000     call "COB_UNLOCK_DATA" with c linkage
011100                            using by reference lock-key
011200                                  by reference err-datail
011300                            returning ret-value.
011400*=================================================================
011500*  ���A�l���O�ȊO�Ȃ�G���[���O���o�͂��܂��B
011600*=================================================================
011700     if ���A�l not = 0 then
011800       move �G���[���b�Z�[�W(���A�l) to ����
011900       call "COB_REPORT_EVENT" using userLog returning ���A�R�[�h
012000     end-if
012100     exit program.
