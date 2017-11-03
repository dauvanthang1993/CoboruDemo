000100* Copyright 1992-2015 FUJITSU LIMITED
000200*
000300* EXCELファイル名
000400*
000500     会議室ファイル名  IS "C:\NetCOBOL Studio\workspace\SAMPLE17_LIB\RoomList.XLS"
000600     予約ファイル名    IS "C:\NetCOBOL Studio\workspace\SAMPLE17_LIB\RsvList.XLS"
000700*
000800* EXCELシート名
000900*
001000     会議室シート名    IS "会議室仕様"
001100     予約シート名      IS "予約リスト"
001200 
001300*
001400* 参照フラグ
001500*
001600     ZON               IS  B"1"
001700     ZOFF              IS  B"0"
001800*
001900* 予約状況 
002000*
002100     予約              IS  1
002200     空き              IS  0
002300     終了              IS  9
002400*
002500* EXCELシート
002600*
002700     会議室シート      IS "K"
002800     予約シート        IS "R"
002900*
003000* 個人予約のMAX
003100*
003200     RSV-MAX           IS  5
003300*
003400* 処理コード
003500*
003600     予約－復元        IS  4
003700     予約－新規        IS  8
003800     予約－既存        IS  12
003900*
004000* 共通エラーコード
004100*
004200     ERROR-OFF         IS  0
004300     ERROR-ON          IS -1
