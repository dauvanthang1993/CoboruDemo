000010*========================================================================
000020*@Ü^vZ\bh@@@@|TvvOu]ÆõÇii±»jv|
000030*
000040*@@@ÇÒÉÎ·éÜ^vZðs¤B
000050*
000060*@Z®NXF@êÊNX
000070*@ZOVERRIDE\bhi]ÆõNXj
000080*@ZoÍ@@@F@xiPIC S9(8)j
000090*
000100*                              Copyright 1998-2015 FUJITSU LIMITED
000110*========================================================================
000120  METHOD-ID.  Bonus-method OF Manager-class.
000130  ENVIRONMENT         DIVISION.
000140  CONFIGURATION       SECTION.
000150    REPOSITORY.
000160        CLASS  Manager-class.
000170  DATA DIVISION.
000180  WORKING-STORAGE     SECTION.
000190   01  v|î{          PIC   S9(008).
000200  LINKAGE SECTION.
000210   01  k|x          PIC   S9(008).
000220  PROCEDURE   DIVISION     RETURNING  k|x.
000230*
000240      MOVE   î{  OF  SELF      TO    v|î{.
000250      COMPUTE  k|x   =  (v|î{ +  ÁÊè)  *  2.5.
000260*
000270  END METHOD Bonus-method.
