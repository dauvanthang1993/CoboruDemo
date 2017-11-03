000100*=================================================================
000200* �u�}���`�X���b�h�v���O���~���O�v
000300*     �X���b�h�ԂŃt�@�C���E�f�[�^�����p���ăI�����C���V���b�s���O
000400*   �̃A�v���P�[�V�������\�z���܂��B
000500*
000600*=================================================================
000700*
000800*  �t�@�C�����F Entry.cob
000900*  ����T�v  �F   �I�[�_�[�̔��s�Ɗm�F�\�̍č쐬���s���܂�
001000*
001100* Copyright 1999-2015 FUJITSU LIMITED
001200*=================================================================
001300 identification division.
001400 program-id. "HttpExtensionProc".
001500 environment division.
001600 data division.
001700 working-storage section.
001800     copy COBW3.
001900     copy Stock-Info.
002000     copy Product-Info.
002100     copy Order-Info.
002200     copy User-Log.
002300*
002400 01 pathName                      pic X(256) value space.
002500 01 pathSize                      pic 9(05) value 0.
002600 01 HTMLFilename                  pic X(40) value space.
002700 01 counter                       pic 9(04) value 0.
002800 01 quantity                      pic 9(04) value 0.
002900 01 returnValue                   pic 9(09) comp-5 value 0.
003000 01 stockFlag                     pic 9(01) value 0.
003100 01 copyStartPos                  pic 9(05) value 0.
003200 01 leftLength                    pic 9(05) value 0.
003300 01 ����                          pic 9(10) value 0.
003400 01 ���z                          pic 9(10) value 0.
003500 01 ���z                          pic 9(10) value 0.
003600 01 ����                          pic 9(10) value 0.
003700 01 �ҏW����                      pic Z(9)9 value space.
003800 01 �ҏW���z                      pic Z(9)9 value space.
003900 01 �ҏW���z                      pic Z(9)9 value space.
004000 01 �ҏW����                      pic Z(9)9 value space.
004100 01 ����                          pic 9(02) value 0.
004200*
004300 01 ProductNumberLabel.
004400    02 filler                     pic X(13) value "ProductNumber".
004500    02 ProductNumberLabelNumber   pic 9(02) value 0.
004600 01 numLabel.
004700    02 filler                     pic X(15) value "ProductQuantity".
004800    02 numLabelNumber             pic 9(02) value 0.
004900 01 ���ݓ��t����.
005000    02 YMD-HMS.
005100       03 �I�[�_�[�N             pic X(04) value space.
005200       03 �I�[�_�[��              pic X(02) value space.
005300       03 �I�[�_�[��              pic X(02) value space.
005400       03 filler                  pic X(06) value space.
005500    02 filler                     pic X(07) value space.
005600 01 �I�[�_�[���t.
005700    02 �I�[�_�[�N                 pic X(04) value space.
005800    02 filler                     pic X(01) value "/".
005900    02 �I�[�_�[��                 pic X(02) value space.
006000    02 filler                     pic X(01) value "/".
006100    02 �I�[�_�[��                 pic X(02) value space.
006200*----------------------------------------------------------------*
006300* SAF�A�v���ւ̈ڍs�ɂ���                                      *
006400*                                                                *
006500*    SAF�A�v���Ɉڍs����ۂ́A�A���߂Ǝ葱�������C������K�v��   *
006600*  ����܂��B�C���^�t�F�[�X�̈��SAF�T�u���[�`���Ŏg�p���邽�߁A *
006700*  SAF�T�u���[�`���Ƃ̃C���^�t�F�[�X�ł���COBW3�ɂ��̃A�h���X    *
006800*  ��ݒ肷��K�v������܂��B                                    *
006900*                                                                *
007000*  [�⑫]                                                        *
007100*    SAF�A�v���̏ꍇ�́ANSAPI�J�n����I���܂ł̃R�����g���O���A  *
007200*  ISAPI�J�n����I���܂ł��R�����g�����Ă��������B               *
007300*                                                                *
007400*----------------------------------------------------------------*
007500*
007600*---------------------   �h�r�`�o�h �J�n  -----------------------*
007700 linkage section.
007800     copy IsapiCtx.
007900*
008000 procedure division with stdcall linkage using ISAPI-CTX-CNT.
008100*
008200 Auth-Start.
008300*
008400*  �h�r�`�o�h�T�u���[�`���p�����^��̏�����
008500     move low-value to COBW3.
008600     move function addr(ISAPI-CTX-CNT) to COBW3-CONTEXT.
008700*---------------------   �h�r�`�o�h �I��  -----------------------*
008800*
008900*---------------------   �m�r�`�o�h �J�n  -----------------------*
009000*linkage section.
009100*01 safpt                         pointer.
009200**
009300* procedure division using safpt.
009400**
009500*Auth-Start.
009600**
009700**  �m�r�`�o�h�T�u���[�`���p�����^��̏�����
009800*    move low-value to COBW3.
009900*    move safpt     to COBW3-CONTEXT.
010000*---------------------   �m�r�`�o�h �I��  -----------------------*
010100*
010200*=================================================================
010300*  �h�r�`�o�h�T�u���[�`����Ɗ������������A�v�����p�����^��
010400*  �l������
010500*=================================================================
010600     call "COBW3_INIT" using COBW3.
010700*
010800*=================================================================
010900*  �P�̃y�[�W�𕡐���ɕ����ďo�͂���̂ŁA�����p�X���擾����
011000*  �����B�Ȃ��A���ʏo�͗p�y�[�W�́A�A�v�����N�������ďo���p�y�[�W
011100*  �Ɠ����t�H���_�ɂ�����̂ƌ��Ȃ��B
011200*=================================================================
011300     move space to pathName.
011400     set COBW3-PHYSICALPATH to true.
011500     call "COBW3_GET_REQUEST_INFO" using COBW3.
011600     if COBW3-STATUS = zero then
011700       move COBW3-REQUEST-INFO to pathName
011800       move COBW3-REQUEST-INFO-LENGTH to pathSize
011900     end-if.
012000*
012100*=================================================================
012200*  �b�����������ɂ���āA�I�[�_�[�m�F��������User-ID�������p��
012300*=================================================================
012400     move "Online Store User-ID" to COBW3-COOKIE-NAME.
012500     call "COBW3_GET_COOKIE_XX" using COBW3.
012600     if COBW3-SEARCH-FLAG-EXIST then
012700         move COBW3-COOKIE-VALUE to orderUserID
012800     else
012900         move "IlligalAccess.html" to HTMLFilename
013000         perform ��ʏo�͏���
013100         go to �I���ʒu
013200     end-if.
013300*
013400*=================================================================
013500*  �v�����p�����^���������A�I�[�_�[���ʂ��O�łȂ����̂̐��i�ԍ�
013600*  �ƃI�[�_�[���ʂ��擾����
013700*=================================================================
013800     move zero to quantity.
013900     perform test before
014000         varying counter
014100         from 1 by 1 until counter > 20
014200*
014300       *> ProductQuantityXX(XX=1�`20)���L�[�ɃI�[�_�[���ʂ���������
014400       move counter to numLabelNumber
014500       move numLabel to COBW3-SEARCH-DATA
014600       call "COBW3_GET_VALUE_XX" using COBW3
014700       if program-status not = zero then
014800         move "SystemError.html" to HTMLFilename
014900         go to �I���ʒu
015000       end-if
015100       *> �I�[�_�[���ʂ��O�łȂ��Ȃ�A���i�ԍ��𓾂�
015200       if COBW3-SEARCH-FLAG-EXIST then
015300         compute ���� = function NUMVAL(COBW3-GET-DATA)
015400         if ���� not = zero then
015500           move counter to ProductNumberLabelNumber
015600           move ProductNumberLabel to COBW3-SEARCH-DATA
015700           call "COBW3_GET_VALUE_XX" using COBW3
015800           if program-status not = zero then
015900             move "SystemError.html" to HTMLFilename
016000             go to �I���ʒu
016100           end-if
016200*
016300           *> ���i�ԍ����݌ɁE�I�[�_�[�E���i���ɑޔ�����
016400           if COBW3-SEARCH-FLAG-EXIST then
016500             add 1 to  quantity
016600             move COBW3-GET-DATA to stockProductNumber(quantity)
016700                                    orderProductNumber(quantity)
016800                                    productNumber(quantity)
016900             move ���� to orderProductQuantity(quantity)
017000           end-if
017100         end-if
017200       else            *> �v�����p�����^�ɊY�����閼�O���Ȃ��Ȃ�A
017300         exit perform  *> �f�[�^�̏I���ɒB�����̂Ń��[�v��E�o
017400       end-if
017500     end-perform.
017600*
017700     *> �I�[�_�[�i�����I�[�_�[���E���i���ɑޔ�����
017800     move quantity to orderQuantity productQuantity.
017900*=================================================================
018000*  �����t�̎擾�ƃI�[�_�[���t�̐ݒ�
018100*=================================================================
018200     move function current-date to ���ݓ��t����.
018300     move YMD-HMS to orderDate.
018400*
018500*=================================================================
018600*  ���i�ԍ����L�[�ɃI�[�_�[���ꂽ���i�̍݌ɂ��X�V���A�I�[�_�[��
018700*  �o�^���鏈�����Ăяo���B
018800*=================================================================
018900     call "�݌ɍX�V�I�[�_�[�o�^" using orderInfo
019000                                 returning returnValue.
019100     if returnValue not = zero then
019200       move "SystemError.html" to HTMLFilename
019300       go to �I���ʒu
019400     end-if.
019500*=================================================================
019600*  ���i�ԍ����L�[�ɃI�[�_�[���ꂽ���i�f�[�^��₢���킹��
019700*=================================================================
019800     call "���i�f�[�^�擾" using productInfo
019900                           returning returnValue.
020000     if returnValue not = zero then
020100       move "SystemError.html" to HTMLFilename
020200       go to �I���ʒu
020300     end-if.
020400*
020500*=================================================================
020600*  �I�[�_�[�\�̍쐬
020700*=================================================================
020800*
020900     *> �I�[�_�[�ԍ��̓o�^
021000     move "OrderNumber" to COBW3-CNV-NAME.
021100     move orderNumber to COBW3-CNV-VALUE.
021200     perform �ϊ��f�[�^�o�^.
021300*
021400     *> ���t�̓o�^
021500     move corresponding YMD-HMS to �I�[�_�[���t
021600     move "OrderYMD"   to COBW3-CNV-NAME.
021700     move �I�[�_�[���t to COBW3-CNV-VALUE.
021800     perform �ϊ��f�[�^�o�^.
021900*
022000     *> �I�[�_�[�\�w�b�_�̏o��
022100     move "OrderResultHead.html" to HTMLFilename.
022200     perform ��ʏo�͏���.
022300*
022400*  �e���ׂ̍쐬
022500     move zero to �ҏW���z �ҏW����.
022600     perform test before
022700        varying counter  from 1 by 1
022800         until counter > orderQuantity
022900       if orderProductNumber(counter) not = stockProductNumber(counter) or
023000          orderProductNumber(counter) not = productNumber(counter) then
023100         move "IlligalSystem.html" to HTMLFilename
023200         go to �I���ʒu
023300       end-if
023400*
023500       *> �ϊ��f�[�^�̃N���A
023600       call "COBW3_INIT_CNV" using COBW3
023700*
023800       *> �����ԍ��̓o�^
023900       move counter to ����
024000       move "Sequence" to COBW3-CNV-NAME
024100       move ����       to COBW3-CNV-VALUE
024200       perform �ϊ��f�[�^�o�^
024300*
024400       *> ���i�ԍ��̓o�^
024500       move "ProductNumber"             to COBW3-CNV-NAME
024600       move orderProductNumber(counter) to COBW3-CNV-VALUE
024700       perform �ϊ��f�[�^�o�^
024800*
024900       *> ���i���̓o�^
025000       move "ProductName"        to COBW3-CNV-NAME
025100       move productName(counter) to COBW3-CNV-VALUE
025200       perform �ϊ��f�[�^�o�^
025300*
025400       *> ���i���f�����̓o�^
025500       move "ProductModel"        to COBW3-CNV-NAME
025600       move productModel(counter) to COBW3-CNV-VALUE
025700       perform �ϊ��f�[�^�o�^
025800*
025900       *> �I�[�_�[���ʂ̓o�^
026000       move orderProductQuantity(counter) to �ҏW����
026100       move "ProductQuantity" to COBW3-CNV-NAME
026200       move �ҏW����          to COBW3-CNV-VALUE
026300       perform �ϊ��f�[�^�o�^
026400*
026500       *> �I�[�_�[���z�̓o�^
026600       compute ���z = orderProductQuantity(counter) *
026700                      productPrice(counter) / 1000
026800       move ���z to �ҏW���z
026900       move "ProductTotal" to COBW3-CNV-NAME
027000       move �ҏW���z       to COBW3-CNV-VALUE
027100       perform �ϊ��f�[�^�o�^
027200*
027300       *> ���z�E���ʂ̌v�Z
027400       compute ���z = ���z + ���z
027500       compute ���� = ���� + orderProductQuantity(counter)
027600*  ���ׂ̏o��
027700       move "OrderDetailParts.html" to HTMLFilename
027800       perform ��ʏo�͏���
027900     end-perform.
028000*
028100     *> ���ʂ̓o�^
028200     move ���� to �ҏW����.
028300     move "SummaryQuantity" to COBW3-CNV-NAME.
028400     move �ҏW����          to COBW3-CNV-VALUE.
028500     perform �ϊ��f�[�^�o�^.
028600*
028700     *> ���z�̓o�^
028800     move ���z to �ҏW���z.
028900     move "SummaryTotal" to COBW3-CNV-NAME.
029000     move �ҏW���z       to COBW3-CNV-VALUE.
029100     perform �ϊ��f�[�^�o�^.
029200*
029300     *>  �I�[�_�[�\�e�[���̏o�́i���ۂ̏o�͂͏I�������Łj
029400     move "OrderResultTail.html" to HTMLFilename.
029500*
029600*=================================================================
029700*  �G���[�y�[�W�܂��̓I�[�_�[�\�̃e�[�����o�͂��A�h�r�`�o�h�T�u
029800*  ���[�`����Ɨ̈���J�����āA�v���O�������I������B
029900*=================================================================
030000 �I���ʒu.
030100*
030200     perform ��ʏo�͏���.
030300*  �h�r�`�o�h�T�u���[�`����Ɨ̈�̉��
030400     call "COBW3_FREE" using COBW3.
030500*
030600 Entry-End.
030700*
030800     move 1 to program-status.
030900     exit program.
031000*=================================================================
031100*
031200*  ���������̒�`
031300*
031400*=================================================================
031500*
031600*=================================================================
031700*  �ϊ��f�[�^�o�^����
031800*=================================================================
031900 �ϊ��f�[�^�o�^ section.
032000     call "COBW3_SET_CNV_XX" using COBW3.
032100     if program-status not = zero then
032200         move "SystemError.html" to HTMLFilename
032300         perform ��ʏo�͏���
032400         go to �I���ʒu
032500     end-if.
032600 �ϊ��f�[�^�o�^�I��.
032700     exit.
032800*=================================================================
032900*  ��ʏo�͏���
033000*    ���ʏo�͗p�y�[�W�́A�A�v���P�[�V�������N�������ďo���p�y�[�W
033100*    �Ɠ����t�H���_�ɂ�����̂ƌ��Ȃ��B
033200*=================================================================
033300 ��ʏo�͏��� section.
033400     *>  �t���p�X�t�@�C�����̊���
033500     move space to COBW3-HTML-FILENAME.
033600     string pathName(1:pathSize) "\" delimited by size
033700            HTMLFilename             delimited by space
033800        into COBW3-HTML-FILENAME
033900     *>  HTML�����̏o��
034000     call "COBW3_PUT_HTML" using COBW3.
034100*
034200 ��ʏo�͏����I��.
034300     exit.
