000010*=================================================================
000020*�u�ȈՃA�v���ԒʐM�@�\���g�p�����v���O�����v
000030*    �ȈՃA�v���ԒʐM�T�[�o��̘_��������g���ăA�v���P�[�V������
000040*  �Ń��b�Z�[�W�̂��Ƃ�����܂��B
000050*
000060*=================================================================
000070*
000080*                               �ȈՃA�v���ԒʐM�T�[�o
000090*   ��SAMPLE12������������������  ��SERVER1 ��������  ��TSUUSHIN����
000100*   ��                        ��  ��              ��  ��          ��
000110*   ��                        ��  ������������������  ��          ��
000120*   ��CALL  "COBCI_WRITE"�c �����������k�c�P    �������� CALL  "  ��
000130*   ��                        ��  ������������������  ��          ��
000140*   ��CALL  "COBCI_READ" �c �����������k�c�Q    �������� CALL  "  ��
000150*   ��                        ��  ������������������  ��          ��
000160*   ��                        ��  ��              ��  ��          ��
000170*   ����������������������������  ������������������  ��������������
000180*                                                       LD: �_������
000190*
000200*    ��}�A���g�������{�v���O����
000210*
000220*     Copyright 2000-2015 FUJITSU LIMITED
000230*=================================================================
000240 IDENTIFICATION DIVISION.
000250  PROGRAM-ID. TSUUSHIN.
000260*
000270 DATA DIVISION.
000280  WORKING-STORAGE SECTION.
000290      COPY "PRM_REC.CBL".
000300*
000310  01  ���b�Z�[�W��.
000320      02  �ʐM�̈�  OCCURS 1 TO 32000 DEPENDING ON ���b�Z�[�W��.
000330          03              PIC X(1).
000340  01  ���b�Z�[�W��        PIC 9(5).
000350  01  ���M���b�Z�[�W�P    PIC X(30) VALUE "SENT MESSAGE FROM TSUUSHIN".
000360  01  ���M���b�Z�[�W�Q    PIC X(25) VALUE "SENT MESSAGE : PRIORITY=3".
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
000600**�i�Q�j���b�Z�[�W��ǂݍ��݂܂��B
000610*=================================================================
000620      MOVE "MYLD1" TO �_�����於.
000630      MOVE 32000   TO ��M�o�b�t�@�� OF ��M�p�����^.
000640      MOVE 0       TO ��M������� OF ��M�p�����^.
000645      MOVE 0       TO ���b�Z�[�W��.
000650      CALL "COBCI_READ" WITH C LINKAGE
000660           USING BY REFERENCE ��Ԓʒm��
000670                 BY VALUE     �T�[�o���ʎq
000680                 BY REFERENCE �_�����於
000690                 BY REFERENCE ��M�p�����^
000700                 BY REFERENCE ���b�Z�[�W��
000710                 BY VALUE     �ʐM�\���.
000720      IF PROGRAM-STATUS = 0 THEN
000730          DISPLAY NC"���b�Z�[�W���P���ǂݍ��݂܂����B"
000740          DISPLAY NC"�@�_�����於�@�F" �_�����於
000750          MOVE ��M���b�Z�[�W�� OF ��M�p�����^ TO ���b�Z�[�W��
000760          DISPLAY NC"�@��M���b�Z�[�W�F" ���b�Z�[�W��
000770      ELSE
000780          DISPLAY NC"���b�Z�[�W�̓ǂݍ��݂Ɏ��s���܂����B"
000790          DISPLAY NC"�@�_�����於�@�F" �_�����於
000800          DISPLAY NC"�@�G���[�R�[�h�F" �G���[�R�[�h OF ��Ԓʒm��
000810          DISPLAY NC"�@�ڍ׃R�[�h�@�F" �ڍ׃R�[�h OF ��Ԓʒm��
000820      END-IF.
000830*
000840*=================================================================
000850**�i�R�j���b�Z�[�W���������݂܂��B
000860*=================================================================
000870      MOVE 25               TO ���b�Z�[�W��.
000880      MOVE ���M���b�Z�[�W�Q TO ���b�Z�[�W��.
000890      MOVE "MYLD1"          TO �_�����於.
000900      MOVE ���b�Z�[�W��     TO ���M���b�Z�[�W�� OF ���M�p�����^.
000910      MOVE 3                TO ���M�D�揇�� OF ���M�p�����^.
000920      MOVE 0                TO ���M������� OF ���M�p�����^.
000930      CALL "COBCI_WRITE" WITH C LINKAGE
000940           USING BY REFERENCE ��Ԓʒm��
000950                 BY VALUE     �T�[�o���ʎq
000960                 BY REFERENCE �_�����於
000970                 BY REFERENCE ���M�p�����^
000980                 BY REFERENCE ���b�Z�[�W��
000990                 BY VALUE     �ʐM�\���.
001000      IF PROGRAM-STATUS = 0 THEN
001010          DISPLAY NC"���b�Z�[�W���P���������݂܂����B"
001020          DISPLAY NC"�@�_�����於�@�F" �_�����於
001030      ELSE
001040          DISPLAY NC"���b�Z�[�W�̏������݂Ɏ��s���܂����B"
001050          DISPLAY NC"�@�_�����於�@�F" �_�����於
001060          DISPLAY NC"�@�G���[�R�[�h�F" �G���[�R�[�h OF ��Ԓʒm��
001070          DISPLAY NC"�@�ڍ׃R�[�h�@�F" �ڍ׃R�[�h OF ��Ԓʒm��
001080      END-IF.
001090*
001100      MOVE 30               TO ���b�Z�[�W��.
001110      MOVE ���M���b�Z�[�W�P TO ���b�Z�[�W��.
001120      MOVE "MYLD2"          TO �_�����於.
001130      MOVE ���b�Z�[�W��     TO ���M���b�Z�[�W�� OF ���M�p�����^.
001140      MOVE 2                TO ���M�D�揇�� OF ���M�p�����^.
001150      MOVE 0                TO ���M������� OF ���M�p�����^.
001160      CALL "COBCI_WRITE" WITH C LINKAGE
001170           USING BY REFERENCE ��Ԓʒm��
001180                 BY VALUE     �T�[�o���ʎq
001190                 BY REFERENCE �_�����於
001200                 BY REFERENCE ���M�p�����^
001210                 BY REFERENCE ���b�Z�[�W��
001220                 BY VALUE     �ʐM�\���.
001230      IF PROGRAM-STATUS = 0 THEN
001240          DISPLAY NC"���b�Z�[�W���P���������݂܂����B"
001250          DISPLAY NC"�@�_�����於�@�F" �_�����於
001260      ELSE
001270          DISPLAY NC"���b�Z�[�W�̏������݂Ɏ��s���܂����B"
001280          DISPLAY NC"�@�_�����於�@�F" �_�����於
001290          DISPLAY NC"�@�G���[�R�[�h�F" �G���[�R�[�h OF ��Ԓʒm��
001300          DISPLAY NC"�@�ڍ׃R�[�h�@�F" �ڍ׃R�[�h OF ��Ԓʒm��
001310      END-IF.
001320*
001330*=================================================================
001340**�i�S�j�T�[�o��ؒf���܂��B
001350*=================================================================
001360      CALL "COBCI_CLOSE" WITH C LINKAGE
001370           USING BY REFERENCE ��Ԓʒm��
001380                 BY VALUE     �T�[�o���ʎq
001390                 BY VALUE     �ʐM�\���.
001400      IF PROGRAM-STATUS = 0 THEN
001410          DISPLAY NC"�T�[�o��ؒf���܂����B"
001420          DISPLAY NC"�@�T�[�o���@�@�F" �T�[�o��
001430      ELSE
001440          DISPLAY NC"�T�[�o�̐ؒf�Ɏ��s���܂����B"
001450          DISPLAY NC"�@�T�[�o���@�@�F" �T�[�o��
001460          DISPLAY NC"�@�G���[�R�[�h�F" �G���[�R�[�h OF ��Ԓʒm��
001470          DISPLAY NC"�@�ڍ׃R�[�h�@�F" �ڍ׃R�[�h OF ��Ԓʒm��
001480     END-IF.
001490*
001500  �����I��.
001510     EXIT PROGRAM.
001520 END PROGRAM TSUUSHIN.
