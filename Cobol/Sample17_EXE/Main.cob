000100*========================================================================
000200*�@��c���\��v���O����
000300*                                   �|�T���v���v���O�����u��c���\��v�|
000400*
000500*�@�Z�@�\
000600*
000700*�@�@�P�j��c���̗\��E�Q��
000800*�@�@�Q�j�\����̌���
000900*  �@�R�j��c���Ǘ�����
001000*
001100*�@�Z�Q�ƃN���X
001200*�@�@�P�j�\��Ǘ��N���X
001300*�@�@�Q�j��c�����Ǘ��N���X
001400*
001500*            Copyright 1999-2015 FUJITSU LIMITED
001600*========================================================================
001700 PROGRAM-ID.  ���C��.
001800 ENVIRONMENT     DIVISION.
001900 CONFIGURATION   SECTION.
002000 SPECIAL-NAMES.
002100     CONSOLE     IS CONS
002200     SYMBOLIC CONSTANT
002300     COPY R_CONST.
002400     .
002500 REPOSITORY.
002600     CLASS �\��Ǘ��N���X
002700     CLASS ��c�����Ǘ��N���X
002800      .
002900 DATA            DIVISION.
003000 BASED-STORAGE   SECTION.
003100  COPY RSVINFO.
003200 WORKING-STORAGE SECTION.
003300  01 �I������                         PIC X    IS GLOBAL.
003400  01 �{���̓��t                       PIC X(8) IS GLOBAL
003500                                              IS EXTERNAL.
003600  01 �\��Ǘ��I�u�W�F�N�g             OBJECT REFERENCE �\��Ǘ��N���X.
003700 PROCEDURE       DIVISION.
003800*
003900* �{���̓��t�̎擾�Ɨ\��f�[�^�^��c���f�[�^�̕���
004000*
004100     MOVE  FUNCTION CURRENT-DATE  TO  �{���̓��t
004200     DISPLAY "������c���f�[�^�̕������ł��E�E�B���΂炭���҂����������B����"
004300     PERFORM  ��c���f�[�^�̕���
004400     DISPLAY "�����\��f�[�^�̕������ł��E�E�E�B���΂炭���҂����������B����"
004500     PERFORM  �\��f�[�^�̕���
004600     .
004700*
004800* �����I��
004900*
005000 �������.
005100     DISPLAY "----------------------------------------------------------------------"
005200     DISPLAY "<<  ��c���\��v���O����  >>"
005300     DISPLAY "  �@�P�D�\��E�Q��"
005400     DISPLAY "�@�@�Q�D����"
005500     DISPLAY "    �R�D��c���Ǘ�"
005600     DISPLAY "    �w�D�I��"
005700     DISPLAY "������I�����ĉ������B( 1 or 2 or 3 or X) => " WITH NO ADVANCING
005800     ACCEPT  �I������  FROM  CONS
005900*
006000     EVALUATE  �I������
006100     WHEN "1"
006200       CALL  "�\��Q�Ə���"
006300     WHEN "2"
006400       CALL  "��������"
006500     WHEN "3"
006600       CALL  "��c���Ǘ�����"
006700       DISPLAY  "������c���f�[�^�̕ۑ����E���f���ł��B���΂炭���҂����������B����"
006800       PERFORM   ��c���f�[�^�̕ۑ�
006900     WHEN "X"
007000       DISPLAY  "�����\��f�[�^��ۑ����Ă��܂��B����"
007100       PERFORM   �\��f�[�^�̕ۑ�
007200       EXIT PROGRAM
007300     WHEN OTHER
007400       GO TO  �������
007500     END-EVALUATE
007600     GO TO  �������
007700     .
007800 ��c���f�[�^�̕���.
007900     MOVE  ��c���V�[�g           TO  �I������
008000     CALL  "�f�[�^�̕���"  USING BY CONTENT �I������
008100     .
008200*
008300 �\��f�[�^�̕���.
008400     MOVE  �\��V�[�g             TO  �I������
008500     CALL  "�f�[�^�̕���"  USING BY CONTENT �I������
008600     .
008700 ��c���f�[�^�̕ۑ�.
008800     MOVE  ��c���V�[�g           TO  �I������
008900     CALL  "�f�[�^�̕ۑ�"  USING BY CONTENT �I������
009000     MOVE  �\��V�[�g             TO  �I������
009100     PERFORM �\��f�[�^�̕ۑ�
009200     INVOKE  �\��Ǘ��N���X           "NEW"
009300                                      RETURNING        �\��Ǘ��I�u�W�F�N�g
009400     INVOKE  �\��Ǘ��I�u�W�F�N�g     "�\���ԃI�u�W�F�N�g�̍폜"
009500     PERFORM �\��f�[�^�̕���
009600     .
009700 �\��f�[�^�̕ۑ�.
009800     MOVE  �\��V�[�g             TO  �I������
009900     CALL  "�f�[�^�̕ۑ�"  USING BY CONTENT �I������
010000     .
010100*========================================================================
010200*�@�\��Q�Ə���
010300*
010400*�@�Z���́F�Ȃ�
010500*�@�Z�o�́F�Ȃ�
010600*========================================================================
010700 IDENTIFICATION  DIVISION.
010800 PROGRAM-ID.  �\��Q�Ə���.
010900 DATA            DIVISION.
011000 BASED-STORAGE   SECTION.
011100  COPY RSVINFO.
011200  COPY ROOMINFO.
011300 WORKING-STORAGE SECTION.
011400  01 �\��Ǘ��I�u�W�F�N�g             OBJECT REFERENCE �\��Ǘ��N���X.
011500  01 �\��f�[�^                       TYPE �\�񃊃X�g.
011600  01 ��c���f�[�^                     TYPE ��c���d�l.
011700  01 ���t                             PIC X(8).
011800  01 �����R�[�h                       PIC S9(8) BINARY.
011900 PROCEDURE       DIVISION.
012000*
012100* ���t�w��
012200*
012300 ���t�w����.
012400     MOVE    LOW-VALUE            TO  �\��f�[�^
012500     MOVE    LOW-VALUE            TO  ��c���f�[�^
012600     DISPLAY "----------------------------------------------------------------------"
012700     DISPLAY "�\��E�Q�Ƃ�����t����͂��Ă��������B"
012800     DISPLAY "(8�������œ���: ��.1999�N3��18�� => 19990318�Ɠ���) "
012900     DISPLAY "�@�\����@�@�F�@" WITH NO ADVANCING
013000     ACCEPT ���t  FROM  CONS
013100     IF ���t < �{���̓��t THEN
013200       DISPLAY "�@+++ �ߋ��̓��t�͎󂯕t�����܂���B+++"
013300       GO TO ���t�w����
013400     END-IF
013500     MOVE  ���t                   TO  �\��� OF �\��f�[�^
013600*
013700* �w����̗\��󋵕\��
013800*
013900     INVOKE  �\��Ǘ��N���X "NEW"     RETURNING  �\��Ǘ��I�u�W�F�N�g
014000     INVOKE  �\��Ǘ��I�u�W�F�N�g     "�\��󋵂̈ꗗ�\��"
014100                                      USING BY CONTENT �\��� OF �\��f�[�^
014200     .
014300*
014400* ��c���Ǝ��Ԙg�w��
014500*
014600  ��c���w����.    
014700     DISPLAY "----------------------------------------------------------------------"
014800     DISPLAY "�\��E�Q�Ƃ����c�����Ǝ��Ԙg����͂��ĉ������B"
014900     DISPLAY "�@��c�����@�i4���p����: ��. D101�j�F�@" WITH NO ADVANCING
015000     ACCEPT     ��c����  OF �\��f�[�^ FROM CONS
015100     DISPLAY "�@���Ԙg�@�@�i'AM' or 'PM'�j�@�@�@ �F�@" WITH NO ADVANCING
015200     ACCEPT     ���Ԙg    OF �\��f�[�^ FROM CONS
015300*
015400* �\��E�Q��
015500*
015600     INVOKE  �\��Ǘ��I�u�W�F�N�g     "�\��"
015700                                      USING            �\��f�[�^
015800                                                       ��c���f�[�^
015900                                      RETURNING        �����R�[�h
016000*
016100* �����R�[�h�ɂ���āA������؂蕪����
016200*
016300     EVALUATE �����R�[�h
016400     WHEN  �\��|����
016500       CALL    "�\��f�[�^�\��"   USING BY CONTENT �\��f�[�^
016600       CALL    "��c���f�[�^�\��" USING BY CONTENT ��c���f�[�^
016700       DISPLAY  "�L�����Z������Ȃ�'C'���A�I������Ȃ�Enter����͂��ĉ������B=> "
016800                WITH NO ADVANCING
016900       ACCEPT   �I������  FROM CONS
017000       IF  �I������ = 'C' THEN
017100         INVOKE  �\��Ǘ��I�u�W�F�N�g "�\����"
017200                                      USING BY CONTENT �\��f�[�^
017300       END-IF  
017400     WHEN  �\��|�V�K
017500       DISPLAY "----------------------------------------------------------------------"
017600       DISPLAY  "�\��ł��܂����B�\��ԍ��̓L�����Z�����ɕK�v�ɂȂ�܂��̂ōT���Ă��� "
017700       DISPLAY  "���������B"
017800       DISPLAY  "*** �\��ԍ� *** : "   �\��ԍ�   OF �\��f�[�^
017900       CALL     "�\��f�[�^�\��"  USING BY CONTENT �\��f�[�^
018000     WHEN  �\��|����
018100       CALL     "�\��f�[�^�\��"  USING BY CONTENT �\��f�[�^
018200     END-EVALUATE
018300
018400     PERFORM �m�F���.
018500     GO TO ���t�w����.
018600     .
018700 �m�F���.
018800     DISPLAY "�\��E�Q�Ƃ��I������Ȃ�'X'���A������Ȃ�Enter����͂��ĉ������B=> "
018900             WITH NO ADVANCING
019000     ACCEPT  �I������  FROM  CONS
019100     IF �I������ = "X" THEN
019200       EXIT PROGRAM
019300     END-IF
019400     .
019500 END PROGRAM �\��Q�Ə���.   
019600*========================================================================
019700*�@��������
019800*
019900*�@�Z���́F�Ȃ�
020000*�@�Z�o�́F�Ȃ�
020100*========================================================================
020200 IDENTIFICATION  DIVISION.
020300 PROGRAM-ID.  ��������.
020400 DATA            DIVISION.
020500 BASED-STORAGE   SECTION.
020600  COPY RSVINFO.
020700 WORKING-STORAGE SECTION.
020800  01 �\��Ǘ��I�u�W�F�N�g             OBJECT REFERENCE �\��Ǘ��N���X.
020900  01 ���O                             PIC X(20).
021000  01 �\����f�[�^.
021100    02 �\���                       PIC 9(8) BINARY.
021200    02 �\��f�[�^                     TYPE �\�񃊃X�g OCCURS RSV-MAX.
021300  01 �J�E���^                         PIC S9(4) BINARY.
021400 PROCEDURE       DIVISION.
021500*
021600* ���O�w��
021700*
021800 ���O�w����.
021900     MOVE    LOW-VALUE            TO  �\����f�[�^
022000     DISPLAY "----------------------------------------------------------------------"
022100     DISPLAY " <<  �\��ҏ�񌟍�  >>"
022200     DISPLAY "�\�񂵂����O�ŗ\������������܂��B�\��Җ�����͂��ĉ������B"
022300     DISPLAY "�@�\��Җ��i10�����܂ŁF��.�x�m�ʑ��Y)�@�F�@" WITH NO ADVANCING
022400     ACCEPT ���O  FROM  CONS
022500*
022600* �\���񌟍�
022700*
022800     INVOKE  �\��Ǘ��N���X "NEW"     RETURNING        �\��Ǘ��I�u�W�F�N�g
022900     INVOKE  �\��Ǘ��I�u�W�F�N�g     "�\����̌���"
023000                                      USING BY CONTENT ���O
023100                                      RETURNING        �\����f�[�^
023200*
023300* �\����\��
023400*
023500     PERFORM TEST BEFORE VARYING �J�E���^ FROM 1 BY 1 
023600                                           UNTIL �J�E���^ > �\���
023700       CALL "�\��f�[�^�\��"  USING BY CONTENT �\��f�[�^(�J�E���^)
023800     END-PERFORM
023900     .
024000 �m�F���.
024100     DISPLAY "�����������I������Ȃ�'X'���A������Ȃ�Enter����͂��ĉ������B=> "
024200             WITH NO ADVANCING
024300     ACCEPT  �I������  FROM  CONS
024400     IF �I������ = "X" THEN
024500       EXIT PROGRAM
024600     END-IF
024700     GO TO   ���O�w����.
024800 END PROGRAM ��������.
024900*========================================================================
025000*�@��c���Ǘ�����
025100*
025200*�@�Z���́F�Ȃ�
025300*�@�Z�o�́F�Ȃ�
025400*========================================================================
025500 IDENTIFICATION  DIVISION.
025600 PROGRAM-ID.  ��c���Ǘ�����.
025700 DATA            DIVISION.
025800 BASED-STORAGE   SECTION.
025900     COPY ROOMINFO.
026000 WORKING-STORAGE SECTION.
026100  01 ��c���Ǘ��I�u�W�F�N�g           OBJECT REFERENCE ��c�����Ǘ��N���X.
026200  01 ��c���f�[�^                     TYPE ��c���d�l.
026300  01 �����R�[�h                       PIC S9(8) BINARY.
026400 PROCEDURE       DIVISION.
026500     INVOKE ��c�����Ǘ��N���X  "NEW"  
026600                                      RETURNING ��c���Ǘ��I�u�W�F�N�g
026700     .
026800*
026900* ��c���d�l�̈ꗗ�\��
027000*
027100 ��c���ꗗ���.
027200     INVOKE  ��c���Ǘ��I�u�W�F�N�g   "��c�����̈ꗗ�\��"
027300     .
027400*
027500* ��c���I��
027600*
027700     MOVE    LOW-VALUE            TO  ��c���f�[�^
027800     DISPLAY "<<  ��c���Ǘ�  >>"
027900     DISPLAY "�w�肳�ꂽ��c���̒ǉ��E�X�V�E�폜���s���܂��B��c������͂��Ă��������B"
028000     DISPLAY "�@��c�����i�p����4���F��.D101�j�F�@" WITH NO ADVANCING
028100     ACCEPT  ��c���� OF ��c���f�[�^  FROM CONS.
028200*
028300     INVOKE  ��c���Ǘ��I�u�W�F�N�g   "�d�l���̎Q��"
028400                                      USING            ��c���f�[�^
028500                                      RETURNING        �����R�[�h
028600     .
028700*
028800* �w�肵����c�������ɓo�^����Ă���ꍇ�A�X�V�E�폜�̂����ꂩ�̏������s���B
028900* �o�^����Ă��Ȃ��ꍇ�́A�ǉ��������s���B
029000*
029100 �X�V�폜�w����.
029200     IF �����R�[�h < 0 THEN
029300       DISPLAY "----------------------------------------------------------------------"
029400       DISPLAY  "���̉�c���͖��o�^�ł��B"
029500       DISPLAY  "�V�K�ɓo�^����Ȃ�'Y'���A�I������Ȃ�Enter����͂��ĉ������B=> "
029600                WITH NO ADVANCING
029700       ACCEPT   �I������ FROM CONS
029800       IF �I������ = "Y" THEN
029900         PERFORM  ��c�����ǉ�
030000       END-IF
030100     ELSE
030200       DISPLAY "----------------------------------------------------------------------"
030300       DISPLAY "���̉�c���͊��ɓo�^����Ă��܂��B"
030400       DISPLAY "�f�[�^���X�V����Ȃ�'R'���A�폜����Ȃ�'D'���A���~����Ȃ�Enter�����"
030500       DISPLAY "���ĉ������B=> " WITH NO ADVANCING
030600       ACCEPT  �I������  FROM CONS
030700       EVALUATE �I������
030800       WHEN "R"
030900         PERFORM ��c�����X�V
031000       WHEN "D"
031100         PERFORM ��c�����폜
031200       WHEN OTHER
031300         CONTINUE
031400       END-EVALUATE
031500     END-IF
031600     .
031700 �m�F���.
031800     DISPLAY "��c���Ǘ��������I������Ȃ�'X'���A������Ȃ�Enter����͂��ĉ������B=> "
031900             WITH NO ADVANCING
032000     ACCEPT  �I������  FROM  CONS
032100     IF �I������ = "X" THEN
032200       EXIT PROGRAM
032300     END-IF
032400     GO TO  ��c���ꗗ���
032500     .
032600 ��c�����X�V.
032700     DISPLAY "----------------------------------------------------------------------"
032800     CALL    "��c���f�[�^�\��"       USING BY CONTENT ��c���f�[�^
032900     DISPLAY "�ύX��̃f�[�^����͂��ĉ������B"
033000     DISPLAY "�@������@�i����2���F��.10 �j�@�@�@�@�@�F�@" WITH NO ADVANCING
033100     ACCEPT   ���   OF ��c���f�[�^  FROM CONS
033200     DISPLAY "�@�����ԍ��i����9���܂ŁF��.1234-5678�j�F�@" WITH NO ADVANCING
033300     ACCEPT   ����   OF ��c���f�[�^  FROM CONS
033400     DISPLAY "�@��ʁ@�@�i�e���r��c���Ȃ�'T'�A��ʉ�c���Ȃ�'N'�j�F�@" WITH NO ADVANCING
033500     ACCEPT   ���   OF ��c���f�[�^  FROM CONS
033600     INVOKE   ��c���Ǘ��I�u�W�F�N�g  "�d�l���̍X�V"
033700                                      USING BY CONTENT ��c���f�[�^
033800                                      RETURNING        �����R�[�h
033900     IF �����R�[�h < 0 THEN
034000       DISPLAY  "�@+++ ��c���̍X�V�Ɏ��s���܂��� +++"
034100     ELSE
034200       DISPLAY "< �ύX��̉�c����� >"
034300       CALL    "��c���f�[�^�\��"    USING BY CONTENT ��c���f�[�^
034400     END-IF 
034500    .
034600 ��c�����폜.
034700     INVOKE  ��c���Ǘ��I�u�W�F�N�g   "�d�l���̍폜"
034800                                      USING BY CONTENT ��c���f�[�^
034900                                      RETURNING        �����R�[�h
035000     IF �����R�[�h < 0 THEN
035100       DISPLAY "�@+++ ��c���̍폜�Ɏ��s���܂��� +++"
035200     END-IF
035300     .
035400 ��c�����ǉ�.
035500     DISPLAY "----------------------------------------------------------------------"
035600     DISPLAY "< ��c�����̒ǉ� >"
035700     DISPLAY "�@������@�i����2���F��.10 �j�@�@�@�@�@�F�@" WITH NO ADVANCING
035800     ACCEPT   ���   OF ��c���f�[�^  FROM CONS
035900     DISPLAY "�@�����ԍ��i����9���܂ŁF��.1234-5678�j�F�@" WITH NO ADVANCING
036000     ACCEPT   ����   OF ��c���f�[�^  FROM CONS
036100     DISPLAY "�@��ʁ@�@�i�e���r��c���Ȃ�'T'�A��ʉ�c���Ȃ�'N'�j�F�@" WITH NO ADVANCING
036200     ACCEPT   ���   OF ��c���f�[�^  FROM CONS
036300     CALL    "��c���f�[�^�\��"       USING BY CONTENT ��c���f�[�^
036400     DISPLAY "��L�̏���o�^����Ȃ�'Y'���A���~����Ȃ�Enter����͂��ĉ������B=> "
036500             WITH NO ADVANCING
036600     ACCEPT  �I������                 FROM CONS
036700     IF �I������ = "Y" THEN
036800       INVOKE  ��c���Ǘ��I�u�W�F�N�g "�d�l���̒ǉ�"
036900                                      USING BY CONTENT ��c���f�[�^
037000     END-IF
037100    .
037200 END PROGRAM ��c���Ǘ�����.
037300*========================================================================
037400*�@�\��f�[�^�\��
037500*
037600*�@�Z���́F�\��f�[�^ (TYPE �\�񃊃X�g)
037700*�@�Z�o�́F�Ȃ�
037800*========================================================================
037900 IDENTIFICATION  DIVISION.
038000 PROGRAM-ID.  �\��f�[�^�\�� IS COMMON.
038100 DATA            DIVISION.
038200 BASED-STORAGE   SECTION.
038300     COPY RSVINFO.
038400 WORKING-STORAGE SECTION.
038500  01 �\��f�[�^�|�\���p.
038600    02                                PIC X(1).
038700    02  �v�|�\���                    PIC X(8).
038800    02                                PIC X(2).
038900    02  �v�|��c����                  PIC X(4).
039000    02                                PIC X(5).
039100    02  �v�|���Ԙg                    PIC X(6).
039200    02                                PIC X(3).
039300    02  �v�|�\��Җ�                  PIC X(20).
039400    02                                PIC X(2).
039500    02  �v�|����                      PIC X(9).
039600    02                                PIC X(3).
039700    02  �v�|����                      PIC X(20).
039800 LINKAGE         SECTION.
039900  01 �k�|�\��f�[�^                   TYPE �\�񃊃X�g.
040000 PROCEDURE       DIVISION
040100                    USING             �k�|�\��f�[�^.
040200     MOVE  SPACE                  TO  �\��f�[�^�|�\���p
040300     DISPLAY "========================================================================="
040400     DISPLAY "-���t------��c��---���Ԙg---�\��Җ�--------------����--------����------"
040500     MOVE  �\���    OF �k�|�\��f�[�^    TO  �v�|�\���
040600     MOVE  ��c����  OF �k�|�\��f�[�^    TO  �v�|��c����
040700     MOVE  ���Ԙg    OF �k�|�\��f�[�^    TO  �v�|���Ԙg
040800     MOVE  �\��Җ�  OF �k�|�\��f�[�^    TO  �v�|�\��Җ�
040900     MOVE  ����      OF �k�|�\��f�[�^    TO  �v�|����
041000     MOVE  ����      OF �k�|�\��f�[�^    TO  �v�|����
041100     DISPLAY �\��f�[�^�|�\���p.
041200     DISPLAY "========================================================================="
041300 END PROGRAM �\��f�[�^�\��.
041400*========================================================================
041500*�@��c���f�[�^�\��
041600*
041700*�@�Z���́F��c���f�[�^ (TYPE ��c���d�l)
041800*�@�Z�o�́F�Ȃ�
041900*========================================================================
042000 IDENTIFICATION  DIVISION.
042100 PROGRAM-ID.  ��c���f�[�^�\�� IS COMMON.
042200 DATA            DIVISION.
042300 BASED-STORAGE   SECTION.
042400     COPY ROOMINFO.
042500 WORKING-STORAGE SECTION.
042600  01 ��c���f�[�^�|�\���p.
042700    02                                PIC X(1).
042800    02  �v�|��c����                  PIC X(4).
042900    02                                PIC X(7).
043000    02  �v�|���                      PIC X(3).
043100    02                                PIC X(4).
043200    02  �v�|����                      PIC X(9).
043300    02                                PIC X(2).
043400    02  �v�|���                      PIC N(10).
043500 LINKAGE         SECTION.
043600  01 �k�|��c���f�[�^                 TYPE ��c���d�l.
043700 PROCEDURE       DIVISION
043800                    USING             �k�|��c���f�[�^.
043900     MOVE  SPACE                  TO  ��c���f�[�^�|�\���p
044000     DISPLAY "=============================================="
044100     DISPLAY "-��c����---���---����-------���------------"
044200     MOVE  ��c����  OF �k�|��c���f�[�^    TO  �v�|��c����
044300     MOVE  ���      OF �k�|��c���f�[�^    TO  �v�|���
044400     MOVE  ����      OF �k�|��c���f�[�^    TO  �v�|����
044500     EVALUATE   ��� OF �k�|��c���f�[�^
044600     WHEN  "N"
044700       MOVE  NC"��ʉ�c��"       TO  �v�|���
044800     WHEN  "T"
044900       MOVE  NC"�e���r��c��"     TO  �v�|���
045000     END-EVALUATE
045100     DISPLAY ��c���f�[�^�|�\���p.
045200     DISPLAY "=============================================="
045300 END PROGRAM ��c���f�[�^�\��.
045400 END PROGRAM ���C��.
