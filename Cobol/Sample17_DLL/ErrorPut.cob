000100*========================================================================
000200*　エラークラス
000300*                                   −サンプルプログラム「会議室予約」−
000400*
000500*　　エラーを処理するメソッドを持つ。
000600*
000700*　〇継承クラス
000800*　　１）シングルトン
000900*
001000*　〇ファクトリデータ
001100*　　１）エラーコード　　　　　　−　PIC S9(8) BINARY
001200*
001300*　○オブジェクトデータ
001400*　　１）エラークラス　　　　　　−　OBJECT REFERENCE FACTORY エラークラス
001500*
001600*　〇ファクトリメソッド
001700*　　１）エラーコードの参照・設定
001800*
001900*　〇オブジェクトメソッド
002000*　　１）仕様検索エラー
002100*　  ２）時間枠オブジェクト検索エラー
002200*　　３）会議室オブジェクト検索エラー
002300*　　４）会議室情報検索エラー
002400*　　５）予約オブジェクト削除エラー
002500*　　６）予約情報検索エラー
002600*　　７）予約キャンセルエラー
002700*
002800*            Copyright 1999-2015 FUJITSU LIMITED
002900*========================================================================
003000 IDENTIFICATION  DIVISION.
003100 CLASS-ID.   エラークラス  INHERITS シングルトン.
003200 ENVIRONMENT     DIVISION.
003300 CONFIGURATION   SECTION.
003400 SPECIAL-NAMES.
003500     SYMBOLIC CONSTANT
003600     ERR-SPC-NOSRCH     IS  -4
003700     ERR-TST-NONE       IS  -8
003800     ERR-RST-NONE       IS  -12
003900     ERR-RSC-NONE       IS  -16
004000     ERR-RSV-NOREMV     IS  -20
004100     ERR-RSV-NOSRCH     IS  -24
004200     ERR-RSV-NOCNCL     IS  -28
004300     .
004400 REPOSITORY.
004500     CLASS シングルトン
004600     .
004700 FACTORY.
004800 DATA            DIVISION.
004900 WORKING-STORAGE SECTION.
005000  01  エラーコード                    PIC S9(8) BINARY  PROPERTY.
005100 PROCEDURE       DIVISION.
005200 END FACTORY.
005300*
005400 OBJECT.
005500 DATA DIVISION.
005600 WORKING-STORAGE SECTION.
005700  01 エラーオブジェクト               OBJECT REFERENCE FACTORY エラークラス.
005800 PROCEDURE       DIVISION.
005900*========================================================================
006000*　仕様検索エラーメソッド
006100*
006200*　　仕様名キーに該当する情報が見つかりませんでした。
006300*========================================================================
006400 METHOD-ID.  仕様検索エラー.
006500 DATA            DIVISION.
006600 PROCEDURE       DIVISION.
006700     INVOKE  SELF                     "GETCLASS" 
006800                                      RETURNING        エラーオブジェクト
006900     MOVE  ERR-SPC-NOSRCH         TO  エラーコード  OF エラーオブジェクト
007000 END METHOD 仕様検索エラー.
007100*========================================================================
007200*　時間枠オブジェクト検索エラーメソッド
007300*
007400*　　指定された時間枠に該当する時間枠オブジェクトが見つかりません。
007500*========================================================================
007600 METHOD-ID.  時間枠オブジェクト検索エラー.
007700 DATA            DIVISION.
007800 PROCEDURE       DIVISION.
007900     DISPLAY "++++ 該当する時間枠は見つかりません。++++ "
008000     INVOKE  SELF                     "GETCLASS" 
008100                                      RETURNING        エラーオブジェクト
008200     MOVE    ERR-TST-NONE         TO  エラーコード  OF エラーオブジェクト
008300 END METHOD 時間枠オブジェクト検索エラー.
008400*========================================================================
008500*　会議室オブジェクト検索エラーメソッド
008600*
008700*　　指定された会議室に該当する会議室オブジェクトが見つかりません。
008800*========================================================================
008900 METHOD-ID.  会議室オブジェクト検索エラー.
009000 DATA            DIVISION.
009100 PROCEDURE       DIVISION.
009200     DISPLAY "++++ 該当する会議室は見つかりません。++++ "
009300     INVOKE  SELF                     "GETCLASS" 
009400                                      RETURNING        エラーオブジェクト
009500     MOVE    ERR-RST-NONE         TO  エラーコード  OF エラーオブジェクト
009600 END METHOD 会議室オブジェクト検索エラー.
009700*========================================================================
009800*　会議室情報検索エラーメソッド
009900*
010000*　　会議室情報が見つかりません。
010100*========================================================================
010200 METHOD-ID.  会議室情報検索エラー.
010300 DATA            DIVISION.
010400 PROCEDURE       DIVISION.
010500     DISPLAY "++++ 会議室の仕様情報が登録されていません。++++ "
010600     INVOKE  SELF                     "GETCLASS" 
010700                                      RETURNING        エラーオブジェクト
010800     MOVE    ERR-RSC-NONE         TO  エラーコード  OF エラーオブジェクト
010900 END METHOD 会議室情報検索エラー.
011000*========================================================================
011100*　予約オブジェクト削除エラーメソッド
011200*
011300*　　予約オブジェクトの削除処理でエラーが発生しました。
011400*========================================================================
011500 METHOD-ID.  予約オブジェクト削除エラー.
011600 DATA            DIVISION.
011700 PROCEDURE       DIVISION.
011800     DISPLAY "++++ 予約情報の削除に失敗しました。++++ "
011900     INVOKE  SELF                     "GETCLASS"
012000                                      RETURNING        エラーオブジェクト
012100     MOVE    ERR-RSV-NOREMV       TO  エラーコード  OF エラーオブジェクト
012200 END METHOD 予約オブジェクト削除エラー.
012300*========================================================================
012400*　予約情報検索エラーメソッド
012500*
012600*　　予約者名キーに該当する予約情報が見つかりませんでした。
012700*========================================================================
012800 METHOD-ID.  予約情報検索エラー.
012900 DATA            DIVISION.
013000 PROCEDURE       DIVISION.
013100     DISPLAY "++++ 該当する予約情報は見つかりませんでした。++++ "
013200     INVOKE  SELF                     "GETCLASS" 
013300                                      RETURNING        エラーオブジェクト
013400     MOVE    ERR-RSV-NOSRCH       TO  エラーコード  OF エラーオブジェクト
013500 END METHOD 予約情報検索エラー.
013600*========================================================================
013700*　予約キャンセルエラーメソッド
013800*
013900*　　予約番号が誤っています。キャンセルできません。
014000*========================================================================
014100 METHOD-ID.  予約キャンセルエラー.
014200 DATA            DIVISION.
014300 PROCEDURE       DIVISION.
014400     DISPLAY "++++ 予約番号が誤っています。キャンセルできませんでした。++++ "
014500     INVOKE  SELF                     "GETCLASS" 
014600                                      RETURNING        エラーオブジェクト
014700     MOVE    ERR-RSV-NOCNCL       TO  エラーコード  OF エラーオブジェクト
014800 END METHOD 予約キャンセルエラー.
014900 END OBJECT.
015000 END CLASS  エラークラス.
