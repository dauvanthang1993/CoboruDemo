000010*=================================================================
000020* �u�Z�V�����Ǘ��@�\���g�p����Web�A�v���P�[�V�����v
000030*     �Z�V�����Ǘ��@�\���g�p���āA����̃N���C�A���g���畡�����
000040*   ���N�G�X�g�ɂ܂��������Ɩ����s���A�v���P�[�V�������\�z���܂��B
000050*
000060*=================================================================
000070*
000080*  �t�@�C�����F CONFIRM.COB
000090*  ����T�v  �F �m�F�\���쐬�E�o�͂��܂�
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
000230 01 �Z�V�����n�a�i                OBJECT REFERENCE.
000240 01 HTMLFILENAME                  PIC X(40).
000250 01 PATHSIZE                      PIC 9(05).
000260 01 PATHLAST                      PIC 9(05).
000270 01 RETURNVALUE                   PIC 9(09) COMP-5.
000280 01 ���z                          PIC 9(16).
000290 01 �c��                          PIC 9(16).
000300 01 DSP-MONEY                     PIC \\,\\\,\\\,\\\,\\\,\\9.
000310*----------------------------------------------------------------*
000320* SAF�A�v���ւ̈ڍs�ɂ���                                      *
000330*                                                                *
000340*    SAF�A�v���Ɉڍs����ۂ́A�A���߂Ǝ葱�������C������K�v��   *
000350*  ����܂��B�C���^�t�F�[�X�̈��SAF�T�u���[�`���Ŏg�p���邽�߁A *
000360*  SAF�T�u���[�`���Ƃ̃C���^�t�F�[�X�ł���COBW3�ɂ��̃A�h���X    *
000370*  ��ݒ肷��K�v������܂��B                                    *
000380*                                                                *
000390*  [�⑫]                                                        *
000400*    SAF�A�v���̏ꍇ�́ANSAPI�J�n����I���܂ł̃R�����g���O���A  *
000410*  ISAPI�J�n����I���܂ł��R�����g�����Ă��������B               *
000420*                                                                *
000430*----------------------------------------------------------------*
000440*
000450*---------------------   �h�r�`�o�h �J�n  -----------------------*
000460 LINKAGE SECTION.
000470     COPY ISAPICTX.
000480*
000490 PROCEDURE DIVISION WITH STDCALL LINKAGE USING ISAPI-CTX-CNT.
000500*
000510 CONFIRM-START.
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
000640*CONFIRM-START.
000650**
000660**  �m�r�`�o�h�T�u���[�`���p�����^��̏�����
000670*    MOVE LOW-VALUE TO COBW3.
000680*    MOVE SAFPT     TO COBW3-CONTEXT.
000690*---------------------   �m�r�`�o�h �I��  -----------------------*
000700*
000710*=================================================================
000720*  �v�d�a�T�u���[�`����Ɗ������������A�v�d�a�p�����^���l������
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
000970*=================================================================
000980*  �m�F�\���쐬����B
000990*=================================================================
001000     *> ���͂��ꂽ���z���擾����
001010     MOVE "MONEY"  TO COBW3-SEARCH-DATA.
001020     CALL "COBW3_GET_VALUE_XX" USING COBW3.
001030     COMPUTE ���z = FUNCTION NUMVAL(COBW3-GET-DATA).
001040*
001050     *> ���͂��ꂽ�������擾����
001060     MOVE "PROC"  TO COBW3-SEARCH-DATA.
001070     CALL "COBW3_GET_VALUE_XX" USING COBW3.
001080*
001090     IF COBW3-GET-DATA = "DEPOSIT" THEN
001100       *> �a���̏ꍇ
001110       INVOKE �Z�V�����n�a�i "�a��" USING ���z �c�� RETURNING RETURNVALUE
001120       IF RETURNVALUE NOT = 0 THEN
001130         PERFORM ���̓G���[����
001140         GO TO �I���ʒu
001150       END-IF
001160       MOVE "�a�����z:" TO COBW3-CNV-VALUE
001170     ELSE
001180       *> ���߂̏ꍇ
001190       INVOKE �Z�V�����n�a�i "����" USING ���z �c�� RETURNING RETURNVALUE
001200       IF RETURNVALUE NOT = 0 THEN
001210         PERFORM ���̓G���[����
001220         GO TO �I���ʒu
001230       END-IF
001240       MOVE "���ߋ��z:" TO COBW3-CNV-VALUE
001250     END-IF.
001260*
001270     *> �m�F�\�̃f�[�^�o�^
001280     MOVE "PROCMONEY-NAME" TO COBW3-CNV-NAME
001290     PERFORM �ϊ��f�[�^�o�^.
001300     MOVE "MONEY" TO COBW3-CNV-NAME.
001310     MOVE ���z TO DSP-MONEY.
001320     MOVE DSP-MONEY TO COBW3-CNV-VALUE.
001330     PERFORM �ϊ��f�[�^�o�^.
001340     MOVE "BALANCE" TO COBW3-CNV-NAME.
001350     MOVE �c�� TO DSP-MONEY.
001360     MOVE DSP-MONEY TO COBW3-CNV-VALUE.
001370     PERFORM �ϊ��f�[�^�o�^.
001380*
001390     MOVE "Confirm.html" TO HTMLFILENAME.
001400     PERFORM ��ʏo�͏���.
001410*
001420*=================================================================
001430*  �G���[�y�[�W�܂��͊m�F�\���o�͂��A�v�d�a�T�u���[�`��
001440*  ��Ɨ̈���J�����āA�v���O�������I������B
001450*=================================================================
001460 �I���ʒu.
001470*
001480     *> �I�u�W�F�N�g�Q�ƍ��ڂ�NULL��ݒ肷��
001490     SET �Z�V�����n�a�i TO NULL.
001500*
001510     *> �v�d�a�T�u���[�`����Ɨ̈�̉��
001520     CALL "COBW3_FREE" USING COBW3.
001530*
001540 CONFIRM-END.
001550*
001560     MOVE 1 TO PROGRAM-STATUS.
001570     EXIT PROGRAM.
001580*
001590*=================================================================
001600*
001610*  ���������̒�`
001620*
001630*=================================================================
001640*
001650*=================================================================
001660*  �ϊ��f�[�^�o�^����
001670*=================================================================
001680 �ϊ��f�[�^�o�^ SECTION.
001690     CALL "COBW3_SET_CNV_XX" USING COBW3.
001700     IF COBW3-STATUS NOT = ZERO THEN
001710         MOVE "SystemError.html" TO HTMLFILENAME
001720         PERFORM ��ʏo�͏���
001730         GO TO �I���ʒu
001740     END-IF.
001750 �ϊ��f�[�^�o�^�I��.
001760     EXIT.
001770*
001780*=================================================================
001790*  ��ʏo�͏���
001800*    ���ʏo�͗p�y�[�W�́A�A�v���P�[�V�������N�������ďo���p�y�[�W
001810*    �Ɠ����t�H���_�ɂ�����̂ƌ��Ȃ��B
001820*=================================================================
001830 ��ʏo�͏��� SECTION.
001840     MOVE SPACE TO COBW3-HTML-FILENAME.
001850     *>  �����p�X�̎擾
001860     SET COBW3-PHYSICALPATH TO TRUE.
001870     CALL "COBW3_GET_REQUEST_INFO" USING COBW3.
001880     IF COBW3-STATUS = ZERO THEN
001890         MOVE COBW3-REQUEST-INFO-LENGTH TO PATHSIZE
001900         MOVE COBW3-REQUEST-INFO(1:PATHSIZE) TO COBW3-HTML-FILENAME
001910     END-IF.
001920     *>  �t���p�X�t�@�C�����̊���
001930     ADD 1 TO PATHSIZE.
001940     MOVE "\" TO COBW3-HTML-FILENAME(PATHSIZE:1).
001950     MOVE 256 TO PATHLAST.
001960     SUBTRACT PATHSIZE FROM PATHLAST.
001970     ADD 1 TO PATHSIZE.
001980     MOVE HTMLFILENAME TO COBW3-HTML-FILENAME(PATHSIZE:PATHLAST).
001990     *> HTML�����̏o��
002000     CALL "COBW3_PUT_HTML" USING COBW3.
002010*
002020 ��ʏo�͏����I��.
002030     EXIT.
002040*
002050*=================================================================
002060*  ���̓G���[����
002070*=================================================================
002080 ���̓G���[���� SECTION.
002090     INVOKE �Z�V�����n�a�i "�I������".
002100     CALL "COBW3_END_SESSION" USING COBW3.
002110     MOVE "InputError.html" TO HTMLFILENAME.
002120     PERFORM ��ʏo�͏���.
002130 ���̓G���[�����I��.
002140     EXIT.
