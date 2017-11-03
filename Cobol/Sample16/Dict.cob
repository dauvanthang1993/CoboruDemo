000100*=======================================================================
000200*　ディクショナリクラス（Dict）　 　　　　　　－サンプルクラス－
000300*
000400*　　　ディクショナリ構造によるオブジェクト管理手続き
000500*
000600*　〇継承クラス
000700*　　　コレクションクラス　　　　（Collect）
000800*
000900*　〇参照クラス
001000*　　　ディクショナリノードクラス（DictionaryNode-class）
001100*　　　二分探索木クラス　　　　　（BinaryTree-class）
001200*
001300*　〇オブジェクトメソッド
001400*　　１）オブジェクトデータに対する，GET及びSETのプロパティメソッド
001500*　　２）新規要素の追加又は置換メソッド　　　　　（Element-PutAt）
001600*　　３）先頭要素取得メソッド　　　　　　　　　　（FirstElement-Get）
001700*　　４）全要素削除メソッド　　　　　　　　　　　（Remove-All）
001800*　　５）指定要素削除メソッド　　　　　　　　　　（Remove-At）
001900*　　６）要素取得メソッド　　　　　　　　　　　　（Element-Get）
002000*　　７）次要素取得メソッド　　　　　　　　　　　（NextElement-Get）
002100*　　８）前要素取得メソッド　　　　　　　　　　　（PreviousElement-Get）
002200*　　９）先頭キー取得メソッド　　　　　　　　　　（FirstKey-Get）
002300*　１０）最後キー取得メソッド　　　　　　　　　　（LastKey-Get）
002400*　１１）二分探索木構築メソッド　　　　　　　　　（BinaryTree-Create）
002500*　１２）二分探索木要素削除メソッド　　　　　　　（BinaryTree-RemoveAt）
002600*
002700*        Copyright 1997-2015 FUJITSU LIMITED
002800*=======================================================================
002900 CLASS-ID.  Dict  INHERITS  Collect.
003000 ENVIRONMENT  DIVISION.
003100 CONFIGURATION  SECTION.
003200   REPOSITORY.
003300     CLASS  Collect
003400     CLASS  DictionaryNode-class
003500     CLASS  BinaryTree-class.
003600*
003700   OBJECT.
003800   DATA  DIVISION.
003900   PROCEDURE  DIVISION.
004000*=======================================================================
004100*　新規要素の追加又は置換メソッド（Element-PutAt）
004200*
004300*　・　指定されたキー値の要素が現状存在しないならば，そのキー及びオブジ
004400*　　ェクトの要素を新規に作成した後二分探索木要素の生成し，既存の探索木
004500*　　に挿入する．
004600*　・　指定されたキー値の要素がすでに存在するならば，そのキーの要素の対
004700*　　象オブジェクトを指定されたものに置換する。
004800*
004900*　〇入力：　キー値　　　　　（PIC  X ANY LENGTH）
005000*　　　　　　対象オブジェクト（object reference）
005100*=======================================================================
005200   METHOD-ID.  Element-PutAt.
005300   DATA  DIVISION.
005400   WORKING-STORAGE  SECTION.
005500    01  Ｗ－最後の要素         OBJECT  REFERENCE.
005600    01  Ｗ－現在の要素         OBJECT  REFERENCE.
005700    01  Ｗ－新要素             OBJECT  REFERENCE  DictionaryNode-class.
005800    01  Ｗ－探索木             OBJECT  REFERENCE  BinaryTree-class.
005900    01  Ｗ－対象オブジェクト   OBJECT  REFERENCE.
006000    01  Ｗ－要素数             PIC 9(08)  COMP.
006100    01  Ｗ－キー               PIC X(10).
006200   LINKAGE  SECTION.
006300    01  Ｌ－キー               PIC X ANY LENGTH.
006400    01  Ｌ－対象オブジェクト   OBJECT  REFERENCE.
006500   PROCEDURE  DIVISION  USING  Ｌ－キー  Ｌ－対象オブジェクト.
006600*
006700         INVOKE  SELF  "Element-Get"
006800                     USING  Ｌ－キー  RETURNING  Ｗ－対象オブジェクト.
006900         IF  Ｗ－対象オブジェクト  =  NULL
007000         THEN
007100             INVOKE  DictionaryNode-class  "NEW"  RETURNING  Ｗ－新要素
007200             INVOKE  Ｗ－新要素  "Set-Key"  USING  Ｌ－キー
007300             SET   対象オブジェクト  OF  Ｗ－新要素  TO
007400                                                   Ｌ－対象オブジェクト
007500             SET   次の要素          OF  Ｗ－新要素  TO  NULL
007600             SET   Ｗ－最後の要素    TO  最後の要素  OF  SELF
007700             SET   前の要素          OF  Ｗ－新要素  TO  Ｗ－最後の要素
007800             SET   最後の要素        OF  SELF        TO  Ｗ－新要素
007900             MOVE  SELF::"CollectionSize-Get"        TO  Ｗ－要素数
008000*
008100             INVOKE  SELF  "BinaryTree-Create"
008200                     USING   Ｗ－新要素  Ｌ－キー  RETURNING Ｗ－探索木
008300             SET   探索木要素        OF  Ｗ－新要素  TO  Ｗ－探索木
008400*
008500             IF    Ｗ－要素数  =  0
008600             THEN
008700                 SET  先頭の要素     OF  SELF        TO  Ｗ－新要素
008800             ELSE
008900                 SET  次の要素       OF  Ｗ－最後の要素
009000                          AS  DictionaryNode-class   TO  Ｗ－新要素
009100             END-IF
009200             INVOKE  SELF  "Add-CollSize"
009300             SET  現在の要素  OF  SELF  TO  Ｗ－新要素
009400         ELSE
009500             SET  Ｗ－現在の要素        TO  現在の要素  OF  SELF
009600             SET  対象オブジェクト  OF  Ｗ－現在の要素
009700                     AS  DictionaryNode-class  TO  Ｌ－対象オブジェクト
009800         END-IF.
009900*
010000   END  METHOD  Element-PutAt.
010100*
010200*=======================================================================
010300*　先頭要素取得メソッド（FirstElement-Get）
010400*
010500*　　　先頭の辞書要素が持つ，対象オブジェクトを取得する。
010600*
010700*　〇出力：　先頭オブジェクト（object reference）
010800*=======================================================================
010900   METHOD-ID.  FirstElement-Get OVERRIDE.
011000   DATA  DIVISION.
011100   WORKING-STORAGE  SECTION.
011200    01  Ｗ－先頭の要素        OBJECT  REFERENCE.
011300   LINKAGE  SECTION.
011400    01  Ｌ－先頭オブジェクト  OBJECT  REFERENCE.
011500   PROCEDURE  DIVISION  RETURNING  Ｌ－先頭オブジェクト.
011600*
011700       IF  SELF::"CollectionSize-Get"  NOT =  0
011800       THEN
011900           SET  Ｗ－先頭の要素         TO  先頭の要素  OF  SELF
012000           SET  Ｌ－先頭オブジェクト   TO
012100                    対象オブジェクト   OF  Ｗ－先頭の要素
012200                                               AS  DictionaryNode-class
012300           SET  現在の要素  OF SELF    TO  Ｗ－先頭の要素
012400       ELSE
012500           SET  Ｌ－先頭オブジェクト   TO  NULL
012600       END-IF.
012700*
012800   END  METHOD  FirstElement-Get.
012900*
013000*======================================================================
013100*　全要素削除メソッド（Remove-All）
013200*
013300*　　　生成された全ての要素を削除する。
013400*
013500*======================================================================
013600   METHOD-ID.  Remove-All.
013700   DATA  DIVISION.
013800   WORKING-STORAGE  SECTION.
013900    01  Ｗ－要素数            PIC 9(08)  COMP.
014000    01  Ｗ－現要素            OBJECT  REFERENCE  DictionaryNode-class.
014100    01  Ｗ－次の要素          OBJECT  REFERENCE.
014200    01  Ｗ－一時領域          OBJECT  REFERENCE.
014300    01  Ｗ－探索木            OBJECT  REFERENCE  BinaryTree-class.
014400   PROCEDURE  DIVISION.
014500
014600       MOVE  SELF::"CollectionSize-Get"  TO  Ｗ－要素数.
014700       SET   Ｗ－一時領域          TO  先頭の要素  OF  SELF.
014800       SET   Ｗ－現要素            TO  Ｗ－一時領域
014900                                   AS  DictionaryNode-class.
015000*
015100       PERFORM  UNTIL  Ｗ－要素数   <=  0
015200           SET  前の要素       OF  Ｗ－現要素  TO  NULL
015300           SET  Ｗ－一時領域   TO  探索木要素  OF  Ｗ－現要素
015400           SET  Ｗ－探索木                     TO
015500                                 Ｗ－一時領域  AS  BinaryTree-class
015600           SET  左部分木       OF  Ｗ－探索木  TO  NULL
015700           SET  右部分木       OF  Ｗ－探索木  TO  NULL
015800           SET  探索木要素     OF  Ｗ－現要素  TO  NULL
015900           SET  Ｗ－一時領域   TO  次の要素    OF  Ｗ－現要素
016000           SET  次の要素       OF  Ｗ－現要素  TO  NULL
016100           SET  Ｗ－現要素                     TO
016200                                 Ｗ－一時領域  AS  DictionaryNode-class
016300           INVOKE  SELF  "Sub-CollSize"
016400           ADD  -1  TO  Ｗ－要素数
016500       END-PERFORM.
016600*
016700       SET  先頭の要素    OF  SELF  TO  NULL.
016800       SET  最後の要素    OF  SELF  TO  NULL.
016900       SET  現在の要素    OF  SELF  TO  NULL.
017000       SET  探索木の頂点  OF  SELF  TO  NULL.
017100*
017200   END  METHOD  Remove-All.
017300*
017400*======================================================================
017500*　指定要素削除メソッド（Remove-At）
017600*
017700*　　指定されたキーの要素を，リスト構造，２分探索木の両方から削除する。
017800*
017900*　〇入力：　キー　　　　　（PIC  X ANY LENGTH）
018000*　〇出力：　復帰値        （PIC  9(4) COMP)
018100*　〇備考：
018200*　　　削除が正常に終了した場合，復帰値として０が返却されます。
018300*　　　指定したキーの要素が存在せず，削除できなかった場合，復帰値とし
018400*　　て１が返却されます。
018500*=======================================================================
018600   METHOD-ID.  Remove-At.
018700   DATA  DIVISION.
018800   WORKING-STORAGE  SECTION.
018900    01  Ｗ－オブジェクト      OBJECT  REFERENCE.
019000    01  Ｗ－現要素            OBJECT  REFERENCE  DictionaryNode-class.
019100    01  Ｗ－前の要素          OBJECT  REFERENCE.
019200    01  Ｗ－次の要素          OBJECT  REFERENCE.
019300    01  Ｗ－一時領域          OBJECT  REFERENCE.
019400   LINKAGE  SECTION.
019500    01  Ｌ－キー              PIC X ANY LENGTH.
019600    01  Ｌ－復帰値            PIC 9(04)  COMP.
019700   PROCEDURE  DIVISION
019800                  USING  Ｌ－キー  RETURNING  Ｌ－復帰値.
019900*
020000         INVOKE  SELF  "Element-Get"
020100                           USING  Ｌ－キー RETURNING  Ｗ－オブジェクト.
020200         IF   Ｗ－オブジェクト  NOT =  NULL
020300         THEN
020400             SET   Ｗ－一時領域     TO  現在の要素    OF  SELF
020500             SET   Ｗ－現要素       TO  Ｗ－一時領域
020600                                               AS  DictionaryNode-class
020700             SET   Ｗ－前の要素     TO  前の要素      OF  Ｗ－現要素
020800             SET   Ｗ－次の要素     TO  次の要素      OF  Ｗ－現要素
020900             SET   対象オブジェクト OF  Ｗ－現要素    TO  NULL
021000             SET   前の要素         OF  Ｗ－現要素    TO  NULL
021100             SET   次の要素         OF  Ｗ－現要素    TO  NULL
021200             SET   探索木要素       OF  Ｗ－現要素    TO  NULL
021300*
021400             EVALUATE  Ｗ－前の要素   ALSO  Ｗ－次の要素
021500             WHEN      NULL           ALSO  NULL
021600                 SET   先頭の要素   OF  SELF          TO  NULL
021700                 SET   最後の要素   OF  SELF          TO  NULL
021800                 SET   現在の要素   OF  SELF          TO  NULL
021900             WHEN      NULL           ALSO  NOT NULL
022000                 SET   先頭の要素   OF  SELF          TO  Ｗ－次の要素
022100                 SET   現在の要素   OF  SELF          TO  Ｗ－次の要素
022200                 SET   前の要素     OF  Ｗ－次の要素
022300                          AS  DictionaryNode-class    TO  NULL
022400             WHEN      NOT NULL      ALSO  NULL
022500                 SET   現在の要素   OF  SELF          TO  Ｗ－前の要素
022600                 SET   次の要素     OF  Ｗ－前の要素
022700                          AS  DictionaryNode-class    TO  NULL
022800             WHEN      NOT NULL      ALSO  NOT NULL
022900                 SET   現在の要素   OF  SELF          TO  Ｗ－次の要素
023000                 SET   前の要素     OF  Ｗ－次の要素
023100                          AS  DictionaryNode-class    TO  Ｗ－前の要素
023200                 SET   次の要素     OF  Ｗ－前の要素
023300                          AS  DictionaryNode-class    TO  Ｗ－次の要素
023400             END-EVALUATE
023500*
023600             INVOKE  SELF  "BinaryTree-RemoveAt"  USING  Ｌ－キー
023700             INVOKE  SELF  "Sub-CollSize"
023800             MOVE  0               TO  Ｌ－復帰値
023900         ELSE
024000             MOVE  1               TO  Ｌ－復帰値
024100         END-IF.
024200*
024300   END  METHOD  Remove-At.
024400*=======================================================================
024500*　要素取得メソッド（Element-Get）
024600*
024700*　　　指定されたキーの要素の対象オブジェクトを取得する。
024800*
024900*　〇入力：　キー　　　　　（PIC  X ANY LENGTH）
025000*　〇出力：　オブジェクト　（object reference）
025100*　〇備考：
025200*　　　指定されたキーの要素が，探索木に存在しない場合，NULLが返却されま
025300*　　す。
025400*=======================================================================
025500   METHOD-ID.  Element-Get.
025600   DATA  DIVISION.
025700   WORKING-STORAGE  SECTION.
025800    01  Ｗ－先頭の要素       OBJECT  REFERENCE.
025900    01  Ｗ－探索木           OBJECT  REFERENCE  BinaryTree-class.
026000    01  Ｗ－対象要素         OBJECT  REFERENCE  DictionaryNode-class.
026100    01  Ｗ－キー             PIC X(10).
026200    01  Ｗ－一時領域         OBJECT  REFERENCE.
026300   LINKAGE  SECTION.
026400    01  Ｌ－キー             PIC X  ANY LENGTH.
026500    01  Ｌ－オブジェクト     OBJECT  REFERENCE.
026600   PROCEDURE  DIVISION  USING  Ｌ－キー  RETURNING  Ｌ－オブジェクト.
026700*
026800         SET   Ｌ－オブジェクト  TO  NULL.
026900         SET   Ｗ－探索木        TO  探索木の頂点  OF  SELF.
027000*
027100         PERFORM  UNTIL  Ｗ－探索木  =   NULL
027200             INVOKE  Ｗ－探索木  "Get-Key"  RETURNING   Ｗ－キー
027300             EVALUATE  TRUE
027400             WHEN   Ｌ－キー  <  Ｗ－キー
027500                 SET   Ｗ－一時領域     TO  左部分木  OF  Ｗ－探索木
027600             WHEN   Ｌ－キー  >  Ｗ－キー
027700                 SET   Ｗ－一時領域     TO  右部分木  OF  Ｗ－探索木
027800             WHEN   Ｌ－キー  =  Ｗ－キー
027900                 SET  Ｗ－対象要素   現在の要素   OF  SELF  TO
028000                                           対象要素   OF  Ｗ－探索木
028100                 SET  Ｌ－オブジェクト  TO
028200                                    対象オブジェクト  OF  Ｗ－対象要素
028300                 SET  Ｗ－一時領域      TO   NULL
028400             END-EVALUATE
028500             SET   Ｗ－探索木  TO   Ｗ－一時領域  AS  BinaryTree-class
028600         END-PERFORM
028700*
028800   END  METHOD  Element-Get.
028900*
029000*=======================================================================
029100*　先頭キー取得メソッド（FirstKey-Get）
029200*
029300*　　　先頭要素のキーを取得する。
029400*
029500*　〇出力：　キー　　　　　（PIC  X ANY LENGTH）
029600*======================================================================
029700   METHOD-ID.  FirstKey-Get.
029800   DATA  DIVISION.
029900   WORKING-STORAGE  SECTION.
030000    01  Ｗ－先頭の要素      OBJECT  REFERENCE.
030100    01  Ｗ－キー            PIC X(10).
030200   LINKAGE  SECTION.
030300    01  Ｌ－キー            PIC X ANY LENGTH.
030400   PROCEDURE  DIVISION  RETURNING  Ｌ－キー.
030500*
030600         IF  SELF::"CollectionSize-Get"  NOT =  0
030700         THEN
030800             SET   Ｗ－先頭の要素            TO  先頭の要素  OF  SELF
030900             INVOKE  Ｗ－先頭の要素  AS  DictionaryNode-class
031000                "Get-Key"  RETURNING  Ｗ－キー
031100             MOVE  Ｗ－キー  TO  Ｌ－キー
031200             SET   現在の要素  OF  SELF      TO  Ｗ－先頭の要素
031300         ELSE
031400             MOVE  SPACE  TO  Ｌ－キー
031500         END-IF.
031600*
031700   END  METHOD  FirstKey-Get.
031800*
031900*======================================================================
032000*　最後キー取得メソッド（LastKey-Get）
032100*
032200*　　　最後の要素のキーを取得する。
032300*
032400*　〇出力：　キー　　　　　（PIC X ANY LENGTH）
032500*=======================================================================
032600   METHOD-ID.  LastKey-Get.
032700   DATA  DIVISION.
032800   WORKING-STORAGE  SECTION.
032900    01  Ｗ－最後の要素      OBJECT  REFERENCE.
033000    01  Ｗ－キー            PIC X(10).
033100   LINKAGE  SECTION.
033200    01  Ｌ－キー            PIC X ANY LENGTH.
033300   PROCEDURE  DIVISION  RETURNING  Ｌ－キー.
033400*
033500         IF  SELF::"CollectionSize-Get"  NOT =  0
033600         THEN
033700             SET   Ｗ－最後の要素            TO  最後の要素  OF  SELF
033800             INVOKE  Ｗ－最後の要素  AS  DictionaryNode-class
033900                     "Get-Key"  RETURNING  Ｗ－キー
034000             MOVE  Ｗ－キー  TO  Ｌ－キー
034100             SET   現在の要素  OF  SELF      TO  Ｗ－最後の要素
034200         ELSE
034300             MOVE  SPACE  TO  Ｌ－キー
034400         END-IF.
034500*
034600   END  METHOD  LastKey-Get.
034700*
034800*=======================================================================
034900*　次要素取得メソッド（NextElement-Get）
035000*
035100*　　　次の要素の対象オブジェクトを取得する。
035200*
035300*　〇出力：　オブジェクト　　（object reference）
035400*=======================================================================
035500   METHOD-ID.  NextElement-Get  OVERRIDE.
035600   DATA  DIVISION.
035700   WORKING-STORAGE  SECTION.
035800    01  Ｗ－次の要素       OBJECT  REFERENCE.
035900    01  Ｗ－現要素         OBJECT  REFERENCE.
036000   LINKAGE  SECTION.
036100    01  Ｌ－オブジェクト   OBJECT  REFERENCE.
036200   PROCEDURE  DIVISION  RETURNING   Ｌ－オブジェクト.
036300*
036400         SET  Ｌ－オブジェクト  TO  NULL.
036500         SET  Ｗ－現要素        TO  現在の要素  OF  SELF.
036600         SET  Ｗ－次の要素      TO
036700                   次の要素  OF  Ｗ－現要素  AS  DictionaryNode-class.
036800*
036900         IF   Ｗ－次の要素  NOT =  NULL
037000         THEN
037100             SET  Ｌ－オブジェクト  TO
037200                           対象オブジェクト  OF  Ｗ－次の要素
037300                                             AS  DictionaryNode-class
037400             SET  現在の要素  OF  SELF  TO  Ｗ－次の要素
037500         END-IF.
037600*
037700   END  METHOD  NextElement-Get.
037800*
037900*=======================================================================
038000*　前要素取得メソッド（PreviousElement-Get）
038100*
038200*　　　前の要素の対象オブジェクトを取得する。
038300*
038400*　〇出力：　前のオブジェクト　（object reference）
038500*=======================================================================
038600   METHOD-ID.  PreviousElement-Get  OVERRIDE.
038700   DATA  DIVISION.
038800   WORKING-STORAGE  SECTION.
038900    01  Ｗ－前の要素           OBJECT  REFERENCE.
039000    01  Ｗ－現要素             OBJECT  REFERENCE.
039100   LINKAGE  SECTION.
039200    01  Ｌ－前のオブジェクト   OBJECT  REFERENCE.
039300   PROCEDURE  DIVISION  RETURNING   Ｌ－前のオブジェクト.
039400*
039500         SET  Ｌ－前のオブジェクト  TO  NULL.
039600         SET  Ｗ－現要素            TO  現在の要素  OF  SELF.
039700         SET  Ｗ－前の要素          TO
039800                 前の要素   OF  Ｗ－現要素  AS  DictionaryNode-class.
039900*
040000         IF  Ｗ－前の要素  NOT =  NULL
040100         THEN
040200             SET  Ｌ－前のオブジェクト  TO
040300                      対象オブジェクト  OF  Ｗ－前の要素
040400                                        AS  DictionaryNode-class
040500             SET  現在の要素  OF  SELF  TO  Ｗ－前の要素
040600         END-IF.
040700*
040800   END  METHOD  PreviousElement-Get.
040900*
041000*=======================================================================
041100*　二分探索木構築メソッド（BinaryTree-Create）
041200*
041300*　　　追加された要素を二分探索木に加える。
041400*
041500*　〇入力：　要素　　　　（OBJECT REFERENCE DictinaryNode-class）
041600*　　　　　　キー　　　　（PIC  X ANY LENGTH）
041700*　〇出力：　新探索木要素（OBJECT REFERENCE BinaryTree-class)
041800*　〇備考：
041900*　　指定されたキーが，探索木に既存の場合，結果的には何も行われません。
042000*=======================================================================
042100   METHOD-ID.  BinaryTree-Create.
042200   DATA  DIVISION.
042300   WORKING-STORAGE  SECTION.
042400    01  Ｗ－探索木の頂点       OBJECT  REFERENCE  BinaryTree-class.
042500    01  Ｗ－探索木             OBJECT  REFERENCE  BinaryTree-class.
042600    01  Ｗ－部分木             OBJECT  REFERENCE.
042700    01  Ｗ－一時領域           OBJECT  REFERENCE.
042800    01  Ｗ－状態               PIC  X(4)  VALUE  SPACE.
042900    01  Ｗ－キー               PIC  X(10).
043000   LINKAGE  SECTION.
043100    01  Ｌ－要素               OBJECT  REFERENCE  DictionaryNode-class.
043200    01  Ｌ－キー               PIC  X ANY LENGTH.
043300    01  Ｌ－新探索木           OBJECT  REFERENCE  BinaryTree-class.
043400   PROCEDURE  DIVISION
043500                  USING  Ｌ－要素  Ｌ－キー  RETURNING  Ｌ－新探索木.
043600*
043700         INVOKE  BinaryTree-class  "NEW"  RETURNING  Ｌ－新探索木.
043800         INVOKE  Ｌ－新探索木  "Set-Key"  USING  Ｌ－キー.
043900         SET   対象要素    OF  Ｌ－新探索木    TO  Ｌ－要素.
044000         SET   左部分木    OF  Ｌ－新探索木    TO  NULL.
044100         SET   右部分木    OF  Ｌ－新探索木    TO  NULL.
044200*
044300         SET   Ｗ－探索木の頂点             TO  探索木の頂点  OF  SELF.
044400         IF    Ｗ－探索木の頂点  =  NULL
044500         THEN
044600             SET   探索木の頂点  OF  SELF      TO  Ｌ－新探索木
044700         ELSE
044800             SET   Ｗ－探索木                  TO  Ｗ－探索木の頂点
044900             PERFORM   UNTIL  Ｗ－状態  =  "終了"
045000                 INVOKE  Ｗ－探索木  "Get-Key"  RETURNING  Ｗ－キー
045100                 EVALUATE  TRUE
045200                 WHEN   Ｌ－キー  <  Ｗ－キー
045300                     SET  Ｗ－部分木     TO   左部分木   OF  Ｗ－探索木
045400                     IF   Ｗ－部分木   =   NULL
045500                     THEN
045600                         SET   左部分木  OF  Ｗ－探索木  TO
045700                                                         Ｌ－新探索木
045800                         MOVE  "終了"                    TO   Ｗ－状態
045900                     ELSE
046000                         INVOKE  Ｗ－部分木 AS BinaryTree-class  "Get-Key"
046100                            RETURNING  Ｗ－キー
046200                         IF     Ｌ－キー   >   Ｗ－キー
046300                             SET   左部分木  OF  Ｌ－新探索木   TO
046400                                                           Ｗ－部分木
046500                             SET   左部分木  OF  Ｗ－探索木     TO
046600                                                           Ｌ－新探索木
046700                             MOVE  "終了"    TO   Ｗ－状態
046800                         ELSE
046900                             SET   Ｗ－探索木   TO   Ｗ－部分木
047000                                                AS  BinaryTree-class
047100                         END-IF
047200                     END-IF
047300                 WHEN   Ｌ－キー  >  Ｗ－キー
047400                     SET  Ｗ－部分木    TO  右部分木   OF  Ｗ－探索木
047500                     IF   Ｗ－部分木   =   NULL
047600                     THEN
047700                         SET   右部分木  OF  Ｗ－探索木   TO
047800                                                          Ｌ－新探索木
047900                         MOVE  "終了"                     TO   Ｗ－状態
048000                     ELSE
048100                         INVOKE  Ｗ－部分木  AS  BinaryTree-class
048200                               "Get-Key"  RETURNING  Ｗ－キー
048300                         IF    Ｌ－キー   <   Ｗ－キー
048400                             SET   左部分木  OF  Ｌ－新探索木   TO
048500                                                           Ｗ－部分木
048600                             SET   左部分木  OF  Ｗ－探索木     TO
048700                                                           Ｌ－新探索木
048800                             MOVE  "終了"                       TO
048900                                                           Ｗ－状態
049000                         ELSE
049100                             SET   Ｗ－探索木   TO   Ｗ－部分木
049200                                                AS   BinaryTree-class
049300                         END-IF
049400                     END-IF
049500                 WHEN   Ｌ－キー  =  Ｗ－キー
049600                     SET   Ｌ－新探索木    TO   NULL
049700                     MOVE  "終了"          TO   Ｗ－状態
049800                 END-EVALUATE
049900             END-PERFORM
050000         END-IF
050100*
050200   END  METHOD  BinaryTree-Create.
050300*
050400*=======================================================================
050500*　二分探索木要素削除メソッド（BinaryTree-RemoveAt）
050600*
050700*　　　指定されたキーの探索木要素を，探索木から削除する。
050800*
050900*　〇入力：　キー　（PIC  X ANY LENGTH）
051000*　〇備考：
051100*　　　指定されたキーの要素が，探索木に存在しない場合，結果的には何も行
051200*　　われません。
051300*=======================================================================
051400   METHOD-ID.  BinaryTree-RemoveAt.
051500   DATA  DIVISION.
051600   WORKING-STORAGE  SECTION.
051700    01  Ｗ－親探索木           OBJECT  REFERENCE  BinaryTree-class.
051800    01  Ｗ－探索木             OBJECT  REFERENCE  BinaryTree-class.
051900    01  Ｗ－部分木             OBJECT  REFERENCE  BinaryTree-class.
052000    01  Ｗ－左部分木           OBJECT  REFERENCE.
052100    01  Ｗ－右部分木           OBJECT  REFERENCE.
052200    01  Ｗ－一時領域           OBJECT  REFERENCE.
052300    01  Ｗ－対象要素           OBJECT  REFERENCE  DictionaryNode-class.
052400    01  Ｗ－左右情報           PIC  X(2).
052500    01  Ｗ－キー               PIC  X(10).
052600   LINKAGE  SECTION.
052700    01  Ｌ－キー               PIC  X ANY LENGTH.
052800   PROCEDURE  DIVISION  USING  Ｌ－キー.
052900*
053000         SET   Ｗ－親探索木  Ｗ－部分木    TO  NULL.
053100         SET   Ｗ－探索木                  TO  探索木の頂点  OF  SELF.
053200         IF    Ｗ－探索木   =   NULL
053300         THEN
053400             EXIT METHOD
053500         ELSE
053600             INVOKE  Ｗ－探索木  "Get-Key"  RETURNING  Ｗ－キー
053700         END-IF.
053800*
053900         PERFORM  UNTIL  Ｌ－キー  =   Ｗ－キー
054000             EVALUATE  TRUE
054100             WHEN   Ｌ－キー   <   Ｗ－キー
054200                 SET   Ｗ－親探索木    TO   Ｗ－探索木
054300                 SET   Ｗ－一時領域    TO   左部分木  OF  Ｗ－探索木
054400                 MOVE  "左"            TO   Ｗ－左右情報
054500             WHEN   Ｌ－キー   >   Ｗ－キー
054600                 SET   Ｗ－親探索木    TO   Ｗ－探索木
054700                 SET   Ｗ－一時領域    TO   右部分木  OF  Ｗ－探索木
054800                 MOVE  "右"            TO   Ｗ－左右情報
054900             END-EVALUATE
055000             IF  Ｗ－一時領域   =   NULL
055100             THEN
055200                 EXIT METHOD
055300             ELSE
055400                 SET   Ｗ－探索木            TO   Ｗ－一時領域
055500                                                  AS  BinaryTree-class
055600                 INVOKE  Ｗ－探索木  "Get-Key"  RETURNING  Ｗ－キー
055700             END-IF
055800         END-PERFORM.
055900*
056000         SET   Ｗ－左部分木              TO   左部分木  OF  Ｗ－探索木.
056100         SET   Ｗ－右部分木              TO   右部分木  OF  Ｗ－探索木.
056200*
056300         IF     Ｗ－左部分木  NOT =  NULL    AND
056400                Ｗ－右部分木  NOT =  NULL
056500         THEN
056600             SET  Ｗ－部分木         TO    Ｗ－左部分木
056700                                               AS  BinaryTree-class
056800             SET  Ｗ－一時領域       TO    右部分木  OF  Ｗ－部分木
056900             PERFORM   UNTIL   Ｗ－一時領域  =   NULL
057000                 SET  Ｗ－部分木     TO    Ｗ－一時領域
057100                                               AS  BinaryTree-class
057200                 SET  Ｗ－一時領域   TO    右部分木  OF  Ｗ－部分木
057300             END-PERFORM
057400             SET   Ｗ－対象要素      TO    対象要素  OF  Ｗ－部分木
057500             INVOKE  Ｗ－部分木  "Get-Key"  RETURNING  Ｗ－キー
057600             INVOKE  SELF  "BinaryTree-RemoveAt"  USING  Ｗ－キー
057700             INVOKE  Ｗ－探索木  "Set-Key"  USING  Ｗ－キー
057800             SET   対象要素    OF  Ｗ－探索木     TO   Ｗ－対象要素
057900             SET   探索木要素  OF  Ｗ－対象要素   TO   Ｗ－探索木
058000         ELSE
058100             SET   左部分木  OF  Ｗ－探索木  TO   NULL
058200             SET   右部分木  OF  Ｗ－探索木  TO   NULL
058300             SET   対象要素  OF  Ｗ－探索木  TO   NULL
058400*
058500             EVALUATE Ｗ－左部分木   ALSO  Ｗ－右部分木
058600             WHEN          NULL      ALSO       NULL
058700                 SET  Ｗ－部分木     TO         NULL
058800             WHEN          NULL      ALSO   NOT NULL
058900                 SET  Ｗ－部分木     TO    Ｗ－右部分木
059000                                               AS  BinaryTree-class
059100             WHEN      NOT NULL      ALSO       NULL
059200                 SET  Ｗ－部分木     TO    Ｗ－左部分木
059300                                               AS  BinaryTree-class
059400             END-EVALUATE
059500*
059600             EVALUATE TRUE
059700             WHEN   Ｗ－親探索木  =  NULL
059800                 SET   探索木の頂点  OF  SELF          TO  Ｗ－部分木
059900             WHEN   Ｗ－左右情報  =  "左"
060000                 SET   左部分木      OF  Ｗ－親探索木  TO  Ｗ－部分木
060100             WHEN   Ｗ－左右情報  =  "右"
060200                 SET   右部分木      OF  Ｗ－親探索木  TO  Ｗ－部分木
060300             END-EVALUATE
060400         END-IF.
060500*
060600   END  METHOD  BinaryTree-RemoveAt.
060700*
060800   END  OBJECT.
060900 END  CLASS  Dict.
