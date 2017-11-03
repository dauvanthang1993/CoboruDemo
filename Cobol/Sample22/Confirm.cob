000100*=================================================================
000200* �u�}���`�X���b�h�v���O���~���O�v
000300*     �X���b�h�ԂŃt�@�C���E�f�[�^�����p���ăI�����C���V���b�s���O
000400*   �̃A�v���P�[�V�������\�z���܂��B
000500*
000600*=================================================================
000700*
000800*  �t�@�C�����F Confirm.cob
000900*  ����T�v  �F �I�[�_�[�m�F�\���쐬�E�o�͂��܂�
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
002200*
002300 01 succededUserID                pic X(32).
002400 01 pathName                      pic X(256).
002500 01 pathSize                      pic 9(05).
002600 01 HTMLFilename                  pic X(40).
002700 01 copyStartPos                  pic 9(05).
002800 01 counter                       pic 9(04).
002900 01 quantity                      pic 9(04).
003000 01 returnValue                   pic 9(09) comp-5.
003100 01 leftLength                    pic 9(05).
003200 01 ����                          pic 9(10).
003300 01 ����                          pic 9(02).
003400 01 ���z                          pic 9(10).
003500 01 ����                          pic 9(10).
003600 01 ���z                          pic 9(10).
003700 01 �ҏW���z                      pic Z(9)9.
003800 01 �ҏW���z                      pic Z(9)9.
003900 01 �ҏW����                      pic Z(9)9.
004000 01 �ҏW����                      pic Z(9)9.
004100*
004200 01 ProductNumberLabel.
004300    02 filler                     pic X(13) value "ProductNumber".
004400    02 ProductNumberLabelNumber   pic 9(02).
004500 01 numLabel.
004600    02 filler                     pic X(03) value "num".
004700    02 numLabelNumber             pic 9(02).
004800*----------------------------------------------------------------*
004900* SAF�A�v���ւ̈ڍs�ɂ���                                      *
005000*                                                                *
005100*    SAF�A�v���Ɉڍs����ۂ́A�A���߂Ǝ葱�������C������K�v��   *
005200*  ����܂��B�C���^�t�F�[�X�̈��SAF�T�u���[�`���Ŏg�p���邽�߁A *
005300*  SAF�T�u���[�`���Ƃ̃C���^�t�F�[�X�ł���COBW3�ɂ��̃A�h���X    *
005400*  ��ݒ肷��K�v������܂��B                                    *
005500*                                                                *
005600*  [�⑫]                                                        *
005700*    SAF�A�v���̏ꍇ�́ANSAPI�J�n����I���܂ł̃R�����g���O���A  *
005800*  ISAPI�J�n����I���܂ł��R�����g�����Ă��������B               *
005900*                                                                *
006000*----------------------------------------------------------------*
006100*
006200*---------------------   �h�r�`�o�h �J�n  -----------------------*
006300 linkage section.
006400     copy IsapiCtx.
006500*
006600 procedure division with stdcall linkage using ISAPI-CTX-CNT.
006700*
006800 Auth-Start.
006900*
007000*  �h�r�`�o�h�T�u���[�`���p�����^��̏�����
007100     move low-value to COBW3.
007200     move function addr(ISAPI-CTX-CNT) to COBW3-CONTEXT.
007300*---------------------   �h�r�`�o�h �I��  -----------------------*
007400*
007500*---------------------   �m�r�`�o�h �J�n  -----------------------*
007600*linkage section.
007700*01 safpt                         pointer.
007800**
007900* procedure division using safpt.
008000**
008100*Auth-Start.
008200**
008300**  �m�r�`�o�h�T�u���[�`���p�����^��̏�����
008400*    move low-value to COBW3.
008500*    move safpt     to COBW3-CONTEXT.
008600*---------------------   �m�r�`�o�h �I��  -----------------------*
008700*
008800*=================================================================
008900*  �h�r�`�o�h�T�u���[�`����Ɗ������������A�v�����p�����^��
009000*  �l������
009100*=================================================================
009200     call "COBW3_INIT" using COBW3.
009300*
009400*=================================================================
009500*  �P�̃y�[�W�𕡐���ɕ����ďo�͂���̂ŁA�����p�X���擾����
009600*  �����B�Ȃ��A���ʏo�͗p�y�[�W�́A�A�v�����N�������ďo���p�y�[�W
009700*  �Ɠ����t�H���_�ɂ�����̂ƌ��Ȃ��B
009800*=================================================================
009900     move space to pathName.
010000     set COBW3-PHYSICALPATH to true.
010100     call "COBW3_GET_REQUEST_INFO" using COBW3.
010200     if COBW3-STATUS = zero then
010300       move COBW3-REQUEST-INFO to pathName
010400       move COBW3-REQUEST-INFO-LENGTH to pathSize
010500     end-if.
010600*
010700*  ���[�UID�̎擾
010800*=================================================================
010900*  �b�����������ɂ���āA�F�؏�������User-ID�������p��
011000*=================================================================
011100     move "Online Store User-ID" to COBW3-COOKIE-NAME.
011200     call "COBW3_GET_COOKIE_XX" using COBW3.
011300     if COBW3-SEARCH-FLAG-NON then
011400         move "IlligalAccess.html" to HTMLFilename
011500         go to �I���ʒu
011600     end-if.
011700*=================================================================
011800*  ���̏����p��User-ID���b�����������ɏo�͂���
011900*=================================================================
012000     call "COBW3_SET_COOKIE_XX" using COBW3.
012100     if program-status not = zero then
012200         move "SystemError.html" to HTMLFilename
012300         go to �I���ʒu
012400     end-if.
012500*=================================================================
012600*  �v�����p�����^���������A�I�[�_�[���ʂ��O�łȂ����̂̐��i�ԍ�
012700*  �ƃI�[�_�[���ʂ��擾����
012800*=================================================================
012900     move zero to quantity.
013000     perform test before
013100             varying counter
013200             from 1 by 1 until counter > 20
013300*
013400       *> numXX(XX=1�`20)���L�[�ɃI�[�_�[���ʂ���������
013500       move counter to numLabelNumber
013600       move numLabel to COBW3-SEARCH-DATA
013700       call "COBW3_GET_VALUE_XX" using COBW3
013800       if program-status not = zero then
013900         move  "SystemError.html" to HTMLFilename
014000         go to �I���ʒu
014100       end-if
014200*
014300       *> �I�[�_�[���ʂ��O�łȂ��Ȃ�A���i�ԍ��𓾂�
014400       if COBW3-SEARCH-FLAG-EXIST then
014500         compute ���� = function NUMVAL(COBW3-GET-DATA)
014600         if ���� not = zero then
014700           move counter to ProductNumberLabelNumber
014800           move ProductNumberLabel to COBW3-SEARCH-DATA
014900           call "COBW3_GET_VALUE_XX" using COBW3
015000           if program-status not = zero then
015100             move "SystemError.html" to HTMLFilename
015200             go to �I���ʒu
015300           end-if
015400*
015500           *> ���i�ԍ����݌ɁE�I�[�_�[�E���i���ɑޔ�����
015600           if COBW3-SEARCH-FLAG-EXIST then
015700             add 1 to  quantity
015800             move COBW3-GET-DATA to stockProductNumber(quantity)
015900                                    orderProductNumber(quantity)
016000                                    productNumber(quantity)
016100             move ���� to orderProductQuantity(quantity)
016200           end-if
016300         end-if
016400       else            *> �v�����p�����^�ɊY�����閼�O���Ȃ��Ȃ�A
016500         exit perform  *> �f�[�^�̏I���ɒB�����̂Ń��[�v��E�o
016600       end-if
016700     end-perform.
016800*
016900     *> �I�[�_�[�i�����݌ɁE�I�[�_�[�E���i���ɑޔ�����
017000     move quantity to stockQuantity
017100                      orderQuantity
017200                      productQuantity.
017300*
017400*=================================================================
017500*  ���i�ԍ����L�[�ɃI�[�_�[���ꂽ���i�̍݌ɂ�₢���킹��
017600*=================================================================
017700     call "�݌ɖ⍇�킹" using stockInfo
017800                         returning returnValue.
017900*
018000*=================================================================
018100*  �݌ɖ₢���킹�ɐ���������A�݌ɗʂ̊m�F���s���B
018200*=================================================================
018300     if returnValue = 0 then
018400       perform test before
018500          varying counter from 1 by 1
018600                  until counter > orderQuantity
018700         if stockProductQuantity(counter) <
018800            orderProductQuantity(counter) then
018900           move "ShortageStock.html" to HTMLFilename
019000           go to �I���ʒu
019100         end-if
019200       end-perform
019300     else
019400       move "SystemError.hmtl" to HTMLFilename
019500       go to �I���ʒu
019600     end-if
019700*
019800*=================================================================
019900*  ���i�ԍ����L�[�ɃI�[�_�[���ꂽ���i�f�[�^��₢���킹��
020000*=================================================================
020100     call "���i�f�[�^�擾" using productInfo
020200                           returning returnValue.
020300     if returnValue not = zero then
020400       move "SystemError.html" to HTMLFilename
020500       go to �I���ʒu
020600     end-if.
020700*
020800*=================================================================
020900*  �I�[�_�[�\�̍쐬
021000*=================================================================
021100*
021200     *> �I�[�_�[�\�̃w�b�_�����o�͂���
021300     move "ConfirmHead.html" to HTMLFilename.
021400     perform ��ʏo�͏���.
021500*
021600     *> �I�[�_�[�\�̃{�f�B�����P�s���쐬�E�o�͂���
021700     move zero to ���z ����.
021800     perform varying counter
021900           from 1 by 1 until counter > orderQuantity
022000       if orderProductNumber(counter) not = stockProductNumber(counter) or
022100          orderProductNumber(counter) not = productNumber(counter)      then
022200         move "IlligalSystem.html" to HTMLFilename
022300         go to �I���ʒu
022400       end-if
022500*
022600       *>  �ϊ��f�[�^�̃N���A
022700       call "COBW3_INIT_CNV" using COBW3
022800*
022900       *>  �����ԍ��̓o�^
023000       move counter to ����
023100       move "Sequence" to COBW3-CNV-NAME
023200       move ����       to COBW3-CNV-VALUE
023300       perform �ϊ��f�[�^�o�^
023400*
023500       *>  ���i�ԍ��̓o�^
023600       move "ProductNumber"             to COBW3-CNV-NAME
023700       move orderProductNumber(counter) to COBW3-CNV-VALUE
023800       perform �ϊ��f�[�^�o�^
023900*
024000       *>  ���i���̓o�^
024100       move "ProductName"        to COBW3-CNV-NAME
024200       move productName(counter) to COBW3-CNV-VALUE
024300       perform �ϊ��f�[�^�o�^
024400*
024500       *>  ���i���f�����̓o�^
024600       move "ProductModel"        to COBW3-CNV-NAME
024700       move productModel(counter) to COBW3-CNV-VALUE
024800       perform �ϊ��f�[�^�o�^
024900*
025000       *>  �I�[�_�[���ʂ̓o�^
025100       move orderProductQuantity(counter) to �ҏW����
025200       move "ProductQuantity" to COBW3-CNV-NAME
025300       move �ҏW����          to COBW3-CNV-VALUE
025400       perform �ϊ��f�[�^�o�^
025500*
025600       *>  �I�[�_�[���z�̓o�^
025700       compute ���z = orderProductQuantity(counter) *
025800                      productPrice(counter) / 1000
025900       move ���z to �ҏW���z
026000       move "ProductTotal" to COBW3-CNV-NAME
026100       move  �ҏW���z      to COBW3-CNV-VALUE
026200       perform �ϊ��f�[�^�o�^
026300*
026400       *>  ���z�E���ʂ̌v�Z
026500       compute ���z = ���z + ���z
026600       compute ���� = ���� + orderProductQuantity(counter)
026700*
026800       *>  �I�[�_�[�\�{�f�B���P�s�̏o��
026900       move "ConfirmDetailParts.html" to HTMLFilename
027000       perform ��ʏo�͏���
027100     end-perform.
027200*
027300*  ���ʂ̓o�^
027400     move ����              to �ҏW����
027500     move "SummaryQuantity" to COBW3-CNV-NAME.
027600     move �ҏW����          to COBW3-CNV-VALUE.
027700     perform �ϊ��f�[�^�o�^.
027800*
027900*  ���z�̓o�^
028000     move ���z           to �ҏW���z
028100     move "SummaryTotal" to COBW3-CNV-NAME.
028200     move �ҏW���z       to COBW3-CNV-VALUE.
028300     perform �ϊ��f�[�^�o�^.
028400*
028500     *>  �I�[�_�[�\�e�[���̏o�́i���ۂ̏o�͂͏I�������Łj
028600     move "ConfirmTail.html" to HTMLFilename.
028700*
028800*=================================================================
028900*  �G���[�y�[�W�܂��̓I�[�_�[�\�̃e�[�����o�͂��A�h�r�`�o�h�T�u
029000*  ���[�`����Ɨ̈���J�����āA�v���O�������I������B
029100*=================================================================
029200 �I���ʒu.
029300     perform ��ʏo�͏���.
029400*  �h�r�`�o�h�T�u���[�`����Ɨ̈�̉��
029500     call "COBW3_FREE" using COBW3.
029600*
029700 Confirm-End.
029800*
029900     move 1 to program-status.
030000     exit program.
030100*
030200*=================================================================
030300*
030400*  ���������̒�`
030500*
030600*=================================================================
030700*
030800*=================================================================
030900*  �ϊ��f�[�^�o�^����
031000*=================================================================
031100 �ϊ��f�[�^�o�^ section.
031200     call "COBW3_SET_CNV_XX" using COBW3.
031300     if program-status not = zero then
031400         move "SystemError.html" to HTMLFilename
031500         go to �I���ʒu
031600     end-if.
031700 �ϊ��f�[�^�o�^�I��.
031800     exit.
031900*=================================================================
032000*  ��ʏo�͏���
032100*    ���ʏo�͗p�y�[�W�́A�A�v���P�[�V�������N�������ďo���p�y�[�W
032200*    �Ɠ����t�H���_�ɂ�����̂ƌ��Ȃ��B
032300*=================================================================
032400 ��ʏo�͏��� section.
032500     *>  �t���p�X�t�@�C�����̊���
032600     move space to COBW3-HTML-FILENAME.
032700     string pathName(1:pathSize) "\" delimited by size
032800            HTMLFilename             delimited by space
032900        into COBW3-HTML-FILENAME
033000     *>  HTML�����̏o��
033100     call "COBW3_PUT_HTML" using COBW3.
033200*
033300 ��ʏo�͏����I��.
033400     exit.
