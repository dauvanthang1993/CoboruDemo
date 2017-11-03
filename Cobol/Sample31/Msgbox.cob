000100 @OPTIONS ALPHAL(WORD)
000200*=================================================================
000300*「メッセージボックスの出力」
000400*
000500*  注意: リンク時に"USER32.LIB"を指定してください。
000600*
000700*     Copyright 2000-2015 FUJITSU LIMITED
000800*=================================================================
000900 PROGRAM-ID. MsgBox.
001000 ENVIRONMENT DIVISION.
001100 CONFIGURATION SECTION.
001200 SPECIAL-NAMES.
001300     SYMBOLIC CONSTANT
001400       IDYES   IS 6
001500       IDNO    IS 7.
001600 DATA DIVISION.
001700 WORKING-STORAGE SECTION.
001800 01 MsgTITLE   PIC X(30).
001900 01 MsgBody    PIC X(80).
002000 01 RETCODE    PIC S9(9) COMP-5 VALUE 0.
002100 PROCEDURE DIVISION.
002200*-----------------------------------------------------------------
002300*  文字列の末尾には LOW-VALUE を入れます。
002400*-----------------------------------------------------------------
002500     MOVE  "From COBOL: タイトル"      TO  MsgTITLE
002600     MOVE  LOW-VALUE                   TO  MsgTITLE(21:1)
002700     MOVE  "メッセージボックスです。"  TO  MsgBody
002800     MOVE  LOW-VALUE                   TO  MsgBody(25:1)
002900*-----------------------------------------------------------------
003000*  メッセージボックスの関数名は「MessageBoxA」(末尾に「A」が付く
003100*  ことに注意)。
003200*  また、小文字を有効にするため、"NOALPHAL" または "ALPHAL(WORD)"
003300*  オプションを指定します。
003400*-----------------------------------------------------------------
003500     CALL "MessageBoxA"        *> メッセージボックスシステム関数
003600       WITH STDCALL            *> STDCALL呼出しにする
003700       USING
003800         BY VALUE     0        *> ハンドル ("0"にする)
003900         BY REFERENCE MsgBody  *> メッセージ本文
004000         BY REFERENCE MsgTITLE *> メッセージボックスタイトル
004100         BY VALUE     3        *> メッセージボックスのタイプ (0～5)
004200      RETURNING     RETCODE    *> 復帰値
004300*-----------------------------------------------------------------
004400*  メッセージボックスの「ボタン」によって復帰値が変わります。
004500*  「はい」を押すと０を，「いいえ」を押すと９，「キャンセル」を
004600*  押すと９９９９を返します。
004700*-----------------------------------------------------------------
004800     EVALUATE RETCODE
004900     WHEN IDYES
005000       move 0 TO RETURN-CODE
005100     WHEN IDNO
005200       move 9 TO RETURN-CODE
005300     WHEN OTHER
005400       move 9999 TO RETURN-CODE
005500     END-EVALUATE
005600     EXIT PROGRAM
005700 END PROGRAM MsgBox.
