000100* Copyright 1999-2015 FUJITSU LIMITED
000200  01  状態通知域.
000300      02  エラーコード      PIC S9(9) COMP-5.
000400      02  詳細コード        PIC S9(9) COMP-5.
000500  01  サーバ名              PIC X(15).
000600  01  サーバ識別子          PIC S9(9) COMP-5.
000700  01  論理宛先名            PIC X(8).
000800  01  受信パラメタ.
000900      02  受信バッファ長    PIC S9(9) COMP-5.
001000      02  受信メッセージ長  PIC S9(9) COMP-5.
001100      02  受信処理種別      PIC S9(9) COMP-5.
001200      02  受信監視時間      PIC S9(9) COMP-5.
001300      02                    PIC X(16) VALUE LOW-VALUE.
001400  01  送信パラメタ.
001500      02  送信メッセージ長  PIC S9(9) COMP-5.
001600      02  送信優先順位      PIC S9(9) COMP-5.
001700      02  送信処理種別      PIC S9(9) COMP-5.
001800      02  送信監視時間      PIC S9(9) COMP-5.
001900      02                    PIC X(16) VALUE LOW-VALUE.
002000  01  通信予約域            PIC S9(9) COMP-5 VALUE 0.
