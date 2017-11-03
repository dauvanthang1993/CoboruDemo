000100*========================================================================
000200*　ＥＸＣＥＬ操作プログラム
000300*                                   －サンプルプログラム「会議室予約」－
000400*
000500*　OLE連携機能を使用してExcelファイルを操作する。
000600*
000700*　〇機能
000800*　　１）データの復元
000900*　　２）データの保存
001000*
001100*　〇参照クラス
001200*　　１）予約情報クラス
001300*　　２）予約管理クラス
001400*　　３）会議室情報管理クラス
001500*　　４）List
001600*　　５）リストイテレータ
001700*
001800*            Copyright 1999-2015 FUJITSU LIMITED
001900*========================================================================
002000 IDENTIFICATION  DIVISION.
002100 PROGRAM-ID.     Excel-edit.
002200 ENVIRONMENT     DIVISION.
002300 CONFIGURATION   SECTION.
002400 SPECIAL-NAMES.
002500     SYMBOLIC CONSTANT
002600     COPY R_CONST.
002700     .
002800 REPOSITORY.
002900     CLASS OLE      AS "*OLE"
003000     CLASS OLE-ERR  AS "*OLE-EXCEPTION"
003100     CLASS 予約情報クラス
003200     CLASS 予約管理クラス
003300     CLASS 会議室情報管理クラス
003400     CLASS List
003500     CLASS リストイテレータ
003600     .
003700 DATA DIVISION.
003800 BASED-STORAGE   SECTION.
003900     COPY RSVINFO.
004000     COPY ROOMINFO.
004100 WORKING-STORAGE SECTION.
004200  01 本日の日付                   PIC X(8) IS EXTERNAL.
004300  01 ＯＬＥ作業域 IS GLOBAL.
004400    02 アプリケーション名         PIC X(20)    VALUE "EXCEL.APPLICATION".
004500    02 ファイル名                 PIC X(256)   VALUE LOW-VALUE.
004600    02 シート名                   PIC X(20).
004700    02 EXCEL                      OBJECT REFERENCE OLE.
004800    02 ワークブック               OBJECT REFERENCE OLE.
004900    02 シート                     OBJECT REFERENCE OLE.
005000    02 ワークシート               OBJECT REFERENCE OLE.
005100    02 .
005200      03 セル参照                 OBJECT REFERENCE OLE OCCURS 7 TIMES .
005300    02 全範囲                     OBJECT REFERENCE OLE.
005400    02 選択範囲                   OBJECT REFERENCE OLE.
005500    02 行範囲                     OBJECT REFERENCE OLE.
005600    02 列範囲                     OBJECT REFERENCE OLE.
005700    02 OLE-TRUE                   PIC 1(1) BIT VALUE B"1".
005800    02                            PIC 1(7) BIT.
005900    02 OLE-FALSE                  PIC 1(1) BIT VALUE B"0".
006000    02 行数                       PIC S9(9) COMP-5.
006100    02 列数                       PIC S9(9) COMP-5.
006200    02 行数カウンタ               PIC S9(9) COMP-5.
006300    02 行カウンタ                 PIC S9(9) COMP-5.
006400    02 列カウンタ                 PIC S9(9) COMP-5.
006500*
006600  01 会議室仕様レコード           TYPE 会議室仕様.
006700  01 予約リストレコード           TYPE 予約リスト.
006800  01 ダミー会議室データ           TYPE 会議室仕様 VALUE LOW-VALUE.
006900  01 処理コード                   PIC S9(8) BINARY.
007000*
007100  01 ERROR-TYPE                   PIC X(1).
007200  01 WCODE                        PIC S9(4) COMP-5.
007300	01 SCODE                        PIC S9(9) COMP-5.
007400  01 DESC-LENG                    PIC S9(9) COMP-5.
007500  01 DESC-STR                     PIC X(200).
007600*
007700  01 列タイトル.
007800    02 タイトル名                 PIC X(10) OCCURS 10.
007900*
008000  01 データ個数                   PIC 9(8) BINARY.
008100  01 カウンタ                     PIC 9(8) BINARY.
008200  01 予約管理オブジェクト         OBJECT REFERENCE 予約管理クラス.
008300  01 会議室管理オブジェクト       OBJECT REFERENCE 会議室情報管理クラス.
008400  01 リストオブジェクト           OBJECT REFERENCE List.
008500  01 イテレータオブジェクト       OBJECT REFERENCE リストイテレータ.
008600 LINKAGE         SECTION.
008700  01 シート種別                   PIC X.
008800 PROCEDURE DIVISION.
008900 DECLARATIVES.
009000 OLE-EXCEPRION   SECTION.
009100     USE AFTER EXCEPTION OLE-ERR
009200*
009300* 例外処理：エラーコードを取得と表示
009400*           ERROR-TYPE : 0  OLEサーバがエラーを検出した
009500*                      : 1  OLEシステムがエラーを検出した
009600*           WCODE      : OLE サーバから通知されたエラーコード
009700*           SCODE      : OLE のシステムまたはOLE サーバから通知されたエラ
009800*　　　　　　　　　　　　ーコード
009900     INVOKE  EXCEPTION-OBJECT         "GET-ERROR-TYPE" 
010000                                      RETURNING        ERROR-TYPE
010100     IF ERROR-TYPE = 0 THEN
010200       INVOKE  EXCEPTION-OBJECT       "GET-WCODE"
010300                                      RETURNING        WCODE
010400       DISPLAY "特殊クラスで例外が発生しました。WCODE = " WCODE
010500     ELSE
010600       INVOKE  EXCEPTION-OBJECT       "GET-SCODE"
010700                                      RETURNING        SCODE
010800       DISPLAY "特殊クラスで例外が発生しました。SCODE = " SCODE
010900     END-IF
011000*
011100* エラーに関する説明の通知
011200* 
011300     INVOKE  EXCEPTION-OBJECT         "GET-DESCRIPTION-LENGTH" 
011400                                      RETURNING        DESC-LENG
011500     IF DESC-LENG NOT = 0 THEN
011600       INVOKE EXCEPTION-OBJECT        "GET-DESCRIPTION"
011700                                      RETURNING        DESC-STR
011800       DISPLAY "エラー説明 : "  DESC-STR
011900     END-IF  
012000     CALL "ファイル利用終了".
012100
012200 END DECLARATIVES.
012300***
012400*** データの復元
012500***
012600     ENTRY "データの復元"             USING   シート種別.
012700*
012800* EXCELシートの準備
012900* 
013000     EVALUATE  シート種別
013100     WHEN  会議室シート
013200       MOVE  会議室ファイル名     TO  ファイル名
013300       MOVE  会議室シート名       TO  シート名
013400     WHEN  予約シート
013500       MOVE  予約ファイル名       TO  ファイル名
013600       MOVE  予約シート名         TO  シート名
013700     END-EVALUATE
013800     CALL  "ファイル利用準備"
013900     CALL  "ワークシートサイズ取得"
014000*
014100* 登録されているデータ件数分、復元する
014200*
014300     PERFORM TEST BEFORE VARYING 行数カウンタ FROM 1 BY 1 
014400                                  UNTIL  行数カウンタ  >= 行数
014500       COMPUTE 行カウンタ = 行数カウンタ + 1 
014600       PERFORM  TEST BEFORE VARYING 列カウンタ FROM 1 BY 1
014700                                  UNTIL  列カウンタ    > 列数
014800         INVOKE  ワークシート         "GET-CELLS" 
014900                                      USING            行カウンタ
015000                                                       列カウンタ
015100                                      RETURNING        セル参照(列カウンタ) 
015200       END-PERFORM
015300*
015400* データ取得
015500*
015600       EVALUATE  シート種別
015700       WHEN  会議室シート
015800         INVOKE  セル参照(1)          "GET-VALUE" 
015900                                      RETURNING        会議室名 OF 会議室仕様レコード 
016000
016100         INVOKE  セル参照(2)          "GET-VALUE"
016200                                      RETURNING        定員     OF 会議室仕様レコード
016300         INVOKE  セル参照(3)          "GET-VALUE" 
016400                                      RETURNING        内線     OF 会議室仕様レコード
016500         INVOKE  セル参照(4)          "GET-VALUE"
016600                                      RETURNING        種類     OF 会議室仕様レコード
016700       WHEN  予約シート
016800         INVOKE  セル参照(1)          "GET-VALUE" 
016900                                      RETURNING        予約番号 OF 予約リストレコード 
017000         INVOKE  セル参照(2)          "GET-VALUE"
017100                                      RETURNING        予約日   OF 予約リストレコード
017200         INVOKE  セル参照(3)          "GET-VALUE" 
017300                                      RETURNING        会議室名 OF 予約リストレコード
017400         INVOKE  セル参照(4)          "GET-VALUE"
017500                                      RETURNING        時間枠   OF 予約リストレコード
017600         INVOKE  セル参照(5)          "GET-VALUE"
017700                                      RETURNING        予約者名 OF 予約リストレコード
017800         INVOKE  セル参照(6)          "GET-VALUE"
017900                                      RETURNING        内線     OF 予約リストレコード
018000         INVOKE  セル参照(7)          "GET-VALUE"
018100                                      RETURNING        所属     OF 予約リストレコード
018200       END-EVALUATE
018300*
018400* データ取出しに使用したセルオブジェクトを削除する
018500*
018600       PERFORM TEST BEFORE VARYING 列カウンタ FROM 1 BY 1 
018700                                  UNTIL 列カウンタ > 列数
018800         SET セル参照(列カウンタ) TO  NULL
018900       END-PERFORM
019000*
019100* 各オブジェクトを生成する。
019200*
019300       EVALUATE  シート種別
019400       WHEN  会議室シート
019500         INVOKE 会議室情報管理クラス  "NEW"
019600                                      RETURNING        会議室管理オブジェクト
019700         INVOKE 会議室管理オブジェクト "仕様情報の追加" 
019800                                      USING BY CONTENT 会議室仕様レコード
019900       WHEN  予約シート
020000         IF 本日の日付 <= 予約日 OF 予約リストレコード THEN
020100           INVOKE  予約管理クラス     "NEW"
020200                                       RETURNING       予約管理オブジェクト
020300           INVOKE 予約管理オブジェクト "予約" 
020400                                      USING BY CONTENT 予約リストレコード
020500                                            BY CONTENT ダミー会議室データ
020600                                      RETURNING        処理コード
020700         END-IF
020800       END-EVALUATE
020900     END-PERFORM
021000*
021100* EXCELシートの後処理
021200     CALL "ファイル利用終了"
021300     EXIT PROGRAM
021400     .
021500***
021600*** データの保存
021700***
021800     ENTRY "データの保存"             USING   シート種別.
021900*
022000* EXCELシートの準備
022100* 
022200     EVALUATE  シート種別
022300     WHEN  会議室シート
022400       MOVE  会議室ファイル名     TO  ファイル名
022500       MOVE  会議室シート名       TO  シート名
022600     WHEN  予約シート
022700       MOVE  予約ファイル名       TO  ファイル名
022800       MOVE  予約シート名         TO  シート名
022900     END-EVALUATE
023000     CALL  "ファイル利用準備"
023100     CALL  "前データ消去"
023200*
023300* 列タイトルの設定
023400*
023500     MOVE  LOW-VALUE              TO  列タイトル
023600     EVALUATE  シート種別
023700     WHEN  会議室シート
023800       MOVE  "会議室名"           TO  タイトル名(1)
023900       MOVE  "定員"               TO  タイトル名(2)
024000       MOVE  "内線"               TO  タイトル名(3)
024100       MOVE  "種類"               TO  タイトル名(4)
024200       MOVE  4                    TO  列数
024300     WHEN  予約シート
024400       MOVE  "予約番号"           TO  タイトル名(1)
024500       MOVE  "予約日"             TO  タイトル名(2)
024600       MOVE  "会議室名"           TO  タイトル名(3)
024700       MOVE  "時間枠"             TO  タイトル名(4)
024800       MOVE  "予約者"             TO  タイトル名(5)
024900       MOVE  "内線"               TO  タイトル名(6)
025000       MOVE  "所属"               TO  タイトル名(7)
025100       MOVE  7                    TO  列数
025200     END-EVALUATE
025300       MOVE  1                    TO  行カウンタ
025400*
025500     PERFORM TEST BEFORE VARYING 列カウンタ FROM 1 BY 1
025600                                  UNTIL  列カウンタ > 列数
025700       CALL  "列タイトル設定"     USING BY CONTENT  タイトル名(列カウンタ)
025800                                        BY CONTENT  列カウンタ
025900     END-PERFORM
026000*
026100* 各リストに登録された順に、EXCELシートに書き出す。
026200*
026300     EVALUATE  シート種別
026400     WHEN      会議室シート
026500       INVOKE  会議室情報管理クラス   "NEW"
026600                                      RETURNING        会議室管理オブジェクト
026700       INVOKE  会議室管理オブジェクト "仕様リストの参照"
026800                                      RETURNING        リストオブジェクト
026900     WHEN      予約シート
027000       INVOKE  予約情報クラス         "予約リストオブジェクトの参照"
027100                                      RETURNING        リストオブジェクト
027200     END-EVALUATE
027300*
027400     IF  リストオブジェクト NOT = NULL THEN
027500       INVOKE  リストイテレータ         "イテレータ生成"
027600                                        USING BY CONTENT リストオブジェクト
027700                                        RETURNING        イテレータオブジェクト
027800       INVOKE  イテレータオブジェクト   "先頭要素設定"
027900       PERFORM TEST BEFORE 
028000        UNTIL イテレータオブジェクト :: "要素確認" = ZOFF
028100         EVALUATE シート種別
028200         WHEN     会議室シート
028300           INVOKE  イテレータオブジェクト :: "現在の要素取得"  "仕様参照"
028400                                        RETURNING        会議室仕様レコード
028500         WHEN     予約シート
028600           INVOKE  イテレータオブジェクト :: "現在の要素取得"  "予約データの参照"
028700                                        RETURNING        予約リストレコード
028800         END-EVALUATE
028900*
029000         COMPUTE 行カウンタ = 行カウンタ + 1
029100         PERFORM TEST BEFORE VARYING 列カウンタ FROM 1 BY 1
029200                                    UNTIL 列カウンタ > 列数
029300           INVOKE  ワークシート         "GET-CELLS" 
029400                                        USING            行カウンタ
029500                                                         列カウンタ
029600                                        RETURNING        セル参照(列カウンタ) 
029700         END-PERFORM   
029800*
029900* データ設定
030000*
030100         EVALUATE  シート種別
030200         WHEN  会議室シート
030300           INVOKE  セル参照(1)          "SET-VALUE" 
030400                                        USING            会議室名 OF 会議室仕様レコード
030500           INVOKE  セル参照(2)          "SET-VALUE" 
030600                                        USING            定員     OF 会議室仕様レコード
030700           INVOKE  セル参照(3)          "SET-VALUE" 
030800                                        USING            内線     OF 会議室仕様レコード
030900           INVOKE  セル参照(4)          "SET-VALUE" 
031000                                        USING            種類     OF 会議室仕様レコード
031100         WHEN  予約シート
031200           INVOKE  セル参照(1)          "SET-VALUE" 
031300                                        USING            予約番号 OF 予約リストレコード 
031400           INVOKE  セル参照(2)          "SET-VALUE"
031500                                        USING            予約日   OF 予約リストレコード
031600           INVOKE  セル参照(3)          "SET-VALUE" 
031700                                        USING            会議室名 OF 予約リストレコード
031800           INVOKE  セル参照(4)          "SET-VALUE"
031900                                        USING            時間枠   OF 予約リストレコード
032000           INVOKE  セル参照(5)          "SET-VALUE"
032100                                        USING            予約者名 OF 予約リストレコード
032200           INVOKE  セル参照(6)          "SET-VALUE"
032300                                        USING            内線     OF 予約リストレコード
032400           INVOKE  セル参照(7)          "SET-VALUE"
032500                                        USING            所属     OF 予約リストレコード
032600         END-EVALUATE
032700         INVOKE  イテレータオブジェクト "次要素設定"
032800       END-PERFORM
032900       SET  イテレータオブジェクト  TO  NULL
033000     END-IF
033100*
033200* 書き出し終了処理
033300*
033400     INVOKE  ワークブック             "SAVE" 
033500     CALL    "ファイル利用終了"
033600     .
033700***
033800*** ファイル利用準備
033900***
034000 PROGRAM-ID.  ファイル利用準備  IS COMMON.
034100 PROCEDURE       DIVISION.
034200*
034300* 1) EXCELを起動する (CREATE-OBJECT)
034400* 2) 起動したEXCELを可視状態にする。(SET-VISIBLE)
034500* 3) ワークブックの取り出し。(GET-WORKBOOKS)
034600* 4) ファイルのオープン (OPEN)
034700* 5) ワークブックからシートコレクションを取り出す (GET-WORKSEETS)
034800* 6) シートコレクションからワークシートを取り出す (GET-ITEM)
034900     INVOKE  OLE                      "CREATE-OBJECT"
035000                                      USING            アプリケーション名
035100                                      RETURNING        EXCEL
035200     INVOKE  EXCEL                    "SET-VISIBLE"
035300                                      USING            OLE-FALSE
035400     INVOKE  EXCEL                    "GET-WORKBOOKS"
035500                                      RETURNING        ワークブック
035600     INVOKE  ワークブック             "OPEN"
035700                                      USING            ファイル名
035800                                      RETURNING        ワークブック
035900     INVOKE  ワークブック             "GET-WORKSHEETS"
036000                                      RETURNING        シート
036100     INVOKE  シート                   "GET-ITEM"
036200                                      USING BY REFERENCE シート名
036300                                      RETURNING        ワークシート
036400      EXIT PROGRAM.
036500 END PROGRAM  ファイル利用準備.
036600***
036700*** ファイル利用終了
036800***
036900 PROGRAM-ID.  ファイル利用終了  IS COMMON.
037000 DATA            DIVISION.
037100 PROCEDURE       DIVISION.
037200     IF ワークブック NOT = NULL THEN
037300       INVOKE ワークブック            "CLOSE" 
037400                                      USING            OLE-FALSE
037500     END-IF
037600     IF EXCEL NOT = NULL THEN
037700       INVOKE EXCEL                   "QUIT"
037800     END-IF
037900     SET  列範囲                  TO  NULL
038000     SET  行範囲                  TO  NULL
038100     SET  選択範囲                TO  NULL
038200     SET  全範囲                  TO  NULL
038300     SET  ワークシート            TO  NULL
038400     SET  シート                  TO  NULL
038500     SET  ワークブック            TO  NULL
038600     IF EXCEL NOT = NULL THEN
038700       INVOKE  EXCEL                  "SET-VISIBLE"
038800                                      USING            OLE-TRUE
038900     END-IF
039000     SET  EXCEL                   TO  NULL
039100 END PROGRAM ファイル利用終了.
039200***
039300*** ワークシートサイズ取得
039400***   ファイルの中に何件のデータが格納されているのか調べる。
039500***
039600 PROGRAM-ID.  ワークシートサイズ取得  IS COMMON.
039700 DATA            DIVISION.
039800 PROCEDURE       DIVISION.
039900     INVOKE  ワークシート             "GET-ROWS"
040000                                      RETURNING        全範囲
040100     INVOKE  全範囲                   "GET-CURRENTREGION"
040200                                      RETURNING        選択範囲
040300     INVOKE  選択範囲                 "GET-ROWS"
040400                                      RETURNING        行範囲
040500     INVOKE  選択範囲                 "GET-COLUMNS" 
040600                                      RETURNING        列範囲
040700     INVOKE  行範囲                   "GET-COUNT"
040800                                      RETURNING        行数
040900     INVOKE  列範囲                   "GET-COUNT" 
041000                                      RETURNING        列数
041100 END PROGRAM  ワークシートサイズ取得.
041200***
041300*** 前データ消去
041400***
041500 PROGRAM-ID.  前データ消去  IS COMMON.
041600 DATA            DIVISION.
041700 LINKAGE         SECTION.
041800 PROCEDURE       DIVISION.
041900     INVOKE  ワークブック             "SET-SAVED"
042000                                      USING            OLE-TRUE
042100*
042200* 前データを削除する
042300*
042400     INVOKE  ワークシート             "GET-ROWS"
042500                                      RETURNING        全範囲
042600     INVOKE  全範囲                   "CLEARCONTENTS"
042700     .
042800 END PROGRAM  前データ消去.
042900***
043000***  列タイトル設定
043100***
043200 PROGRAM-ID.  列タイトル設定 IS COMMON.
043300 DATA            DIVISION.
043400 LINKAGE         SECTION.
043500  01 Ｌ－列タイトル名             PIC X(10).
043600  01 Ｌ－列カウンタ               PIC S9(9)  COMP-5.
043700 PROCEDURE       DIVISION
043800                    USING         Ｌ－列タイトル名
043900                                  Ｌ－列カウンタ.
044000     MOVE  Ｌ－列カウンタ         TO  列カウンタ
044100*
044200     INVOKE  ワークシート             "GET-CELLS"
044300                                      USING            行カウンタ
044400                                                       列カウンタ
044500                                      RETURNING        セル参照(列カウンタ) 
044600     INVOKE セル参照(列カウンタ)      "SET-VALUE" 
044700                                      USING BY REFERENCE Ｌ－列タイトル名
044800     SET    セル参照(行カウンタ)  TO  NULL
044900 END PROGRAM  列タイトル設定.
045000 END PROGRAM  EXCEL-EDIT.
