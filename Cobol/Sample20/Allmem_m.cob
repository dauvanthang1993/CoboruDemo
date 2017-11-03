000010*========================================================================
000020*　従業員マスタクラス（MemberMaster-class）
000030*　　　　　　　　　　　　　－サンプルプログラム「従業員管理（永続化）」－
000040*
000050*　　　従業員情報の保存復元のためのデータを持つ。
000060*
000070*　〇ファクトリデータ
000080*　　１）従業員番号　－　PIC  S9(4)
000090*　　２）氏名　　　　－　PIC   X(16)
000100*　　３）入社年月日　－　PIC   X(8)
000110*　　４）退社年月日　－　PIC   X(8)
000120*　　５）職級　　　　－　PIC  S9(1)
000130*　　６）基本給　　　－　PIC  S9(8)
000140*　　７）総支給　　　－　PIC  S9(8)
000150*　　８）時間外手当　－　PIC  S9(5)
000160*　　９）残業時間  　－　PIC  S9(5)
000170*　１０）特別手当　　－　PIC  S9(6)
000180*
000190*                              Copyright 1998-2015 FUJITSU LIMITED
000200*========================================================================
000210 CLASS-ID.   MemberMaster-class.
000220 ENVIRONMENT    DIVISION.
000230 CONFIGURATION    SECTION.
000240*
000250   FACTORY.
000260   ENVIRONMENT    DIVISION.
000270   DATA                 DIVISION.
000280   WORKING-STORAGE SECTION.
000290    01  共通情報.
000300      02  従業員番号          PIC  S9(004)    VALUE 0     PROPERTY.
000310      02  氏名                PIC   X(016)    VALUE SPACE PROPERTY.
000320      02  入社年月日          PIC   X(008)    VALUE SPACE PROPERTY.
000330      02  退社年月日          PIC   X(008)    VALUE SPACE PROPERTY.
000340      02  職級                PIC  S9(001)    VALUE 0     PROPERTY.
000350      02  基本給              PIC  S9(008)    VALUE 0     PROPERTY.
000360      02  総支給              PIC  S9(008)    VALUE 0     PROPERTY.
000370    01  時間外手当          PIC  S9(5)        VALUE 0     PROPERTY.
000380    01  残業時間            PIC  S9(5)V9(1)   VALUE 0     PROPERTY.
000390    01  特別手当            PIC  S9(6)        VALUE 0     PROPERTY.
000400   PROCEDURE  DIVISION.
000410   END FACTORY.
000420  END CLASS  MemberMaster-class.
