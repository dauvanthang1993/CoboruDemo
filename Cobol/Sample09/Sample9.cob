000100* Copyright 1992-2015 FUJITSU LIMITED
000200 IDENTIFICATION           DIVISION.
000300 PROGRAM-ID.              SAMPLE9.
000400*－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－*
000500*【印刷サンプルでお見せする項目概要】　　　　　　　　　　　　　　　　　　　　　　　　*
000600*　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*
000700*　１．ＦＣＢを使用した６ＬＰＩ／８ＬＰＩでの帳票サンプル印刷。　　　　　　　　　　　*
000800*　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*
000900*　　◆Ａ４用紙を横向きに使用し、１ページ全ての行間隔を６ＬＰＩとした場合の帳票をイ　*
001000*　　　メージし、６ＬＰＩ／１０ＣＰＩフォーマットのスぺーシングチャート形式のフォー　*
001100*　　　ムオーバレイと重畳印刷します。　　　　　　　　　　　　　　　　　　　　　　　　*
001200*　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*
001300*　　◆Ａ４用紙を横向きに使用し、１ページ全ての行間隔を８ＬＰＩとした場合の帳票をイ　*
001400*　　　メージし、８ＬＰＩ／１０ＣＰＩフォーマットのスぺーシングチャート形式のフォー　*
001500*　　　ムオーバレイと重畳印刷します。　　　　　　　　　　　　　　　　　　　　　　　　*
001600*　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*
001700*　２．ＣＨＡＲＡＣＴＥＲ　ＴＹＰＥ句で指定する様々な文字属性のサンプリング印刷。　　*
001800*　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*
001900*　　◆あらゆる文字サイズを使用した印刷　　　　　　　　　　　　　　　　　　　　　　　*
002000*　　　１文字づつ３ポ、７．２ポ、９ポ、１２ポ、１８ポ、２４ポ、３６ポ、５０ポ、　　　*
002100*　　　７２ポ、１００ポ、２００ポ、３００ポの文字サイズを指定します。　　　　　　　　*
002200*　　　※ここでは、文字ピッチ指定を省略し、文字サイズに合わせた最適な文字ピッチを　　*
002300*　　　　ＣＯＢＯＬランタイムシステムに自動算出・配置させます。　　　　　　　　　　　*
002400*　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*
002500*　　◆あらゆる文字ピッチを使用した印刷　　　　　　　　　　　　　　　　　　　　　　　*
002600*　　　文字ピッチ１ＣＰＩで１文字、２ＣＰＩで２文字、３ＣＰＩで３文字、　　　　　　　*
002700*　　　５ＣＰＩで５文字、６ＣＰＩで６文字、７．５ＣＰＩで１５文字、　　　　　　　　　*
002800*　　　２０ＣＰＩで２０文字、２４ＣＰＩで２４文字指定します。　　　　　　　　　　　　*
002900*　　　※ここでは、文字サイズ指定を省略し、文字ピッチに合わせた最適な文字サイズを　　*
003000*　　　　ＣＯＢＯＬランタイムシステムに自動算出・印字させます。　　　　　　　　　　　*
003100*　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*
003200*　　◆複数の書体を使用した印刷　　　　　　　　　　　　　　　　　　　　　　　　　　　*
003300*　　　ゴシック、ゴシック半角（文字形態半角）、明朝、明朝半角（文字形態半角）を１０　*
003400*　　　文字づつ２回繰り返します。　　　　　　　　　　　　　　　　　　　　　　　　　　*
003500*　　　※ここで指定した書体名は、以下の実行環境情報に関連づけられています。　　　　　*
003600*　　　　＠ＰｒｉｎｔｅｒＦｏｎｔＮａｍｅ＝（フォント名１，フォント名２）　　　　　　*
003700*　　　　「ＭＩＮＣＨＯＵ」／「ＭＩＮＣＨＯＵ－ＨＡＮＫＡＫＵ」を指定したデータ項目　*
003800*　　　　は「フォント名１」に指定されたフォントを用いて印字され、　　　　　　　　　　*
003900*　　　　「ＧＯＴＨＩＣ」／「ＧＯＴＨＩＣ－ＨＡＮＫＡＫＵ」を指定したデータ項目は　　*
004000*　　　　「フォント名２」に指定されたフォントを用いて印字されます。　　　　　　　　　*
004100*　　　　本サンプルでは、＠ＰｒｉｎｔｅｒＦｏｎｔＮａｍｅ＝（ＭＳ明朝，ＭＳゴシック）*
004200*　　　　を指定しています。　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*
004300*　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*
004400*　　◆文字回転を使用した印刷　　　　　　　　　　　　　　　　　　　　　　　　　　　　*
004500*　　　縦書き（反時計回りに９０度回転）、横書きを１０文字づつ繰り返します。　　   　 *
004600*　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*
004700*　　◆あらゆる文字形態を使用した印刷　　　　　　　　　　　　　　　　　　　　　　　　*
004800*　　　全角、半角、全角平体、半角平体、全角長体、半角長体、全角倍角、半各倍角の文字　*
004900*　　　形態指定を９文字づつ指定します。　　　　　　　　　　　　　　　　　　　　　　　*
005000*　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*
005100*　　◆上記５つの文字属性を組み合わせた印刷を行います。　　　　　　　　　　　　　　　*
005200*　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*
005300*－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－*
005400 ENVIRONMENT              DIVISION.
005500 CONFIGURATION            SECTION.
005600 SPECIAL-NAMES.
005700*----------------------------------------------------------------------------------*
005800* 制御レコードを示す機能名とそれに対応する呼び名を宣言。
005900*----------------------------------------------------------------------------------*
006000     CTL IS PAGE-CNTL
006100*----------------------------------------------------------------------------------*
006200* ＦＣＢを使用した帳票サンプルに使用する機能名とその呼び名を宣言。
006300*----------------------------------------------------------------------------------*
006400* ６ＬＰＩの帳票に使用
006500* １２ポ／５ＣＰＩ／明朝／横書き／長体
006600     PRINTING MODE OOMIDASHI6 IS FOR ALL
006700                    IN   SIZE  012.0 POINT
006800                    AT   PITCH 05.00 CPI
006900                    WITH FONT  MINCHOU
007000                    AT   ANGLE 00 DEGREES
007100                    BY   FORM  F0102
007200* １２ポ／５ＣＰＩ／明朝／横書き／全角
007300     PRINTING MODE KOMIDASHI6 IS FOR ALL
007400                    IN   SIZE  012.0 POINT
007500                    AT   PITCH 05.00 CPI
007600                    WITH FONT  MINCHOU
007700                    AT   ANGLE 00 DEGREES
007800                    BY   FORM  F
007900* １０．５ポ／１０ＣＰＩ／ゴシック／横書き／全角
008000     PRINTING MODE MEISAIANK6 IS FOR ALL
008100                    IN   SIZE  010.5 POINT
008200                    AT   PITCH 10.00 CPI
008300                    WITH FONT  GOTHIC
008400                    AT   ANGLE 00 DEGREES
008500                    BY   FORM  F
008600* １０．５ポ／５ＣＰＩ／明朝／横書き／全角
008700     PRINTING MODE MEISAIJP16 IS FOR ALL
008800                    IN   SIZE  010.5 POINT
008900                    AT   PITCH 05.00 CPI
009000                    WITH FONT  MINCHOU
009100                    AT   ANGLE 00 DEGREES
009200                    BY   FORM  F
009300* ７．２ポ／１０ＣＰＩ／明朝／横書き／全角
009400     PRINTING MODE MEISAIJP26 IS FOR ALL
009500                    IN   SIZE  006.0 POINT
009600                    AT   PITCH 10.00 CPI
009700                    WITH FONT  MINCHOU
009800                    AT   ANGLE 00 DEGREES
009900                    BY   FORM  F0102
010000*
010100* ８ＬＰＩの帳票に使用
010200* ９ポ／５ＣＰＩ／明朝／横書き／長体
010300     PRINTING MODE OOMIDASHI8 IS FOR ALL
010400                    IN   SIZE  009.0 POINT
010500                    AT   PITCH 05.00 CPI
010600                    WITH FONT  MINCHOU
010700                    AT   ANGLE 00 DEGREES
010800                    BY   FORM  F0102
010900* ９ポ／５ＣＰＩ／明朝／横書き／全角
011000     PRINTING MODE KOMIDASHI8 IS FOR ALL
011100                    IN   SIZE  009.0 POINT
011200                    AT   PITCH 05.00 CPI
011300                    WITH FONT  MINCHOU
011400                    AT   ANGLE 00 DEGREES
011500                    BY   FORM  F
011600* ７．２ポ／１０ＣＰＩ／ゴシック／横書き／全角
011700     PRINTING MODE MEISAIANK8 IS FOR ALL
011800                    IN   SIZE  007.2 POINT
011900                    AT   PITCH 10.00 CPI
012000                    WITH FONT  GOTHIC
012100                    AT   ANGLE 00 DEGREES
012200                    BY   FORM  F
012300* ７．２ポ／５ＣＰＩ／明朝／横書き／全角
012400     PRINTING MODE MEISAIJP18 IS FOR ALL
012500                    IN   SIZE  007.2 POINT
012600                    AT   PITCH 05.00 CPI
012700                    WITH FONT  MINCHOU
012800                    AT   ANGLE 00 DEGREES
012900                    BY   FORM  F
013000* ７．２ポ／１０ＣＰＩ／明朝／横書き／全角
013100     PRINTING MODE MEISAIJP28 IS FOR ALL
013200                    IN   SIZE  007.2 POINT
013300                    AT   PITCH 10.00 CPI
013400                    WITH FONT  MINCHOU
013500                    AT   ANGLE 00 DEGREES
013600                    BY   FORM  F
013700*----------------------------------------------------------------------------------*
013800* 文字サイズを示す機能名とそれに対応する呼び名を宣言。
013900*----------------------------------------------------------------------------------*
014000* ３．０ポ
014100     PRINTING MODE PMSIZE01 IS FOR ALL
014200                    IN   SIZE   3   POINT
014300* ７．２ポ
014400     PRINTING MODE PMSIZE02 IS FOR ALL
014500                    IN   SIZE   7.2 POINT
014600* ９．０ポ
014700     PRINTING MODE PMSIZE03 IS FOR ALL
014800                    IN   SIZE   9   POINT
014900* １２．０ポ
015000     PRINTING MODE PMSIZE04 IS FOR ALL
015100                    IN   SIZE  12   POINT
015200* １８．０ポ
015300     PRINTING MODE PMSIZE05 IS FOR ALL
015400                    IN   SIZE  18   POINT
015500* ２４．０ポ
015600     PRINTING MODE PMSIZE06 IS FOR ALL
015700                    IN   SIZE  24   POINT
015800* ３６．０ポ
015900     PRINTING MODE PMSIZE07 IS FOR ALL
016000                    IN   SIZE  36   POINT
016100* ５０．０ポ
016200     PRINTING MODE PMSIZE08 IS FOR ALL
016300                    IN   SIZE  50   POINT
016400* ７２．０ポ
016500     PRINTING MODE PMSIZE09 IS FOR ALL
016600                    IN   SIZE  72   POINT
016700* １００．０ポ
016800     PRINTING MODE PMSIZE10 IS FOR ALL
016900                    IN   SIZE 100   POINT
017000* ２００．０ポ
017100     PRINTING MODE PMSIZE11 IS FOR ALL
017200                    IN   SIZE 200   POINT
017300* ３００．０ポ
017400     PRINTING MODE PMSIZE12 IS FOR ALL
017500                    IN   SIZE 300   POINT
017600*----------------------------------------------------------------------------------*
017700* 文字ピッチを示す機能名とそれに対応する呼び名を宣言。
017800*----------------------------------------------------------------------------------*
017900* １．００ＣＰＩ
018000     PRINTING MODE PMPICH01 IS FOR ALL
018100                    AT   PITCH  1   CPI
018200* ２．００ＣＰＩ
018300     PRINTING MODE PMPICH02 IS FOR ALL
018400                    AT   PITCH  2   CPI
018500* ３．００ＣＰＩ
018600     PRINTING MODE PMPICH03 IS FOR ALL
018700                    AT   PITCH  3   CPI
018800* ５．００ＣＰＩ
018900     PRINTING MODE PMPICH04 IS FOR ALL
019000                    AT   PITCH  5   CPI
019100* ６．００ＣＰＩ
019200     PRINTING MODE PMPICH05 IS FOR ALL
019300                    AT   PITCH  6   CPI
019400* ７．５０ＣＰＩ
019500     PRINTING MODE PMPICH06 IS FOR ALL
019600                    AT   PITCH  7.5 CPI
019700* ８．００ＣＰＩ
019800     PRINTING MODE PMPICH07 IS FOR ALL
019900                    AT   PITCH  8   CPI
020000* １０．００ＣＰＩ
020100     PRINTING MODE PMPICH08 IS FOR ALL
020200                    AT   PITCH 10   CPI
020300* １２．００ＣＰＩ
020400     PRINTING MODE PMPICH09 IS FOR ALL
020500                    AT   PITCH 12   CPI
020600* １５．００ＣＰＩ
020700     PRINTING MODE PMPICH10 IS FOR ALL
020800                    AT   PITCH 15   CPI
020900* ２０．００ＣＰＩ
021000     PRINTING MODE PMPICH11 IS FOR ALL
021100                    AT   PITCH 20   CPI
021200* ２４．００ＣＰＩ
021300     PRINTING MODE PMPICH12 IS FOR ALL
021400                    AT   PITCH 24   CPI
021500*----------------------------------------------------------------------------------*
021600* 書体を示す機能名とそれに対応する呼び名を宣言。
021700*----------------------------------------------------------------------------------*
021800* ＧＯＴＨＩＣ
021900     PRINTING MODE PMFONT01 IS FOR ALL
022000                    WITH FONT   GOTHIC
022100* ＧＯＴＨＩＣ－ＨＡＮＫＡＫＵ
022200     PRINTING MODE PMFONT02 IS FOR ALL
022300                    WITH FONT   GOTHIC-HANKAKU
022400                    BY   FORM   H
022500* ＭＩＮＣＨＯＵ
022600     PRINTING MODE PMFONT03 IS FOR ALL
022700                    WITH FONT   MINCHOU
022800* ＭＩＮＣＨＯＵ－ＨＡＮＫＡＫＵ
022900     PRINTING MODE PMFONT04 IS FOR ALL
023000                    WITH FONT   MINCHOU-HANKAKU
023100                    BY   FORM   H
023200*----------------------------------------------------------------------------------*
023300* 文字回転を示す機能名とそれに対応する呼び名を宣言。
023400*----------------------------------------------------------------------------------*
023500* 横書き
023600     PRINTING MODE PMANGL01 IS FOR ALL
023700                    AT   ANGLE  0   DEGREES
023800* 縦書き（反時計回りに９０度回転）
023900     PRINTING MODE PMANGL02 IS FOR ALL
024000                    AT   ANGLE  90  DEGREES
024100*----------------------------------------------------------------------------------*
024200* 文字形態を示す機能名とそれに対応する呼び名を宣言。
024300*----------------------------------------------------------------------------------*
024400* 全角
024500     PRINTING MODE PMFORM01 IS FOR ALL
024600                    BY   FORM   F
024700* 半角
024800     PRINTING MODE PMFORM02 IS FOR ALL
024900                    BY   FORM   H
025000                    WITH FONT   GOTHIC-HANKAKU
025100* 全角平体
025200     PRINTING MODE PMFORM03 IS FOR ALL
025300                    BY   FORM   F0201
025400* 半角平体
025500     PRINTING MODE PMFORM04 IS FOR ALL
025600                    BY   FORM   H0201
025700                    WITH FONT   GOTHIC-HANKAKU
025800* 全角長体
025900     PRINTING MODE PMFORM05 IS FOR ALL
026000                    BY   FORM   F0102
026100* 半角長体
026200     PRINTING MODE PMFORM06 IS FOR ALL
026300                    BY   FORM   H0102
026400                    WITH FONT   GOTHIC-HANKAKU
026500* 全角倍角
026600     PRINTING MODE PMFORM07 IS FOR ALL
026700                    BY   FORM   F0202
026800* 半角倍角
026900     PRINTING MODE PMFORM08 IS FOR ALL
027000                    BY   FORM   H0202
027100                    WITH FONT   GOTHIC-HANKAKU
027200*----------------------------------------------------------------------------------*
027300* あらゆる文字属性の組合せを示す機能名とそれに対応する呼び名を宣言。
027400*----------------------------------------------------------------------------------*
027500* ９ポ／８ＣＰＩ／ＭＩＮＣＨＯＵ／横書き／全角
027600     PRINTING MODE PRTMODE1 IS FOR ALL
027700                    IN   SIZE   9   POINT
027800                    AT   PITCH  8   CPI
027900                    WITH FONT   MINCHOU
028000                    AT   ANGLE  0   DEGREES
028100                    BY   FORM   F
028200* ７．２ポ／２０ＣＰＩ／ＧＯＴＨＩＣ－ＨＡＮＫＡＫＵ／横書き／半角
028300     PRINTING MODE PRTMODE2 IS FOR ALL
028400                    IN   SIZE   7.2 POINT
028500                    AT   PITCH  20  CPI
028600                    WITH FONT   GOTHIC-HANKAKU
028700                    AT   ANGLE  0   DEGREES
028800                    BY   FORM   H
028900* １２ポ／２．５ＣＰＩ／ＧＯＴＨＩＣ／縦書き／倍角
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
030000     SELECT 印刷ファイル ASSIGN TO PRINTER
030100            ORGANIZATION IS SEQUENTIAL
030200            ACCESS MODE  IS SEQUENTIAL
030300            FILE STATUS  IS 入出力状態.
030400*----------------------------------------------------------------------------------*
030500 DATA                     DIVISION.
030600*
030700 FILE                     SECTION.
030800*
030900 FD  印刷ファイル.
031000 01  行レコード           PIC N(136).
031100 01  注釈レコード         PIC N(050).
031200 01  制御レコード         PIC X(100).
031300*
031400 WORKING-STORAGE          SECTION.
031500* ＦＣＢを使用した帳票サンプルに使用するデータ宣言
031600 01  大見出し６           CHARACTER TYPE    IS OOMIDASHI6
031700                          PRINTING POSITION IS 36
031800                          PIC N(020)
031900                          VALUE NC"ＦＣＢを使用した６ＬＰＩでの帳票サンプル".
032000 01  小見出し６           CHARACTER TYPE    IS KOMIDASHI6.
032100   02  FILLER             PIC N(002)
032200                          VALUE NC"項番".
032300   02  FILLER             PRINTING POSITION IS 11
032400                          PIC N(005)
032500                          VALUE NC"商品コード".
032600   02  FILLER             PRINTING POSITION IS 27
032700                          PIC N(003)
032800                          VALUE NC"商品名".
032900   02  FILLER             PRINTING POSITION IS 57
033000                          PIC N(002)
033100                          VALUE NC"単価".
033200   02  FILLER             PRINTING POSITION IS 67
033300                          PIC N(004)
033400                          VALUE NC"出荷本数".
033500   02  FILLER             PRINTING POSITION IS 81
033600                          PIC N(004)
033700                          VALUE NC"在庫数量".
033800   02  FILLER             PRINTING POSITION IS 95
033900                          PIC N(002)
034000                          VALUE NC"備考".
034100 01  明細６.
034200   02  項番               CHARACTER TYPE IS MEISAIANK6
034300                          PIC 9(004)
034400                          VALUE 9999.
034500   02  商品コード         CHARACTER TYPE IS MEISAIANK6
034600                          PRINTING POSITION IS 11
034700                          PIC X(010)
034800                          VALUE "XXXXXXXXXX".
034900   02  商品名             CHARACTER TYPE IS MEISAIJP16
035000                          PRINTING POSITION IS 27
035100                          PIC N(010)
035200                          VALUE NC"ＮＮＮＮＮＮＮＮＮＮ".
035300   02  単価               CHARACTER TYPE IS MEISAIANK6
035400                          PRINTING POSITION IS 53
035500                          PIC X(008)
035600                          VALUE "\9999999".
035700   02  出荷本数           CHARACTER TYPE IS MEISAIANK6
035800                          PRINTING POSITION IS 67
035900                          PIC 9(008)
036000                          VALUE 99999999.
036100   02  在庫数量           CHARACTER TYPE IS MEISAIANK6
036200                          PRINTING POSITION IS 81
036300                          PIC 9(008)
036400                          VALUE 99999999.
036500   02  備考               CHARACTER TYPE IS MEISAIJP26
036600                          PRINTING POSITION IS 95
036700                          PIC N(016)
036800                          VALUE NC"この行は６ＬＰＩで印字されます。".
036900 01  大見出し８           CHARACTER TYPE    IS OOMIDASHI8
037000                          PRINTING POSITION IS 36
037100                          PIC N(020)
037200                          VALUE NC"ＦＣＢを使用した８ＬＰＩでの帳票サンプル".
037300 01  小見出し８           CHARACTER TYPE    IS KOMIDASHI8.
037400   02  FILLER             PIC N(002)
037500                          VALUE NC"項番".
037600   02  FILLER             PRINTING POSITION IS 11
037700                          PIC N(005)
037800                          VALUE NC"商品コード".
037900   02  FILLER             PRINTING POSITION IS 27
038000                          PIC N(003)
038100                          VALUE NC"商品名".
038200   02  FILLER             PRINTING POSITION IS 57
038300                          PIC N(002)
038400                          VALUE NC"単価".
038500   02  FILLER             PRINTING POSITION IS 67
038600                          PIC N(004)
038700                          VALUE NC"出荷本数".
038800   02  FILLER             PRINTING POSITION IS 81
038900                          PIC N(004)
039000                          VALUE NC"在庫数量".
039100   02  FILLER             PRINTING POSITION IS 95
039200                          PIC N(002)
039300                          VALUE NC"備考".
039400 01  明細８.
039500   02  項番               CHARACTER TYPE IS MEISAIANK8
039600                          PIC 9(004)
039700                          VALUE 9999.
039800   02  商品コード         CHARACTER TYPE IS MEISAIANK8
039900                          PRINTING POSITION IS 11
040000                          PIC X(010)
040100                          VALUE "XXXXXXXXXX".
040200   02  商品名             CHARACTER TYPE IS MEISAIJP18
040300                          PRINTING POSITION IS 27
040400                          PIC N(010)
040500                          VALUE NC"ＮＮＮＮＮＮＮＮＮＮ".
040600   02  単価               CHARACTER TYPE IS MEISAIANK8
040700                          PRINTING POSITION IS 53
040800                          PIC X(008)
040900                          VALUE "\9999999".
041000   02  出荷本数           CHARACTER TYPE IS MEISAIANK8
041100                          PRINTING POSITION IS 67
041200                          PIC 9(008)
041300                          VALUE 99999999.
041400   02  在庫数量           CHARACTER TYPE IS MEISAIANK8
041500                          PRINTING POSITION IS 81
041600                          PIC 9(008)
041700                          VALUE 99999999.
041800   02  備考               CHARACTER TYPE IS MEISAIJP28
041900                          PRINTING POSITION IS 95
042000                          PIC N(016)
042100                          VALUE NC"この行は８ＬＰＩで印字されます。".
042200*
042300* 注釈として使用するデータ宣言
042400 01  見出しデータ１       PIC N(050) CHARACTER TYPE IS MODE-1
042500                          VALUE NC"富士通ＮｅｔＣＯＢＯＬ　ＦＯＲＭＡＴ句なし印刷ファイル".
042600 01  見出しデータ２       PIC N(050) CHARACTER TYPE IS PMPICH01
042700                          VALUE NC"各種文字属性印字サンプル集".
042800 01  注釈データ１         PIC N(050) CHARACTER TYPE IS MODE-1
042900                          VALUE NC"◆あらゆる文字サイズを使用した印刷例。".
043000 01  注釈データ２         PIC N(050) CHARACTER TYPE IS MODE-1
043100                          VALUE NC"◆あらゆる文字ピッチを使用した印刷例。".
043200 01  注釈データ３         PIC N(050) CHARACTER TYPE IS MODE-1
043300                          VALUE NC"◆複数の書体を使用した印刷例。".
043400 01  注釈データ４         PIC N(100) CHARACTER TYPE IS MODE-1
043500                          VALUE NC"◆文字回転を使用した印刷例。".
043600 01  注釈データ５         PIC N(100) CHARACTER TYPE IS MODE-1
043700                          VALUE NC"◆あらゆる文字形態を使用した印刷例。".
043800 01  注釈データ６         PIC N(100) CHARACTER TYPE IS MODE-1
043900                          VALUE NC"◆様々な文字属性を組み合わせた（混在）印刷例。".
044000* 文字サイズを指定したデータ宣言
044100 01  文字サイズデータ.
044200   02                     PIC N(001) CHARACTER TYPE IS PMSIZE01
044300                          VALUE NC"あ".
044400   02                     PIC N(001) CHARACTER TYPE IS PMSIZE02
044500                          VALUE NC"あ".
044600   02                     PIC N(001) CHARACTER TYPE IS PMSIZE03
044700                          VALUE NC"あ".
044800   02                     PIC N(001) CHARACTER TYPE IS PMSIZE04
044900                          VALUE NC"あ".
045000   02                     PIC N(001) CHARACTER TYPE IS PMSIZE05
045100                          VALUE NC"あ".
045200   02                     PIC N(001) CHARACTER TYPE IS PMSIZE06
045300                          VALUE NC"あ".
045400   02                     PIC N(001) CHARACTER TYPE IS PMSIZE07
045500                          VALUE NC"あ".
045600   02                     PIC N(001) CHARACTER TYPE IS PMSIZE08
045700                          VALUE NC"あ".
045800   02                     PIC N(001) CHARACTER TYPE IS PMSIZE09
045900                          VALUE NC"あ".
046000   02                     PIC N(001) CHARACTER TYPE IS PMSIZE10
046100                          VALUE NC"あ".
046200   02                     PIC N(001) CHARACTER TYPE IS PMSIZE11
046300                          VALUE NC"あ".
046400   02                     PIC N(001) CHARACTER TYPE IS PMSIZE12
046500                          VALUE NC"あ".
046600* 文字ピッチを指定したデータ宣言
046700 01  文字ピッチデータ.
046800   02                     PIC N(001) CHARACTER TYPE IS PMPICH01
046900                          VALUE     NC"い".
047000   02                     PIC N(002) CHARACTER TYPE IS PMPICH02
047100                          VALUE ALL NC"い".
047200   02                     PIC N(003) CHARACTER TYPE IS PMPICH03
047300                          VALUE ALL NC"い".
047400   02                     PIC N(005) CHARACTER TYPE IS PMPICH04
047500                          VALUE ALL NC"い".
047600   02                     PIC N(006) CHARACTER TYPE IS PMPICH05
047700                          VALUE ALL NC"い".
047800   02                     PIC N(015) CHARACTER TYPE IS PMPICH06
047900                          VALUE ALL NC"い".
048000   02                     PIC N(008) CHARACTER TYPE IS PMPICH07
048100                          VALUE ALL NC"い".
048200   02                     PIC N(010) CHARACTER TYPE IS PMPICH08
048300                          VALUE ALL NC"い".
048400   02                     PIC N(012) CHARACTER TYPE IS PMPICH09
048500                          VALUE ALL NC"い".
048600   02                     PIC N(015) CHARACTER TYPE IS PMPICH10
048700                          VALUE ALL NC"い".
048800   02                     PIC N(020) CHARACTER TYPE IS PMPICH11
048900                          VALUE ALL NC"い".
049000   02                     PIC N(024) CHARACTER TYPE IS PMPICH12
049100                          VALUE ALL NC"い".
049200* 書体を指定したデータ宣言
049300 01  文字フォントデータ.
049400   02                     PIC N(010) CHARACTER TYPE IS PMFONT01
049500                          VALUE ALL NC"う".
049600   02                     PIC N(010) CHARACTER TYPE IS PMFONT02
049700                          VALUE ALL NC"う".
049800   02                     PIC N(010) CHARACTER TYPE IS PMFONT03
049900                          VALUE ALL NC"う".
050000   02                     PIC N(010) CHARACTER TYPE IS PMFONT04
050100                          VALUE ALL NC"う".
050200   02                     PIC N(010) CHARACTER TYPE IS PMFONT01
050300                          VALUE ALL NC"う".
050400   02                     PIC N(010) CHARACTER TYPE IS PMFONT02
050500                          VALUE ALL NC"う".
050600   02                     PIC N(010) CHARACTER TYPE IS PMFONT03
050700                          VALUE ALL NC"う".
050800   02                     PIC N(010) CHARACTER TYPE IS PMFONT04
050900                          VALUE ALL NC"う".
051000* 文字回転を指定したデータ宣言
051100 01  文字回転データ.
051200   02                     PIC N(010) CHARACTER TYPE IS PMANGL01
051300                          VALUE ALL NC"え".
051400   02                     PIC N(010) CHARACTER TYPE IS PMANGL02
051500                          VALUE ALL NC"え".
051600   02                     PIC N(010) CHARACTER TYPE IS PMANGL01
051700                          VALUE ALL NC"え".
051800   02                     PIC N(010) CHARACTER TYPE IS PMANGL02
051900                          VALUE ALL NC"え".
052000   02                     PIC N(010) CHARACTER TYPE IS PMANGL01
052100                          VALUE ALL NC"え".
052200   02                     PIC N(010) CHARACTER TYPE IS PMANGL02
052300                          VALUE ALL NC"え".
052400   02                     PIC N(010) CHARACTER TYPE IS PMANGL01
052500                          VALUE ALL NC"え".
052600   02                     PIC N(010) CHARACTER TYPE IS PMANGL02
052700                          VALUE ALL NC"え".
052800* 文字形態を指定したデータ宣言
052900 01  文字形態データ.
053000   02                     PIC N(009) CHARACTER TYPE IS PMFORM01
053100                          VALUE ALL NC"お".
053200   02                     PIC N(009) CHARACTER TYPE IS PMFORM02
053300                          VALUE ALL NC"お".
053400   02                     PIC N(009) CHARACTER TYPE IS PMFORM03
053500                          VALUE ALL NC"お".
053600   02                     PIC N(009) CHARACTER TYPE IS PMFORM04
053700                          VALUE ALL NC"お".
053800   02                     PIC N(009) CHARACTER TYPE IS PMFORM05
053900                          VALUE ALL NC"お".
054000   02                     PIC N(009) CHARACTER TYPE IS PMFORM06
054100                          VALUE ALL NC"お".
054200   02                     PIC N(009) CHARACTER TYPE IS PMFORM07
054300                          VALUE ALL NC"お".
054400   02                     PIC N(009) CHARACTER TYPE IS PMFORM08
054500                          VALUE ALL NC"お".
054600* 様々な文字属性を組合せ指定したデータ宣言
054700 01  文字属性組合せデータ.
054800   02                     PIC N(010) CHARACTER TYPE IS PRTMODE1
054900                          VALUE ALL NC"か".
055000   02                     PIC N(010) CHARACTER TYPE IS PRTMODE2
055100                          VALUE ALL NC"か".
055200   02                     PIC N(010) CHARACTER TYPE IS PRTMODE3
055300                          VALUE ALL NC"か".
055400   02                     PIC N(010) CHARACTER TYPE IS PRTMODE1
055500                          VALUE ALL NC"か".
055600   02                     PIC N(010) CHARACTER TYPE IS PRTMODE2
055700                          VALUE ALL NC"か".
055800   02                     PIC N(010) CHARACTER TYPE IS PRTMODE3
055900                          VALUE ALL NC"か".
056000*Ｉ制御レコードのデータ宣言
056100 01  Ｉ制御データ.
056200   02  レコード識別子     PIC X(002) VALUE "I1".
056300   02  モード             PIC X(001) VALUE "1".
056400   02  オーバレイ.
056500     03  オーバレイ名     PIC X(004) VALUE SPACE.
056600     03  焼付け回数       PIC 9(003) VALUE 0.
056700   02  複写数             PIC 9(003) VALUE 0.
056800   02  ＦＣＢ名           PIC X(004) VALUE SPACE.
056900   02  帳票定義体名       PIC X(008) VALUE SPACE.
057000   02                     PIC X(030) VALUE SPACE.
057100   02  印刷形式           PIC X(002) VALUE SPACE.
057200   02  用紙サイズ         PIC X(003) VALUE SPACE.
057300   02                     PIC X(004) VALUE SPACE.
057400   02  印刷面             PIC X(001) VALUE SPACE.
057500   02  印刷開始位置づけ面 PIC X(001) VALUE SPACE.
057600   02  印字禁止域         PIC X(001) VALUE SPACE.
057700   02  綴じ代方向.
057800     03  ポート時表面     PIC X(001) VALUE SPACE.
057900     03  ポート時裏面     PIC X(001) VALUE SPACE.
058000     03  ランド時表面     PIC X(001) VALUE SPACE.
058100     03  ランド時裏面     PIC X(001) VALUE SPACE.
058200   02  印字位置情報.
058300     03  綴じ代幅         PIC 9(004) VALUE 9999.
058400     03  印字開始原点位置.
058500       04  ポート時Ｘ座標 PIC 9(004) VALUE 9999.
058600       04  ポート時Ｙ座標 PIC 9(004) VALUE 9999.
058700       04  ランド時Ｘ座標 PIC 9(004) VALUE 9999.
058800       04  ランド時Ｙ座標 PIC 9(004) VALUE 9999.
058900   02  文書情報           PIC X(004) VALUE SPACE.
059000   02  予約域             PIC X(005) VALUE SPACE.
059100* エラーカウンタとして使用するデータ宣言
059200 01  エラーカウンタ       PIC 9(004)        VALUE ZERO.
059300* 入出力状態として使用するデータ宣言
059400 77  入出力状態           PIC X(002)        VALUE ZERO.
059500*----------------------------------------------------------------------------------*
059600 PROCEDURE                DIVISION.
059700*
059800* 印刷ファイルのＯＰＥＮ
059900     OPEN OUTPUT 印刷ファイル.
060000     IF 入出力状態 NOT = ZERO THEN
060100       ADD 1 TO エラーカウンタ
060200     END-IF.
060300*
060400*----------------------------------------------------------------------------------*
060500* １．ＦＣＢを使用した帳票印刷サンプルの出力処理　　　　　　　　　　　　　　　　　 *
060600*----------------------------------------------------------------------------------*
060700*
060800* ６ＬＰＩの帳票印刷処理
060900*
061000* オーバレイ名”Ａ４Ｌ６”（ＫＯＬ５Ａ４Ｌ６．ＯＶＤ）設定
061100* ６ＬＰＩ／１０ＣＰＩのスペーシングチャートイメージのオーバレイを出力
061200     MOVE "A4L6" TO オーバレイ名.
061300* 焼き付け回数１回設定
061400     MOVE 1      TO 焼付け回数.
061500* 複写枚数１枚設定
061600     MOVE 1      TO 複写数.
061700* ＦＣＢ名”Ａ４Ｌ６”（ＦＣＢＡ４Ｌ６）設定
061800     MOVE "A4L6" TO ＦＣＢ名.
061900* 印刷形式ランドスケープモード(横向き)設定
062000     MOVE "L"    TO 印刷形式.
062100* 用紙サイズＡ４設定
062200     MOVE "A4"   TO 用紙サイズ.
062300* 片面印刷設定
062400     MOVE "F"    TO 印刷面.
062500* 表面位置づけ設定
062600     MOVE "F"    TO 印刷開始位置づけ面.
062700* 文書情報名”ＤＯＣ１”（＠ＣＢＲ＿ＤｏｃｕｍｅｎｔＮａｍｅ＿ＤＯＣ１）設定
062800     MOVE "DOC1" TO 文書情報.
062900* Ｉ制御レコードを出力することによりページ属性を設定
063000     WRITE 制御レコード FROM Ｉ制御データ
063100                        AFTER ADVANCING PAGE-CNTL.
063200     IF 入出力状態 NOT = ZERO THEN
063300       ADD 1 TO エラーカウンタ
063400     END-IF.
063500*
063600* 大見出し出力
063700     MOVE SPACE  TO 注釈レコード.
063800     WRITE 注釈レコード AFTER ADVANCING PAGE.
063900     IF 入出力状態 NOT = ZERO THEN
064000       ADD 1 TO エラーカウンタ
064100     END-IF.
064200*
064300* 小見出し出力
064400     WRITE 行レコード FROM 大見出し６
064500                        AFTER ADVANCING 1 LINE.
064600     IF 入出力状態 NOT = ZERO THEN
064700       ADD 1 TO エラーカウンタ
064800     END-IF.
064900*
065000* 明細出力
065100     WRITE 行レコード FROM 小見出し６
065200                        AFTER ADVANCING 2 LINES.
065300     IF 入出力状態 NOT = ZERO THEN
065400       ADD 1 TO エラーカウンタ
065500     END-IF.
065600     WRITE 行レコード FROM 明細６
065700                        AFTER ADVANCING 2 LINES
065800     PERFORM 40 TIMES
065900       WRITE 行レコード FROM 明細６
066000                        AFTER ADVANCING 1 LINE
066100       IF 入出力状態 NOT = ZERO THEN
066200         ADD 1 TO エラーカウンタ
066300       END-IF
066400     END-PERFORM.
066500*
066600* ８ＬＰＩの帳票印刷処理
066700*
066800* オーバレイ名”Ａ４Ｌ８”（ＫＯＬ５Ａ４Ｌ８．ＯＶＤ）設定
066900* ８ＬＰＩ／１０ＣＰＩのスペーシングチャートイメージのオーバレイを出力
067000     MOVE "A4L8" TO オーバレイ名.
067100* 焼き付け回数１回設定
067200     MOVE 1      TO 焼付け回数.
067300* 複写枚数１枚設定
067400     MOVE 1      TO 複写数.
067500* ＦＣＢ名”Ａ４Ｌ６”（ＦＣＢＡ４Ｌ６）設定
067600     MOVE "A4L8" TO ＦＣＢ名.
067700* 印刷形式ランドスケープモード(横向き)設定
067800     MOVE "L"    TO 印刷形式.
067900* 用紙サイズＡ４設定
068000     MOVE "A4"   TO 用紙サイズ.
068100* 片面印刷設定
068200     MOVE "F"    TO 印刷面.
068300* 表面位置づけ設定
068400     MOVE "F"    TO 印刷開始位置づけ面.
068500* 文書情報名”ＤＯＣ１”（＠ＣＢＲ＿ＤｏｃｕｍｅｎｔＮａｍｅ＿ＤＯＣ１）設定
068600     MOVE "DOC1" TO 文書情報.
068700* Ｉ制御レコードを出力することによりページ属性を設定
068800     WRITE 制御レコード FROM Ｉ制御データ
068900                        AFTER ADVANCING PAGE-CNTL.
069000     IF 入出力状態 NOT = ZERO THEN
069100       ADD 1 TO エラーカウンタ
069200     END-IF.
069300*
069400* 大見出し出力
069500     MOVE SPACE  TO 注釈レコード.
069600     WRITE 注釈レコード AFTER ADVANCING PAGE.
069700     IF 入出力状態 NOT = ZERO THEN
069800       ADD 1 TO エラーカウンタ
069900     END-IF.
070000     WRITE 行レコード FROM 大見出し８
070100                        AFTER ADVANCING 1 LINE.
070200     IF 入出力状態 NOT = ZERO THEN
070300       ADD 1 TO エラーカウンタ
070400     END-IF.
070500*
070600* 小見出し出力
070700     WRITE 行レコード FROM 小見出し８
070800                        AFTER ADVANCING 2 LINES.
070900     IF 入出力状態 NOT = ZERO THEN
071000       ADD 1 TO エラーカウンタ
071100     END-IF.
071200*
071300* 明細出力
071400     WRITE 行レコード FROM 明細８
071500                        AFTER ADVANCING 2 LINES
071600     PERFORM 55 TIMES
071700       WRITE 行レコード FROM 明細８
071800                        AFTER ADVANCING 1 LINE
071900       IF 入出力状態 NOT = ZERO THEN
072000         ADD 1 TO エラーカウンタ
072100       END-IF
072200     END-PERFORM.
072300*
072400*----------------------------------------------------------------------------------*
072500* ２．各種文字属性印字サンプル集の出力処理　　　　　　　　　　　　　　　　　　　　 *
072600*----------------------------------------------------------------------------------*
072700*
072800* オーバレイ名”Ｂ４ＯＶ”（ＫＯＬ５Ｂ４ＯＶ．ＯＶＤ）設定
072900     MOVE "B4OV" TO オーバレイ名.
073000* 焼き付け回数１回設定
073100     MOVE 1      TO 焼付け回数.
073200* 複写枚数１枚設定
073300     MOVE 1      TO 複写数.
073400* ＦＣＢ名”ＬＰＩ６”（ＦＣＢ６ＬＰＩ）設定
073500     MOVE "LPI6" TO ＦＣＢ名.
073600* 印刷形式ランドスケープモード(横向き)設定
073700     MOVE "L"    TO 印刷形式.
073800* 用紙サイズＢ４設定
073900     MOVE "B4"   TO 用紙サイズ.
074000* 片面印刷設定
074100     MOVE "F"    TO 印刷面.
074200* 表面位置づけ設定
074300     MOVE "F"    TO 印刷開始位置づけ面.
074400* 文書情報名”ＤＯＣ２”（＠ＣＢＲ＿ＤｏｃｕｍｅｎｔＮａｍｅ＿ＤＯＣ２）設定
074500     MOVE "DOC2" TO 文書情報.
074600* Ｉ制御レコードを出力することによりページ属性を設定
074700     WRITE 制御レコード FROM Ｉ制御データ
074800                        AFTER ADVANCING PAGE-CNTL.
074900     IF 入出力状態 NOT = ZERO THEN
075000       ADD 1 TO エラーカウンタ
075100     END-IF.
075200*
075300* 見出し出力
075400     WRITE 注釈レコード FROM 見出しデータ１
075500                        AFTER ADVANCING PAGE.
075600     IF 入出力状態 NOT = ZERO THEN
075700       ADD 1 TO エラーカウンタ
075800     END-IF.
075900     WRITE 注釈レコード FROM 見出しデータ２
076000                        AFTER ADVANCING 30 LINES.
076100     IF 入出力状態 NOT = ZERO THEN
076200       ADD 1 TO エラーカウンタ
076300     END-IF.
076400*
076500* 文字サイズサンプル出力
076600     WRITE 注釈レコード FROM 注釈データ１
076700                        AFTER ADVANCING PAGE.
076800     WRITE 行レコード   FROM 文字サイズデータ
076900                        AFTER ADVANCING 40 LINES.
077000     IF 入出力状態 NOT = ZERO THEN
077100       ADD 1 TO エラーカウンタ
077200     END-IF.
077300*
077400* 文字ピッチサンプル出力
077500     WRITE 注釈レコード FROM 注釈データ２
077600                        AFTER ADVANCING PAGE.
077700     PERFORM 5 TIMES
077800       WRITE 行レコード FROM 文字ピッチデータ
077900                        AFTER ADVANCING 10 LINES
078000       IF 入出力状態 NOT = ZERO THEN
078100         ADD 1 TO エラーカウンタ
078200       END-IF
078300     END-PERFORM.
078400*
078500* 文字書体サンプル出力
078600     WRITE 注釈レコード FROM 注釈データ３
078700                        AFTER ADVANCING PAGE.
078800     PERFORM 18 TIMES
078900       WRITE 行レコード FROM 文字フォントデータ
079000                        AFTER ADVANCING 3 LINES
079100       IF 入出力状態 NOT = ZERO THEN
079200         ADD 1 TO エラーカウンタ
079300       END-IF
079400     END-PERFORM.
079500*
079600* 文字回転サンプル出力
079700     WRITE 注釈レコード FROM 注釈データ４
079800                        AFTER ADVANCING PAGE.
079900     PERFORM 18 TIMES
080000       WRITE 行レコード FROM 文字回転データ
080100                        AFTER ADVANCING 3 LINES
080200       IF 入出力状態 NOT = ZERO THEN
080300         ADD 1 TO エラーカウンタ
080400       END-IF
080500     END-PERFORM.
080600*
080700* 文字形態データ出力
080800     WRITE 注釈レコード FROM 注釈データ５
080900                        AFTER ADVANCING PAGE.
081000     PERFORM 18 TIMES
081100       WRITE 行レコード FROM 文字形態データ
081200                        AFTER ADVANCING 3 LINES
081300       IF 入出力状態 NOT = ZERO THEN
081400         ADD 1 TO エラーカウンタ
081500       END-IF
081600     END-PERFORM.
081700*
081800* 文字属性組合せサンプル出力
081900     WRITE 注釈レコード FROM 注釈データ６
082000                        AFTER ADVANCING PAGE.
082100     PERFORM 18 TIMES
082200       WRITE 行レコード FROM 文字属性組合せデータ
082300                        AFTER ADVANCING 3 LINES
082400       IF 入出力状態 NOT = ZERO THEN
082500         ADD 1 TO エラーカウンタ
082600       END-IF
082700     END-PERFORM.
082800*
082900* 印刷ファイルＣＬＯＳＥ
083000     CLOSE 印刷ファイル.
083100     IF 入出力状態 NOT = ZERO THEN
083200       ADD 1 TO エラーカウンタ
083300     END-IF.
083400* エラー判定
083500     IF エラーカウンタ > ZERO THEN
083600       DISPLAY NC"エラーが発生しました。"
083700       DISPLAY NC"実行時メーッセージを確認し、エラーの原因を取り除いてください。"
083800       DISPLAY SPACE
083900     END-IF.
084000*
084100     STOP RUN.
