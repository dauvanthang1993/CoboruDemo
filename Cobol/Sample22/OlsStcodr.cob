000100*=================================================================
000200* 「マルチスレッドプログラミング」
000300*     スレッド間でファイル・データを共用してオンラインショッピング
000400*   のアプリケーションを構築します。
000500*
000600*=================================================================
000700*
000800*  ファイル名： OLSSRCODR.cob
000900*  動作概要  ： オンラインショッピングのための、在庫データの更新
001000*               とオーダーデータの登録を行う。
001100*  パラメータ：
001200*     第一引数：オーダー情報(集団項目)
001300*     復帰値
001400*       成功：０
001500*       失敗：０以外
001600*
001700* Copyright 1999-2015 FUJITSU LIMITED
001800*=================================================================
001900 identification division.
002000  program-id. "在庫更新オーダー登録".
002100 data division.
002200 working-storage section.
002300  copy user-Log.
002400  copy user-Lock.
002500  01 オンラインショッピング起動情報   pic 9(1) is external.
002600  01 在庫更新数               pic 9(02) value 1.
002700  01 オーダー登録数           pic 9(02) value 1.
002800 01 メッセージテーブル.
002900   02               pic x(90) value
003000     "発注情報または発注明細の登録に失敗しました。プログラム：在庫更新オーダー登録".
003100   02               pic x(90) value
003200     "無効な製品番号が指定されました。プログラム：在庫更新オーダー登録".
003300   02               pic x(90) value
003400     "在庫がありません。プログラム：在庫更新オーダー登録".
003500   02               pic x(90) value
003600     "オンラインショッピングが起動されていません。プログラム：在庫更新オーダー登録".
003700 01 redefines メッセージテーブル.
003800   02 エラーメッセージ pic x(90) occurs 4 times.
003900 linkage section.
004000  copy Order-Info.
004100  01 復帰値 global     pic 9(09) comp-5.
004200 procedure division using orderInfo returning 復帰値.
004300*=================================================================
004400*  作業域を初期化します。
004500*=================================================================
004600     move 0 to 復帰値.
004700     initialize userLog.
004800*=================================================================
004900*  オンラインショッピングの起動状態を確認します。
005000*=================================================================
005100     move "初期化"  to lock-key.
005200     move -1        to wait-time.
005300     call "COB_LOCK_DATA" with c linkage
005400                          using by reference lock-key
005500                                by value wait-time
005600                                by reference err-datail
005700                          returning ret-value.
005800*=================================================================
005900*  オンラインショッピングが起動されているなら、在庫の更新と
006000*  オーダーの登録を行う。
006100*=================================================================
006200     if オンラインショッピング起動情報 = 1 then
006300       perform test before
006400         varying orderIndex from 1 by 1
006500               until orderIndex > orderQuantity or
006600                     復帰値 not = 0
006700         call "在庫更新処理" using orderProductNumber(orderIndex)
006800                                   orderProductQuantity(orderIndex)
006900                             returning 復帰値
007000       end-perform
007100       if 復帰値 = 0 then
007200         call "オーダー登録処理" using orderInfo
007300                                 returning 復帰値
007400       end-if
007500     else
007600       move 4 to 復帰値
007700       set エラー to true
007800     end-if.
007900 exit-proc.
008000*=================================================================
008100*  復帰値が０以外ならエラーログを出力します。
008200*=================================================================
008300     move "初期化"  to lock-key.
008400     call "COB_UNLOCK_DATA" with c linkage
008500                            using by reference lock-key
008600                                  by reference err-datail
008700                            returning ret-value.
008800*=================================================================
008900*  復帰値が０以外ならエラーログを出力します。
009000*=================================================================
009100     if 復帰値 not = 0 then
009200       move エラーメッセージ(復帰値) to 説明
009300       call "COB_REPORT_EVENT" using userLog returning 復帰コード
009400     end-if
009500     exit program.
009600/
009700*=================================================================
009800*  在庫更新処理
009900*  パラメータ：
010000*     第一引数：製品番号
010100*     第二引数：オーダー数量
010200*     復帰値
010300*       成功：０
010400*       失敗：０以外
010500*
010600*=================================================================
010700 identification division.
010800 program-id.    在庫更新処理.
010900 environment    division.
011000 input-output section.
011100 file-control.
011200     select 在庫情報ファイル assign to sys007
011300       organization is indexed
011400       access mode  is random
011500       record key   is 製品番号
011600       file status  is 在庫情報ファイル入出力状態.
011700 data           division.
011800 file            section.
011900 fd 在庫情報ファイル is external.
012000 01 在庫情報.
012100   02 製品番号              pic x(10).
012200   02 在庫数                pic 9(10).
012300 working-storage section.
012400 01 在庫情報ファイル入出力状態       pic x(02).
012500 linkage         section.
012600 01 orderProductNumber      pic x(10).
012700 01 orderProductQuantity   pic 9(10).
012800  01 復帰値            pic 9(09) comp-5.
012900 procedure      division
013000                    using orderProductNumber orderProductQuantity
013100                    returning 復帰値.
013200*=================================================================
013300*  在庫情報ファイルの処理を行う。処理中、別スレッドでの操作を
013400*  排除するため、"在庫更新処理"をキーとしてロックを行う。
013500*=================================================================
013600     move "在庫更新処理"  to lock-key.
013700     move -1      to wait-time.
013800     call "COB_LOCK_DATA" with c linkage
013900                          using by reference lock-key
014000                                by value wait-time
014100                                by reference err-datail
014200                          returning ret-value.
014300*=================================================================
014400*  製品番号をキーとして、レコードを読み込む。レコードロック状態
014500*  (fs=99)にあるなら、成功するまで処理を繰り返す。
014600*=================================================================
014700     move orderProductNumber to 製品番号
014800     perform test after
014900         until 在庫情報ファイル入出力状態 not = "99"
015000       read 在庫情報ファイル
015100         invalid key
015200           set エラー to true
015300           move 2 to 復帰値
015400       end-read
015500     end-perform
015600*=================================================================
015700*  オーダー数量が在庫数より大きいならエラーとし、そうでないなら
015800*  在庫数を再計算して、レコードを更新する
015900*=================================================================
016000     if 在庫数 < orderProductQuantity then
016100       set エラー to true
016200       move 3 to 復帰値
016300     else
016400       compute 在庫数 = 在庫数 - orderProductQuantity
016500       rewrite 在庫情報 end-rewrite
016600       move 0 to 復帰値
016700     end-if.
016800*=================================================================
016900*  "在庫更新処理"のロックを解除する
017000*=================================================================
017100     call "COB_UNLOCK_DATA" with c linkage
017200                            using by reference lock-key
017300                                  by reference err-datail
017400                            returning ret-value.
017500 end program    在庫更新処理.
017600/
017700*=================================================================
017800*  オーダー登録処理
017900*  パラメータ：
018000*     第一引数：オーダー情報
018100*     復帰値
018200*       成功：０
018300*       失敗：０以外
018400*
018500*=================================================================
018600 identification division.
018700 program-id.    オーダー登録処理.
018800 environment    division.
018900 input-output section.
019000 file-control.
019100     select optional 発注情報ファイル assign to sys009
019200       organization is indexed
019300       access mode  is random
019400       record key   is 発注番号 of 発注情報
019500       file status  is 発注情報ファイル入出力状態.
019600     select optional 発注明細ファイル assign to sys010
019700       organization is indexed
019800       access mode  is dynamic
019900       record key   is 発注番号 of 発注明細 発注製品番号 with duplicates
020000       file status  is 発注明細ファイル入出力状態.
020100 data            division.
020200 file            section.
020300 fd 発注情報ファイル is external.
020400 01 発注情報.
020500   02 発注番号              pic x(12).
020600   02 発注顧客番号          pic x(32).
020700   02 発注日付              pic x(14).
020800 fd 発注明細ファイル is external.
020900 01 発注明細.
021000   02 発注番号              pic x(12).
021100   02 発注製品番号          pic x(10).
021200   02 発注数                pic 9(09).
021300 working-storage section.
021400  01 発注情報ファイル入出力状態       pic x(02).
021500  01 発注明細ファイル入出力状態       pic x(02).
021600  01 オーダ番号.
021700   02 filler              pic x(04) value "ONUM".
021800   02 番号                pic x(08).
021900  01 オーダー番号作成情報         pic 9(08).
022000 linkage section.
022100  copy Order-Info.
022200  01 復帰値            pic 9(09) comp-5.
022300 procedure division using orderInfo
022400                    returning 復帰値.
022500     move 0 to 復帰値
022600*=================================================================
022700*  発注情報ファイルの処理を行う。処理中、別スレッドでの操作を
022800*  排除するため、"発注情報"をキーとしてロックを行う。
022900*=================================================================
023000     move all space   to lock-key.
023100     move "発注情報"  to lock-key.
023200     move -1      to wait-time.
023300     call "COB_LOCK_DATA" with c linkage
023400                          using by reference lock-key
023500                                by value wait-time
023600                                by reference err-datail
023700                          returning ret-value.
023800*=================================================================
023900*  オーダー番号を採番し、オーダー情報をファイルに登録する
024000*=================================================================
024100     accept 番号 from time.      *> * オーダー番号を作成する
024200     move orderUserID to 発注顧客番号.
024300     move orderDate   to 発注日付.
024400     move オーダ番号  to 発注番号 of 発注情報.
024500*
024600     write 発注情報.
024700*=================================================================
024800*  "発注情報"のロックを解除する
024900*=================================================================
025000     call "COB_UNLOCK_DATA" with c linkage
025100                            using by reference lock-key
025200                                  by reference err-datail
025300                            returning ret-value.
025400     move オーダ番号 to orderNumber.
025500*=================================================================
025600*  発注情報の登録に成功したら、発注明細の登録を行う。この際、
025700*  発注情報明細に対する別スレッドの処理を排他とするため"発注明細"
025800*  をキーとして、ロックを行う。
025900*=================================================================
026000     if 発注情報ファイル入出力状態 = "00" then
026100       move "発注明細"  to lock-key
026200       move -1      to wait-time
026300       call "COB_LOCK_DATA" with c linkage
026400                            using by reference lock-key
026500                                  by value wait-time
026600                                  by reference err-datail
026700                            returning ret-value
026800*=================================================================
026900*  orderQuantity数分、発注明細をファイルに登録する
027000*=================================================================
027100       perform test before
027200           varying orderIndex from 1 by 1
027300                   until orderIndex > orderQuantity
027400         move オーダ番号                       to 発注番号 of 発注明細
027500         move orderProductNumber(orderIndex)   to 発注製品番号
027600         move orderProductQuantity(orderIndex) to 発注数
027700         write 発注明細
027800         if 発注明細ファイル入出力状態 not = "00"
027900           set エラー to true
028000           move 1 to 復帰値
028100           exit perform
028200         end-if
028300       end-perform
028400*=================================================================
028500*  "発注明細"のロックを解除する
028600*=================================================================
028700       call "COB_UNLOCK_DATA" with c linkage
028800                              using by reference lock-key
028900                                    by reference err-datail
029000                              returning ret-value
029100     else
029200       set エラー to true
029300       move 1 to 復帰値
029400     end-if.
029500* オーダー明細を登録する
029600* 呼出し元に復帰する
029700 end program    オーダー登録処理.
029800 end program    "在庫更新オーダー登録".
