000010*========================================================================
000020*@êÊ^vZ\bh@@|TvvOu]ÆõÇii±»jv|
000030*
000040*@@@êÊ]ÆõÉÎ·é^vZðs¤B
000050*
000060*@Z®NXF@êÊNX
000070*@ZOVERRIDE\bhi]ÆõNXj
000080*@ZoÍF      @xiPIC S9(8)j
000090*
000100*                              Copyright 1998-2015 FUJITSU LIMITED
000110*========================================================================
000120 METHOD-ID.   Salary-method  OF  Member-class.
000130 ENVIRONMENT        DIVISION.
000140 CONFIGURATION      SECTION.
000150  REPOSITORY.
000160      CLASS  Member-class.
000170 DATA DIVISION.
000180 WORKING-STORAGE    SECTION.
000190  01  v|î{      PIC   S9(8).
000200 LINKAGE SECTION.
000210  01  k|x          PIC   S9(8).
000220 PROCEDURE   DIVISION    RETURNING   k|x.
000230*
000240     MOVE     î{  OF SELF    TO   v|î{.
000250     COMPUTE  k|x  =
000260              v|î{  +  (cÆÔ  *  ÔOè).
000270*
000280 END METHOD Salary-method.
