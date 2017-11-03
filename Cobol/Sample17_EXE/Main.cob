000100*========================================================================
000200*　会議室予約プログラム
000300*                                   −サンプルプログラム「会議室予約」−
000400*
000500*　〇機能
000600*
000700*　　１）会議室の予約・参照
000800*　　２）予約情報の検索
000900*  　３）会議室管理処理
001000*
001100*　〇参照クラス
001200*　　１）予約管理クラス
001300*　　２）会議室情報管理クラス
001400*
001500*            Copyright 1999-2015 FUJITSU LIMITED
001600*========================================================================
001700 PROGRAM-ID.  メイン.
001800 ENVIRONMENT     DIVISION.
001900 CONFIGURATION   SECTION.
002000 SPECIAL-NAMES.
002100     CONSOLE     IS CONS
002200     SYMBOLIC CONSTANT
002300     COPY R_CONST.
002400     .
002500 REPOSITORY.
002600     CLASS 予約管理クラス
002700     CLASS 会議室情報管理クラス
002800      .
002900 DATA            DIVISION.
003000 BASED-STORAGE   SECTION.
003100  COPY RSVINFO.
003200 WORKING-STORAGE SECTION.
003300  01 選択処理                         PIC X    IS GLOBAL.
003400  01 本日の日付                       PIC X(8) IS GLOBAL
003500                                              IS EXTERNAL.
003600  01 予約管理オブジェクト             OBJECT REFERENCE 予約管理クラス.
003700 PROCEDURE       DIVISION.
003800*
003900* 本日の日付の取得と予約データ／会議室データの復元
004000*
004100     MOVE  FUNCTION CURRENT-DATE  TO  本日の日付
004200     DISPLAY "＊＊会議室データの復元中です・・。しばらくお待ちください。＊＊"
004300     PERFORM  会議室データの復元
004400     DISPLAY "＊＊予約データの復元中です・・・。しばらくお待ちください。＊＊"
004500     PERFORM  予約データの復元
004600     .
004700*
004800* 処理選択
004900*
005000 初期画面.
005100     DISPLAY "----------------------------------------------------------------------"
005200     DISPLAY "<<  会議室予約プログラム  >>"
005300     DISPLAY "  　１．予約・参照"
005400     DISPLAY "　　２．検索"
005500     DISPLAY "    ３．会議室管理"
005600     DISPLAY "    Ｘ．終了"
005700     DISPLAY "処理を選択して下さい。( 1 or 2 or 3 or X) => " WITH NO ADVANCING
005800     ACCEPT  選択処理  FROM  CONS
005900*
006000     EVALUATE  選択処理
006100     WHEN "1"
006200       CALL  "予約参照処理"
006300     WHEN "2"
006400       CALL  "検索処理"
006500     WHEN "3"
006600       CALL  "会議室管理処理"
006700       DISPLAY  "＊＊会議室データの保存中・反映中です。しばらくお待ちください。＊＊"
006800       PERFORM   会議室データの保存
006900     WHEN "X"
007000       DISPLAY  "＊＊予約データを保存しています。＊＊"
007100       PERFORM   予約データの保存
007200       EXIT PROGRAM
007300     WHEN OTHER
007400       GO TO  初期画面
007500     END-EVALUATE
007600     GO TO  初期画面
007700     .
007800 会議室データの復元.
007900     MOVE  会議室シート           TO  選択処理
008000     CALL  "データの復元"  USING BY CONTENT 選択処理
008100     .
008200*
008300 予約データの復元.
008400     MOVE  予約シート             TO  選択処理
008500     CALL  "データの復元"  USING BY CONTENT 選択処理
008600     .
008700 会議室データの保存.
008800     MOVE  会議室シート           TO  選択処理
008900     CALL  "データの保存"  USING BY CONTENT 選択処理
009000     MOVE  予約シート             TO  選択処理
009100     PERFORM 予約データの保存
009200     INVOKE  予約管理クラス           "NEW"
009300                                      RETURNING        予約管理オブジェクト
009400     INVOKE  予約管理オブジェクト     "予約状態オブジェクトの削除"
009500     PERFORM 予約データの復元
009600     .
009700 予約データの保存.
009800     MOVE  予約シート             TO  選択処理
009900     CALL  "データの保存"  USING BY CONTENT 選択処理
010000     .
010100*========================================================================
010200*　予約参照処理
010300*
010400*　〇入力：なし
010500*　〇出力：なし
010600*========================================================================
010700 IDENTIFICATION  DIVISION.
010800 PROGRAM-ID.  予約参照処理.
010900 DATA            DIVISION.
011000 BASED-STORAGE   SECTION.
011100  COPY RSVINFO.
011200  COPY ROOMINFO.
011300 WORKING-STORAGE SECTION.
011400  01 予約管理オブジェクト             OBJECT REFERENCE 予約管理クラス.
011500  01 予約データ                       TYPE 予約リスト.
011600  01 会議室データ                     TYPE 会議室仕様.
011700  01 日付                             PIC X(8).
011800  01 処理コード                       PIC S9(8) BINARY.
011900 PROCEDURE       DIVISION.
012000*
012100* 日付指定
012200*
012300 日付指定画面.
012400     MOVE    LOW-VALUE            TO  予約データ
012500     MOVE    LOW-VALUE            TO  会議室データ
012600     DISPLAY "----------------------------------------------------------------------"
012700     DISPLAY "予約・参照する日付を入力してください。"
012800     DISPLAY "(8桁数字で入力: 例.1999年3月18日 => 19990318と入力) "
012900     DISPLAY "　予約日　　：　" WITH NO ADVANCING
013000     ACCEPT 日付  FROM  CONS
013100     IF 日付 < 本日の日付 THEN
013200       DISPLAY "　+++ 過去の日付は受け付けられません。+++"
013300       GO TO 日付指定画面
013400     END-IF
013500     MOVE  日付                   TO  予約日 OF 予約データ
013600*
013700* 指定日の予約状況表示
013800*
013900     INVOKE  予約管理クラス "NEW"     RETURNING  予約管理オブジェクト
014000     INVOKE  予約管理オブジェクト     "予約状況の一覧表示"
014100                                      USING BY CONTENT 予約日 OF 予約データ
014200     .
014300*
014400* 会議室と時間枠指定
014500*
014600  会議室指定画面.    
014700     DISPLAY "----------------------------------------------------------------------"
014800     DISPLAY "予約・参照する会議室名と時間枠を入力して下さい。"
014900     DISPLAY "　会議室名　（4桁英数字: 例. D101）：　" WITH NO ADVANCING
015000     ACCEPT     会議室名  OF 予約データ FROM CONS
015100     DISPLAY "　時間枠　　（'AM' or 'PM'）　　　 ：　" WITH NO ADVANCING
015200     ACCEPT     時間枠    OF 予約データ FROM CONS
015300*
015400* 予約・参照
015500*
015600     INVOKE  予約管理オブジェクト     "予約"
015700                                      USING            予約データ
015800                                                       会議室データ
015900                                      RETURNING        処理コード
016000*
016100* 処理コードによって、処理を切り分ける
016200*
016300     EVALUATE 処理コード
016400     WHEN  予約−既存
016500       CALL    "予約データ表示"   USING BY CONTENT 予約データ
016600       CALL    "会議室データ表示" USING BY CONTENT 会議室データ
016700       DISPLAY  "キャンセルするなら'C'を、終了するならEnterを入力して下さい。=> "
016800                WITH NO ADVANCING
016900       ACCEPT   選択処理  FROM CONS
017000       IF  選択処理 = 'C' THEN
017100         INVOKE  予約管理オブジェクト "予約取消"
017200                                      USING BY CONTENT 予約データ
017300       END-IF  
017400     WHEN  予約−新規
017500       DISPLAY "----------------------------------------------------------------------"
017600       DISPLAY  "予約できました。予約番号はキャンセル時に必要になりますので控えておい "
017700       DISPLAY  "ください。"
017800       DISPLAY  "*** 予約番号 *** : "   予約番号   OF 予約データ
017900       CALL     "予約データ表示"  USING BY CONTENT 予約データ
018000     WHEN  予約−復元
018100       CALL     "予約データ表示"  USING BY CONTENT 予約データ
018200     END-EVALUATE
018300
018400     PERFORM 確認画面.
018500     GO TO 日付指定画面.
018600     .
018700 確認画面.
018800     DISPLAY "予約・参照を終了するなら'X'を、続けるならEnterを入力して下さい。=> "
018900             WITH NO ADVANCING
019000     ACCEPT  選択処理  FROM  CONS
019100     IF 選択処理 = "X" THEN
019200       EXIT PROGRAM
019300     END-IF
019400     .
019500 END PROGRAM 予約参照処理.   
019600*========================================================================
019700*　検索処理
019800*
019900*　〇入力：なし
020000*　〇出力：なし
020100*========================================================================
020200 IDENTIFICATION  DIVISION.
020300 PROGRAM-ID.  検索処理.
020400 DATA            DIVISION.
020500 BASED-STORAGE   SECTION.
020600  COPY RSVINFO.
020700 WORKING-STORAGE SECTION.
020800  01 予約管理オブジェクト             OBJECT REFERENCE 予約管理クラス.
020900  01 名前                             PIC X(20).
021000  01 予約情報データ.
021100    02 予約個数                       PIC 9(8) BINARY.
021200    02 予約データ                     TYPE 予約リスト OCCURS RSV-MAX.
021300  01 カウンタ                         PIC S9(4) BINARY.
021400 PROCEDURE       DIVISION.
021500*
021600* 名前指定
021700*
021800 名前指定画面.
021900     MOVE    LOW-VALUE            TO  予約情報データ
022000     DISPLAY "----------------------------------------------------------------------"
022100     DISPLAY " <<  予約者情報検索  >>"
022200     DISPLAY "予約した名前で予約情報を検索します。予約者名を入力して下さい。"
022300     DISPLAY "　予約者名（10文字まで：例.富士通太郎)　：　" WITH NO ADVANCING
022400     ACCEPT 名前  FROM  CONS
022500*
022600* 予約情報検索
022700*
022800     INVOKE  予約管理クラス "NEW"     RETURNING        予約管理オブジェクト
022900     INVOKE  予約管理オブジェクト     "予約情報の検索"
023000                                      USING BY CONTENT 名前
023100                                      RETURNING        予約情報データ
023200*
023300* 予約情報表示
023400*
023500     PERFORM TEST BEFORE VARYING カウンタ FROM 1 BY 1 
023600                                           UNTIL カウンタ > 予約個数
023700       CALL "予約データ表示"  USING BY CONTENT 予約データ(カウンタ)
023800     END-PERFORM
023900     .
024000 確認画面.
024100     DISPLAY "検索処理を終了するなら'X'を、続けるならEnterを入力して下さい。=> "
024200             WITH NO ADVANCING
024300     ACCEPT  選択処理  FROM  CONS
024400     IF 選択処理 = "X" THEN
024500       EXIT PROGRAM
024600     END-IF
024700     GO TO   名前指定画面.
024800 END PROGRAM 検索処理.
024900*========================================================================
025000*　会議室管理処理
025100*
025200*　〇入力：なし
025300*　〇出力：なし
025400*========================================================================
025500 IDENTIFICATION  DIVISION.
025600 PROGRAM-ID.  会議室管理処理.
025700 DATA            DIVISION.
025800 BASED-STORAGE   SECTION.
025900     COPY ROOMINFO.
026000 WORKING-STORAGE SECTION.
026100  01 会議室管理オブジェクト           OBJECT REFERENCE 会議室情報管理クラス.
026200  01 会議室データ                     TYPE 会議室仕様.
026300  01 処理コード                       PIC S9(8) BINARY.
026400 PROCEDURE       DIVISION.
026500     INVOKE 会議室情報管理クラス  "NEW"  
026600                                      RETURNING 会議室管理オブジェクト
026700     .
026800*
026900* 会議室仕様の一覧表示
027000*
027100 会議室一覧画面.
027200     INVOKE  会議室管理オブジェクト   "会議室情報の一覧表示"
027300     .
027400*
027500* 会議室選択
027600*
027700     MOVE    LOW-VALUE            TO  会議室データ
027800     DISPLAY "<<  会議室管理  >>"
027900     DISPLAY "指定された会議室の追加・更新・削除を行います。会議室を入力してください。"
028000     DISPLAY "　会議室名（英数字4桁：例.D101）：　" WITH NO ADVANCING
028100     ACCEPT  会議室名 OF 会議室データ  FROM CONS.
028200*
028300     INVOKE  会議室管理オブジェクト   "仕様情報の参照"
028400                                      USING            会議室データ
028500                                      RETURNING        処理コード
028600     .
028700*
028800* 指定した会議室が既に登録されている場合、更新・削除のいずれかの処理を行う。
028900* 登録されていない場合は、追加処理を行う。
029000*
029100 更新削除指定画面.
029200     IF 処理コード < 0 THEN
029300       DISPLAY "----------------------------------------------------------------------"
029400       DISPLAY  "この会議室は未登録です。"
029500       DISPLAY  "新規に登録するなら'Y'を、終了するならEnterを入力して下さい。=> "
029600                WITH NO ADVANCING
029700       ACCEPT   選択処理 FROM CONS
029800       IF 選択処理 = "Y" THEN
029900         PERFORM  会議室情報追加
030000       END-IF
030100     ELSE
030200       DISPLAY "----------------------------------------------------------------------"
030300       DISPLAY "この会議室は既に登録されています。"
030400       DISPLAY "データを更新するなら'R'を、削除するなら'D'を、中止するならEnterを入力"
030500       DISPLAY "して下さい。=> " WITH NO ADVANCING
030600       ACCEPT  選択処理  FROM CONS
030700       EVALUATE 選択処理
030800       WHEN "R"
030900         PERFORM 会議室情報更新
031000       WHEN "D"
031100         PERFORM 会議室情報削除
031200       WHEN OTHER
031300         CONTINUE
031400       END-EVALUATE
031500     END-IF
031600     .
031700 確認画面.
031800     DISPLAY "会議室管理処理を終了するなら'X'を、続けるならEnterを入力して下さい。=> "
031900             WITH NO ADVANCING
032000     ACCEPT  選択処理  FROM  CONS
032100     IF 選択処理 = "X" THEN
032200       EXIT PROGRAM
032300     END-IF
032400     GO TO  会議室一覧画面
032500     .
032600 会議室情報更新.
032700     DISPLAY "----------------------------------------------------------------------"
032800     CALL    "会議室データ表示"       USING BY CONTENT 会議室データ
032900     DISPLAY "変更後のデータを入力して下さい。"
033000     DISPLAY "　定員数　（数字2桁：例.10 ）　　　　　：　" WITH NO ADVANCING
033100     ACCEPT   定員   OF 会議室データ  FROM CONS
033200     DISPLAY "　内線番号（数字9桁まで：例.1234-5678）：　" WITH NO ADVANCING
033300     ACCEPT   内線   OF 会議室データ  FROM CONS
033400     DISPLAY "　種別　　（テレビ会議室なら'T'、一般会議室なら'N'）：　" WITH NO ADVANCING
033500     ACCEPT   種類   OF 会議室データ  FROM CONS
033600     INVOKE   会議室管理オブジェクト  "仕様情報の更新"
033700                                      USING BY CONTENT 会議室データ
033800                                      RETURNING        処理コード
033900     IF 処理コード < 0 THEN
034000       DISPLAY  "　+++ 会議室の更新に失敗しました +++"
034100     ELSE
034200       DISPLAY "< 変更後の会議室情報 >"
034300       CALL    "会議室データ表示"    USING BY CONTENT 会議室データ
034400     END-IF 
034500    .
034600 会議室情報削除.
034700     INVOKE  会議室管理オブジェクト   "仕様情報の削除"
034800                                      USING BY CONTENT 会議室データ
034900                                      RETURNING        処理コード
035000     IF 処理コード < 0 THEN
035100       DISPLAY "　+++ 会議室の削除に失敗しました +++"
035200     END-IF
035300     .
035400 会議室情報追加.
035500     DISPLAY "----------------------------------------------------------------------"
035600     DISPLAY "< 会議室情報の追加 >"
035700     DISPLAY "　定員数　（数字2桁：例.10 ）　　　　　：　" WITH NO ADVANCING
035800     ACCEPT   定員   OF 会議室データ  FROM CONS
035900     DISPLAY "　内線番号（数字9桁まで：例.1234-5678）：　" WITH NO ADVANCING
036000     ACCEPT   内線   OF 会議室データ  FROM CONS
036100     DISPLAY "　種別　　（テレビ会議室なら'T'、一般会議室なら'N'）：　" WITH NO ADVANCING
036200     ACCEPT   種類   OF 会議室データ  FROM CONS
036300     CALL    "会議室データ表示"       USING BY CONTENT 会議室データ
036400     DISPLAY "上記の情報を登録するなら'Y'を、中止するならEnterを入力して下さい。=> "
036500             WITH NO ADVANCING
036600     ACCEPT  選択処理                 FROM CONS
036700     IF 選択処理 = "Y" THEN
036800       INVOKE  会議室管理オブジェクト "仕様情報の追加"
036900                                      USING BY CONTENT 会議室データ
037000     END-IF
037100    .
037200 END PROGRAM 会議室管理処理.
037300*========================================================================
037400*　予約データ表示
037500*
037600*　〇入力：予約データ (TYPE 予約リスト)
037700*　〇出力：なし
037800*========================================================================
037900 IDENTIFICATION  DIVISION.
038000 PROGRAM-ID.  予約データ表示 IS COMMON.
038100 DATA            DIVISION.
038200 BASED-STORAGE   SECTION.
038300     COPY RSVINFO.
038400 WORKING-STORAGE SECTION.
038500  01 予約データ−表示用.
038600    02                                PIC X(1).
038700    02  Ｗ−予約日                    PIC X(8).
038800    02                                PIC X(2).
038900    02  Ｗ−会議室名                  PIC X(4).
039000    02                                PIC X(5).
039100    02  Ｗ−時間枠                    PIC X(6).
039200    02                                PIC X(3).
039300    02  Ｗ−予約者名                  PIC X(20).
039400    02                                PIC X(2).
039500    02  Ｗ−内線                      PIC X(9).
039600    02                                PIC X(3).
039700    02  Ｗ−所属                      PIC X(20).
039800 LINKAGE         SECTION.
039900  01 Ｌ−予約データ                   TYPE 予約リスト.
040000 PROCEDURE       DIVISION
040100                    USING             Ｌ−予約データ.
040200     MOVE  SPACE                  TO  予約データ−表示用
040300     DISPLAY "========================================================================="
040400     DISPLAY "-日付------会議室---時間枠---予約者名--------------内線--------所属------"
040500     MOVE  予約日    OF Ｌ−予約データ    TO  Ｗ−予約日
040600     MOVE  会議室名  OF Ｌ−予約データ    TO  Ｗ−会議室名
040700     MOVE  時間枠    OF Ｌ−予約データ    TO  Ｗ−時間枠
040800     MOVE  予約者名  OF Ｌ−予約データ    TO  Ｗ−予約者名
040900     MOVE  内線      OF Ｌ−予約データ    TO  Ｗ−内線
041000     MOVE  所属      OF Ｌ−予約データ    TO  Ｗ−所属
041100     DISPLAY 予約データ−表示用.
041200     DISPLAY "========================================================================="
041300 END PROGRAM 予約データ表示.
041400*========================================================================
041500*　会議室データ表示
041600*
041700*　〇入力：会議室データ (TYPE 会議室仕様)
041800*　〇出力：なし
041900*========================================================================
042000 IDENTIFICATION  DIVISION.
042100 PROGRAM-ID.  会議室データ表示 IS COMMON.
042200 DATA            DIVISION.
042300 BASED-STORAGE   SECTION.
042400     COPY ROOMINFO.
042500 WORKING-STORAGE SECTION.
042600  01 会議室データ−表示用.
042700    02                                PIC X(1).
042800    02  Ｗ−会議室名                  PIC X(4).
042900    02                                PIC X(7).
043000    02  Ｗ−定員                      PIC X(3).
043100    02                                PIC X(4).
043200    02  Ｗ−内線                      PIC X(9).
043300    02                                PIC X(2).
043400    02  Ｗ−種類                      PIC N(10).
043500 LINKAGE         SECTION.
043600  01 Ｌ−会議室データ                 TYPE 会議室仕様.
043700 PROCEDURE       DIVISION
043800                    USING             Ｌ−会議室データ.
043900     MOVE  SPACE                  TO  会議室データ−表示用
044000     DISPLAY "=============================================="
044100     DISPLAY "-会議室名---定員---内線-------種類------------"
044200     MOVE  会議室名  OF Ｌ−会議室データ    TO  Ｗ−会議室名
044300     MOVE  定員      OF Ｌ−会議室データ    TO  Ｗ−定員
044400     MOVE  内線      OF Ｌ−会議室データ    TO  Ｗ−内線
044500     EVALUATE   種類 OF Ｌ−会議室データ
044600     WHEN  "N"
044700       MOVE  NC"一般会議室"       TO  Ｗ−種類
044800     WHEN  "T"
044900       MOVE  NC"テレビ会議室"     TO  Ｗ−種類
045000     END-EVALUATE
045100     DISPLAY 会議室データ−表示用.
045200     DISPLAY "=============================================="
045300 END PROGRAM 会議室データ表示.
045400 END PROGRAM メイン.
