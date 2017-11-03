000010*---------------------------------------------------------------*
000020* MODULE NAME :      GetExtensionVersion                        *
000030*                                                               *
000040*   Copyright 1999-2015 FUJITSU LIMITED                         *
000050*---------------------------------------------------------------*
000060 IDENTIFICATION DIVISION.
000070 PROGRAM-ID. "GetExtensionVersion".
000080 ENVIRONMENT DIVISION.
000090 DATA DIVISION.
000100  LINKAGE SECTION.
000110     COPY ISAPIINF.
000120*
000130 PROCEDURE DIVISION WITH STDCALL LINKAGE USING ISAPI-INFO.
000140     MOVE 1 TO PROGRAM-STATUS.
000150     EXIT PROGRAM.
