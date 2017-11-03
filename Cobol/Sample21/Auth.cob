000100*=================================================================
000200* �u�}���`�X���b�h�v���O���~���O�v
000300*     �X���b�h�ԂŃt�@�C���E�f�[�^�����p���ĔF�؏������������܂�
000400*
000500*=================================================================
000600*
000700*  �t�@�C�����F Auth.cob
000800*  ����T�v  �F �ȒP�ȔF�؏������s���܂�
000900*
001000* Copyright 1999-2015 FUJITSU LIMITED
001100*=================================================================
001200 identification division.
001300 program-id. "HttpExtensionProc".
001400 environment division.
001500 data division.
001600 working-storage section.
001700     copy COBW3.
001800     copy User-Info.
001900*
002000 01 authDataFlag                  pic 9(01).
002100 01 inputedPassword               pic X(32).
002200 01 returnValue                   pic 9(09) comp-5.
002300 01 HTMLFilename                  pic X(40).
002400 01 copyStartPos                  pic 9(05).
002500 01 leftLength                    pic 9(05).
002600*----------------------------------------------------------------*
002700* SAF�A�v���ւ̈ڍs�ɂ���                                      *
002800*                                                                *
002900*    SAF�A�v���Ɉڍs����ۂ́A�A���߂Ǝ葱�������C������K�v��   *
003000*  ����܂��B�C���^�t�F�[�X�̈��SAF�T�u���[�`���Ŏg�p���邽�߁A *
003100*  SAF�T�u���[�`���Ƃ̃C���^�t�F�[�X�ł���COBW3�ɂ��̃A�h���X    *
003200*  ��ݒ肷��K�v������܂��B                                    *
003300*                                                                *
003400*  [�⑫]                                                        *
003500*    SAF�A�v���̏ꍇ�́ANSAPI�J�n����I���܂ł̃R�����g���O���A  *
003600*  ISAPI�J�n����I���܂ł��R�����g�����Ă��������B               *
003700*    SAF�A�v���̃����N�`���s�̏ڍׂɂ��Ă�"COBOL Web�T�u���[   *
003800*  �`���g�p�����" ���Q�Ƃ��Ă�������                            *
003900*                                                                *
004000*----------------------------------------------------------------*
004100*
004200*---------------------   �h�r�`�o�h �J�n  -----------------------*
004300 linkage section.
004400     copy IsapiCtx.
004500*
004600 procedure division with stdcall linkage using ISAPI-CTX-CNT.
004700*
004800 Auth-Start.
004900*
005000*  �h�r�`�o�h�T�u���[�`���p�����^��̏�����
005100     move low-value to COBW3.
005200     move function addr(ISAPI-CTX-CNT) to COBW3-CONTEXT.
005300*---------------------   �h�r�`�o�h �I��  -----------------------*
005400*
005500*---------------------   �m�r�`�o�h �J�n  -----------------------*
005600*linkage section.
005700*01 safpt                         pointer.
005800**
005900* procedure division using safpt.
006000**
006100*Auth-Start.
006200**
006300**  �m�r�`�o�h�T�u���[�`���p�����^��̏�����
006400*    move low-value to COBW3.
006500*    move safpt     to COBW3-CONTEXT.
006600*---------------------   �m�r�`�o�h �I��  -----------------------*
006700*
006800*=================================================================
006900*  �v�����T�u���[�`����Ɗ��̐ݒ肵�A�v�����p�����^���l������
007000*=================================================================
007100     call "COBW3_INIT" using COBW3.
007200*=================================================================
007300*  �v�����p�����^���烆�[�UID���擾����
007400*=================================================================
007500     move "���[�UID" to COBW3-SEARCH-DATA.
007600     call "COBW3_GET_VALUE_XX" using COBW3.
007700     if COBW3-SEARCH-FLAG-EXIST then
007800         move 1 to authDataFlag
007900         move COBW3-GET-DATA to userID
008000     else
008100         move zero to authDataFlag
008200     end-if.
008300*=================================================================
008400*  �v�����p�����^����p�X���[�h���擾���A���[�UID�Ƃ̑g������
008500*  �`�F�b�N����B
008600*=================================================================
008700     move NC"�p�X���[�h" to COBW3-SEARCH-DATA-N.
008800     call "COBW3_GET_VALUE_NX" using COBW3.
008900     if COBW3-SEARCH-FLAG-EXIST then
009000         move 1 to authDataFlag
009100         move COBW3-GET-DATA to userPassword
009200         call "�ڋq���擾" using userInfo
009300                             returning returnValue
009400     else
009500         move zero to authDataFlag
009600     end-if.
009700*
009800*=================================================================
009900*  ���ʏo�͗p�y�[�W�̑I��
010000*=================================================================
010100     evaluate authDataFlag also returnValue
010200       when   not zero     also zero
010300         move "AuthSuccess.html" to HTMLFilename
010400       when   any          also 2 thru 3
010500         move "AuthFail.html" to HTMLFilename
010600       when other
010700         move "SystemError.html" to HTMLFilename
010800     end-evaluate.
010900*=================================================================
011000* ��ʏo�͏���
011100*   �A�v���P�[�V�������z�u����Ă��镨���p�X�̎擾���āA�o�͂���
011200*  HTML������������������
011300*=================================================================
011400     set COBW3-PHYSICALPATH to true.
011500     call "COBW3_GET_REQUEST_INFO" using COBW3.
011600     if COBW3-STATUS = zero then
011700       move space to COBW3-HTML-FILENAME
011800       string COBW3-REQUEST-INFO(1:COBW3-REQUEST-INFO-LENGTH)
011900              "\"                    delimited by size
012000              HTMLFilename           delimited by space
012100          into COBW3-HTML-FILENAME
012200     end-if.
012300*  HTML�����̏o��
012400     call "COBW3_PUT_HTML" using COBW3.
012500*=================================================================
012600*  �v�����T�u���[�`����Ɨ̈�̉��
012700*=================================================================
012800     call "COBW3_FREE" using COBW3.
012900*
013000 Auth-End.
013100*
013200     move 1 to program-status.
013300     exit program.
013400*
013500 ��ʏo�͏����I��.
013600     exit.
