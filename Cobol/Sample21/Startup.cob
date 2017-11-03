000100*=================================================================
000200* �u�}���`�X���b�h�v���O���~���O�v
000300*     �X���b�h�ԂŃt�@�C���E�f�[�^�����p���ĔF�؏������������܂�
000400*
000500*=================================================================
000600*
000700*  �t�@�C�����F Startup.cob
000800*  ����T�v  �F �F�؃T�[�r�X�̊J�n�������s���܂�
000900*
001000* Copyright 1999-2015 FUJITSU LIMITED
001100*=================================================================
001200 identification division.
001300 program-id. "HttpExtensionProc".
001400 environment division.
001500 data division.
001600 working-storage section.
001700     copy COBW3.
001800*
001900 01 returnValue                    pic 9(09) comp-5.
002000 01 HTMLFilename                   pic X(40).
002100 01 copyStartPos                   pic 9(05).
002200 01 leftLength                     pic 9(05).
002300 01 �F�؃T�[�r�X�N����� pic 9(1) is external.
002400*----------------------------------------------------------------*
002500* SAF�A�v���ւ̈ڍs�ɂ���                                      *
002600*                                                                *
002700*    SAF�A�v���Ɉڍs����ۂ́A�A���߂Ǝ葱�������C������K�v��   *
002800*  ����܂��B�C���^�t�F�[�X�̈��SAF�T�u���[�`���Ŏg�p���邽�߁A *
002900*  SAF�T�u���[�`���Ƃ̃C���^�t�F�[�X�ł���COBW3�ɂ��̃A�h���X    *
003000*  ��ݒ肷��K�v������܂��B                                    *
003100*                                                                *
003200*  [�⑫]                                                        *
003300*    SAF�A�v���̏ꍇ�́ANSAPI�J�n����I���܂ł̃R�����g���O���A  *
003400*  ISAPI�J�n����I���܂ł��R�����g�����Ă��������B               *
003500*    SAF�A�v���̃����N�`���s�̏ڍׂɂ��Ă�"COBOL Web�T�u���[   *
003600*  �`���g�p�����" ���Q�Ƃ��Ă�������                            *
003700*                                                                *
003800*----------------------------------------------------------------*
003900*
004000*---------------------   �h�r�`�o�h �J�n  -----------------------*
004100 linkage section.
004200     copy IsapiCtx.
004300*
004400 procedure division with stdcall linkage using ISAPI-CTX-CNT.
004500*
004600 Auth-Start.
004700*
004800*  �h�r�`�o�h�T�u���[�`���p�����^��̏�����
004900     move low-value to COBW3.
005000     move function addr(ISAPI-CTX-CNT) to COBW3-CONTEXT.
005100*---------------------   �h�r�`�o�h �I��  -----------------------*
005200*
005300*---------------------   �m�r�`�o�h �J�n  -----------------------*
005400*linkage section.
005500*01 safpt                         pointer.
005600**
005700* procedure division using safpt.
005800**
005900*Auth-Start.
006000**
006100**  �m�r�`�o�h�T�u���[�`���p�����^��̏�����
006200*    move low-value to COBW3.
006300*    move safpt     to COBW3-CONTEXT.
006400*---------------------   �m�r�`�o�h �I��  -----------------------*
006500*
006600*=================================================================
006700*  �v�����T�u���[�`����Ɗ��̐ݒ肵�A�v�����p�����^���l������
006800*=================================================================
006900     call "COBW3_INIT" using COBW3.
007000*=================================================================
007100*  �F�؃T�[�r�X�̋N��
007200*=================================================================
007300     call "�F�؃T�[�r�X�N��"
007400          returning returnValue
007500*=================================================================
007600*  ���ʏo�͗p�y�[�W�̑I��
007700*=================================================================
007800     evaluate returnValue
007900       when   zero
008000         move "Startup.html" to HTMLFilename
008100       when   1
008200         move "SysError.html" to HTMLFilename
008300       when   2
008400         move "Opened.html" to HTMLFilename
008500     end-evaluate.
008600*=================================================================
008700* ��ʏo�͏���
008800*   �A�v���P�[�V�������z�u����Ă��镨���p�X�̎擾���āA�o�͂���
008900*  HTML������������������
009000*=================================================================
009100     set COBW3-PHYSICALPATH to true.
009200     call "COBW3_GET_REQUEST_INFO" using COBW3.
009300     if COBW3-STATUS = zero then
009400       move COBW3-REQUEST-INFO(1:COBW3-REQUEST-INFO-LENGTH)
009500            to COBW3-HTML-FILENAME
009600       compute copyStartPos = COBW3-REQUEST-INFO-LENGTH + 1
009700       move "\" to COBW3-HTML-FILENAME(copyStartPos:1)
009800       compute copyStartPos = copyStartPos + 1
009900       compute leftLength = 256 - copyStartPos + 1
010000       move HTMLFilename to COBW3-HTML-FILENAME(copyStartPos:leftLength)
010100     end-if.
010200*  HTML�����̏o��
010300     call "COBW3_PUT_HTML" using COBW3.
010400*=================================================================
010500*  �v�����T�u���[�`����Ɨ̈�̉��
010600*=================================================================
010700     call "COBW3_FREE" using COBW3.
010800*
010900 StartOnline-End.
011000*
011100     move 1 to program-status.
011200     exit program.
