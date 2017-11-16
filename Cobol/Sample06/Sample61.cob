000010*=================================================================
000020*「コマンド行引数の受取り方」
000030*
000040*
000050*  Copyright 2000-2015 FUJITSU LIMITED
000060*=================================================================
000070 IDENTIFICATION DIVISION.
000080  PROGRAM-ID. SAMPLE6.
000090*
000100 ENVIRONMENT DIVISION.
000110  CONFIGURATION SECTION.
000120  SPECIAL-NAMES.
000130     ARGUMENT-NUMBER IS 引数の番号
000140     ARGUMENT-VALUE  IS 引数の値.
000150*
000160 DATA DIVISION.
000170 WORKING-STORAGE SECTION.
000180   01  引数の数    PIC 9(4)  BINARY.
000190   01  日付の差    PIC S9(5) DISPLAY.
000200*
000210   01  通算日１    PIC S9(8) BINARY.
000220   01  引数１.
000230     02  年月日１.
000240         03  年   PIC 9999.
000250         03  月   PIC 99.
000260         03  日   PIC 99.
000270     02  日付情報１  REDEFINES 年月日１  PIC X(8).
000280*
000290   01  通算日２    PIC S9(8) BINARY.
000300   01  引数２.
000310     02  年月日２.
000320         03  年  PIC 9999.
000330         03  月  PIC 99.
000340         03  日  PIC 99.
000350     02  日付情報２  REDEFINES 年月日２  PIC X(8).
000360*
000370 PROCEDURE DIVISION.
000380     ACCEPT 引数の数 FROM 引数の番号.
000390     IF 引数の数 NOT = 2 THEN
000400       DISPLAY "引数の数に誤りがあります．"
000410       GO TO 終了処理
000420     END-IF
000430*
000440     ACCEPT 日付情報１ FROM 引数の値.
000450     IF 年 OF 年月日１ < 1900 THEN
000460         DISPLAY "入力日付は１９００年以降の日付を入力してください．"
000470         GO TO 終了処理
000480     END-IF.
000490     ACCEPT 日付情報２ FROM 引数の値.
000500     IF 年 OF 年月日２ < 1900 THEN
000510         DISPLAY "入力日付は１９００年以降の日付を入力してください．"
000520         GO TO 終了処理
000530     END-IF.
000540     CALL "SUMCALC"  USING 年月日１ 通算日１.
000550     CALL "SUMCALC"  USING 年月日２ 通算日２.
000560*
000570     COMPUTE 日付の差 = 通算日２ - 通算日１.
000580     DISPLAY "日数の差は　" 日付の差 "日です．".
000590*
000600 終了処理.
000610     EXIT PROGRAM.
000620*
000630/
000640*=================================================================
000650*  以下のプログラムで1900年1月1日からの日数を計算する.
000660*=================================================================
000670 IDENTIFICATION DIVISION.
000680   PROGRAM-ID. SUMCALC  INITIAL PROGRAM.
000690*
000700 DATA DIVISION.
000710 WORKING-STORAGE SECTION.
000720   77  合計日数    PIC S9(8) BINARY.
000730   77  カウンタ    PIC S9(4) BINARY.
000740   77  うるう年数  PIC S9(8) BINARY.
000750   77  作業用年    PIC S9(4) BINARY.
000760   77  余り１      PIC S9(4) BINARY.
000770   77  余り２      PIC S9(4) BINARY.
000780   77  余り３      PIC S9(4) BINARY.
000790   01  月日テーブル.
000800      02  日数     PIC X(24)
000810                   VALUE  "312831303130313130313031".
000820      02  月日     REDEFINES 日数
000830                   PIC 99 OCCURS 12 TIMES.
000840*
000850 LINKAGE SECTION.
000860   01  入力日付.
000870         03  年  PIC 9999.
000880         03  月  PIC 99.
000890         03  日  PIC 99.
000900   01  出力日数  PIC S9(8)  BINARY.
000910*
000920 PROCEDURE DIVISION  USING 入力日付 出力日数.
000930*
000940* 前年までの「うるう年」を考慮する．
000950     COMPUTE うるう年数 = (年 - 1900 - 1) / 4.
000960* 前年までの通算日付を求める。
000970     COMPUTE 合計日数 = (年 - 1900) * 365 + うるう年数.
000980*
000990* 入力された年がうるう年かどうか判定する
001000     DIVIDE 年 BY 4   GIVING 作業用年 REMAINDER 余り１.
001010     DIVIDE 年 BY 100 GIVING 作業用年 REMAINDER 余り２.
001020     DIVIDE 年 BY 400 GIVING 作業用年 REMAINDER 余り３.
001030*
001040* 年が４の倍数で、かつ100の倍数でなければ閏年
001050* ただし、400の倍数の年も閏年
001060     IF 余り１ = 0 THEN
001070       IF 余り２ NOT = 0 OR
001080           余り３     = 0 THEN
001090         MOVE "29" TO 月日(2)
001100       END-IF
001110     END-IF.
001120*
001130* 入力された年の月を計算して日数にする.
001140     PERFORM  VARYING カウンタ FROM 1 BY 1 UNTIL カウンタ = 月
001150       COMPUTE 合計日数 = 合計日数 + 月日(カウンタ)
001160     END-PERFORM.
001170*
001180* 日数を計算する.
001190     COMPUTE 出力日数 = 合計日数 + 日.
001200*
001210     EXIT PROGRAM.
001220 END PROGRAM  SUMCALC.
001230 END PROGRAM  SAMPLE6.