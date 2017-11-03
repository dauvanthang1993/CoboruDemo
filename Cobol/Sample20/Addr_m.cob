000010*========================================================================
000020*　住所マスタクラス（AddressMaster-class）
000030*　　　　　　　　　　　　－サンプルプログラム「従業員管理（永続化）」－
000040*
000050*　　　住所情報の保存復元のためのデータを持つ。
000060*
000070*　〇ファクトリデータ
000080*　　１）住所識別　－　PIC  S9(4)
000090*　　２）郵便番号　－　PIC   X(7)
000100*　　３）住所　　　－　PIC   X(40)
000110*
000120*                              Copyright 1998-2015 FUJITSU LIMITED
000130*========================================================================
000140 CLASS-ID .   AddressMaster-class.
000150 ENVIRONMENT   DIVISION .
000160 CONFIGURATION   SECTION.
000170*
000180   FACTORY.
000190   ENVIRONMENT   DIVISION .
000200   DATA                 DIVISION .
000210   WORKING-STORAGE SECTION.
000220    01  住所識別             PIC  S9(004) PROPERTY.
000230    01  郵便番号             PIC   X(007) PROPERTY.
000240    01  住所                 PIC   X(040) PROPERTY.
000250   PROCEDURE  DIVISION .
000260*
000270   END FACTORY.
000280  END CLASS  AddressMaster-class.
