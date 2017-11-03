000010*=================================================================
000020*「簡易アプリ間通信機能を使用したプログラム」
000030*    簡易アプリ間通信サーバ上の論理宛先を使ってアプリケーション間
000040*  でメッセージのやりとりをします。
000050*
000060*=================================================================
000070*
000080*                  簡易アプリ間通信サーバ
000090*   ┌SAMPLE29─┐  ┌SERVER1 ───┐  ┏TSUUSHIN━━━━━━━┓
000100*   │          │  │              │  ┃                      ┃
000110*   │          │  │┌─────┐│  ┃                      ┃
000120*   │          ──→│ＬＤ１    │┼─→ CALL  "COBCI_WRITE"…┃
000130*   │          │  │├─────┤│  ┃                      ┃
000140*   │          ←──│ＬＤ２    │←── CALL  "COBCI_READ" …┃
000150*   │          │  │└─────┘│  ┃                      ┃
000160*   │          │  │              │  ┃                      ┃
000170*   └─────┘  └───────┘  ┗━━━━━━━━━━━┛
000180*                                                       LD: 論理宛先
000190*
000200*    上図、太枠部分が本プログラム
000210*
000220*     Copyright 2000-2015 FUJITSU LIMITED
000230*=================================================================
000240 IDENTIFICATION DIVISION.
000250  PROGRAM-ID. SAMPLE29.
000260*
000270 DATA DIVISION.
000280  WORKING-STORAGE SECTION.
000290      COPY "PRM_REC.CBL".
000300*
000310  01  メッセージ域.
000320      02  通信領域  OCCURS 1 TO 32000 DEPENDING ON メッセージ長.
000330          03              PIC X(1).
000340  01  メッセージ長        PIC 9(5).
000350  01  送信メッセージ１    PIC X(26) VALUE "SENT MESSAGE FROM SAMPLE29".
000360  01  送信メッセージ２    PIC X(25) VALUE "SENT MESSAGE : PRIORITY=5".
000370*
000380 PROCEDURE DIVISION.
000390*=================================================================
000400**（１）サーバと接続します。
000410*=================================================================
000420      MOVE "SERVER1" TO サーバ名.
000430      CALL "COBCI_OPEN" WITH C LINKAGE
000440           USING BY REFERENCE 状態通知域
000450                 BY REFERENCE サーバ名
000460                 BY REFERENCE サーバ識別子
000470                 BY VALUE     通信予約域.
000480      IF PROGRAM-STATUS = 0 THEN
000490          DISPLAY NC"サーバと接続しました。"
000500          DISPLAY NC"　サーバ名　　：" サーバ名
000510      ELSE
000520          DISPLAY NC"サーバとの接続に失敗しました。"
000530          DISPLAY NC"　サーバ名　　：" サーバ名
000540          DISPLAY NC"　エラーコード：" エラーコード OF 状態通知域
000550          DISPLAY NC"　詳細コード　：" 詳細コード OF 状態通知域
000560          GO TO 処理終了
000570      END-IF.
000580*
000590*=================================================================
000600**（２）メッセージを書き込みます。
000610*=================================================================
000620      MOVE 26               TO メッセージ長.
000630      MOVE 送信メッセージ１ TO メッセージ域.
000640      MOVE "MYLD1"          TO 論理宛先名.
000650      MOVE メッセージ長     TO 送信メッセージ長 OF 送信パラメタ.
000660      MOVE 1                TO 送信優先順位 OF 送信パラメタ.
000670      MOVE 0                TO 送信処理種別 OF 送信パラメタ.
000680      CALL "COBCI_WRITE" WITH C LINKAGE
000690           USING BY REFERENCE 状態通知域
000700                 BY VALUE     サーバ識別子
000710                 BY REFERENCE 論理宛先名
000720                 BY REFERENCE 送信パラメタ
000730                 BY REFERENCE メッセージ域
000740                 BY VALUE     通信予約域.
000750      IF PROGRAM-STATUS = 0 THEN
000760          DISPLAY NC"メッセージを１件書き込みました。"
000770          DISPLAY NC"　論理宛先名　：" 論理宛先名
000780      ELSE
000790          DISPLAY NC"メッセージの書き込みに失敗しました。"
000800          DISPLAY NC"　論理宛先名　：" 論理宛先名
000810          DISPLAY NC"　エラーコード：" エラーコード OF 状態通知域
000820          DISPLAY NC"　詳細コード　：" 詳細コード OF 状態通知域
000830      END-IF.
000840*
000850      MOVE 25               TO メッセージ長.
000860      MOVE 送信メッセージ２ TO メッセージ域.
000870      MOVE "MYLD1"          TO 論理宛先名.
000880      MOVE メッセージ長     TO 送信メッセージ長 OF 送信パラメタ.
000890      MOVE 5                TO 送信優先順位 OF 送信パラメタ.
000900      MOVE 0                TO 送信処理種別 OF 送信パラメタ.
000910      CALL "COBCI_WRITE" WITH C LINKAGE
000920           USING BY REFERENCE 状態通知域
000930                 BY VALUE     サーバ識別子
000940                 BY REFERENCE 論理宛先名
000950                 BY REFERENCE 送信パラメタ
000960                 BY REFERENCE メッセージ域
000970                 BY VALUE     通信予約域.
000980      IF PROGRAM-STATUS = 0 THEN
000990          DISPLAY NC"メッセージを１件書き込みました。"
001000          DISPLAY NC"　論理宛先名　：" 論理宛先名
001010      ELSE
001020          DISPLAY NC"メッセージの書き込みに失敗しました。"
001030          DISPLAY NC"　論理宛先名　：" 論理宛先名
001040          DISPLAY NC"　エラーコード：" エラーコード OF 状態通知域
001050          DISPLAY NC"　詳細コード　：" 詳細コード OF 状態通知域
001060      END-IF.
001070      DISPLAY "***TSUUSHIN.EXEを起動してください***"
001080*
001090*=================================================================
001100**（３）メッセージを読み込みます（監視時間＝６０秒）。
001110*=================================================================
001120      MOVE "MYLD2" TO 論理宛先名.
001130      MOVE 32000   TO 受信バッファ長 OF 受信パラメタ.
001140      MOVE 1       TO 受信処理種別 OF 受信パラメタ.
001150      MOVE 60      TO 受信監視時間 OF 受信パラメタ.
001160      CALL "COBCI_READ" WITH C LINKAGE
001170           USING BY REFERENCE 状態通知域
001180                 BY VALUE     サーバ識別子
001190                 BY REFERENCE 論理宛先名
001200                 BY REFERENCE 受信パラメタ
001210                 BY REFERENCE メッセージ域
001220                 BY VALUE     通信予約域.
001230      IF PROGRAM-STATUS = 0 THEN
001240          DISPLAY NC"メッセージを１件読み込みました。"
001250          DISPLAY NC"　論理宛先名　：" 論理宛先名
001260          MOVE 受信メッセージ長 OF 受信パラメタ TO メッセージ長
001270          DISPLAY NC"　受信メッセージ：" メッセージ域
001280      ELSE
001290          DISPLAY NC"メッセージの読み込みに失敗しました。"
001300          DISPLAY NC"　論理宛先名　：" 論理宛先名
001310          DISPLAY NC"　エラーコード：" エラーコード OF 状態通知域
001320          DISPLAY NC"　詳細コード　：" 詳細コード OF 状態通知域
001330      END-IF.
001340*
001350      MOVE "MYLD1" TO 論理宛先名.
001360      MOVE 32000   TO 受信バッファ長 OF 受信パラメタ.
001370      MOVE 1       TO 受信処理種別 OF 受信パラメタ.
001380      MOVE 10      TO 受信監視時間 OF 受信パラメタ.
001390      CALL "COBCI_READ" WITH C LINKAGE
001400           USING BY REFERENCE 状態通知域
001410                 BY VALUE     サーバ識別子
001420                 BY REFERENCE 論理宛先名
001430                 BY REFERENCE 受信パラメタ
001440                 BY REFERENCE メッセージ域
001450                 BY VALUE     通信予約域.
001460      IF PROGRAM-STATUS = 0
001470          DISPLAY NC"メッセージを１件読み込みました。"
001480          DISPLAY NC"　論理宛先名　：" 論理宛先名
001490          MOVE 受信メッセージ長 OF 受信パラメタ TO メッセージ長
001500          DISPLAY NC"　受信メッセージ：" メッセージ域
001510      ELSE
001520          DISPLAY NC"メッセージの読み込みに失敗しました。"
001530          DISPLAY NC"　論理宛先名　：" 論理宛先名
001540          DISPLAY NC"　エラーコード：" エラーコード OF 状態通知域
001550          DISPLAY NC"　詳細コード　：" 詳細コード OF 状態通知域
001560      END-IF.
001570*
001580      CALL "COBCI_READ" WITH C LINKAGE
001590           USING BY REFERENCE 状態通知域
001600                 BY VALUE     サーバ識別子
001610                 BY REFERENCE 論理宛先名
001620                 BY REFERENCE 受信パラメタ
001630                 BY REFERENCE メッセージ域
001640                 BY VALUE     通信予約域.
001650      IF PROGRAM-STATUS = 0 THEN
001660          DISPLAY NC"メッセージを１件読み込みました。"
001670          DISPLAY NC"　論理宛先名　：" 論理宛先名
001680          MOVE 受信メッセージ長 OF 受信パラメタ TO メッセージ長
001690          DISPLAY NC"　受信メッセージ：" メッセージ域
001700      ELSE
001710          DISPLAY NC"メッセージの読み込みに失敗しました。"
001720          DISPLAY NC"　論理宛先名　：" 論理宛先名
001730          DISPLAY NC"　エラーコード：" エラーコード OF 状態通知域
001740          DISPLAY NC"　詳細コード　：" 詳細コード OF 状態通知域
001750      END-IF.
001760*=================================================================
001770**（４）サーバを切断します。
001780*=================================================================
001790      CALL "COBCI_CLOSE" WITH C LINKAGE
001800           USING BY REFERENCE 状態通知域
001810                 BY VALUE     サーバ識別子
001820                 BY VALUE     通信予約域.
001830      IF PROGRAM-STATUS = 0 THEN
001840          DISPLAY NC"サーバを切断しました。"
001850          DISPLAY NC"　サーバ名　　：" サーバ名
001860      ELSE
001870          DISPLAY NC"サーバの切断に失敗しました。"
001880          DISPLAY NC"　サーバ名　　：" サーバ名
001890          DISPLAY NC"　エラーコード：" エラーコード OF 状態通知域
001900          DISPLAY NC"　詳細コード　：" 詳細コード OF 状態通知域
001910      END-IF.
001920  処理終了.
001930     EXIT PROGRAM.
001940 END PROGRAM SAMPLE29.
