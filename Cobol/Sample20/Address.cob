000010*========================================================================
000020*　住所クラス（Address-class）　　　－サンプルプログラム「従業員管理」－
000030*
000040*　　　従業員ひとりに対する住所データと，それを参照・更新するためのメソ
000050*    ッドを持つ。
000060*
000070*　〇継承クラス
000080*　　　FJBASE
000090*
000100*　〇参照クラス
000110*　　　住所マスタクラス（AddressMaster-class）
000120*
000130*　〇オブジェクトデータ
000140*　　　郵便番号
000150*　　　住所
000160*
000170*　〇オブジェクトメソッド
000180*　　１）データ設定　　　　（DataSet-method）
000190*　　２）データ保存　　　　（Store-method）
000200*　　３）データ削除　　　　（RemoveAt-method）
000210*　  ４）エラー表示　　　　（ErrorDisplay-method）
000220*
000230*                              Copyright 1998-2015 FUJITSU LIMITED
000240*========================================================================
000250 CLASS-ID.   Address-class INHERITS FJBASE.
000260 ENVIRONMENT    DIVISION.
000270 CONFIGURATION    SECTION.
000280 SPECIAL-NAMES.
000290      SYMBOLIC CONSTANT
000300       レコードあり            IS    0
000310       レコードなし            IS    1
000320
000330       ＳＥＬＥＣＴ文          IS    3
000340       ＩＮＳＥＲＴ文          IS    4
000350       ＵＰＤＡＴＥ文          IS    5
000360       ＤＥＬＥＴＥ文          IS    6.
000370*
000380 REPOSITORY.
000390     CLASS FJBASE.
000400*
000410   OBJECT.
000420   DATA DIVISION.
000430   WORKING-STORAGE SECTION.
000440    01  住所ＩＤ             PIC   S9(004) PROPERTY.
000450    01  郵便番号             PIC    X(007) PROPERTY.
000460    01  住所                 PIC    X(040) PROPERTY.
000470*
000480      EXEC SQL BEGIN DECLARE SECTION END-EXEC.
000490    01  SQLSTATE             PIC    X(5).
000500    01  SQLCODE              PIC   S9(9) COMP-5.
000510    01  SQLMSG               PIC    X(256).
000520      EXEC SQL END   DECLARE SECTION END-EXEC.
000530    01  Ｗ－ＳＱＬ文識別     PIC    9(2).
000540*
000550   PROCEDURE DIVISION.
000560*
000570*========================================================================
000580*　住所データ削除メソッド
000590*
000600*　　　指定された住所識別の住所情報を削除する。
000610*
000620*　〇入力：　住所識別　  PIC S9(4)
000630*========================================================================
000640   METHOD-ID. RemoveAt-method.
000650   DATA DIVISION.
000660   LINKAGE SECTION.
000670     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
000680   01 Ｌ－住所識別          PIC S9(04).
000690     EXEC SQL END   DECLARE SECTION END-EXEC.
000700   PROCEDURE DIVISION
000710                USING  Ｌ－住所識別.
000720*
000730       EXEC SQL
000740           DELETE FROM 住所表 WHERE 住所識別 = :Ｌ－住所識別
000750       END-EXEC.
000760*
000770       IF SQLCODE NOT = 100 AND SQLSTATE NOT = "00000"
000780       THEN
000790           MOVE ＤＥＬＥＴＥ文  TO  Ｗ－ＳＱＬ文識別
000800           INVOKE SELF "ErrorDisplay-method"
000810                        USING Ｗ－ＳＱＬ文識別
000820       END-IF.
000830*
000840   END METHOD RemoveAt-method.
000850*
000860*========================================================================
000870*　住所データ設定メソッド
000880*
000890*　　　指定された住所識別の住所情報を住所表より読み込み，オブジェクトデー
000900*　　タに設定する．
000910*
000920*　〇入力：　住所ＩＤ　  PIC S9(4)
000930*========================================================================
000940   METHOD-ID. DataSet-method.
000950   DATA DIVISION.
000960   WORKING-STORAGE SECTION.
000970     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
000980   01  Ｗ－郵便番号         PIC   X(007).
000990   01  Ｗ－住所             PIC   X(040).
001000     EXEC SQL END   DECLARE SECTION END-EXEC.
001010   LINKAGE SECTION.
001020     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
001030   01 Ｌ－住所識別          PIC  S9(04).
001040     EXEC SQL END   DECLARE SECTION END-EXEC.
001050   PROCEDURE DIVISION
001060             USING  Ｌ－住所識別.
001070*
001080       EXEC SQL
001090           SELECT 郵便番号, 住所 INTO :Ｗ－郵便番号, :Ｗ－住所
001100            FROM 住所表
001110             WHERE 住所識別 = :Ｌ－住所識別
001120       END-EXEC.
001130*
001140       IF SQLCODE NOT = 100 AND SQLSTATE NOT = "00000"
001150       THEN
001160           MOVE ＳＥＬＥＣＴ文  TO  Ｗ－ＳＱＬ文識別
001170           INVOKE SELF "ErrorDisplay-method"
001180                        USING Ｗ－ＳＱＬ文識別
001190       END-IF.
001200*
001210       MOVE Ｗ－郵便番号  TO  郵便番号.
001220       MOVE Ｗ－住所      TO  住所.
001230*
001240   END METHOD DataSet-method.
001250*
001260*========================================================================
001270*　住所データ保存メソッド
001280*
001290*　　　オブジェクトデータが保持する住所情報を，住所表に保存する。
001300*
001310*　〇入力：　住所識別　  PIC S9(4)
001320*========================================================================
001330   METHOD-ID. Store-method.
001340   DATA DIVISION.
001350   WORKING-STORAGE SECTION.
001360   01  Ｗ－ＲＥＡＤ結果     PIC 9(01).
001370     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
001380   01  Ｗ－郵便番号         PIC   X(007).
001390   01  Ｗ－住所             PIC   X(040).
001400     EXEC SQL END   DECLARE SECTION END-EXEC.
001410   LINKAGE SECTION.
001420     EXEC SQL BEGIN DECLARE SECTION END-EXEC.
001430   01 Ｌ－住所識別          PIC  S9(04).
001440     EXEC SQL END   DECLARE SECTION END-EXEC.
001450   PROCEDURE DIVISION
001460                USING  Ｌ－住所識別.
001470*
001480       IF  Ｌ－住所識別  =  0
001490       THEN
001500           EXIT METHOD
001510       END-IF.
001520*
001530       EXEC SQL
001540           SELECT 郵便番号, 住所 INTO :Ｗ－郵便番号, :Ｗ－住所
001550            FROM 住所表
001560             WHERE 住所識別 = :Ｌ－住所識別
001570       END-EXEC.
001580*
001590       IF SQLCODE NOT = 100 AND SQLSTATE NOT = "00000"
001600       THEN
001610           MOVE ＳＥＬＥＣＴ文  TO  Ｗ－ＳＱＬ文識別
001620           INVOKE SELF "ErrorDisplay-method"
001630                        USING Ｗ－ＳＱＬ文識別
001640       END-IF.
001650*
001660       IF SQLCODE = 100
001670       THEN
001680             MOVE  レコードなし   TO  Ｗ－ＲＥＡＤ結果
001690       ELSE
001700             MOVE  レコードあり   TO  Ｗ－ＲＥＡＤ結果
001710       END-IF.
001720*
001730       MOVE 郵便番号      TO  Ｗ－郵便番号.
001740       MOVE 住所          TO  Ｗ－住所.
001750*
001760       IF  Ｗ－ＲＥＡＤ結果 =  レコードなし
001770       THEN
001780           EXEC SQL
001790               INSERT INTO 住所表
001800                VALUES(:Ｌ－住所識別, :Ｗ－郵便番号, :Ｗ－住所)
001810           END-EXEC
001820*
001830           IF SQLSTATE NOT = "00000"
001840           THEN
001850               MOVE ＩＮＳＥＲＴ文  TO  Ｗ－ＳＱＬ文識別
001860               INVOKE SELF "ErrorDisplay-method"
001870                            USING Ｗ－ＳＱＬ文識別
001880           END-IF
001890       ELSE
001900           EXEC SQL
001910               UPDATE 住所表 SET
001920                郵便番号 = :Ｗ－郵便番号, 住所 = :Ｗ－住所
001930                 WHERE 住所識別 = :Ｌ－住所識別
001940           END-EXEC
001950*
001960           IF SQLSTATE NOT = "00000"
001970           THEN
001980               MOVE ＵＰＤＡＴＥ文  TO  Ｗ－ＳＱＬ文識別
001990               INVOKE SELF "ErrorDisplay-method"
002000                            USING Ｗ－ＳＱＬ文識別
002010           END-IF
002020       END-IF.
002030*
002040   END METHOD Store-method.
002050*
002060*========================================================================
002070*　データベースアクセスエラー表示メソッド（ErrorDisplay-method）
002080*
002090*      データベースアクセス時にエラーが発生した場合に，エラー内容を表示し
002100*    て，コネクションを切断し，アプリケーションを終了する。
002110*========================================================================
002120   METHOD-ID.  ErrorDisplay-method.
002130   ENVIRONMENT         DIVISION.
002140   DATA DIVISION.
002150   LINKAGE SECTION.
002160    01  Ｌ－ＳＱＬ文識別    PIC 9(2).
002170   PROCEDURE DIVISION USING  Ｌ－ＳＱＬ文識別.
002180*
002190       DISPLAY NC"データベースアクセス時にエラーが発生しました".
002200       DISPLAY " ".
002210       DISPLAY "SQLSTATE :" SQLSTATE.
002220       DISPLAY "SQLMSG   :" SQLMSG.
002230*
002240       EXEC SQL
002250           ROLLBACK WORK
002260       END-EXEC.
002270*
002280       EXEC SQL
002290           DISCONNECT DEFAULT
002300       END-EXEC.
002310*
002320       DISPLAY NC"アプリケーションを終了します".
002330       STOP RUN.
002340*
002350   END METHOD ErrorDisplay-method.
002360*
002370   END OBJECT.
002380 END CLASS Address-class.
