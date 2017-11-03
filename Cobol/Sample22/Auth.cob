000100*=================================================================
000200* �u�}���`�X���b�h�v���O���~���O�v
000300*     �X���b�h�ԂŃt�@�C���E�f�[�^�����p���ăI�����C���V���b�s���O
000400*   �̃A�v���P�[�V�������\�z���܂��B
000500*
000600*=================================================================
000700*
000800*  �t�@�C�����F Auth.cob
000900*  ����T�v  �F �F�؏������s���܂�
001000*
001100* Copyright 1999-2015 FUJITSU LIMITED
001200*=================================================================
001300 identification division.
001400 program-id. "HttpExtensionProc".
001500 environment division.
001600 data division.
001700 working-storage section.
001800     copy COBW3.
001900     copy User-Info.
002000*
002100 01 authDataFlag                  pic 9(01).
002200 01 inputedPassword               pic X(32).
002300 01 returnValue                   pic 9(09) comp-5.
002400 01 HTMLFilename                  pic X(40).
002500 01 copyStartPos                  pic 9(05).
002600 01 leftLength                    pic 9(05).
002700*----------------------------------------------------------------*
002800* SAF�A�v���ւ̈ڍs�ɂ���                                      *
002900*                                                                *
003000*    SAF�A�v���Ɉڍs����ۂ́A�A���߂Ǝ葱�������C������K�v��   *
003100*  ����܂��B�C���^�t�F�[�X�̈��SAF�T�u���[�`���Ŏg�p���邽�߁A *
003200*  SAF�T�u���[�`���Ƃ̃C���^�t�F�[�X�ł���COBW3�ɂ��̃A�h���X    *
003300*  ��ݒ肷��K�v������܂��B                                    *
003400*                                                                *
003500*  [�⑫]                                                        *
003600*    SAF�A�v���̏ꍇ�́ANSAPI�J�n����I���܂ł̃R�����g���O���A  *
003700*  ISAPI�J�n����I���܂ł��R�����g�����Ă��������B               *
003800*    SAF�A�v���̃����N�`���s�̏ڍׂɂ��Ă�"COBOL Web�T�u���[   *
003900*  �`���g�p�����" ���Q�Ƃ��Ă�������                            *
004000*                                                                *
004100*----------------------------------------------------------------*
004200*
004300*---------------------   �h�r�`�o�h �J�n  -----------------------*
004400 linkage section.
004500     copy IsapiCtx.
004600*
004700 procedure division with stdcall linkage using ISAPI-CTX-CNT.
004800*
004900 Auth-Start.
005000*
005100*  �h�r�`�o�h�T�u���[�`���p�����^��̏�����
005200     move low-value to COBW3.
005300     move function addr(ISAPI-CTX-CNT) to COBW3-CONTEXT.
005400*---------------------   �h�r�`�o�h �I��  -----------------------*
005500*
005600*---------------------   �m�r�`�o�h �J�n  -----------------------*
005700*linkage section.
005800*01 safpt                         pointer.
005900**
006000* procedure division using safpt.
006100**
006200*Auth-Start.
006300**
006400**  �m�r�`�o�h�T�u���[�`���p�����^��̏�����
006500*    move low-value to COBW3.
006600*    move safpt     to COBW3-CONTEXT.
006700*---------------------   �m�r�`�o�h �I��  -----------------------*
006800*
006900*=================================================================
007000*  �v�����T�u���[�`����Ɗ��̐ݒ肵�A�v�����p�����^���l������
007100*=================================================================
007200     call "COBW3_INIT" using COBW3.
007300*=================================================================
007400*  �v�����p�����^���烆�[�UID���擾����
007500*=================================================================
007600     move "���[�UID" to COBW3-SEARCH-DATA.
007700     call "COBW3_GET_VALUE_XX" using COBW3.
007800     if COBW3-SEARCH-FLAG-EXIST then
007900       move 1 to authDataFlag
008000       move COBW3-GET-DATA to userID
008100     else
008200       move zero to authDataFlag
008300     end-if.
008400*=================================================================
008500*  �v�����p�����^����p�X���[�h���擾���A���[�UID�Ƃ̑g������
008600*  �`�F�b�N����B
008700*=================================================================
008800     move NC"�p�X���[�h" to COBW3-SEARCH-DATA-N.
008900     call "COBW3_GET_VALUE_NX" using COBW3.
009000     if COBW3-SEARCH-FLAG-EXIST then
009100       move 1 to authDataFlag
009200       move COBW3-GET-DATA to userPassword
009300       call "�ڋq���擾" using userInfo
009400                           returning returnValue
009500     else
009600       move zero to authDataFlag
009700     end-if.
009800*
009900*=================================================================
010000*  ���ʏo�͗p�y�[�W�̑I�����܂��B�F�ؐ������͂b������������
010100*  userID���o�͂��܂��B
010200*=================================================================
010300     evaluate authDataFlag also returnValue
010400       when   not zero     also zero
010500         move "Online Store User-ID" to COBW3-COOKIE-NAME
010600         move userID                 to COBW3-COOKIE-VALUE
010700         call "COBW3_SET_COOKIE" using COBW3
010800         move "Catalog.html" to HTMLFilename
010900       when   any          also 2 thru 3
011000         move "AuthFail.html" to HTMLFilename
011100       when other
011200         move "SystemError.html" to HTMLFilename
011300     end-evaluate.
011400*=================================================================
011500* ��ʏo�͏���
011600*   �A�v���P�[�V�������z�u����Ă��镨���p�X�̎擾���āA�o�͂���
011700*  HTML������������������
011800*=================================================================
011900     set COBW3-PHYSICALPATH to true.
012000     call "COBW3_GET_REQUEST_INFO" using COBW3.
012100     if COBW3-STATUS = zero then
012200       move space to COBW3-HTML-FILENAME
012300       string COBW3-REQUEST-INFO(1:COBW3-REQUEST-INFO-LENGTH)
012400              "\"                    delimited by size
012500              HTMLFilename           delimited by space
012600          into COBW3-HTML-FILENAME
012700     end-if.
012800*  HTML�����̏o��
012900     call "COBW3_PUT_HTML" using COBW3.
013000*=================================================================
013100*  �v�����T�u���[�`����Ɨ̈�̉��
013200*=================================================================
013300     call "COBW3_FREE" using COBW3.
013400*
013500 Auth-End.
013600*
013700     move 1 to program-status.
013800     exit program.
013900*
014000 ��ʏo�͏����I��.
014100     exit.
