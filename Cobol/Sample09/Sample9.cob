000100* Copyright 1992-2015 FUJITSU LIMITED
000200 IDENTIFICATION           DIVISION.
000300 PROGRAM-ID.              SAMPLE9.
000400*�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|*
000500*�y����T���v���ł��������鍀�ڊT�v�z�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
000600*�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
000700*�@�P�D�e�b�a���g�p�����U�k�o�h�^�W�k�o�h�ł̒��[�T���v������B�@�@�@�@�@�@�@�@�@�@�@*
000800*�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
000900*�@�@���`�S�p�����������Ɏg�p���A�P�y�[�W�S�Ă̍s�Ԋu���U�k�o�h�Ƃ����ꍇ�̒��[���C�@*
001000*�@�@�@���[�W���A�U�k�o�h�^�P�O�b�o�h�t�H�[�}�b�g�̃X�؁[�V���O�`���[�g�`���̃t�H�[�@*
001100*�@�@�@���I�[�o���C�Əd�������܂��B�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
001200*�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
001300*�@�@���`�S�p�����������Ɏg�p���A�P�y�[�W�S�Ă̍s�Ԋu���W�k�o�h�Ƃ����ꍇ�̒��[���C�@*
001400*�@�@�@���[�W���A�W�k�o�h�^�P�O�b�o�h�t�H�[�}�b�g�̃X�؁[�V���O�`���[�g�`���̃t�H�[�@*
001500*�@�@�@���I�[�o���C�Əd�������܂��B�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
001600*�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
001700*�@�Q�D�b�g�`�q�`�b�s�d�q�@�s�x�o�d��Ŏw�肷��l�X�ȕ��������̃T���v�����O����B�@�@*
001800*�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
001900*�@�@�������镶���T�C�Y���g�p��������@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
002000*�@�@�@�P�����ÂR�|�A�V�D�Q�|�A�X�|�A�P�Q�|�A�P�W�|�A�Q�S�|�A�R�U�|�A�T�O�|�A�@�@�@*
002100*�@�@�@�V�Q�|�A�P�O�O�|�A�Q�O�O�|�A�R�O�O�|�̕����T�C�Y���w�肵�܂��B�@�@�@�@�@�@�@�@*
002200*�@�@�@�������ł́A�����s�b�`�w����ȗ����A�����T�C�Y�ɍ��킹���œK�ȕ����s�b�`���@�@*
002300*�@�@�@�@�b�n�a�n�k�����^�C���V�X�e���Ɏ����Z�o�E�z�u�����܂��B�@�@�@�@�@�@�@�@�@�@�@*
002400*�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
002500*�@�@�������镶���s�b�`���g�p��������@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
002600*�@�@�@�����s�b�`�P�b�o�h�łP�����A�Q�b�o�h�łQ�����A�R�b�o�h�łR�����A�@�@�@�@�@�@�@*
002700*�@�@�@�T�b�o�h�łT�����A�U�b�o�h�łU�����A�V�D�T�b�o�h�łP�T�����A�@�@�@�@�@�@�@�@�@*
002800*�@�@�@�Q�O�b�o�h�łQ�O�����A�Q�S�b�o�h�łQ�S�����w�肵�܂��B�@�@�@�@�@�@�@�@�@�@�@�@*
002900*�@�@�@�������ł́A�����T�C�Y�w����ȗ����A�����s�b�`�ɍ��킹���œK�ȕ����T�C�Y���@�@*
003000*�@�@�@�@�b�n�a�n�k�����^�C���V�X�e���Ɏ����Z�o�E�󎚂����܂��B�@�@�@�@�@�@�@�@�@�@�@*
003100*�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
003200*�@�@�������̏��̂��g�p��������@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
003300*�@�@�@�S�V�b�N�A�S�V�b�N���p�i�����`�Ԕ��p�j�A�����A�������p�i�����`�Ԕ��p�j���P�O�@*
003400*�@�@�@�����ÂQ��J��Ԃ��܂��B�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
003500*�@�@�@�������Ŏw�肵�����̖��́A�ȉ��̎��s�����Ɋ֘A�Â����Ă��܂��B�@�@�@�@�@*
003600*�@�@�@�@���o�������������e�������m���������i�t�H���g���P�C�t�H���g���Q�j�@�@�@�@�@�@*
003700*�@�@�@�@�u�l�h�m�b�g�n�t�v�^�u�l�h�m�b�g�n�t�|�g�`�m�j�`�j�t�v���w�肵���f�[�^���ځ@*
003800*�@�@�@�@�́u�t�H���g���P�v�Ɏw�肳�ꂽ�t�H���g��p���Ĉ󎚂���A�@�@�@�@�@�@�@�@�@�@*
003900*�@�@�@�@�u�f�n�s�g�h�b�v�^�u�f�n�s�g�h�b�|�g�`�m�j�`�j�t�v���w�肵���f�[�^���ڂ́@�@*
004000*�@�@�@�@�u�t�H���g���Q�v�Ɏw�肳�ꂽ�t�H���g��p���Ĉ󎚂���܂��B�@�@�@�@�@�@�@�@�@*
004100*�@�@�@�@�{�T���v���ł́A���o�������������e�������m���������i�l�r�����C�l�r�S�V�b�N�j*
004200*�@�@�@�@���w�肵�Ă��܂��B�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
004300*�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
004400*�@�@��������]���g�p��������@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
004500*�@�@�@�c�����i�����v���ɂX�O�x��]�j�A���������P�O�����ÂJ��Ԃ��܂��B�@�@   �@ *
004600*�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
004700*�@�@�������镶���`�Ԃ��g�p��������@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
004800*�@�@�@�S�p�A���p�A�S�p���́A���p���́A�S�p���́A���p���́A�S�p�{�p�A���e�{�p�̕����@*
004900*�@�@�@�`�Ԏw����X�����Âw�肵�܂��B�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
005000*�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
005100*�@�@����L�T�̕���������g�ݍ��킹��������s���܂��B�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
005200*�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@*
005300*�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|�|*
005400 ENVIRONMENT              DIVISION.
005500 CONFIGURATION            SECTION.
005600 SPECIAL-NAMES.
005700*----------------------------------------------------------------------------------*
005800* ���䃌�R�[�h�������@�\���Ƃ���ɑΉ�����Ăі���錾�B
005900*----------------------------------------------------------------------------------*
006000     CTL IS PAGE-CNTL
006100*----------------------------------------------------------------------------------*
006200* �e�b�a���g�p�������[�T���v���Ɏg�p����@�\���Ƃ��̌Ăі���錾�B
006300*----------------------------------------------------------------------------------*
006400* �U�k�o�h�̒��[�Ɏg�p
006500* �P�Q�|�^�T�b�o�h�^�����^�������^����
006600     PRINTING MODE OOMIDASHI6 IS FOR ALL
006700                    IN   SIZE  012.0 POINT
006800                    AT   PITCH 05.00 CPI
006900                    WITH FONT  MINCHOU
007000                    AT   ANGLE 00 DEGREES
007100                    BY   FORM  F0102
007200* �P�Q�|�^�T�b�o�h�^�����^�������^�S�p
007300     PRINTING MODE KOMIDASHI6 IS FOR ALL
007400                    IN   SIZE  012.0 POINT
007500                    AT   PITCH 05.00 CPI
007600                    WITH FONT  MINCHOU
007700                    AT   ANGLE 00 DEGREES
007800                    BY   FORM  F
007900* �P�O�D�T�|�^�P�O�b�o�h�^�S�V�b�N�^�������^�S�p
008000     PRINTING MODE MEISAIANK6 IS FOR ALL
008100                    IN   SIZE  010.5 POINT
008200                    AT   PITCH 10.00 CPI
008300                    WITH FONT  GOTHIC
008400                    AT   ANGLE 00 DEGREES
008500                    BY   FORM  F
008600* �P�O�D�T�|�^�T�b�o�h�^�����^�������^�S�p
008700     PRINTING MODE MEISAIJP16 IS FOR ALL
008800                    IN   SIZE  010.5 POINT
008900                    AT   PITCH 05.00 CPI
009000                    WITH FONT  MINCHOU
009100                    AT   ANGLE 00 DEGREES
009200                    BY   FORM  F
009300* �V�D�Q�|�^�P�O�b�o�h�^�����^�������^�S�p
009400     PRINTING MODE MEISAIJP26 IS FOR ALL
009500                    IN   SIZE  006.0 POINT
009600                    AT   PITCH 10.00 CPI
009700                    WITH FONT  MINCHOU
009800                    AT   ANGLE 00 DEGREES
009900                    BY   FORM  F0102
010000*
010100* �W�k�o�h�̒��[�Ɏg�p
010200* �X�|�^�T�b�o�h�^�����^�������^����
010300     PRINTING MODE OOMIDASHI8 IS FOR ALL
010400                    IN   SIZE  009.0 POINT
010500                    AT   PITCH 05.00 CPI
010600                    WITH FONT  MINCHOU
010700                    AT   ANGLE 00 DEGREES
010800                    BY   FORM  F0102
010900* �X�|�^�T�b�o�h�^�����^�������^�S�p
011000     PRINTING MODE KOMIDASHI8 IS FOR ALL
011100                    IN   SIZE  009.0 POINT
011200                    AT   PITCH 05.00 CPI
011300                    WITH FONT  MINCHOU
011400                    AT   ANGLE 00 DEGREES
011500                    BY   FORM  F
011600* �V�D�Q�|�^�P�O�b�o�h�^�S�V�b�N�^�������^�S�p
011700     PRINTING MODE MEISAIANK8 IS FOR ALL
011800                    IN   SIZE  007.2 POINT
011900                    AT   PITCH 10.00 CPI
012000                    WITH FONT  GOTHIC
012100                    AT   ANGLE 00 DEGREES
012200                    BY   FORM  F
012300* �V�D�Q�|�^�T�b�o�h�^�����^�������^�S�p
012400     PRINTING MODE MEISAIJP18 IS FOR ALL
012500                    IN   SIZE  007.2 POINT
012600                    AT   PITCH 05.00 CPI
012700                    WITH FONT  MINCHOU
012800                    AT   ANGLE 00 DEGREES
012900                    BY   FORM  F
013000* �V�D�Q�|�^�P�O�b�o�h�^�����^�������^�S�p
013100     PRINTING MODE MEISAIJP28 IS FOR ALL
013200                    IN   SIZE  007.2 POINT
013300                    AT   PITCH 10.00 CPI
013400                    WITH FONT  MINCHOU
013500                    AT   ANGLE 00 DEGREES
013600                    BY   FORM  F
013700*----------------------------------------------------------------------------------*
013800* �����T�C�Y�������@�\���Ƃ���ɑΉ�����Ăі���錾�B
013900*----------------------------------------------------------------------------------*
014000* �R�D�O�|
014100     PRINTING MODE PMSIZE01 IS FOR ALL
014200                    IN   SIZE   3   POINT
014300* �V�D�Q�|
014400     PRINTING MODE PMSIZE02 IS FOR ALL
014500                    IN   SIZE   7.2 POINT
014600* �X�D�O�|
014700     PRINTING MODE PMSIZE03 IS FOR ALL
014800                    IN   SIZE   9   POINT
014900* �P�Q�D�O�|
015000     PRINTING MODE PMSIZE04 IS FOR ALL
015100                    IN   SIZE  12   POINT
015200* �P�W�D�O�|
015300     PRINTING MODE PMSIZE05 IS FOR ALL
015400                    IN   SIZE  18   POINT
015500* �Q�S�D�O�|
015600     PRINTING MODE PMSIZE06 IS FOR ALL
015700                    IN   SIZE  24   POINT
015800* �R�U�D�O�|
015900     PRINTING MODE PMSIZE07 IS FOR ALL
016000                    IN   SIZE  36   POINT
016100* �T�O�D�O�|
016200     PRINTING MODE PMSIZE08 IS FOR ALL
016300                    IN   SIZE  50   POINT
016400* �V�Q�D�O�|
016500     PRINTING MODE PMSIZE09 IS FOR ALL
016600                    IN   SIZE  72   POINT
016700* �P�O�O�D�O�|
016800     PRINTING MODE PMSIZE10 IS FOR ALL
016900                    IN   SIZE 100   POINT
017000* �Q�O�O�D�O�|
017100     PRINTING MODE PMSIZE11 IS FOR ALL
017200                    IN   SIZE 200   POINT
017300* �R�O�O�D�O�|
017400     PRINTING MODE PMSIZE12 IS FOR ALL
017500                    IN   SIZE 300   POINT
017600*----------------------------------------------------------------------------------*
017700* �����s�b�`�������@�\���Ƃ���ɑΉ�����Ăі���錾�B
017800*----------------------------------------------------------------------------------*
017900* �P�D�O�O�b�o�h
018000     PRINTING MODE PMPICH01 IS FOR ALL
018100                    AT   PITCH  1   CPI
018200* �Q�D�O�O�b�o�h
018300     PRINTING MODE PMPICH02 IS FOR ALL
018400                    AT   PITCH  2   CPI
018500* �R�D�O�O�b�o�h
018600     PRINTING MODE PMPICH03 IS FOR ALL
018700                    AT   PITCH  3   CPI
018800* �T�D�O�O�b�o�h
018900     PRINTING MODE PMPICH04 IS FOR ALL
019000                    AT   PITCH  5   CPI
019100* �U�D�O�O�b�o�h
019200     PRINTING MODE PMPICH05 IS FOR ALL
019300                    AT   PITCH  6   CPI
019400* �V�D�T�O�b�o�h
019500     PRINTING MODE PMPICH06 IS FOR ALL
019600                    AT   PITCH  7.5 CPI
019700* �W�D�O�O�b�o�h
019800     PRINTING MODE PMPICH07 IS FOR ALL
019900                    AT   PITCH  8   CPI
020000* �P�O�D�O�O�b�o�h
020100     PRINTING MODE PMPICH08 IS FOR ALL
020200                    AT   PITCH 10   CPI
020300* �P�Q�D�O�O�b�o�h
020400     PRINTING MODE PMPICH09 IS FOR ALL
020500                    AT   PITCH 12   CPI
020600* �P�T�D�O�O�b�o�h
020700     PRINTING MODE PMPICH10 IS FOR ALL
020800                    AT   PITCH 15   CPI
020900* �Q�O�D�O�O�b�o�h
021000     PRINTING MODE PMPICH11 IS FOR ALL
021100                    AT   PITCH 20   CPI
021200* �Q�S�D�O�O�b�o�h
021300     PRINTING MODE PMPICH12 IS FOR ALL
021400                    AT   PITCH 24   CPI
021500*----------------------------------------------------------------------------------*
021600* ���̂������@�\���Ƃ���ɑΉ�����Ăі���錾�B
021700*----------------------------------------------------------------------------------*
021800* �f�n�s�g�h�b
021900     PRINTING MODE PMFONT01 IS FOR ALL
022000                    WITH FONT   GOTHIC
022100* �f�n�s�g�h�b�|�g�`�m�j�`�j�t
022200     PRINTING MODE PMFONT02 IS FOR ALL
022300                    WITH FONT   GOTHIC-HANKAKU
022400                    BY   FORM   H
022500* �l�h�m�b�g�n�t
022600     PRINTING MODE PMFONT03 IS FOR ALL
022700                    WITH FONT   MINCHOU
022800* �l�h�m�b�g�n�t�|�g�`�m�j�`�j�t
022900     PRINTING MODE PMFONT04 IS FOR ALL
023000                    WITH FONT   MINCHOU-HANKAKU
023100                    BY   FORM   H
023200*----------------------------------------------------------------------------------*
023300* ������]�������@�\���Ƃ���ɑΉ�����Ăі���錾�B
023400*----------------------------------------------------------------------------------*
023500* ������
023600     PRINTING MODE PMANGL01 IS FOR ALL
023700                    AT   ANGLE  0   DEGREES
023800* �c�����i�����v���ɂX�O�x��]�j
023900     PRINTING MODE PMANGL02 IS FOR ALL
024000                    AT   ANGLE  90  DEGREES
024100*----------------------------------------------------------------------------------*
024200* �����`�Ԃ������@�\���Ƃ���ɑΉ�����Ăі���錾�B
024300*----------------------------------------------------------------------------------*
024400* �S�p
024500     PRINTING MODE PMFORM01 IS FOR ALL
024600                    BY   FORM   F
024700* ���p
024800     PRINTING MODE PMFORM02 IS FOR ALL
024900                    BY   FORM   H
025000                    WITH FONT   GOTHIC-HANKAKU
025100* �S�p����
025200     PRINTING MODE PMFORM03 IS FOR ALL
025300                    BY   FORM   F0201
025400* ���p����
025500     PRINTING MODE PMFORM04 IS FOR ALL
025600                    BY   FORM   H0201
025700                    WITH FONT   GOTHIC-HANKAKU
025800* �S�p����
025900     PRINTING MODE PMFORM05 IS FOR ALL
026000                    BY   FORM   F0102
026100* ���p����
026200     PRINTING MODE PMFORM06 IS FOR ALL
026300                    BY   FORM   H0102
026400                    WITH FONT   GOTHIC-HANKAKU
026500* �S�p�{�p
026600     PRINTING MODE PMFORM07 IS FOR ALL
026700                    BY   FORM   F0202
026800* ���p�{�p
026900     PRINTING MODE PMFORM08 IS FOR ALL
027000                    BY   FORM   H0202
027100                    WITH FONT   GOTHIC-HANKAKU
027200*----------------------------------------------------------------------------------*
027300* �����镶�������̑g�����������@�\���Ƃ���ɑΉ�����Ăі���錾�B
027400*----------------------------------------------------------------------------------*
027500* �X�|�^�W�b�o�h�^�l�h�m�b�g�n�t�^�������^�S�p
027600     PRINTING MODE PRTMODE1 IS FOR ALL
027700                    IN   SIZE   9   POINT
027800                    AT   PITCH  8   CPI
027900                    WITH FONT   MINCHOU
028000                    AT   ANGLE  0   DEGREES
028100                    BY   FORM   F
028200* �V�D�Q�|�^�Q�O�b�o�h�^�f�n�s�g�h�b�|�g�`�m�j�`�j�t�^�������^���p
028300     PRINTING MODE PRTMODE2 IS FOR ALL
028400                    IN   SIZE   7.2 POINT
028500                    AT   PITCH  20  CPI
028600                    WITH FONT   GOTHIC-HANKAKU
028700                    AT   ANGLE  0   DEGREES
028800                    BY   FORM   H
028900* �P�Q�|�^�Q�D�T�b�o�h�^�f�n�s�g�h�b�^�c�����^�{�p
029000     PRINTING MODE PRTMODE3 IS FOR ALL
029100                    IN   SIZE   12  POINT
029200                    AT   PITCH  2.5 CPI
029300                    WITH FONT   GOTHIC
029400                    AT   ANGLE  90  DEGREES
029500                    BY   FORM   F0202.
029600*
029700 INPUT-OUTPUT             SECTION.
029800*
029900 FILE-CONTROL.
030000     SELECT ����t�@�C�� ASSIGN TO PRINTER
030100            ORGANIZATION IS SEQUENTIAL
030200            ACCESS MODE  IS SEQUENTIAL
030300            FILE STATUS  IS ���o�͏��.
030400*----------------------------------------------------------------------------------*
030500 DATA                     DIVISION.
030600*
030700 FILE                     SECTION.
030800*
030900 FD  ����t�@�C��.
031000 01  �s���R�[�h           PIC N(136).
031100 01  ���߃��R�[�h         PIC N(050).
031200 01  ���䃌�R�[�h         PIC X(100).
031300*
031400 WORKING-STORAGE          SECTION.
031500* �e�b�a���g�p�������[�T���v���Ɏg�p����f�[�^�錾
031600 01  �匩�o���U           CHARACTER TYPE    IS OOMIDASHI6
031700                          PRINTING POSITION IS 36
031800                          PIC N(020)
031900                          VALUE NC"�e�b�a���g�p�����U�k�o�h�ł̒��[�T���v��".
032000 01  �����o���U           CHARACTER TYPE    IS KOMIDASHI6.
032100   02  FILLER             PIC N(002)
032200                          VALUE NC"����".
032300   02  FILLER             PRINTING POSITION IS 11
032400                          PIC N(005)
032500                          VALUE NC"���i�R�[�h".
032600   02  FILLER             PRINTING POSITION IS 27
032700                          PIC N(003)
032800                          VALUE NC"���i��".
032900   02  FILLER             PRINTING POSITION IS 57
033000                          PIC N(002)
033100                          VALUE NC"�P��".
033200   02  FILLER             PRINTING POSITION IS 67
033300                          PIC N(004)
033400                          VALUE NC"�o�ז{��".
033500   02  FILLER             PRINTING POSITION IS 81
033600                          PIC N(004)
033700                          VALUE NC"�݌ɐ���".
033800   02  FILLER             PRINTING POSITION IS 95
033900                          PIC N(002)
034000                          VALUE NC"���l".
034100 01  ���ׂU.
034200   02  ����               CHARACTER TYPE IS MEISAIANK6
034300                          PIC 9(004)
034400                          VALUE 9999.
034500   02  ���i�R�[�h         CHARACTER TYPE IS MEISAIANK6
034600                          PRINTING POSITION IS 11
034700                          PIC X(010)
034800                          VALUE "XXXXXXXXXX".
034900   02  ���i��             CHARACTER TYPE IS MEISAIJP16
035000                          PRINTING POSITION IS 27
035100                          PIC N(010)
035200                          VALUE NC"�m�m�m�m�m�m�m�m�m�m".
035300   02  �P��               CHARACTER TYPE IS MEISAIANK6
035400                          PRINTING POSITION IS 53
035500                          PIC X(008)
035600                          VALUE "\9999999".
035700   02  �o�ז{��           CHARACTER TYPE IS MEISAIANK6
035800                          PRINTING POSITION IS 67
035900                          PIC 9(008)
036000                          VALUE 99999999.
036100   02  �݌ɐ���           CHARACTER TYPE IS MEISAIANK6
036200                          PRINTING POSITION IS 81
036300                          PIC 9(008)
036400                          VALUE 99999999.
036500   02  ���l               CHARACTER TYPE IS MEISAIJP26
036600                          PRINTING POSITION IS 95
036700                          PIC N(016)
036800                          VALUE NC"���̍s�͂U�k�o�h�ň󎚂���܂��B".
036900 01  �匩�o���W           CHARACTER TYPE    IS OOMIDASHI8
037000                          PRINTING POSITION IS 36
037100                          PIC N(020)
037200                          VALUE NC"�e�b�a���g�p�����W�k�o�h�ł̒��[�T���v��".
037300 01  �����o���W           CHARACTER TYPE    IS KOMIDASHI8.
037400   02  FILLER             PIC N(002)
037500                          VALUE NC"����".
037600   02  FILLER             PRINTING POSITION IS 11
037700                          PIC N(005)
037800                          VALUE NC"���i�R�[�h".
037900   02  FILLER             PRINTING POSITION IS 27
038000                          PIC N(003)
038100                          VALUE NC"���i��".
038200   02  FILLER             PRINTING POSITION IS 57
038300                          PIC N(002)
038400                          VALUE NC"�P��".
038500   02  FILLER             PRINTING POSITION IS 67
038600                          PIC N(004)
038700                          VALUE NC"�o�ז{��".
038800   02  FILLER             PRINTING POSITION IS 81
038900                          PIC N(004)
039000                          VALUE NC"�݌ɐ���".
039100   02  FILLER             PRINTING POSITION IS 95
039200                          PIC N(002)
039300                          VALUE NC"���l".
039400 01  ���ׂW.
039500   02  ����               CHARACTER TYPE IS MEISAIANK8
039600                          PIC 9(004)
039700                          VALUE 9999.
039800   02  ���i�R�[�h         CHARACTER TYPE IS MEISAIANK8
039900                          PRINTING POSITION IS 11
040000                          PIC X(010)
040100                          VALUE "XXXXXXXXXX".
040200   02  ���i��             CHARACTER TYPE IS MEISAIJP18
040300                          PRINTING POSITION IS 27
040400                          PIC N(010)
040500                          VALUE NC"�m�m�m�m�m�m�m�m�m�m".
040600   02  �P��               CHARACTER TYPE IS MEISAIANK8
040700                          PRINTING POSITION IS 53
040800                          PIC X(008)
040900                          VALUE "\9999999".
041000   02  �o�ז{��           CHARACTER TYPE IS MEISAIANK8
041100                          PRINTING POSITION IS 67
041200                          PIC 9(008)
041300                          VALUE 99999999.
041400   02  �݌ɐ���           CHARACTER TYPE IS MEISAIANK8
041500                          PRINTING POSITION IS 81
041600                          PIC 9(008)
041700                          VALUE 99999999.
041800   02  ���l               CHARACTER TYPE IS MEISAIJP28
041900                          PRINTING POSITION IS 95
042000                          PIC N(016)
042100                          VALUE NC"���̍s�͂W�k�o�h�ň󎚂���܂��B".
042200*
042300* ���߂Ƃ��Ďg�p����f�[�^�錾
042400 01  ���o���f�[�^�P       PIC N(050) CHARACTER TYPE IS MODE-1
042500                          VALUE NC"�x�m�ʂm�����b�n�a�n�k�@�e�n�q�l�`�s��Ȃ�����t�@�C��".
042600 01  ���o���f�[�^�Q       PIC N(050) CHARACTER TYPE IS PMPICH01
042700                          VALUE NC"�e�핶�������󎚃T���v���W".
042800 01  ���߃f�[�^�P         PIC N(050) CHARACTER TYPE IS MODE-1
042900                          VALUE NC"�������镶���T�C�Y���g�p���������B".
043000 01  ���߃f�[�^�Q         PIC N(050) CHARACTER TYPE IS MODE-1
043100                          VALUE NC"�������镶���s�b�`���g�p���������B".
043200 01  ���߃f�[�^�R         PIC N(050) CHARACTER TYPE IS MODE-1
043300                          VALUE NC"�������̏��̂��g�p���������B".
043400 01  ���߃f�[�^�S         PIC N(100) CHARACTER TYPE IS MODE-1
043500                          VALUE NC"��������]���g�p���������B".
043600 01  ���߃f�[�^�T         PIC N(100) CHARACTER TYPE IS MODE-1
043700                          VALUE NC"�������镶���`�Ԃ��g�p���������B".
043800 01  ���߃f�[�^�U         PIC N(100) CHARACTER TYPE IS MODE-1
043900                          VALUE NC"���l�X�ȕ���������g�ݍ��킹���i���݁j�����B".
044000* �����T�C�Y���w�肵���f�[�^�錾
044100 01  �����T�C�Y�f�[�^.
044200   02                     PIC N(001) CHARACTER TYPE IS PMSIZE01
044300                          VALUE NC"��".
044400   02                     PIC N(001) CHARACTER TYPE IS PMSIZE02
044500                          VALUE NC"��".
044600   02                     PIC N(001) CHARACTER TYPE IS PMSIZE03
044700                          VALUE NC"��".
044800   02                     PIC N(001) CHARACTER TYPE IS PMSIZE04
044900                          VALUE NC"��".
045000   02                     PIC N(001) CHARACTER TYPE IS PMSIZE05
045100                          VALUE NC"��".
045200   02                     PIC N(001) CHARACTER TYPE IS PMSIZE06
045300                          VALUE NC"��".
045400   02                     PIC N(001) CHARACTER TYPE IS PMSIZE07
045500                          VALUE NC"��".
045600   02                     PIC N(001) CHARACTER TYPE IS PMSIZE08
045700                          VALUE NC"��".
045800   02                     PIC N(001) CHARACTER TYPE IS PMSIZE09
045900                          VALUE NC"��".
046000   02                     PIC N(001) CHARACTER TYPE IS PMSIZE10
046100                          VALUE NC"��".
046200   02                     PIC N(001) CHARACTER TYPE IS PMSIZE11
046300                          VALUE NC"��".
046400   02                     PIC N(001) CHARACTER TYPE IS PMSIZE12
046500                          VALUE NC"��".
046600* �����s�b�`���w�肵���f�[�^�錾
046700 01  �����s�b�`�f�[�^.
046800   02                     PIC N(001) CHARACTER TYPE IS PMPICH01
046900                          VALUE     NC"��".
047000   02                     PIC N(002) CHARACTER TYPE IS PMPICH02
047100                          VALUE ALL NC"��".
047200   02                     PIC N(003) CHARACTER TYPE IS PMPICH03
047300                          VALUE ALL NC"��".
047400   02                     PIC N(005) CHARACTER TYPE IS PMPICH04
047500                          VALUE ALL NC"��".
047600   02                     PIC N(006) CHARACTER TYPE IS PMPICH05
047700                          VALUE ALL NC"��".
047800   02                     PIC N(015) CHARACTER TYPE IS PMPICH06
047900                          VALUE ALL NC"��".
048000   02                     PIC N(008) CHARACTER TYPE IS PMPICH07
048100                          VALUE ALL NC"��".
048200   02                     PIC N(010) CHARACTER TYPE IS PMPICH08
048300                          VALUE ALL NC"��".
048400   02                     PIC N(012) CHARACTER TYPE IS PMPICH09
048500                          VALUE ALL NC"��".
048600   02                     PIC N(015) CHARACTER TYPE IS PMPICH10
048700                          VALUE ALL NC"��".
048800   02                     PIC N(020) CHARACTER TYPE IS PMPICH11
048900                          VALUE ALL NC"��".
049000   02                     PIC N(024) CHARACTER TYPE IS PMPICH12
049100                          VALUE ALL NC"��".
049200* ���̂��w�肵���f�[�^�錾
049300 01  �����t�H���g�f�[�^.
049400   02                     PIC N(010) CHARACTER TYPE IS PMFONT01
049500                          VALUE ALL NC"��".
049600   02                     PIC N(010) CHARACTER TYPE IS PMFONT02
049700                          VALUE ALL NC"��".
049800   02                     PIC N(010) CHARACTER TYPE IS PMFONT03
049900                          VALUE ALL NC"��".
050000   02                     PIC N(010) CHARACTER TYPE IS PMFONT04
050100                          VALUE ALL NC"��".
050200   02                     PIC N(010) CHARACTER TYPE IS PMFONT01
050300                          VALUE ALL NC"��".
050400   02                     PIC N(010) CHARACTER TYPE IS PMFONT02
050500                          VALUE ALL NC"��".
050600   02                     PIC N(010) CHARACTER TYPE IS PMFONT03
050700                          VALUE ALL NC"��".
050800   02                     PIC N(010) CHARACTER TYPE IS PMFONT04
050900                          VALUE ALL NC"��".
051000* ������]���w�肵���f�[�^�錾
051100 01  ������]�f�[�^.
051200   02                     PIC N(010) CHARACTER TYPE IS PMANGL01
051300                          VALUE ALL NC"��".
051400   02                     PIC N(010) CHARACTER TYPE IS PMANGL02
051500                          VALUE ALL NC"��".
051600   02                     PIC N(010) CHARACTER TYPE IS PMANGL01
051700                          VALUE ALL NC"��".
051800   02                     PIC N(010) CHARACTER TYPE IS PMANGL02
051900                          VALUE ALL NC"��".
052000   02                     PIC N(010) CHARACTER TYPE IS PMANGL01
052100                          VALUE ALL NC"��".
052200   02                     PIC N(010) CHARACTER TYPE IS PMANGL02
052300                          VALUE ALL NC"��".
052400   02                     PIC N(010) CHARACTER TYPE IS PMANGL01
052500                          VALUE ALL NC"��".
052600   02                     PIC N(010) CHARACTER TYPE IS PMANGL02
052700                          VALUE ALL NC"��".
052800* �����`�Ԃ��w�肵���f�[�^�錾
052900 01  �����`�ԃf�[�^.
053000   02                     PIC N(009) CHARACTER TYPE IS PMFORM01
053100                          VALUE ALL NC"��".
053200   02                     PIC N(009) CHARACTER TYPE IS PMFORM02
053300                          VALUE ALL NC"��".
053400   02                     PIC N(009) CHARACTER TYPE IS PMFORM03
053500                          VALUE ALL NC"��".
053600   02                     PIC N(009) CHARACTER TYPE IS PMFORM04
053700                          VALUE ALL NC"��".
053800   02                     PIC N(009) CHARACTER TYPE IS PMFORM05
053900                          VALUE ALL NC"��".
054000   02                     PIC N(009) CHARACTER TYPE IS PMFORM06
054100                          VALUE ALL NC"��".
054200   02                     PIC N(009) CHARACTER TYPE IS PMFORM07
054300                          VALUE ALL NC"��".
054400   02                     PIC N(009) CHARACTER TYPE IS PMFORM08
054500                          VALUE ALL NC"��".
054600* �l�X�ȕ���������g�����w�肵���f�[�^�錾
054700 01  ���������g�����f�[�^.
054800   02                     PIC N(010) CHARACTER TYPE IS PRTMODE1
054900                          VALUE ALL NC"��".
055000   02                     PIC N(010) CHARACTER TYPE IS PRTMODE2
055100                          VALUE ALL NC"��".
055200   02                     PIC N(010) CHARACTER TYPE IS PRTMODE3
055300                          VALUE ALL NC"��".
055400   02                     PIC N(010) CHARACTER TYPE IS PRTMODE1
055500                          VALUE ALL NC"��".
055600   02                     PIC N(010) CHARACTER TYPE IS PRTMODE2
055700                          VALUE ALL NC"��".
055800   02                     PIC N(010) CHARACTER TYPE IS PRTMODE3
055900                          VALUE ALL NC"��".
056000*�h���䃌�R�[�h�̃f�[�^�錾
056100 01  �h����f�[�^.
056200   02  ���R�[�h���ʎq     PIC X(002) VALUE "I1".
056300   02  ���[�h             PIC X(001) VALUE "1".
056400   02  �I�[�o���C.
056500     03  �I�[�o���C��     PIC X(004) VALUE SPACE.
056600     03  �ĕt����       PIC 9(003) VALUE 0.
056700   02  ���ʐ�             PIC 9(003) VALUE 0.
056800   02  �e�b�a��           PIC X(004) VALUE SPACE.
056900   02  ���[��`�̖�       PIC X(008) VALUE SPACE.
057000   02                     PIC X(030) VALUE SPACE.
057100   02  ����`��           PIC X(002) VALUE SPACE.
057200   02  �p���T�C�Y         PIC X(003) VALUE SPACE.
057300   02                     PIC X(004) VALUE SPACE.
057400   02  �����             PIC X(001) VALUE SPACE.
057500   02  ����J�n�ʒu�Â��� PIC X(001) VALUE SPACE.
057600   02  �󎚋֎~��         PIC X(001) VALUE SPACE.
057700   02  �Ԃ������.
057800     03  �|�[�g���\��     PIC X(001) VALUE SPACE.
057900     03  �|�[�g������     PIC X(001) VALUE SPACE.
058000     03  �����h���\��     PIC X(001) VALUE SPACE.
058100     03  �����h������     PIC X(001) VALUE SPACE.
058200   02  �󎚈ʒu���.
058300     03  �Ԃ��㕝         PIC 9(004) VALUE 9999.
058400     03  �󎚊J�n���_�ʒu.
058500       04  �|�[�g���w���W PIC 9(004) VALUE 9999.
058600       04  �|�[�g���x���W PIC 9(004) VALUE 9999.
058700       04  �����h���w���W PIC 9(004) VALUE 9999.
058800       04  �����h���x���W PIC 9(004) VALUE 9999.
058900   02  �������           PIC X(004) VALUE SPACE.
059000   02  �\���             PIC X(005) VALUE SPACE.
059100* �G���[�J�E���^�Ƃ��Ďg�p����f�[�^�錾
059200 01  �G���[�J�E���^       PIC 9(004)        VALUE ZERO.
059300* ���o�͏�ԂƂ��Ďg�p����f�[�^�錾
059400 77  ���o�͏��           PIC X(002)        VALUE ZERO.
059500*----------------------------------------------------------------------------------*
059600 PROCEDURE                DIVISION.
059700*
059800* ����t�@�C���̂n�o�d�m
059900     OPEN OUTPUT ����t�@�C��.
060000     IF ���o�͏�� NOT = ZERO THEN
060100       ADD 1 TO �G���[�J�E���^
060200     END-IF.
060300*
060400*----------------------------------------------------------------------------------*
060500* �P�D�e�b�a���g�p�������[����T���v���̏o�͏����@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@ *
060600*----------------------------------------------------------------------------------*
060700*
060800* �U�k�o�h�̒��[�������
060900*
061000* �I�[�o���C���h�`�S�k�U�h�i�j�n�k�T�`�S�k�U�D�n�u�c�j�ݒ�
061100* �U�k�o�h�^�P�O�b�o�h�̃X�y�[�V���O�`���[�g�C���[�W�̃I�[�o���C���o��
061200     MOVE "A4L6" TO �I�[�o���C��.
061300* �Ă��t���񐔂P��ݒ�
061400     MOVE 1      TO �ĕt����.
061500* ���ʖ����P���ݒ�
061600     MOVE 1      TO ���ʐ�.
061700* �e�b�a���h�`�S�k�U�h�i�e�b�a�`�S�k�U�j�ݒ�
061800     MOVE "A4L6" TO �e�b�a��.
061900* ����`�������h�X�P�[�v���[�h(������)�ݒ�
062000     MOVE "L"    TO ����`��.
062100* �p���T�C�Y�`�S�ݒ�
062200     MOVE "A4"   TO �p���T�C�Y.
062300* �Жʈ���ݒ�
062400     MOVE "F"    TO �����.
062500* �\�ʈʒu�Â��ݒ�
062600     MOVE "F"    TO ����J�n�ʒu�Â���.
062700* ������񖼁h�c�n�b�P�h�i���b�a�q�Q�c���������������m�������Q�c�n�b�P�j�ݒ�
062800     MOVE "DOC1" TO �������.
062900* �h���䃌�R�[�h���o�͂��邱�Ƃɂ��y�[�W������ݒ�
063000     WRITE ���䃌�R�[�h FROM �h����f�[�^
063100                        AFTER ADVANCING PAGE-CNTL.
063200     IF ���o�͏�� NOT = ZERO THEN
063300       ADD 1 TO �G���[�J�E���^
063400     END-IF.
063500*
063600* �匩�o���o��
063700     MOVE SPACE  TO ���߃��R�[�h.
063800     WRITE ���߃��R�[�h AFTER ADVANCING PAGE.
063900     IF ���o�͏�� NOT = ZERO THEN
064000       ADD 1 TO �G���[�J�E���^
064100     END-IF.
064200*
064300* �����o���o��
064400     WRITE �s���R�[�h FROM �匩�o���U
064500                        AFTER ADVANCING 1 LINE.
064600     IF ���o�͏�� NOT = ZERO THEN
064700       ADD 1 TO �G���[�J�E���^
064800     END-IF.
064900*
065000* ���׏o��
065100     WRITE �s���R�[�h FROM �����o���U
065200                        AFTER ADVANCING 2 LINES.
065300     IF ���o�͏�� NOT = ZERO THEN
065400       ADD 1 TO �G���[�J�E���^
065500     END-IF.
065600     WRITE �s���R�[�h FROM ���ׂU
065700                        AFTER ADVANCING 2 LINES
065800     PERFORM 40 TIMES
065900       WRITE �s���R�[�h FROM ���ׂU
066000                        AFTER ADVANCING 1 LINE
066100       IF ���o�͏�� NOT = ZERO THEN
066200         ADD 1 TO �G���[�J�E���^
066300       END-IF
066400     END-PERFORM.
066500*
066600* �W�k�o�h�̒��[�������
066700*
066800* �I�[�o���C���h�`�S�k�W�h�i�j�n�k�T�`�S�k�W�D�n�u�c�j�ݒ�
066900* �W�k�o�h�^�P�O�b�o�h�̃X�y�[�V���O�`���[�g�C���[�W�̃I�[�o���C���o��
067000     MOVE "A4L8" TO �I�[�o���C��.
067100* �Ă��t���񐔂P��ݒ�
067200     MOVE 1      TO �ĕt����.
067300* ���ʖ����P���ݒ�
067400     MOVE 1      TO ���ʐ�.
067500* �e�b�a���h�`�S�k�U�h�i�e�b�a�`�S�k�U�j�ݒ�
067600     MOVE "A4L8" TO �e�b�a��.
067700* ����`�������h�X�P�[�v���[�h(������)�ݒ�
067800     MOVE "L"    TO ����`��.
067900* �p���T�C�Y�`�S�ݒ�
068000     MOVE "A4"   TO �p���T�C�Y.
068100* �Жʈ���ݒ�
068200     MOVE "F"    TO �����.
068300* �\�ʈʒu�Â��ݒ�
068400     MOVE "F"    TO ����J�n�ʒu�Â���.
068500* ������񖼁h�c�n�b�P�h�i���b�a�q�Q�c���������������m�������Q�c�n�b�P�j�ݒ�
068600     MOVE "DOC1" TO �������.
068700* �h���䃌�R�[�h���o�͂��邱�Ƃɂ��y�[�W������ݒ�
068800     WRITE ���䃌�R�[�h FROM �h����f�[�^
068900                        AFTER ADVANCING PAGE-CNTL.
069000     IF ���o�͏�� NOT = ZERO THEN
069100       ADD 1 TO �G���[�J�E���^
069200     END-IF.
069300*
069400* �匩�o���o��
069500     MOVE SPACE  TO ���߃��R�[�h.
069600     WRITE ���߃��R�[�h AFTER ADVANCING PAGE.
069700     IF ���o�͏�� NOT = ZERO THEN
069800       ADD 1 TO �G���[�J�E���^
069900     END-IF.
070000     WRITE �s���R�[�h FROM �匩�o���W
070100                        AFTER ADVANCING 1 LINE.
070200     IF ���o�͏�� NOT = ZERO THEN
070300       ADD 1 TO �G���[�J�E���^
070400     END-IF.
070500*
070600* �����o���o��
070700     WRITE �s���R�[�h FROM �����o���W
070800                        AFTER ADVANCING 2 LINES.
070900     IF ���o�͏�� NOT = ZERO THEN
071000       ADD 1 TO �G���[�J�E���^
071100     END-IF.
071200*
071300* ���׏o��
071400     WRITE �s���R�[�h FROM ���ׂW
071500                        AFTER ADVANCING 2 LINES
071600     PERFORM 55 TIMES
071700       WRITE �s���R�[�h FROM ���ׂW
071800                        AFTER ADVANCING 1 LINE
071900       IF ���o�͏�� NOT = ZERO THEN
072000         ADD 1 TO �G���[�J�E���^
072100       END-IF
072200     END-PERFORM.
072300*
072400*----------------------------------------------------------------------------------*
072500* �Q�D�e�핶�������󎚃T���v���W�̏o�͏����@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@ *
072600*----------------------------------------------------------------------------------*
072700*
072800* �I�[�o���C���h�a�S�n�u�h�i�j�n�k�T�a�S�n�u�D�n�u�c�j�ݒ�
072900     MOVE "B4OV" TO �I�[�o���C��.
073000* �Ă��t���񐔂P��ݒ�
073100     MOVE 1      TO �ĕt����.
073200* ���ʖ����P���ݒ�
073300     MOVE 1      TO ���ʐ�.
073400* �e�b�a���h�k�o�h�U�h�i�e�b�a�U�k�o�h�j�ݒ�
073500     MOVE "LPI6" TO �e�b�a��.
073600* ����`�������h�X�P�[�v���[�h(������)�ݒ�
073700     MOVE "L"    TO ����`��.
073800* �p���T�C�Y�a�S�ݒ�
073900     MOVE "B4"   TO �p���T�C�Y.
074000* �Жʈ���ݒ�
074100     MOVE "F"    TO �����.
074200* �\�ʈʒu�Â��ݒ�
074300     MOVE "F"    TO ����J�n�ʒu�Â���.
074400* ������񖼁h�c�n�b�Q�h�i���b�a�q�Q�c���������������m�������Q�c�n�b�Q�j�ݒ�
074500     MOVE "DOC2" TO �������.
074600* �h���䃌�R�[�h���o�͂��邱�Ƃɂ��y�[�W������ݒ�
074700     WRITE ���䃌�R�[�h FROM �h����f�[�^
074800                        AFTER ADVANCING PAGE-CNTL.
074900     IF ���o�͏�� NOT = ZERO THEN
075000       ADD 1 TO �G���[�J�E���^
075100     END-IF.
075200*
075300* ���o���o��
075400     WRITE ���߃��R�[�h FROM ���o���f�[�^�P
075500                        AFTER ADVANCING PAGE.
075600     IF ���o�͏�� NOT = ZERO THEN
075700       ADD 1 TO �G���[�J�E���^
075800     END-IF.
075900     WRITE ���߃��R�[�h FROM ���o���f�[�^�Q
076000                        AFTER ADVANCING 30 LINES.
076100     IF ���o�͏�� NOT = ZERO THEN
076200       ADD 1 TO �G���[�J�E���^
076300     END-IF.
076400*
076500* �����T�C�Y�T���v���o��
076600     WRITE ���߃��R�[�h FROM ���߃f�[�^�P
076700                        AFTER ADVANCING PAGE.
076800     WRITE �s���R�[�h   FROM �����T�C�Y�f�[�^
076900                        AFTER ADVANCING 40 LINES.
077000     IF ���o�͏�� NOT = ZERO THEN
077100       ADD 1 TO �G���[�J�E���^
077200     END-IF.
077300*
077400* �����s�b�`�T���v���o��
077500     WRITE ���߃��R�[�h FROM ���߃f�[�^�Q
077600                        AFTER ADVANCING PAGE.
077700     PERFORM 5 TIMES
077800       WRITE �s���R�[�h FROM �����s�b�`�f�[�^
077900                        AFTER ADVANCING 10 LINES
078000       IF ���o�͏�� NOT = ZERO THEN
078100         ADD 1 TO �G���[�J�E���^
078200       END-IF
078300     END-PERFORM.
078400*
078500* �������̃T���v���o��
078600     WRITE ���߃��R�[�h FROM ���߃f�[�^�R
078700                        AFTER ADVANCING PAGE.
078800     PERFORM 18 TIMES
078900       WRITE �s���R�[�h FROM �����t�H���g�f�[�^
079000                        AFTER ADVANCING 3 LINES
079100       IF ���o�͏�� NOT = ZERO THEN
079200         ADD 1 TO �G���[�J�E���^
079300       END-IF
079400     END-PERFORM.
079500*
079600* ������]�T���v���o��
079700     WRITE ���߃��R�[�h FROM ���߃f�[�^�S
079800                        AFTER ADVANCING PAGE.
079900     PERFORM 18 TIMES
080000       WRITE �s���R�[�h FROM ������]�f�[�^
080100                        AFTER ADVANCING 3 LINES
080200       IF ���o�͏�� NOT = ZERO THEN
080300         ADD 1 TO �G���[�J�E���^
080400       END-IF
080500     END-PERFORM.
080600*
080700* �����`�ԃf�[�^�o��
080800     WRITE ���߃��R�[�h FROM ���߃f�[�^�T
080900                        AFTER ADVANCING PAGE.
081000     PERFORM 18 TIMES
081100       WRITE �s���R�[�h FROM �����`�ԃf�[�^
081200                        AFTER ADVANCING 3 LINES
081300       IF ���o�͏�� NOT = ZERO THEN
081400         ADD 1 TO �G���[�J�E���^
081500       END-IF
081600     END-PERFORM.
081700*
081800* ���������g�����T���v���o��
081900     WRITE ���߃��R�[�h FROM ���߃f�[�^�U
082000                        AFTER ADVANCING PAGE.
082100     PERFORM 18 TIMES
082200       WRITE �s���R�[�h FROM ���������g�����f�[�^
082300                        AFTER ADVANCING 3 LINES
082400       IF ���o�͏�� NOT = ZERO THEN
082500         ADD 1 TO �G���[�J�E���^
082600       END-IF
082700     END-PERFORM.
082800*
082900* ����t�@�C���b�k�n�r�d
083000     CLOSE ����t�@�C��.
083100     IF ���o�͏�� NOT = ZERO THEN
083200       ADD 1 TO �G���[�J�E���^
083300     END-IF.
083400* �G���[����
083500     IF �G���[�J�E���^ > ZERO THEN
083600       DISPLAY NC"�G���[���������܂����B"
083700       DISPLAY NC"���s�����[�b�Z�[�W���m�F���A�G���[�̌�������菜���Ă��������B"
083800       DISPLAY SPACE
083900     END-IF.
084000*
084100     STOP RUN.
