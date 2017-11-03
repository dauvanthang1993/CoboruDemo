000100*=================================================================
000200* 「マルチスレッドプログラミング」
000300*     スレッド間でファイル・データを共用して認証処理を実現します
000400*
000500*=================================================================
000600*
000700*  ファイル名： MTHUSRINF.cob
000800*  動作概要  ： 認証サービスのための認証処理をする。
000900*  パラメータ：
001000*     第一引数：ユーザＩＤ
001100*     第二引数：パスワード
001200*     復帰値
001300*       成功：０
001400*       失敗：０以外
001500*
001600* Copyright 1999-2015 FUJITSU LIMITED
001700*=================================================================
001800 identification division.
001900 program-id. "顧客情報取得".
002000 environment division.
002100 input-output section.
002200 file-control.
002300     select 顧客情報ファイル assign to sys006
002400       organization is indexed
002500       access mode is random
002600       record key is 顧客番号
002700       file status is 顧客情報ファイル入出力状態.
002800 data division.
002900 file section.
003000 fd 顧客情報ファイル is external.
003100 01 顧客情報.
003200   02 顧客番号                pic x(32).
003300   02 暗証番号                pic x(32).
003400 working-storage section.
003500   copy user-Lock.
003600 01 認証サービス起動情報  pic 9(1) is external.
003700 01 顧客情報ファイル入出力状態          pic x(2).
003800 linkage section.
003900   copy User-Info.
004000 01 復帰値                pic 9(09) comp-5.
004100 procedure division using userInfo returning 復帰値.
004200*=================================================================
004300*  作業域を初期化します。
004400*=================================================================
004500     move 0 to 復帰値.
004600*=================================================================
004700*  認証サービスの起動状態を確認します。
004800*=================================================================
004900     move "初期化" to lock-key.
005000     move -1 to wait-time.
005100     call "COB_LOCK_DATA" with c linkage
005200                          using by reference lock-key
005300                                by value wait-time
005400                                by reference err-datail
005500                          returning ret-value.
005600     if 認証サービス起動情報 = 1 then
005700*=================================================================
005800*  認証サービスが起動されているなら、userIDをキーにレコードを
005900*  読み込み、認証処理を行います。
006000*=================================================================
006100       move userID to 顧客番号
006200       read 顧客情報ファイル with no lock
006300         invalid key
006400           move 2     to 復帰値
006500         not invalid key
006600           if 暗証番号 not = userPassword
006700             move 3 to 復帰値
006800           end-if
006900       end-read
007000*=================================================================
007100*  認証サービスが起動されていないなら、その旨のコードを設定します。
007200*=================================================================
007300     else
007400       move 4     to 復帰値
007500     end-if.
007600 exit-proc.
007700     call "COB_UNLOCK_DATA" with c linkage
007800                            using by reference lock-key
007900                                  by reference err-datail
008000                            returning ret-value.
008100     exit program.
