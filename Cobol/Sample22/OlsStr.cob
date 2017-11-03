000100*=================================================================
000200* 「マルチスレッドプログラミング」
000300*     スレッド間でファイル・データを共用してオンラインショッピング
000400*   のアプリケーションを構築します。
000500*
000600*=================================================================
000700*
000800*  ファイル名： OLSSTR.cob
000900*  動作概要  ： オンラインショッピングを開始するため、各種ファイル
001000*               をオープンします。
001100*
001200* Copyright 1999-2015 FUJITSU LIMITED
001300*=================================================================
001400 identification division.
001500  program-id. "オンラインショッピング起動".
001600 environment division.
001700 configuration section.
001800 special-names.
001900      symbolic constant
002000        no-limit is -1.
002100 input-output  section.
002200 file-control.
002300     select 顧客情報ファイル assign to sys006
002400       organization is indexed
002500       access mode  is random
002600       record key   is 顧客番号
002700       file status  is 顧客情報ファイル入出力状態.
002800     select 在庫情報ファイル assign to sys007
002900       organization is indexed
003000       access mode  is random
003100       record key   is 製品番号 of 在庫情報
003200       file status  is 在庫情報ファイル入出力状態.
003300     select 製品情報ファイル assign to sys008
003400       organization is indexed
003500       access mode  is random
003600       record key   is 製品番号 of 製品情報
003700       file status  is 製品情報ファイル入出力状態.
003800     select optional 発注情報ファイル assign to sys009
003900       organization is indexed
004000       access mode  is random
004100       record key   is 発注番号 of 発注情報
004200       file status  is 発注情報ファイル入出力状態.
004300     select optional 発注明細ファイル assign to sys010
004400       organization is indexed
004500       access mode  is dynamic
004600       record key   is 発注番号 of 発注明細 発注製品番号 with duplicates
004700       file status  is 発注明細ファイル入出力状態.
004800 data division.
004900 file section.
005000 fd 顧客情報ファイル is external.
005100 01 顧客情報.
005200   02 顧客番号                          pic x(32).
005300   02 暗証番号                          pic x(32).
005400 fd 在庫情報ファイル is external.
005500 01 在庫情報.
005600   02 製品番号                pic x(10).
005700   02 在庫数              pic 9(10).
005800 fd 製品情報ファイル is external.
005900 01 製品情報.
006000   02 製品番号                pic x(12).
006100   02 型番                pic x(32).
006200   02 形式                pic x(32).
006300   02 価格                pic 9(09).
006400 fd 発注情報ファイル is external.
006500 01 発注情報.
006600   02 発注番号                pic x(12).
006700   02 発注顧客番号            pic x(32).
006800   02 発注日付                pic x(14).
006900 fd 発注明細ファイル is external.
007000 01 発注明細.
007100   02 発注番号                pic x(12).
007200   02 発注製品番号            pic x(10).
007300   02 発注数              pic 9(09).
007400 working-storage section.
007500   copy user-Log.
007600   copy user-Lock.
007700   01 オンラインショッピング起動情報      pic 9(1) is external.
007800   01 顧客情報ファイル入出力状態          pic x(02).
007900   01 在庫情報ファイル入出力状態          pic x(02).
008000   01 製品情報ファイル入出力状態          pic x(02).
008100   01 発注情報ファイル入出力状態          pic x(02).
008200   01 発注明細ファイル入出力状態          pic x(02).
008300   01 入出力状態                          pic x(02).
008400   01 ファイル名                          pic x(24).
008500  linkage section.
008600   01 復帰値                              pic s9(09) comp-5.
008700 procedure division returning 復帰値.
008800*=================================================================
008900*  作業域を初期化します。
009000*=================================================================
009100     move 0 to 復帰値.
009200     initialize userLog.
009300*=================================================================
009400*  オンラインショッピングの起動状態を確認します。
009500*=================================================================
009600     move "初期化"  to lock-key.
009700     move NO-LIMIT  to wait-time.
009800     call "COB_LOCK_DATA" with c linkage
009900                          using by reference lock-key
010000                                by value wait-time
010100                                by reference err-datail
010200                          returning ret-value.
010300*=================================================================
010400*  オンラインショッピングが起動されていないなら、各種ファイルを
010500*  オープンし、オンラインショッピングを起動します。
010600*=================================================================
010700     if オンラインショッピング起動情報 not = 1 then
010800*
010900       *> 顧客情報ファイルをオープンする
011000       open input 顧客情報ファイル
011100       if 顧客情報ファイル入出力状態 not = "00"
011200         move "顧客情報ファイル"         to ファイル名
011300         move 顧客情報ファイル入出力状態 to 入出力状態
011400         move 1 to 復帰値
011500         go to exit-proc
011600       end-if
011700*
011800       *> 在庫情報ファイルをオープンする
011900       open i-o 在庫情報ファイル
012000       if 在庫情報ファイル入出力状態 not = "00"
012100         close 顧客情報ファイル
012200         move "在庫情報ファイル"         to ファイル名
012300         move 在庫情報ファイル入出力状態 to 入出力状態
012400         move 1 to 復帰値
012500         go to exit-proc
012600       end-if
012700*
012800       *> 製品情報ファイルをオープンする
012900       open input 製品情報ファイル
013000       if 製品情報ファイル入出力状態 not = "00"
013100         close 顧客情報ファイル
013200         close 在庫情報ファイル
013300         move "製品情報ファイル"         to ファイル名
013400         move 製品情報ファイル入出力状態 to 入出力状態
013500         move 1 to 復帰値
013600         go to exit-proc
013700       end-if
013800*
013900       *> 発注情報ファイルをオープンする
014000       open i-o 発注情報ファイル
014100       if not (発注情報ファイル入出力状態 = "00" or
014200               発注情報ファイル入出力状態 = "05") then
014300         close 顧客情報ファイル
014400         close 在庫情報ファイル
014500         close 製品情報ファイル
014600         move "発注情報ファイル"         to ファイル名
014700         move 発注情報ファイル入出力状態 to 入出力状態
014800         move 1 to 復帰値
014900         go to exit-proc
015000       end-if
015100*
015200       *> 発注明細ファイルをオープンする
015300       open i-o 発注明細ファイル
015400       if not (発注明細ファイル入出力状態 = "00" or
015500               発注明細ファイル入出力状態 = "05") then
015600         close 顧客情報ファイル
015700         close 在庫情報ファイル
015800         close 製品情報ファイル
015900         close 発注情報ファイル
016000         move "発注明細ファイル"         to ファイル名
016100         move 発注明細ファイル入出力状態 to 入出力状態
016200         move 1 to 復帰値
016300         go to exit-proc
016400       end-if
016500       move 1 to オンラインショッピング起動情報
016600     else
016700*=================================================================
016800*  オンラインショッピングが起動済なら、エラーログを出力します。
016900*=================================================================
017000       set 警告 to true
017100       move "オンラインショッピングはすでに起動されています。
017200-           "プログラム：オンラインショッピング起動" TO 説明
017300       move 2 to 復帰値
017400     end-if.
017500*=================================================================
017600* 呼出し元に復帰します。
017700*=================================================================
017800 exit-proc.
017900     call "COB_UNLOCK_DATA" with c linkage
018000                            using by reference lock-key
018100                                  by reference err-datail
018200                            returning ret-value
018300     if 復帰値 not = 0 then
018400       if 復帰値 not = 1 then
018500         set エラー to true
018600         string "オープンエラーが発生しました。プログラム：オンライン
018700-               "ショッピング起動 ファイル名＝"  delimited by size
018800                ファイル名                       delimited by space
018900                入出力状態                       delimited by size
019000                into 説明
019100       end-if
019200       call "COB_REPORT_EVENT" using userLog
019300                                   returning 復帰コード
019400     end-if
019500     exit program.
