000010*=======================================================================
000020*@Ç^vZ\bh@@@@@@|TvvOu]ÆõÇv|
000030*
000040*@@@ÇÒÉÎ·é^vZðs¤B
000050*
000060*@Z®NXF@ÇÒNX
000070*@ZoÍ@@@F@xiPIC S9(8)j
000080*
000090*                              Copyright 1998-2015 FUJITSU LIMITED
000100*=======================================================================
000110 METHOD-ID.  Salary-method  OF Manager-class.
000120 ENVIRONMENT        DIVISION.
000130 CONFIGURATION      SECTION.
000140   REPOSITORY.
000150       CLASS  Manager-class.
000160 DATA DIVISION.
000170 WORKING-STORAGE    SECTION.
000180  01  v|î{         PIC   S9(008).
000190 LINKAGE SECTION.
000200  01  k|x         PIC   S9(008).
000210 PROCEDURE   DIVISION    RETURNING   k|x.
000220*
000230     MOVE   î{  OF  SELF     TO    v|î{.
000240     COMPUTE  k|x   =   v|î{  +  ÁÊè.
000250*
000260 END METHOD Salary-method.
