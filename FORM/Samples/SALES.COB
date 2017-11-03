000010*****************************************************************
000020* Copyright 1992-2010 FUJITSU LIMITED                           *
000030* Copyright 1992-2010 PFU LIMITED                               *
000040*****************************************************************
000050 IDENTIFICATION    DIVISION.
000060 PROGRAM-ID.       SALES.
000070 ENVIRONMENT       DIVISION.
000080 CONFIGURATION     SECTION.
000090 SPECIAL-NAMES.
000100      SYMBOLIC CONSTANT
000110      NORMAL      IS "  "
000120      .
000130*
000140* Define sequential file for printing
000150*
000160 INPUT-OUTPUT      SECTION.
000170 FILE-CONTROL.
000180      SELECT  PRINT-FILE           ASSIGN TO PRTFILE
000190              ORGANIZATION         IS SEQUENTIAL
000200              ACCESS MODE          IS SEQUENTIAL
000210              FORMAT               IS PRT-FORMAT
000220              GROUP                IS PRT-GROUP
000230              .
000240 DATA                DIVISION.
000250 FILE                SECTION.
000260*
000270* 帳票定義体から印刷用レコードを複写します
000280*
000290 FD   PRINT-FILE.
000300      COPY  SALES OF XMDLIB.
000310*           ~~~~~帳票定義体のファイル名
000320 WORKING-STORAGE SECTION.
000330*
000340* Control Area
000350*
000360 01   PRT-PARAM.
000370      03  PRT-FORMAT      PIC X(08)   VALUE SPACE.
000380      03  PRT-GROUP       PIC X(08)   VALUE SPACE.
000390*
000400*  印刷用データ
000410*
000420 01   SAMPLE-DATA.
000430*  --- These data being loaded from DB in the actual program. ---
000440   02   DETAIL-LINE.
000450      03  REGION-NAME-DATA-TABLE.
000460        04                      PIC X(10)  VALUE "Tokyo".
000470        04                      PIC X(10)  VALUE "New York".
000480        04                      PIC X(10)  VALUE "Washington".
000490        04                      PIC X(10)  VALUE "Boston".
000500        04                      PIC X(10)  VALUE "San Jose".
000510        04                      PIC X(10)  VALUE "Chicago".
000520        04                      PIC X(10)  VALUE "Los angels".
000530        04                      PIC X(10)  VALUE "Sacramento".
000540        04                      PIC X(10)  VALUE "Honolulu".
000550        04                      PIC X(10)  VALUE "HongKong".
000560      03  REDEFINES REGION-NAME-DATA-TABLE.
000570        04  REGION-NAME-DATA    PIC X(10) OCCURS 10.
000580      03  GROUP-NAME-TABLE.
000590        04                      PIC X(10)  VALUE "GOLF".
000600        04                      PIC X(10)  VALUE "FOOTBALL".
000610        04                      PIC X(10)  VALUE "BASEBALL".
000620        04                      PIC X(10)  VALUE "TENNIS".
000630      03  REDEFINES GROUP-NAME-TABLE.
000640        04  G-NAME      PIC X(10) OCCURS 4.
000650      03  GOODS-NAME-DATA-TABLE.
000660        04                      PIC N(6)   VALUE NC"シューズ　　".
000670        04                      PIC N(6)   VALUE NC"バッグ　　　".
000680        04                      PIC N(6)   VALUE NC"ウェア　　　".
000690        04                      PIC N(6)   VALUE NC"ボール　　　".
000700        04                      PIC N(6)   VALUE NC"シューズ　　".
000710        04                      PIC N(6)   VALUE NC"ウェア　　　".
000720        04                      PIC N(6)   VALUE NC"タオルセット".
000730        04                      PIC N(6)   VALUE NC"バッグ　　　".
000740        04                      PIC N(6)   VALUE NC"ボール　　　".
000750        04                      PIC N(6)   VALUE NC"ウェア　　　".
000760        04                      PIC N(6)   VALUE NC"シューズ　　".
000770        04                      PIC N(6)   VALUE NC"キャップ　　".
000780        04                      PIC N(6)   VALUE NC"シューズ　　".
000790        04                      PIC N(6)   VALUE NC"ボール　　　".
000800        04                      PIC N(6)   VALUE NC"バッグ　　　".
000810        04                      PIC N(6)   VALUE NC"クラブセット".
000820      03  REDEFINES GOODS-NAME-DATA-TABLE.
000830        04  GOODS-NAME-DATA     PIC N(6)   OCCURS 16.
000840      03  DATE-DATA-TABLE.
000850        04                      PIC 9(8)  VALUE 20100420.
000860        04                      PIC 9(8)  VALUE 20100520.
000870        04                      PIC 9(8)  VALUE 20100620.
000880        04                      PIC 9(8)  VALUE 20100720.
000890        04                      PIC 9(8)  VALUE 20100820.
000900        04                      PIC 9(8)  VALUE 20100920.
000910        04                      PIC 9(8)  VALUE 20101020.
000920        04                      PIC 9(8)  VALUE 20101031.
000930        04                      PIC 9(8)  VALUE 20101120.
000940        04                      PIC 9(8)  VALUE 20101130.
000950        04                      PIC 9(8)  VALUE 20101220.
000960        04                      PIC 9(8)  VALUE 20101221.
000970        04                      PIC 9(8)  VALUE 20110120.
000980        04                      PIC 9(8)  VALUE 20110220.
000990        04                      PIC 9(8)  VALUE 20110221.
001000        04                      PIC 9(8)  VALUE 20110320.
001010      03  REDEFINES DATE-DATA-TABLE.
001020        04  DATE-DATA           PIC 9(8)  OCCURS 16.
001030      03  CUSTOMER-NAME-DATA-TABLE.
001040        04                      PIC N(24) VALUE N"日本　太郎　　　　　　　".
001050        04                      PIC N(24) VALUE N"日本　花子　　　　　　　".
001051        04                      PIC N(24) VALUE N"日本　次郎　　　　　　　".
001060        04                      PIC N(24) VALUE N"日本　三郎　　　　　　　".
001070        04                      PIC N(24) VALUE N"日本　四郎　　　　　　　".
001080        04                      PIC N(24) VALUE N"日本　五郎　　　　　　　".
001090        04                      PIC N(24) VALUE N"日本　六郎　　　　　　　".
001100        04                      PIC N(24) VALUE N"日本　七郎　　　　　　　".
001110        04                      PIC N(24) VALUE N"日本　八郎　　　　　　　".
001120        04                      PIC N(24) VALUE N"日本　九郎　　　　　　　".
001130        04                      PIC N(24) VALUE N"日本　十郎　　　　　　　".
001140        04                      PIC N(24) VALUE N"日本　十一郎　　　　　　".
001150        04                      PIC N(24) VALUE N"日本　十二朗　　　　　　".
001160        04                      PIC N(24) VALUE N"日本　十三郎　　　　　　".
001170        04                      PIC N(24) VALUE N"日本　十四郎　　　　　　".
001180        04                      PIC N(24) VALUE N"日本　十五郎　　　　　　".
001200      03  REDEFINES CUSTOMER-NAME-DATA-TABLE.
001210        04  CUSTOMER-NAME-DATA  PIC N(24) OCCURS 16.
001220      03  SALES-DATA-TABLE.
001230        04                      PIC 9(13) VALUE   200000.
001240        04                      PIC 9(13) VALUE   600000.
001250        04                      PIC 9(13) VALUE   500000.
001260        04                      PIC 9(13) VALUE   888000.
001270        04                      PIC 9(13) VALUE   200000.
001280        04                      PIC 9(13) VALUE   500000.
001290        04                      PIC 9(13) VALUE  1800000.
001300        04                      PIC 9(13) VALUE   600000.
001310        04                      PIC 9(13) VALUE     5000.
001320        04                      PIC 9(13) VALUE   500000.
001330        04                      PIC 9(13) VALUE   200000.
001340        04                      PIC 9(13) VALUE  1800000.
001350        04                      PIC 9(13) VALUE   200000.
001360        04                      PIC 9(13) VALUE     5000.
001370        04                      PIC 9(13) VALUE   600000.
001380        04                      PIC 9(13) VALUE  1800000.
001390      03  REDEFINES SALES-DATA-TABLE.
001400        04  SALES-DATA          PIC 9(13) OCCURS 16.
001410   02   SUM-LINE.
001420      03  小計                  PIC 9(13) VALUE  0.
001430   02   TOTAL-SUM-LINE.
001440      03  合計                  PIC 9(13) VALUE  0.
001450   02   WORK-TABLE.
001460      03  GROUP-1-TABLE.
001470        04           PIC 9(2) VALUE  16.
001480        04           PIC 9(2) VALUE  12.
001490        04           PIC 9(2) VALUE   5.
001500        04           PIC 9(2) VALUE   9.
001510        04           PIC 9(2) VALUE  15.
001520        04           PIC 9(2) VALUE   8.
001530        04           PIC 9(2) VALUE   7.
001540        04           PIC 9(2) VALUE   5.
001550        04           PIC 9(2) VALUE  13.
001560        04           PIC 9(2) VALUE  10.
001570      03  GROUP-2-TABLE.
001580        04           PIC 9(2) VALUE   7.
001590        04           PIC 9(2) VALUE   8.
001600        04           PIC 9(2) VALUE   9.
001610        04           PIC 9(2) VALUE  14.
001620        04           PIC 9(2) VALUE   5.
001630        04           PIC 9(2) VALUE   9.
001640        04           PIC 9(2) VALUE  10.
001650        04           PIC 9(2) VALUE   7.
001660        04           PIC 9(2) VALUE   5.
001670        04           PIC 9(2) VALUE  13.
001680      03  GROUP-3-TABLE.
001690        04           PIC 9(2) VALUE   9.
001700        04           PIC 9(2) VALUE   6.
001710        04           PIC 9(2) VALUE   9.
001720        04           PIC 9(2) VALUE  12.
001730        04           PIC 9(2) VALUE   8.
001740        04           PIC 9(2) VALUE  13.
001750        04           PIC 9(2) VALUE   5.
001760        04           PIC 9(2) VALUE   8.
001770        04           PIC 9(2) VALUE  11.
001780        04           PIC 9(2) VALUE   8.
001790      03  GROUP-4-TABLE.
001800        04           PIC 9(2) VALUE  10.
001810        04           PIC 9(2) VALUE  11.
001820        04           PIC 9(2) VALUE   9.
001830        04           PIC 9(2) VALUE  13.
001840        04           PIC 9(2) VALUE   7.
001850        04           PIC 9(2) VALUE  10.
001860        04           PIC 9(2) VALUE  12.
001870        04           PIC 9(2) VALUE   6.
001880        04           PIC 9(2) VALUE   4.
001890        04           PIC 9(2) VALUE   7.
001900    02  REDEFINES WORK-TABLE.
001910      03             OCCURS 4.
001920        04  GROUP-N  PIC 9(2) OCCURS 10.
001930* Counters
001940 77 CNTI            PIC 9(2) BINARY.
001950 77 CNTJ            PIC 9(2) BINARY.
001960 77 PAGEN         PIC 9(3) BINARY.
001970*
001980******************************************************************
001990 PROCEDURE    DIVISION.
002000*
002010* Open Print File
002020      OPEN  OUTPUT  PRINT-FILE
002030      INITIALIZE  SALES.
002040* ヘッダ
002050*  (固定パーティション : HEAD)
002060      PERFORM VARYING PAGEN FROM 1 BY 1 UNTIL PAGEN > 2
002070        MOVE  "SALES"    TO  PRT-FORMAT
002080        MOVE  "HEAD"     TO  PRT-GROUP
002090        MOVE  PAGEN      TO  ページ数 OF SALES
002100        WRITE SALES AFTER ADVANCING PAGE
002110*                   ~~~~~~~~~~~~~~~~~~~~
002120        PERFORM  VARYING CNTI FROM 1 BY 1 UNTIL CNTI > 4
002130* 明細部の印刷
002140*  (浮動パーティション : DETAIL)
002150*   サンプルデータのセット
002160          MOVE  "DETAIL"   TO  PRT-GROUP
002170          PERFORM VARYING CNTJ FROM 1 BY 1 UNTIL CNTJ > GROUP-N(CNTI PAGEN)
002180            MOVE GOODS-NAME-DATA(CNTJ)    TO 商品名    OF SALES
002190            MOVE DATE-DATA(CNTJ)          TO 日付    OF SALES
002200            MOVE CUSTOMER-NAME-DATA(CNTJ) TO 顧客名 OF SALES
002210            MOVE SALES-DATA(CNTJ)         TO 売上げ         OF SALES
002220            ADD  SALES-DATA(CNTJ)           TO 小計    OF SUM-LINE
002230            IF  CNTJ = 1     THEN
002240              MOVE REGION-NAME-DATA(PAGEN)  TO 地名   OF SALES
002250              MOVE G-NAME(CNTI)                 TO 分類    OF SALES
002260              WRITE SALES AFTER ADVANCING 1 LINE
002270*                         ~~~~~~~~~~~~~~~~~~~~
002280              MOVE  SPACE                   TO 地名   OF SALES
002290              MOVE  SPACE                   TO 分類   OF SALES
002300            ELSE
002310                WRITE SALES AFTER ADVANCING 1 LINE
002320*                           ~~~~~~~~~~~~~~~~~~~~
002330            END-IF
002340          END-PERFORM
002350* 小計の印刷
002360*   (浮動パーティション : SUM)
002370          MOVE  "SUM"   TO  PRT-GROUP
002380          MOVE CORR SUM-LINE OF SAMPLE-DATA TO SALES
002390          WRITE SALES AFTER ADVANCING 1 LINE
002400          ADD  小計 OF SUM-LINE TO 合計 OF TOTAL-SUM-LINE
002410          MOVE 0 TO 小計 OF SUM-LINE
002420        END-PERFORM
002430* 合計の印刷
002440*   (浮動パーティション : TOTAL)
002450        MOVE  "TOTAL"    TO  PRT-GROUP
002460        MOVE  "LOGO.BMP" TO  LOGO-AREA  OF SALES
002470        MOVE  "B"        TO  EDIT-MODE OF LOGO-AREA  OF SALES
002480        MOVE CORR TOTAL-SUM-LINE OF SAMPLE-DATA TO SALES
002490        WRITE SALES  AFTER ADVANCING 1 LINE
002500      END-PERFORM
002510******************************************************************
002520      CLOSE PRINT-FILE
002530      STOP RUN
002540      .
002550 END PROGRAM SALES.
