000100*=======================================================================
000200*　リストクラス（List）　             　　　　　　－サンプルクラス－
000300*
000400*　　　リスト構造によるオブジェクト管理手続き
000500*
000600*　〇継承クラス
000700*　　　コレクションクラス　　　　（Collect）
000800*
000900*　〇参照クラス
001000*　　　リストノードクラス（ListNode-class）
001100*
001200*
001300*　〇オブジェクトメソッド
001400*　　１）オブジェクトデータに対する，GET及びSETのプロパティメソッド
001500*　　２）要素取得メソッド　　　　　　　　　　　　（Element-Get）
001600*　　３）先頭要素取得メソッド　　　　　　　　　　（FirstElement-Get）
001700*　　４）最後の要素取得メソッド　　　　　　　　　（LastElement-Get）
001800*　　５）要素番号取得メソッド　　　　　　　　　　（ElementNo-Get）
001900*　　６）要素追加メソッド　　　　　　　　　　　　（Element-PutLast）
002000*　　７）要素置換メソッド　　　　　　　　　　　　（Element-PutAt）
002100*　　８）要素挿入メソッド　　　　　　　　　　　　（Element-Insert）
002200*　　９）全要素削除メソッド　　　　　　　　　　　（Remove-All）
002300*　１０）指定要素削除メソッド　　　　　　　　　　（Remove-At）
002400*　１１）次要素取得メソッド　　　　　　　　　　　（NextElement-Get）
002500*　１２）前要素取得メソッド　　　　　　　　　　　（PreviousElement-Get）
002600*
002700*        Copyright 1997-2015 FUJITSU LIMITED
002800*=======================================================================
002900 CLASS-ID.  List  INHERITS  Collect.
003000 ENVIRONMENT  DIVISION.
003100 CONFIGURATION  SECTION.
003200   REPOSITORY.
003300     CLASS  Collect
003400     CLASS  ListNode-class.
003500
003600   OBJECT.
003700   DATA  DIVISION.
003800   PROCEDURE  DIVISION.
003900*=======================================================================
004000*　要素取得メソッド（Element-Get）
004100*
004200*　　　指定された番号のリスト要素の，対象オブジェクトを取得する。
004300*
004400*　〇入力：　要素番号（PIC  9(8) COMP）
004500*　〇出力：　要素（OBJECT REFERENCE）
004600*　〇備考：
004700*　　　指定された番号の要素が存在しない場合，NULLが返却されます。
004800*========================================================================
004900   METHOD-ID.  Element-Get.
005000   DATA  DIVISION.
005100   WORKING-STORAGE  SECTION.
005200    01  Ｗ－一時領域            OBJECT  REFERENCE.
005300    01  Ｗ－現要素              OBJECT  REFERENCE  ListNode-class.
005400    01  Ｗ－要素番号            PIC 9(08)  COMP.
005500   LINKAGE  SECTION.
005600    01  Ｌ－要素番号            PIC 9(08)  COMP.
005700    01  Ｌ－対象オブジェクト    OBJECT  REFERENCE.
005800   PROCEDURE  DIVISION
005900              USING  Ｌ－要素番号  RETURNING  Ｌ－対象オブジェクト.
006000*
006100       SET Ｌ－対象オブジェクト  TO  NULL.
006200       SET Ｗ－一時領域          TO  先頭の要素    OF  SELF.
006300       SET Ｗ－現要素            TO  Ｗ－一時領域  AS  ListNode-class.
006400       MOVE  1                   TO  Ｗ－要素番号.
006500*
006600       PERFORM    UNTIL  Ｗ－要素番号  =  Ｌ－要素番号  OR
006700                         Ｗ－現要素    =  NULL
006800           SET Ｗ－一時領域      TO  次の要素      OF  Ｗ－現要素
006900           SET Ｗ－現要素        TO  Ｗ－一時領域  AS  ListNode-class
007000           ADD  1                TO  Ｗ－要素番号
007100       END-PERFORM.
007200*
007300       IF  Ｗ－現要素  NOT  =  NULL
007400       THEN
007500           SET  Ｌ－対象オブジェクト   TO
007600                                      対象オブジェクト  OF  Ｗ－現要素
007700       END-IF.
007800*
007900   END  METHOD  Element-Get.
008000*
008100*========================================================================
008200*　先頭要素取得メソッド（FirstElement-Get）
008300*
008400*　　　先頭のリスト要素が持つ，対象オブジェクトを取得する。
008500*
008600*　〇出力：　先頭オブジェクト（OBJECT REFERENCE）
008700*========================================================================
008800   METHOD-ID.  FirstElement-Get OVERRIDE.
008900   DATA  DIVISION.
009000   WORKING-STORAGE  SECTION.
009100    01  Ｗ－先頭の要素        OBJECT  REFERENCE.
009200   LINKAGE  SECTION.
009300    01  Ｌ－先頭オブジェクト  OBJECT  REFERENCE.
009400   PROCEDURE  DIVISION  RETURNING  Ｌ－先頭オブジェクト.
009500*
009600       IF  SELF::"CollectionSize-Get"  NOT =  0
009700       THEN
009800           SET Ｗ－先頭の要素         TO  先頭の要素  OF  SELF
009900           SET Ｌ－先頭オブジェクト   TO
010000              対象オブジェクト   OF  Ｗ－先頭の要素  AS  ListNode-class
010100           SET 現在の要素  OF SELF    TO  Ｗ－先頭の要素
010200       ELSE
010300           SET Ｌ－先頭オブジェクト   TO  NULL
010400       END-IF.
010500*
010600   END  METHOD  FirstElement-Get.
010700*
010800*========================================================================
010900*　最後の要素取得メソッド（LastElement-Get）
011000*
011100*　　　リスト構造の最後の要素が持つ，対象オブジェクトを取得する。
011200*
011300*　〇出力：　最後オブジェクト（OBJECT REFERENCE）
011400*========================================================================
011500   METHOD-ID.  LastElement-Get.
011600   DATA  DIVISION.
011700   WORKING-STORAGE  SECTION.
011800    01  Ｗ－最後の要素           OBJECT  REFERENCE.
011900   LINKAGE  SECTION.
012000    01  Ｌ－最後のオブジェクト   OBJECT REFERENCE.
012100   PROCEDURE  DIVISION  RETURNING  Ｌ－最後のオブジェクト.
012200
012300       IF  SELF::"CollectionSize-Get"  NOT =  0
012400       THEN
012500           SET Ｗ－最後の要素           TO  最後の要素  OF  SELF
012600           SET Ｌ－最後のオブジェクト   TO
012700              対象オブジェクト   OF  Ｗ－最後の要素  AS  ListNode-class
012800           SET 現在の要素  OF  SELF     TO  Ｗ－最後の要素
012900       ELSE
013000           SET Ｌ－最後のオブジェクト   TO  NULL
013100       END-IF.
013200*
013300   END  METHOD  LastElement-Get.
013400
013500*========================================================================
013600*　要素番号取得メソッド（ElementNo-Get）
013700*
013800*　　　オブジェクトに対する要素の要素番号を取得する。
013900*
014000*　〇入力：　対象オブジェクト（OBJECT REFERENCE）
014100*　〇出力：　要素番号        （PIC 9(8) COMP）
014200*========================================================================
014300   METHOD-ID.  ElementNo-Get.
014400   DATA  DIVISION.
014500   WORKING-STORAGE  SECTION.
014600    01  Ｗ－要素番号            PIC 9(08)  COMP.
014700    01  Ｗ－現要素              OBJECT  REFERENCE  ListNode-class.
014800    01  Ｗ－現オブジェクト      OBJECT  REFERENCE.
014900    01  Ｗ－一時領域            OBJECT  REFERENCE.
015000   LINKAGE  SECTION.
015100    01  Ｌ－要素番号            PIC 9(08)  COMP.
015200    01  Ｌ－対象オブジェクト    OBJECT  REFERENCE.
015300   PROCEDURE  DIVISION
015400                  USING  Ｌ－対象オブジェクト  RETURNING  Ｌ－要素番号.
015500*
015600       MOVE   0                  TO   Ｌ－要素番号.
015700       SET   Ｗ－一時領域        TO   先頭の要素        OF  SELF.
015800       SET   Ｗ－現要素          TO   Ｗ－一時領域  AS  ListNode-class.
015900       IF    Ｗ－現要素  =  NULL
016000       THEN
016100           EXIT METHOD
016200       ELSE
016300           SET  Ｗ－現オブジェクト  TO  対象オブジェクト OF  Ｗ－現要素
016400           MOVE   1                 TO  Ｗ－要素番号
016500       END-IF.
016600*
016700       PERFORM  UNTIL  Ｗ－現オブジェクト  =  Ｌ－対象オブジェクト
016800           SET Ｗ－一時領域       TO  次の要素      OF  Ｗ－現要素
016900           SET Ｗ－現要素         TO  Ｗ－一時領域  AS  ListNode-class
017000           IF   Ｗ－現要素  =  NULL
017100           THEN
017200               EXIT  METHOD
017300           ELSE
017400               SET Ｗ－現オブジェクト TO
017500                                   対象オブジェクト  OF  Ｗ－現要素
017600               ADD  1   TO   Ｗ－要素番号
017700           END-IF
017800       END-PERFORM.
017900*
018000       MOVE   Ｗ－要素番号   TO   Ｌ－要素番号.
018100*
018200   END  METHOD  ElementNo-Get.
018300*
018400*========================================================================
018500*　要素追加メソッド（Element-PutLast）
018600*
018700*　　　対象オブジェクトに対する新要素を生成し，リストの最後の要素の後に
018800*　　追加する。
018900*
019000*　〇入力：　対象オブジェクト（OBJECT REFERENCE）
019100*========================================================================
019200   METHOD-ID.  Element-PutLast.
019300   DATA  DIVISION.
019400   WORKING-STORAGE  SECTION.
019500    01  Ｗ－新要素              OBJECT  REFERENCE  ListNode-class.
019600    01  Ｗ－最後の要素          OBJECT  REFERENCE  ListNode-class.
019700    01  Ｗ－一時領域            OBJECT  REFERENCE.
019800   LINKAGE  SECTION.
019900    01  Ｌ－対象オブジェクト    OBJECT  REFERENCE.
020000   PROCEDURE  DIVISION  USING  Ｌ－対象オブジェクト.
020100*
020200      INVOKE  ListNode-class  "new"  RETURNING   Ｗ－新要素.
020300      SET  対象オブジェクト OF  Ｗ－新要素   TO  Ｌ－対象オブジェクト.
020400      SET  現在の要素       OF  SELF         TO  Ｗ－新要素.
020500*
020600      IF  SELF::"CollectionSize-Get"  =  0
020700      THEN
020800          SET  次の要素         OF  Ｗ－新要素      TO  NULL
020900          SET  前の要素         OF  Ｗ－新要素      TO  NULL
021000          SET  先頭の要素       OF  SELF            TO  Ｗ－新要素
021100          SET  最後の要素       OF  SELF            TO  Ｗ－新要素
021200      ELSE
021300          SET  Ｗ－一時領域         TO  最後の要素  OF  SELF
021400          SET  Ｗ－最後の要素   TO  Ｗ－一時領域    AS  ListNode-class
021500          SET  次の要素         OF  Ｗ－最後の要素  TO  Ｗ－新要素
021600          SET  次の要素         OF  Ｗ－新要素      TO  NULL
021700          SET  前の要素         OF  Ｗ－新要素      TO  Ｗ－最後の要素
021800          SET  最後の要素       OF  SELF            TO  Ｗ－新要素
021900      END-IF.
022000      INVOKE  SELF  "Add-CollSize".
022100*
022200   END  METHOD  Element-PutLast.
022300*========================================================================
022400*　要素置換メソッド（Element-PutAt）
022500*
022600*　　　指定した番号の要素の対象オブジェクトを置き換える。
022700*
022800*　〇入力：　要素番号        （PIC 9(8) COMP）
022900*　　　　　　対象オブジェクト（OBJECT REFERENCE）
023000*　〇出力：　復帰値　　　　　（PIC 9(4) COMP）
023100*
023200*========================================================================
023300   METHOD-ID.  Element-PutAt.
023400   DATA  DIVISION.
023500   WORKING-STORAGE  SECTION.
023600    01  Ｗ－要素番号            PIC 9(08)  COMP.
023700    01  Ｗ－置換対象要素        OBJECT  REFERENCE  ListNode-class.
023800    01  Ｗ－一時領域            OBJECT  REFERENCE.
023900   LINKAGE  SECTION.
024000    01  Ｌ－要素番号            PIC 9(08)  COMP.
024100    01  Ｌ－対象オブジェクト    OBJECT  REFERENCE.
024200    01  Ｌ－復帰値              PIC 9(04)  COMP.
024300   PROCEDURE  DIVISION
024400       USING  Ｌ－要素番号 Ｌ－対象オブジェクト  RETURNING  Ｌ－復帰値.
024500*
024600       MOVE  0                   TO   Ｌ－復帰値.
024700       SET  Ｗ－一時領域         TO   先頭の要素    OF  SELF.
024800       SET  Ｗ－置換対象要素     TO   Ｗ－一時領域  AS  ListNode-class.
024900       MOVE  1                   TO   Ｗ－要素番号.
025000*
025100       PERFORM    UNTIL  Ｗ－要素番号      =  Ｌ－要素番号  OR
025200                         Ｗ－置換対象要素  =  NULL
025300           SET Ｗ－一時領域      TO   次の要素      OF  Ｗ－置換対象要素
025400           SET Ｗ－置換対象要素  TO   Ｗ－一時領域  AS  ListNode-class
025500           ADD  1                TO   Ｗ－要素番号
025600       END-PERFORM.
025700*
025800       IF  Ｗ－置換対象要素  NOT  =  NULL
025900       THEN
026000           SET  対象オブジェクト  OF   Ｗ－置換対象要素   TO
026100                                                Ｌ－対象オブジェクト
026200           MOVE  Ｗ－要素番号     TO   Ｌ－復帰値
026300       END-IF.
026400*
026500   END  METHOD  Element-PutAt.
026600*
026700*========================================================================
026800*　要素挿入メソッド（Element-Insert）
026900*
027000*　　　対象オブジェクトに対する新規リスト要素を生成し，指定された番号の
027100*　　位置に
027200*　　，その要素を挿入する。
027300*
027400*　〇入力：　指定番号　　    （PIC 9(8) COMP）
027500*　　　　　　対象オブジェクト（OBJECT REFERENCE）
027600*　〇出力：　復帰値　　　　　（PIC 9(4) COMP）
027700*　〇備考：
027800*　　　挿入が正常に行われた場合，復帰値として，指定された番号と同じ値を
027900*　　返却します。
028000*　　　指定された番号が，現要素数＋１より大きい値の場合，復帰値として０
028100*　　を返却します。この場合，結果的には何も行われません。
028200*========================================================================
028300   METHOD-ID.  Element-Insert.
028400   DATA  DIVISION.
028500   WORKING-STORAGE  SECTION.
028600    01  Ｗ－新要素              OBJECT  REFERENCE  ListNode-class.
028700    01  Ｗ－現要素              OBJECT  REFERENCE  ListNode-class.
028800    01  Ｗ－前の要素            OBJECT  REFERENCE.
028900    01  Ｗ－次の要素            OBJECT  REFERENCE.
029000    01  Ｗ－要素番号            PIC 9(08)  COMP.
029100    01  Ｗ－要素数              PIC 9(08)  COMP.
029200    01  Ｗ－一時領域            OBJECT  REFERENCE.
029300   LINKAGE  SECTION.
029400    01  Ｌ－指定要素番号        PIC 9(08)  COMP.
029500    01  Ｌ－対象オブジェクト    OBJECT  REFERENCE.
029600    01  Ｌ－復帰値              PIC 9(04)  COMP.
029700   PROCEDURE  DIVISION  USING   Ｌ－指定要素番号  Ｌ－対象オブジェクト
029800                        RETURNING  Ｌ－復帰値.
029900*
030000       MOVE  SELF::"CollectionSize-Get"    TO  Ｗ－要素数.
030100       IF    Ｌ－指定要素番号   >  Ｗ－要素数  +  1
030200       THEN
030300           MOVE   0              TO  Ｌ－復帰値
030400           EXIT  METHOD
030500       END-IF.
030600*
030700       SET  Ｗ－一時領域        TO   先頭の要素    OF  SELF.
030800       SET  Ｗ－現要素          TO   Ｗ－一時領域  AS  ListNode-class.
030900       MOVE  1                  TO   Ｗ－要素番号.
031000*
031100       PERFORM  UNTIL  Ｗ－要素番号  =  Ｌ－指定要素番号  OR
031200                       Ｗ－現要素    =  NULL
031300           SET  Ｗ－次の要素    TO   次の要素      OF  Ｗ－現要素
031400           SET  Ｗ－現要素      TO   Ｗ－次の要素  AS  ListNode-class
031500           ADD   1              TO   Ｗ－要素番号
031600       END-PERFORM.
031700*
031800       INVOKE  ListNode-class  "new"  RETURNING   Ｗ－新要素
031900       SET  対象オブジェクト OF  Ｗ－新要素  TO  Ｌ－対象オブジェクト
032000*
032100       IF   Ｗ－現要素  =  NULL
032200       THEN
032300           IF  Ｗ－要素数  =  0
032400           THEN
032500               SET 先頭の要素     OF  SELF          TO   Ｗ－新要素
032600               SET 前の要素       OF  Ｗ－新要素    TO   NULL
032700           ELSE
032800               SET Ｗ－前の要素   TO  最後の要素    OF   SELF
032900               SET 次の要素       OF  Ｗ－前の要素  AS   ListNode-class
033000                                                    TO   Ｗ－新要素
033100               SET 前の要素       OF  Ｗ－新要素    TO   Ｗ－前の要素
033200           END-IF
033300           SET  最後の要素        OF  SELF          TO   Ｗ－新要素
033400           SET  次の要素          OF  Ｗ－新要素    TO   NULL
033500       ELSE
033600           IF  Ｗ－要素数  =  1
033700           THEN
033800               SET  先頭の要素    OF  SELF          TO   Ｗ－新要素
033900               SET  前の要素      OF  Ｗ－新要素    TO   NULL
034000           ELSE
034100               SET  Ｗ－前の要素  TO
034200                        前の要素  OF  Ｗ－現要素    AS  ListNode-class
034300               SET  前の要素      OF  Ｗ－新要素    TO  Ｗ－前の要素
034400               SET  次の要素      OF  Ｗ－前の要素  AS  ListNode-class
034500                                                    TO  Ｗ－新要素
034600           END-IF
034700           SET  次の要素      OF  Ｗ－新要素    TO   Ｗ－現要素
034800           SET  前の要素      OF  Ｗ－現要素    TO   Ｗ－新要素
034900       END-IF
035000       INVOKE  SELF  "Add-CollSize"
035100       SET  現在の要素  OF  SELF  TO  Ｗ－新要素
035200       MOVE  Ｌ－指定要素番号     TO  Ｌ－復帰値
035300*
035400   END  METHOD  Element-Insert.
035500*
035600*========================================================================
035700*　全要素削除メソッド（Remove-All）
035800*
035900*　　　生成された全ての要素を削除する。
036000*
036100*========================================================================
036200   METHOD-ID.  Remove-All.
036300   DATA  DIVISION.
036400   WORKING-STORAGE  SECTION.
036500    01  Ｗ－要素数          PIC 9(08)  COMP.
036600    01  Ｗ－現要素          OBJECT  REFERENCE  ListNode-class.
036700    01  Ｗ－次の要素        OBJECT  REFERENCE.
036800    01  Ｗ－一時領域        OBJECT  REFERENCE.
036900   PROCEDURE  DIVISION.
037000*
037100       MOVE  SELF::"CollectionSize-Get"  TO  Ｗ－要素数.
037200       SET  Ｗ－一時領域          TO  先頭の要素    OF  SELF.
037300       SET  Ｗ－現要素            TO  Ｗ－一時領域  AS  ListNode-class.
037400*
037500       PERFORM  UNTIL  Ｗ－要素数   <=  0
037600           SET 前の要素  OF  Ｗ－現要素         TO  NULL
037700           SET Ｗ－一時領域   TO  次の要素      OF  Ｗ－現要素
037800           SET 次の要素  OF  Ｗ－現要素         TO  NULL
037900           SET Ｗ－現要素     TO  Ｗ－一時領域  AS  ListNode-class
038000           INVOKE  SELF  "Sub-CollSize"
038100           ADD  -1  TO  Ｗ－要素数
038200       END-PERFORM.
038300*
038400       SET 先頭の要素  OF  SELF  TO  NULL.
038500       SET 最後の要素  OF  SELF  TO  NULL.
038600       SET 現在の要素  OF  SELF  TO  NULL.
038700*
038800   END  METHOD  Remove-All.
038900*
039000*========================================================================
039100*　指定要素削除メソッド（Remove-At）
039200*
039300*　　　指定された要素番号の要素を削除する。
039400*
039500*　〇入力：　要素番号　　　　（PIC 9(8) COMP）
039600*　〇出力：　復帰値　　　　　（PIC 9(4) COMP）
039700*　〇備考：
039800*　　　削除が正常に行われた場合，復帰値として，指定された番号と同じ値を
039900*　　返却します。
040000*　　　指定された番号が，現要素数より大きい値の場合，復帰値として０を返
040100*　　却します。この場合，結果的には何も行われません。
040200*========================================================================
040300   METHOD-ID.  Remove-At.
040400   DATA  DIVISION.
040500   WORKING-STORAGE  SECTION.
040600    01  Ｗ－現要素            OBJECT  REFERENCE  ListNode-class.
040700    01  Ｗ－前の要素          OBJECT  REFERENCE.
040800    01  Ｗ－次の要素          OBJECT  REFERENCE.
040900    01  Ｗ－一時領域          OBJECT  REFERENCE.
041000    01  Ｗ－要素番号          PIC 9(08)  COMP.
041100    01  Ｗ－要素数            PIC 9(08)  COMP.
041200   LINKAGE  SECTION.
041300    01  Ｌ－指定要素番号      PIC 9(08)  COMP.
041400    01  Ｌ－復帰値            PIC 9(04)  COMP.
041500   PROCEDURE  DIVISION
041600                 USING  Ｌ－指定要素番号  RETURNING  Ｌ－復帰値.
041700
041800       MOVE  SELF::"CollectionSize-Get"    TO  Ｗ－要素数.
041900       IF    Ｌ－指定要素番号   >  Ｗ－要素数
042000       THEN
042100           MOVE   0                TO  Ｌ－復帰値
042200           EXIT   METHOD
042300       END-IF.
042400*
042500       SET  Ｗ－一時領域        TO   先頭の要素    OF  SELF.
042600       SET  Ｗ－現要素          TO   Ｗ－一時領域  AS  ListNode-class.
042700       MOVE  1                  TO   Ｗ－要素番号.
042800       PERFORM  UNTIL  Ｗ－要素番号  =  Ｌ－指定要素番号
042900           SET  Ｗ－次の要素    TO   次の要素      OF  Ｗ－現要素
043000           SET  Ｗ－現要素      TO   Ｗ－次の要素  AS  ListNode-class
043100           ADD   1              TO   Ｗ－要素番号
043200       END-PERFORM.
043300*
043400       SET 対象オブジェクト  OF  Ｗ－現要素   TO  NULL.
043500       SET Ｗ－前の要素                  TO  前の要素  OF  Ｗ－現要素.
043600       SET Ｗ－次の要素                  TO  次の要素  OF  Ｗ－現要素.
043700       SET 前の要素  OF  Ｗ－現要素      TO  NULL.
043800       SET 次の要素  OF  Ｗ－現要素      TO  NULL.
043900*
044000       IF   Ｗ－前の要素   =   NULL
044100       THEN
044200           IF   Ｗ－次の要素  =  NULL
044300           THEN
044400               SET  先頭の要素  OF  SELF          TO  NULL
044500               SET  最後の要素  OF  SELF          TO  NULL
044600               SET  現在の要素  OF  SELF          TO  NULL
044700           ELSE
044800               SET  先頭の要素  OF  SELF          TO  Ｗ－次の要素
044900               SET  前の要素    OF  Ｗ－次の要素  AS  ListNode-class
045000                                                  TO  NULL
045100               SET  現在の要素  OF  SELF          TO  Ｗ－次の要素
045200           END-IF
045300       ELSE
045400           IF  Ｗ－次の要素  =  NULL
045500           THEN
045600               SET  最後の要素  OF  SELF          TO  Ｗ－前の要素
045700               SET  次の要素    OF  Ｗ－前の要素  AS  ListNode-class
045800                                                  TO  NULL
045900               SET  現在の要素  OF  SELF          TO  Ｗ－前の要素
046000           ELSE
046100               SET  次の要素    OF  Ｗ－前の要素  AS  ListNode-class
046200                                                  TO  Ｗ－次の要素
046300               SET  前の要素    OF  Ｗ－次の要素  AS  ListNode-class
046400                                                  TO  Ｗ－前の要素
046500               SET  現在の要素  OF  SELF          TO  Ｗ－次の要素
046600           END-IF
046700       END-IF.
046800       INVOKE  SELF  "Sub-CollSize".
046900       MOVE    Ｌ－指定要素番号  TO  Ｌ－復帰値.
047000*
047100   END  METHOD  Remove-At.
047200*
047300*========================================================================
047400*　次要素取得メソッド（NextElement-Get）
047500*
047600*　　　次の要素の対象オブジェクトを取得する。
047700*
047800*　〇出力：　次のオブジェクト　（OBJECT REFERENCE）
047900*========================================================================
048000   METHOD-ID.  NextElement-Get OVERRIDE.
048100   DATA  DIVISION.
048200   WORKING-STORAGE  SECTION.
048300   01  Ｗ－次の要素           OBJECT  REFERENCE.
048400   01  Ｗ－現要素             OBJECT  REFERENCE.
048500   LINKAGE  SECTION.
048600   01  Ｌ－次のオブジェクト   OBJECT  REFERENCE.
048700   PROCEDURE  DIVISION  RETURNING   Ｌ－次のオブジェクト.
048800*
048900       SET Ｌ－次のオブジェクト   TO  NULL.
049000       SET Ｗ－現要素     TO  現在の要素  OF  SELF.
049100       SET Ｗ－次の要素   TO  次の要素    OF  Ｗ－現要素
049200                                          AS  ListNode-class.
049300       IF   Ｗ－次の要素  NOT =  NULL
049400       THEN
049500           SET  Ｌ－次のオブジェクト  TO
049600               対象オブジェクト  OF   Ｗ－次の要素  AS  ListNode-class
049700           SET  現在の要素  OF  SELF  TO  Ｗ－次の要素
049800       END-IF.
049900*
050000   END  METHOD  NextElement-Get.
050100*
050200*========================================================================
050300*　前要素取得メソッド（PreviousElement-Get）
050400*
050500*　　　前の要素の対象オブジェクトを取得する。
050600*
050700*　〇出力：　前のオブジェクト　（OBJECT REFERENCE）
050800*========================================================================
050900   METHOD-ID.  PreviousElement-Get  OVERRIDE.
051000   DATA  DIVISION.
051100   WORKING-STORAGE  SECTION.
051200    01  Ｗ－前の要素           OBJECT  REFERENCE.
051300    01  Ｗ－現要素             OBJECT  REFERENCE.
051400   LINKAGE  SECTION.
051500    01  Ｌ－前のオブジェクト   OBJECT  REFERENCE.
051600   PROCEDURE  DIVISION  RETURNING   Ｌ－前のオブジェクト.
051700*
051800         SET Ｌ－前のオブジェクト  TO  NULL.
051900         SET Ｗ－現要素            TO  現在の要素  OF  SELF.
052000         SET Ｗ－前の要素          TO  前の要素    OF  Ｗ－現要素
052100                                                   AS  ListNode-class.
052200*
052300         IF  Ｗ－前の要素  NOT =  NULL
052400         THEN
052500             SET Ｌ－前のオブジェクト  TO
052600                     対象オブジェクト  OF  Ｗ－前の要素
052700                                       AS    ListNode-class
052800             SET 現在の要素  OF  SELF  TO  Ｗ－前の要素
052900         END-IF.
053000*
053100   END  METHOD  PreviousElement-Get.
053200*
053300   END  OBJECT.
053400 END  CLASS  List.
