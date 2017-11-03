000010*=================================================================
000020* �u�Z�V�����Ǘ��@�\���g�p����Web�A�v���P�[�V�����v
000030*     �Z�V�����Ǘ��@�\���g�p���āA����̃N���C�A���g���畡�����
000040*   ���N�G�X�g�ɂ܂��������Ɩ����s���A�v���P�[�V�������\�z���܂��B
000050*
000060*=================================================================
000070*
000080*  �t�@�C�����F AUTH.COB
000090*  ����T�v  �F �F�؏������s���A�Z�V�������J�n���܂�
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
000220     COPY USER-INFO.
000230*
000240 01 �Z�V�����n�a�i                OBJECT REFERENCE.
000250 01 AUTHDATAFLAG                  PIC 9(01).
000260 01 INPUTEDPASSWORD               PIC X(32).
000270 01 RETURNVALUE                   PIC 9(09) COMP-5.
000280 01 HTMLFILENAME                  PIC X(40).
000290 01 PATHSIZE                      PIC 9(05).
000300 01 PATHLAST                      PIC 9(05).
000310 01 DSP-MONEY                     PIC \\,\\\,\\\,\\\,\\\,\\9.
000320 01 �c��                          PIC 9(16).
000330*----------------------------------------------------------------*
000340* SAF�A�v���ւ̈ڍs�ɂ���                                      *
000350*                                                                *
000360*    SAF�A�v���Ɉڍs����ۂ́A�A���߂Ǝ葱�������C������K�v��   *
000370*  ����܂��B�C���^�t�F�[�X�̈��SAF�T�u���[�`���Ŏg�p���邽�߁A *
000380*  SAF�T�u���[�`���Ƃ̃C���^�t�F�[�X�ł���COBW3�ɂ��̃A�h���X    *
000390*  ��ݒ肷��K�v������܂��B                                    *
000400*                                                                *
000410*  [�⑫]                                                        *
000420*    SAF�A�v���̏ꍇ�́ANSAPI�J�n����I���܂ł̃R�����g���O���A  *
000430*  ISAPI�J�n����I���܂ł��R�����g�����Ă��������B               *
000440*    SAF�A�v���̃����N�`���s�̏ڍׂɂ��ẮA                   *
000450*    "NetCOBOL Web�T�u���[�`�� �g�p�����" ���Q�Ƃ��Ă��������B  *
000460*                                                                *
000470*----------------------------------------------------------------*
000480*
000490*---------------------   �h�r�`�o�h �J�n  -----------------------*
000500 LINKAGE SECTION.
000510     COPY ISAPICTX.
000520*
000530 PROCEDURE DIVISION WITH STDCALL LINKAGE USING ISAPI-CTX-CNT.
000540*
000550 AUTH-START.
000560*
000570*  �h�r�`�o�h�T�u���[�`���p�����^��̏�����
000580     MOVE LOW-VALUE TO COBW3.
000590     MOVE FUNCTION ADDR(ISAPI-CTX-CNT) TO COBW3-CONTEXT.
000600*---------------------   �h�r�`�o�h �I��  -----------------------*
000610*
000620*---------------------   �m�r�`�o�h �J�n  -----------------------*
000630*LINKAGE SECTION.
000640*01 SAFPT                         POINTER.
000650**
000660* PROCEDURE DIVISION USING SAFPT.
000670**
000680*AUTH-START.
000690**
000700**  �m�r�`�o�h�T�u���[�`���p�����^��̏�����
000710*    MOVE LOW-VALUE TO COBW3.
000720*    MOVE SAFPT     TO COBW3-CONTEXT.
000730*---------------------   �m�r�`�o�h �I��  -----------------------*
000740*
000750*=================================================================
000760*  �v�d�a�T�u���[�`����Ɗ������������A�v�d�a�p�����^���l������
000770*=================================================================
000780     CALL "COBW3_INIT" USING COBW3.
000790*=================================================================
000800*  �v�d�a�p�����^���烆�[�UID���擾����
000810*=================================================================
000820     MOVE "���[�UID" TO COBW3-SEARCH-DATA.
000830     CALL "COBW3_GET_VALUE_XX" USING COBW3.
000840     IF COBW3-SEARCH-FLAG-EXIST THEN
000850       MOVE 1 TO AUTHDATAFLAG
000860       MOVE COBW3-GET-DATA TO USERID
000870     ELSE
000880       MOVE ZERO TO AUTHDATAFLAG
000890     END-IF.
000900*=================================================================
000910*  �v�d�a�p�����^����p�X���[�h���擾���A���[�UID�Ƃ̑g������
000920*  �`�F�b�N����B
000930*=================================================================
000940     MOVE NC"�p�X���[�h" TO COBW3-SEARCH-DATA-N.
000950     CALL "COBW3_GET_VALUE_NX" USING COBW3.
000960     IF COBW3-SEARCH-FLAG-EXIST THEN
000970       MOVE 1 TO AUTHDATAFLAG
000980       MOVE COBW3-GET-DATA TO USERPASSWORD
000990       CALL "�ڋq���擾" USING USERINFO
001000                           RETURNING RETURNVALUE
001010     ELSE
001020       MOVE ZERO TO AUTHDATAFLAG
001030     END-IF.
001040*
001050*=================================================================
001060*  ���ʏo�͗p�y�[�W�̑I��������B�������p������ꍇ�A�Z�V������
001070*  �J�n���A�Z�V�����f�[�^��o�^����B
001080*=================================================================
001090     EVALUATE AUTHDATAFLAG ALSO RETURNVALUE
001100       *> ID/�p�X���[�h���������ꍇ
001110       WHEN   NOT ZERO     ALSO ZERO
001120*
001130         *> �Z�V�������J�n����B
001140         SET COBW3-SESSION-DATA-OBJECT TO TRUE
001150         MOVE 180 TO COBW3-SESSION-TIMEOUT
001160         CALL "COBW3_START_SESSION" USING COBW3
001170         IF COBW3-STATUS NOT = 0 THEN
001180           MOVE "SystemError.html" TO HTMLFILENAME
001190           PERFORM ��ʏo�͏���
001200           GO TO �I���ʒu
001210         END-IF
001220*
001230         *> �Z�V�����I�u�W�F�N�g(�f�[�^)�𐶐�����B
001240         INVOKE �Z�V�����I�u�W�F�N�g "NEW" RETURNING �Z�V�����n�a�i
001250         IF �Z�V�����n�a�i = NULL THEN
001260           CALL "COBW3_END_SESSION" USING COBW3
001270           MOVE "SystemError.html" TO HTMLFILENAME
001280           PERFORM ��ʏo�͏���
001290           GO TO �I���ʒu
001300         END-IF
001310*
001320         *> �Z�V�����f�[�^�̏��������s��
001330         INVOKE �Z�V�����n�a�i "����������" USING USERID �c�� RETURNING RETURNVALUE
001340         IF RETURNVALUE NOT = 0 THEN
001350           CALL "COBW3_END_SESSION" USING COBW3
001360           IF RETURNVALUE = 3 THEN
001370               MOVE "UsedError.html" TO HTMLFILENAME
001380           ELSE
001390               MOVE "SystemError.html" TO HTMLFILENAME
001400           END-IF
001410           PERFORM ��ʏo�͏���
001420           GO TO �I���ʒu
001430         END-IF
001440*
001450         *> �Z�V�����f�[�^��o�^����
001460         CALL "COBW3_SET_SESSION_DATA" USING COBW3 �Z�V�����n�a�i
001470         IF COBW3-STATUS NOT = 0 THEN
001480             INVOKE �Z�V�����n�a�i "�I������"
001490             CALL "COBW3_END_SESSION" USING COBW3
001500             MOVE "SystemError.html" TO HTMLFILENAME
001510         ELSE
001520             *> ���ʏo�͗p�y�[�W�̃f�[�^�o�^
001530             MOVE "BALANCE" TO COBW3-CNV-NAME
001540             MOVE �c�� TO DSP-MONEY
001550             MOVE DSP-MONEY TO COBW3-CNV-VALUE
001560             CALL "COBW3_SET_CNV_XX" USING COBW3
001570             MOVE "Trade.html" TO HTMLFILENAME
001580         END-IF
001590       *> ID/�p�X���[�h���������Ȃ��ꍇ
001600       WHEN   ANY          ALSO 2 THRU 3
001610         MOVE "AuthFail.html" TO HTMLFILENAME
001620       *> �G���[�̏ꍇ
001630       WHEN OTHER
001640         MOVE "SystemError.html" TO HTMLFILENAME
001650     END-EVALUATE.
001660     PERFORM ��ʏo�͏���.
001670*=================================================================
001680*  �v�d�a�T�u���[�`����Ɨ̈�̉��
001690*=================================================================
001700 �I���ʒu.
001710*
001720     *> �I�u�W�F�N�g�Q�ƍ��ڂ�NULL��ݒ肷��
001730     SET �Z�V�����n�a�i TO NULL.
001740*
001750     *> �v�d�a�T�u���[�`����Ɨ̈�̉��
001760     CALL "COBW3_FREE" USING COBW3.
001770*
001780 AUTH-END.
001790*
001800     MOVE 1 TO PROGRAM-STATUS.
001810     EXIT PROGRAM.
001820*
001830*=================================================================
001840*
001850*  ���������̒�`
001860*
001870*=================================================================
001880*
001890*=================================================================
001900* ��ʏo�͏���
001910*    ���ʏo�͗p�y�[�W�́A�A�v���P�[�V�������N�������ďo���p�y�[�W
001920*    �Ɠ����t�H���_�ɂ�����̂ƌ��Ȃ��B
001930*=================================================================
001940 ��ʏo�͏��� SECTION.
001950     MOVE SPACE TO COBW3-HTML-FILENAME.
001960     *>  �����p�X�̎擾
001970     SET COBW3-PHYSICALPATH TO TRUE.
001980     CALL "COBW3_GET_REQUEST_INFO" USING COBW3.
001990     IF COBW3-STATUS = ZERO THEN
002000         MOVE COBW3-REQUEST-INFO-LENGTH TO PATHSIZE
002010         MOVE COBW3-REQUEST-INFO(1:PATHSIZE) TO COBW3-HTML-FILENAME
002020     END-IF.
002030     *>  �t���p�X�t�@�C�����̊���
002040     ADD 1 TO PATHSIZE.
002050     MOVE "\" TO COBW3-HTML-FILENAME(PATHSIZE:1).
002060     MOVE 256 TO PATHLAST.
002070     SUBTRACT PATHSIZE FROM PATHLAST.
002080     ADD 1 TO PATHSIZE.
002090     MOVE HTMLFILENAME TO COBW3-HTML-FILENAME(PATHSIZE:PATHLAST).
002100     *> HTML�����̏o��
002110     CALL "COBW3_PUT_HTML" USING COBW3.
002120*
002130 ��ʏo�͏����I��.
002140     EXIT.
