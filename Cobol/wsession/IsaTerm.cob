000010*=================================================================
000020* 「セション管理機能を使用したWebアプリケーション」
000030*     セション管理機能を使用して、特定のクライアントから複数回の
000040*   リクエストにまたがった業務を行うアプリケーションを構築します。
000050*
000060*=================================================================
000070*
000080*  ファイル名： ISATERM.COB
000090*  動作概要  ： ISAPI使用時に必要な終了処理プログラムです。
000100*               IISから直接呼び出されます。
000110*
000120* Copyright 2000-2015 FUJITSU LIMITED
000130*=================================================================
000140 IDENTIFICATION DIVISION.
000150 PROGRAM-ID. "TerminateExtension".
000160 ENVIRONMENT DIVISION.
000170 DATA DIVISION.
000180  LINKAGE SECTION.
000190     COPY ISAPIFLG.
000200*
000210 PROCEDURE DIVISION WITH STDCALL LINKAGE USING ISAPI-FLAG.
000220*
000230     MOVE 1 TO PROGRAM-STATUS.
000240     EXIT PROGRAM.
