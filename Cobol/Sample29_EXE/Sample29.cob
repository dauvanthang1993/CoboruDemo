000010*=================================================================
000020*�u�ȈՃA�v���ԒʐM�@�\���g�p�����v���O�����v
000030*    �ȈՃA�v���ԒʐM�T�[�o��̘_��������g���ăA�v���P�[�V������
000040*  �Ń��b�Z�[�W�̂��Ƃ�����܂��B
000050*
000060*=================================================================
000070*
000080*                  �ȈՃA�v���ԒʐM�T�[�o
000090*   ��SAMPLE29����  ��SERVER1 ��������  ��TSUUSHIN����������������
000100*   ��          ��  ��              ��  ��                      ��
000110*   ��          ��  ������������������  ��                      ��
000120*   ��          ���������k�c�P    �������� CALL  "COBCI_WRITE"�c��
000130*   ��          ��  ������������������  ��                      ��
000140*   ��          ���������k�c�Q    �������� CALL  "COBCI_READ" �c��
000150*   ��          ��  ������������������  ��                      ��
000160*   ��          ��  ��              ��  ��                      ��
000170*   ��������������  ������������������  ��������������������������
000180*                                                       LD: �_������
000190*
000200*    ��}�A���g�������{�v���O����
000210*
000220*     Copyright 2000-2015 FUJITSU LIMITED
000230*=================================================================
000240 IDENTIFICATION DIVISION.
000250  PROGRAM-ID. SAMPLE29.
000260*
000270 DATA DIVISION.
000280  WORKING-STORAGE SECTION.
000290      COPY "PRM_REC.CBL".
000300*
000310  01  ���b�Z�[�W��.
000320      02  �ʐM�̈�  OCCURS 1 TO 32000 DEPENDING ON ���b�Z�[�W��.
000330          03              PIC X(1).
000340  01  ���b�Z�[�W��        PIC 9(5).
000350  01  ���M���b�Z�[�W�P    PIC X(26) VALUE "SENT MESSAGE FROM SAMPLE29".
000360  01  ���M���b�Z�[�W�Q    PIC X(25) VALUE "SENT MESSAGE : PRIORITY=5".
000370*
000380 PROCEDURE DIVISION.
000390*=================================================================
000400**�i�P�j�T�[�o�Ɛڑ����܂��B
000410*=================================================================
000420      MOVE "SERVER1" TO �T�[�o��.
000430      CALL "COBCI_OPEN" WITH C LINKAGE
000440           USING BY REFERENCE ��Ԓʒm��
000450                 BY REFERENCE �T�[�o��
000460                 BY REFERENCE �T�[�o���ʎq
000470                 BY VALUE     �ʐM�\���.
000480      IF PROGRAM-STATUS = 0 THEN
000490          DISPLAY NC"�T�[�o�Ɛڑ����܂����B"
000500          DISPLAY NC"�@�T�[�o���@�@�F" �T�[�o��
000510      ELSE
000520          DISPLAY NC"�T�[�o�Ƃ̐ڑ��Ɏ��s���܂����B"
000530          DISPLAY NC"�@�T�[�o���@�@�F" �T�[�o��
000540          DISPLAY NC"�@�G���[�R�[�h�F" �G���[�R�[�h OF ��Ԓʒm��
000550          DISPLAY NC"�@�ڍ׃R�[�h�@�F" �ڍ׃R�[�h OF ��Ԓʒm��
000560          GO TO �����I��
000570      END-IF.
000580*
000590*=================================================================
000600**�i�Q�j���b�Z�[�W���������݂܂��B
000610*=================================================================
000620      MOVE 26               TO ���b�Z�[�W��.
000630      MOVE ���M���b�Z�[�W�P TO ���b�Z�[�W��.
000640      MOVE "MYLD1"          TO �_�����於.
000650      MOVE ���b�Z�[�W��     TO ���M���b�Z�[�W�� OF ���M�p�����^.
000660      MOVE 1                TO ���M�D�揇�� OF ���M�p�����^.
000670      MOVE 0                TO ���M������� OF ���M�p�����^.
000680      CALL "COBCI_WRITE" WITH C LINKAGE
000690           USING BY REFERENCE ��Ԓʒm��
000700                 BY VALUE     �T�[�o���ʎq
000710                 BY REFERENCE �_�����於
000720                 BY REFERENCE ���M�p�����^
000730                 BY REFERENCE ���b�Z�[�W��
000740                 BY VALUE     �ʐM�\���.
000750      IF PROGRAM-STATUS = 0 THEN
000760          DISPLAY NC"���b�Z�[�W���P���������݂܂����B"
000770          DISPLAY NC"�@�_�����於�@�F" �_�����於
000780      ELSE
000790          DISPLAY NC"���b�Z�[�W�̏������݂Ɏ��s���܂����B"
000800          DISPLAY NC"�@�_�����於�@�F" �_�����於
000810          DISPLAY NC"�@�G���[�R�[�h�F" �G���[�R�[�h OF ��Ԓʒm��
000820          DISPLAY NC"�@�ڍ׃R�[�h�@�F" �ڍ׃R�[�h OF ��Ԓʒm��
000830      END-IF.
000840*
000850      MOVE 25               TO ���b�Z�[�W��.
000860      MOVE ���M���b�Z�[�W�Q TO ���b�Z�[�W��.
000870      MOVE "MYLD1"          TO �_�����於.
000880      MOVE ���b�Z�[�W��     TO ���M���b�Z�[�W�� OF ���M�p�����^.
000890      MOVE 5                TO ���M�D�揇�� OF ���M�p�����^.
000900      MOVE 0                TO ���M������� OF ���M�p�����^.
000910      CALL "COBCI_WRITE" WITH C LINKAGE
000920           USING BY REFERENCE ��Ԓʒm��
000930                 BY VALUE     �T�[�o���ʎq
000940                 BY REFERENCE �_�����於
000950                 BY REFERENCE ���M�p�����^
000960                 BY REFERENCE ���b�Z�[�W��
000970                 BY VALUE     �ʐM�\���.
000980      IF PROGRAM-STATUS = 0 THEN
000990          DISPLAY NC"���b�Z�[�W���P���������݂܂����B"
001000          DISPLAY NC"�@�_�����於�@�F" �_�����於
001010      ELSE
001020          DISPLAY NC"���b�Z�[�W�̏������݂Ɏ��s���܂����B"
001030          DISPLAY NC"�@�_�����於�@�F" �_�����於
001040          DISPLAY NC"�@�G���[�R�[�h�F" �G���[�R�[�h OF ��Ԓʒm��
001050          DISPLAY NC"�@�ڍ׃R�[�h�@�F" �ڍ׃R�[�h OF ��Ԓʒm��
001060      END-IF.
001070      DISPLAY "***TSUUSHIN.EXE���N�����Ă�������***"
001080*
001090*=================================================================
001100**�i�R�j���b�Z�[�W��ǂݍ��݂܂��i�Ď����ԁ��U�O�b�j�B
001110*=================================================================
001120      MOVE "MYLD2" TO �_�����於.
001130      MOVE 32000   TO ��M�o�b�t�@�� OF ��M�p�����^.
001140      MOVE 1       TO ��M������� OF ��M�p�����^.
001150      MOVE 60      TO ��M�Ď����� OF ��M�p�����^.
001160      CALL "COBCI_READ" WITH C LINKAGE
001170           USING BY REFERENCE ��Ԓʒm��
001180                 BY VALUE     �T�[�o���ʎq
001190                 BY REFERENCE �_�����於
001200                 BY REFERENCE ��M�p�����^
001210                 BY REFERENCE ���b�Z�[�W��
001220                 BY VALUE     �ʐM�\���.
001230      IF PROGRAM-STATUS = 0 THEN
001240          DISPLAY NC"���b�Z�[�W���P���ǂݍ��݂܂����B"
001250          DISPLAY NC"�@�_�����於�@�F" �_�����於
001260          MOVE ��M���b�Z�[�W�� OF ��M�p�����^ TO ���b�Z�[�W��
001270          DISPLAY NC"�@��M���b�Z�[�W�F" ���b�Z�[�W��
001280      ELSE
001290          DISPLAY NC"���b�Z�[�W�̓ǂݍ��݂Ɏ��s���܂����B"
001300          DISPLAY NC"�@�_�����於�@�F" �_�����於
001310          DISPLAY NC"�@�G���[�R�[�h�F" �G���[�R�[�h OF ��Ԓʒm��
001320          DISPLAY NC"�@�ڍ׃R�[�h�@�F" �ڍ׃R�[�h OF ��Ԓʒm��
001330      END-IF.
001340*
001350      MOVE "MYLD1" TO �_�����於.
001360      MOVE 32000   TO ��M�o�b�t�@�� OF ��M�p�����^.
001370      MOVE 1       TO ��M������� OF ��M�p�����^.
001380      MOVE 10      TO ��M�Ď����� OF ��M�p�����^.
001390      CALL "COBCI_READ" WITH C LINKAGE
001400           USING BY REFERENCE ��Ԓʒm��
001410                 BY VALUE     �T�[�o���ʎq
001420                 BY REFERENCE �_�����於
001430                 BY REFERENCE ��M�p�����^
001440                 BY REFERENCE ���b�Z�[�W��
001450                 BY VALUE     �ʐM�\���.
001460      IF PROGRAM-STATUS = 0
001470          DISPLAY NC"���b�Z�[�W���P���ǂݍ��݂܂����B"
001480          DISPLAY NC"�@�_�����於�@�F" �_�����於
001490          MOVE ��M���b�Z�[�W�� OF ��M�p�����^ TO ���b�Z�[�W��
001500          DISPLAY NC"�@��M���b�Z�[�W�F" ���b�Z�[�W��
001510      ELSE
001520          DISPLAY NC"���b�Z�[�W�̓ǂݍ��݂Ɏ��s���܂����B"
001530          DISPLAY NC"�@�_�����於�@�F" �_�����於
001540          DISPLAY NC"�@�G���[�R�[�h�F" �G���[�R�[�h OF ��Ԓʒm��
001550          DISPLAY NC"�@�ڍ׃R�[�h�@�F" �ڍ׃R�[�h OF ��Ԓʒm��
001560      END-IF.
001570*
001580      CALL "COBCI_READ" WITH C LINKAGE
001590           USING BY REFERENCE ��Ԓʒm��
001600                 BY VALUE     �T�[�o���ʎq
001610                 BY REFERENCE �_�����於
001620                 BY REFERENCE ��M�p�����^
001630                 BY REFERENCE ���b�Z�[�W��
001640                 BY VALUE     �ʐM�\���.
001650      IF PROGRAM-STATUS = 0 THEN
001660          DISPLAY NC"���b�Z�[�W���P���ǂݍ��݂܂����B"
001670          DISPLAY NC"�@�_�����於�@�F" �_�����於
001680          MOVE ��M���b�Z�[�W�� OF ��M�p�����^ TO ���b�Z�[�W��
001690          DISPLAY NC"�@��M���b�Z�[�W�F" ���b�Z�[�W��
001700      ELSE
001710          DISPLAY NC"���b�Z�[�W�̓ǂݍ��݂Ɏ��s���܂����B"
001720          DISPLAY NC"�@�_�����於�@�F" �_�����於
001730          DISPLAY NC"�@�G���[�R�[�h�F" �G���[�R�[�h OF ��Ԓʒm��
001740          DISPLAY NC"�@�ڍ׃R�[�h�@�F" �ڍ׃R�[�h OF ��Ԓʒm��
001750      END-IF.
001760*=================================================================
001770**�i�S�j�T�[�o��ؒf���܂��B
001780*=================================================================
001790      CALL "COBCI_CLOSE" WITH C LINKAGE
001800           USING BY REFERENCE ��Ԓʒm��
001810                 BY VALUE     �T�[�o���ʎq
001820                 BY VALUE     �ʐM�\���.
001830      IF PROGRAM-STATUS = 0 THEN
001840          DISPLAY NC"�T�[�o��ؒf���܂����B"
001850          DISPLAY NC"�@�T�[�o���@�@�F" �T�[�o��
001860      ELSE
001870          DISPLAY NC"�T�[�o�̐ؒf�Ɏ��s���܂����B"
001880          DISPLAY NC"�@�T�[�o���@�@�F" �T�[�o��
001890          DISPLAY NC"�@�G���[�R�[�h�F" �G���[�R�[�h OF ��Ԓʒm��
001900          DISPLAY NC"�@�ڍ׃R�[�h�@�F" �ڍ׃R�[�h OF ��Ԓʒm��
001910      END-IF.
001920  �����I��.
001930     EXIT PROGRAM.
001940 END PROGRAM SAMPLE29.
