000100*========================================================================
000200*@êÊÜ^vZ\bh@@|TvvOu]ÆõÇii±»jv|
000300*
000400*@@@êÊ]ÆõÉÎ·éÜ^vZðs¤B
000500*
000600*@Z®NXF@êÊNX
000700*@ZOVERRIDE\bhi]ÆõNXj
000800*@ZoÍ@@@F@xiPIC 9(8)j
000900*
001000*                              Copyright 1997-2015 FUJITSU LIMITED
001100*========================================================================
001200 METHOD-ID.   Bonus-method  OF  Member-class.
001300 ENVIRONMENT         DIVISION.
001400 CONFIGURATION       SECTION.
001500  REPOSITORY.
001600       CLASS  Member-class.
001700 DATA DIVISION.
001800 WORKING-STORAGE     SECTION.
001900  01  v|î{         PIC   9(8).
002000 LINKAGE SECTION.
002100  01  k|x         PIC   9(8).
002200 PROCEDURE   DIVISION    RETURNING   k|x.
002300*
002400     MOVE   î{  OF  SELF   TO    v|î{.
002500     COMPUTE  k|x   =  v|î{ *  2.5.
002600*
002700 END METHOD Bonus-Method.
