###############################################################################
#                               NetCOBOL
###############################################################################

COBFLAGS=
LINKOPTION =

ALL : "MSGBOX.EXE"

REBUILD : CLEAN ALL
CLEAN :
	DEL "MSGBOX.EXE"
	DEL "MSGBOX.OBJ"

"MSGBOX.OBJ" : "MSGBOX.COB" "MAKEFILE"
	COBOL32.EXE -M $(COBFLAGS) "MSGBOX.COB"

"MSGBOX.EXE" : MSGBOX.OBJ
	"LINK.EXE" $(LINKOPTION) \
	/DYNAMICBASE:NO \
	/OUT:"MSGBOX.EXE" \
	"MSGBOX.OBJ" \
	"F3BICIMP.LIB" \
	"MSVCRT.LIB" \
	"USER32.LIB" 
