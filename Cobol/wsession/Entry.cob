000010*=================================================================
000020* �u�Z�V�����Ǘ��@�\���g�p����Web�A�v���P�[�V�����v
000030*     �Z�V�����Ǘ��@�\���g�p���āA����̃N���C�A���g���畡�����
000040*   ���N�G�X�g�ɂ܂��������Ɩ����s���A�v���P�[�V�������\�z���܂��B
000050*
000060*=================================================================
000070*
000080*  �t�@�C�����F ENTRY.COB
000090*  ����T�v  �F �t�@�C���Ƀf�[�^�������o���A�Z�V�������I�����܂��B
000100*
000110* Copyright 2000-2015 FUJITSU LIMITED
000120*=================================================================
000130 IDENTIFICATION DIVISION.
000140 PROGRAM-ID. "HttpExtensionProc".
000150 ENVIRONMENT DIVISION.
000160  CONFIGURATION SECTION.
000170   REPOSITORY.
000180     CLASS �Z�V�����I�u�W�F�N�g.
000190 DATA DIVISION.
000200 WORKING-STORAGE SECTION.
000210     COPY COBW3.
000220*
000230     COPY GETDATA.
000240 01 �Z�V�����n�a�i                OBJECT REFERENCE.
000250 01 HTMLFILENAME                  PIC X(40).
000260 01 PATHSIZE                      PIC 9(05).
000270 01 PATHLAST                      PIC 9(05).
000280 01 RETURNVALUE                   PIC 9(09) COMP-5.
000290*----------------------------------------------------------------*
000300* SAF�A�v���ւ̈ڍs�ɂ���                                      *
000310*                                                                *
000320*    SAF�A�v���Ɉڍs����ۂ́A�A���߂Ǝ葱�������C������K�v��   *
000330*  ����܂��B�C���^�t�F�[�X�̈��SAF�T�u���[�`���Ŏg�p���邽�߁A *
000340*  SAF�T�u���[�`���Ƃ̃C���^�t�F�[�X�ł���COBW3�ɂ��̃A�h���X    *
000350*  ��ݒ肷��K�v������܂��B                                    *
000360*                                                                *
000370*  [�⑫]                                                        *
000380*    SAF�A�v���̏ꍇ�́ANSAPI�J�n����I���܂ł̃R�����g���O���A  *
000390*  ISAPI�J�n����I���܂ł��R�����g�����Ă��������B               *
000400*    SAF�A�v���̃����N�`���s�̏ڍׂɂ��ẮA                   *
000410*    "NetCOBOL Web�T�u���[�`�� �g�p�����" ���Q�Ƃ��Ă��������B  *
000420*                                                                *
000430*----------------------------------------------------------------*
000440*
000450*---------------------   �h�r�`�o�h �J�n  -----------------------*
000460 LINKAGE SECTION.
000470     COPY ISAPICTX.
000480*
000490 PROCEDURE DIVISION WITH STDCALL LINKAGE USING ISAPI-CTX-CNT.
000500*
000510 ENTRY-START.
000520*
000530*  �h�r�`�o�h�T�u���[�`���p�����^��̏�����
000540     MOVE LOW-VALUE TO COBW3.
000550     MOVE FUNCTION ADDR(ISAPI-CTX-CNT) TO COBW3-CONTEXT.
000560*---------------------   �h�r�`�o�h �I��  -----------------------*
000570*
000580*---------------------   �m�r�`�o�h �J�n  -----------------------*
000590*LINKAGE SECTION.
000600*01 SAFPT                         POINTER.
000610**
000620* PROCEDURE DIVISION USING SAFPT.
000630**
000640*ENTRY-START.
000650**
000660**  �m�r�`�o�h�T�u���[�`���p�����^��̏�����
000670*    MOVE LOW-VALUE TO COBW3.
000680*    MOVE SAFPT     TO COBW3-CONTEXT.
000690*---------------------   �m�r�`�o�h �I��  -----------------------*
000700*
000710*=================================================================
000720*  �v�d�a�T�u���[�`����Ɗ��̐ݒ肵�A�v�d�a�p�����^���l������
000730*=================================================================
000740     CALL "COBW3_INIT" USING COBW3.
000750*
000760*=================================================================
000770*  ���s�̃Z�V���������擾���A�Z�V�����������肷��B
000780*=================================================================
000790     CALL "COBW3_GET_SESSION_INFO" USING COBW3.
000800     IF COBW3-SESSION-STATUS-NON THEN
000810         MOVE "IlligalAccess.html" TO HTMLFILENAME
000820         PERFORM ��ʏo�͏���
000830         GO TO �I���ʒu
000840     END-IF.
000850*
000860*=================================================================
000870*  �Z�V�����f�[�^���擾����B
000880*=================================================================
000890     CALL "COBW3_GET_SESSION_DATA" USING COBW3 �Z�V�����n�a�i.
000900     IF COBW3-STATUS NOT = ZERO THEN
000910         CALL "COBW3_END_SESSION" USING COBW3
000920         MOVE "SystemError.html" TO HTMLFILENAME
000930         PERFORM ��ʏo�͏���
000940         GO TO �I���ʒu
000950     END-IF.
000960*
000970     *> �Z�V�����ň����p�����f�[�^���擾����
000980     INVOKE �Z�V�����n�a�i "�Z�V�����f�[�^�擾" USING GETDATA.
000990*
001000     *> �v�d�a�p�����^���珈�����擾����
001010     MOVE "PROC"  TO COBW3-SEARCH-DATA.
001020     CALL "COBW3_GET_VALUE_XX" USING COBW3.
001030*
001040     IF COBW3-GET-DATA = "CONFIRM" THEN
001050       *> �m�F�̏ꍇ�t�@�C�����X�V����
001060       INVOKE �Z�V�����n�a�i "�X�V" RETURNING RETURNVALUE
001070       *> �ϊ��f�[�^�̓o�^
001080       MOVE "TRADE" TO COBW3-CNV-NAME
001090       IF G-DEPOSIT THEN
001100         MOVE NC"�a��" TO COBW3-CNV-VALUE-N
001110       ELSE
001120         MOVE NC"����" TO COBW3-CNV-VALUE-N
001130       END-IF
001140       PERFORM �ϊ��f�[�^�o�^�m
001150       MOVE "MONEY" TO COBW3-CNV-NAME
001160       MOVE G-MONEY TO COBW3-CNV-VALUE
001170       PERFORM �ϊ��f�[�^�o�^
001180       MOVE "BALANCE" TO COBW3-CNV-NAME
001190       MOVE G-NEWBALANCE TO COBW3-CNV-VALUE
001200       PERFORM �ϊ��f�[�^�o�^
001210
001220     ELSE
001230       *> ����̏ꍇ�ϊ��f�[�^��o�^����
001240       MOVE "TRADE" TO COBW3-CNV-NAME
001250       MOVE "****" TO COBW3-CNV-VALUE
001260       PERFORM �ϊ��f�[�^�o�^
001270       MOVE "MONEY" TO COBW3-CNV-NAME
001280       MOVE "****************" TO COBW3-CNV-VALUE
001290       PERFORM �ϊ��f�[�^�o�^
001300       MOVE "BALANCE" TO COBW3-CNV-NAME
001310       MOVE G-OLDBALANCE TO COBW3-CNV-VALUE
001320       PERFORM �ϊ��f�[�^�o�^
001330     END-IF.
001340*
001350     MOVE "ID" TO COBW3-CNV-NAME.
001360     MOVE G-USERID TO COBW3-CNV-VALUE.
001370     PERFORM �ϊ��f�[�^�o�^.
001380*
001390*=================================================================
001400*  �Z�V�����I���B
001410*=================================================================
001420     *> �Z�V�����f�[�^�̏I���������s��
001430     INVOKE �Z�V�����n�a�i "�I������".
001440
001450     *> �Z�V�������I������
001460     CALL "COBW3_END_SESSION" USING COBW3.
001470*
001480     MOVE "End.html" TO HTMLFILENAME.
001490     PERFORM ��ʏo�͏���.
001500*
001510 �I���ʒu.
001520*
001530     *> �I�u�W�F�N�g�Q�ƍ��ڂ�NULL��ݒ肷��
001540     SET �Z�V�����n�a�i TO NULL.
001550*
001560     *> �v�d�a�T�u���[�`����Ɨ̈�̉��
001570     CALL "COBW3_FREE" USING COBW3.
001580*
001590 ENTRY-END.
001600*
001610     MOVE 1 TO PROGRAM-STATUS.
001620     EXIT PROGRAM.
001630*
001640*=================================================================
001650*
001660*  ���������̒�`
001670*
001680*=================================================================
001690*
001700*=================================================================
001710*  �ϊ��f�[�^�o�^����
001720*=================================================================
001730 �ϊ��f�[�^�o�^ SECTION.
001740     CALL "COBW3_SET_CNV_XX" USING COBW3.
001750     IF COBW3-STATUS NOT = ZERO THEN
001760         MOVE "SystemError.html" TO HTMLFILENAME
001770         PERFORM ��ʏo�͏���
001780         GO TO �I���ʒu
001790     END-IF.
001800 �ϊ��f�[�^�o�^�I��.
001810     EXIT.
001820*
001830*=================================================================
001840*  �ϊ��f�[�^�o�^����(VALUE�����{��)
001850*=================================================================
001860 �ϊ��f�[�^�o�^�m SECTION.
001870     CALL "COBW3_SET_CNV_XN" USING COBW3.
001880     IF COBW3-STATUS NOT = ZERO THEN
001890         MOVE "SystemError.html" TO HTMLFILENAME
001900         PERFORM ��ʏo�͏���
001910         GO TO �I���ʒu
001920     END-IF.
001930 �ϊ��f�[�^�o�^�m�I��.
001940     EXIT.
001950*
001960*=================================================================
001970*  ��ʏo�͏���
001980*    ���ʏo�͗p�y�[�W�́A�A�v���P�[�V�������N�������ďo���p�y�[�W
001990*    �Ɠ����t�H���_�ɂ�����̂ƌ��Ȃ��B
002000*=================================================================
002010 ��ʏo�͏��� SECTION.
002020     MOVE SPACE TO COBW3-HTML-FILENAME.
002030     *>  �����p�X�̎擾
002040     SET COBW3-PHYSICALPATH TO TRUE.
002050     CALL "COBW3_GET_REQUEST_INFO" USING COBW3.
002060     IF COBW3-STATUS = ZERO THEN
002070         MOVE COBW3-REQUEST-INFO-LENGTH TO PATHSIZE
002080         MOVE COBW3-REQUEST-INFO(1:PATHSIZE) TO COBW3-HTML-FILENAME
002090     END-IF.
002100     *>  �t���p�X�t�@�C�����̊���
002110     ADD 1 TO PATHSIZE.
002120     MOVE "\" TO COBW3-HTML-FILENAME(PATHSIZE:1).
002130     MOVE 256 TO PATHLAST.
002140     SUBTRACT PATHSIZE FROM PATHLAST.
002150     ADD 1 TO PATHSIZE.
002160     MOVE HTMLFILENAME TO COBW3-HTML-FILENAME(PATHSIZE:PATHLAST).
002170     *> HTML�����̏o��
002180     CALL "COBW3_PUT_HTML" USING COBW3.
002190*
002200 ��ʏo�͏����I��.
002210     EXIT.
